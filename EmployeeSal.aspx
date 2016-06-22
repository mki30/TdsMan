<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EmployeeSal.aspx.cs" Inherits="EmployeeSal" MasterPageFile="~/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title></title>
    <style type="text/css">
        .table-condensed > tbody > tr > td, .table-condensed > tfoot > tr > td
        {
            padding: 2px;
        }

        .table-condensed > thead > tr > th, .table-condensed > tbody > tr > th
        {
            padding: 1px;
        }

        input, button, select, textarea
        {
            line-height: 15px !important;
        }

        table
        {
            border-collapse: collapse;
        }

        #tableSalary tr:hover
        {
            background-color: #e6e6e6;
        }

        .bordered td
        {
            border: 1px solid lightgrey;
            text-indent: 5px;
        }

        input[type=text]
        {
            background-color: #F7F5CC;
            border: 1px solid #c0c0c0;
            text-align: right;
            padding-right: 2px;
        }

        #taxDeclarationTable td
        {
        }

            #tableTaxComputation td:last-child, #taxDeclarationTable td:last-child
            {
                width: 55px;
                padding: 0px;
                text-indent: 0px;
                text-align: right;
                font-weight: bold;
            }

        #tableTaxComputation tr td:first-child + td
        {
            text-align: right;
            padding-right: 5px;
        }

        #tableTaxComputation td:last-child > span, #taxDeclarationTable td:last-child > span
        {
            margin-right: 2px;
        }

        #tableTaxComputation input[type=text], #taxDeclarationTable input[type=text]
        {
            width: 100%;
            margin: 0px;
            border: 0px;
        }

        .number
        {
            text-align: right;
        }

        @media print
        {
            .no-print, .no-print *
            {
                display: none !important;
            }

            .show-print
            {
                display: block !important;
            }

            a:link:after, a:visited:after
            {
                content: "";
            }
        }
    </style>
    <script type="text/javascript">

        var UniformAll = "UniformAll";
        var ctlsIncome = ["Basic", "HRA", "TravelAll", "Medical", "SpecialAll", "Other", "DA", "LTA", "UniformAll", "ChildrenEducAll"]
        var ctlsDeduction = ["PF", "Loan", "TDS", "VPF", "ProfessionTax"];
        var ctlsOther = ["RentPaid", "Paid", "PaidOn"];
        var Totals = new Array();

        $(document).ready(function ()
        {
            //debugger;
            $('.tooltip').tooltip();
            $("input[type=text]").keyup(function ()
            {
                AddValues();
                //SaveToLocal();
            });

            $("select").change(function ()
            {
                AddValues();
                //SaveToLocal();
            });

            var empid = $("#lblEmpoyeeID").text();
            var FY = $("#lblFY2").text().split('-')[0];
            ShowData(empid, FY);

            AddValues();

            $("#btnSave").click(function ()
            {
                if (empid == undefined)
                    return;
                var EmpData = window.localStorage.getItem("AllValues");
                $.post("/Data.aspx?Action=UpdateEmployeeSalaryData&Data1=" + empid + "&Data2=" + FY + "", { EmployeeData: EmpData }, function (data)
                {
                    if (data.replace('~', '') == "")
                    {
                        $("#lblMessage").html("<span style='color:green;'>&nbsp;Saved!</span>");
                        ShowData(empid, FY);
                    }
                    else
                    {
                        $("#lblMessage").html("<span style='color:red;'>&nbsp;Not Saved!</span>");
                    }
                });
            });
        });

        function ShowData(empid, FY)
        {
            $.ajax({
                url: "/Data.aspx?Action=GetEmployeeSalaryData&Data1=" + empid + "&Data2=" + FY + "", cache: false, success: function (data)
                {
                    var Data = data.replace("~", "");
                    if (Data != null)
                    {
                        Data = JSON.parse(Data);
                        $.each(Data, function (key, val)
                        {
                            $("#" + key).val(val);
                        });
                        AddValues();
                    }
                },
                error: function (e)
                {
                }
            })

            $.ajax({
                url: "/Data.aspx?Action=GetChallan&Data1=" + empid + "&Data2=" + FY + "", cache: false, success: function (data)
                {
                    var Data = data.replace("~", "");
                    if (Data != null)
                    {
                        Data = JSON.parse(Data);
                        console.log(Data);
                        $.each(Data, function (key, value)
                        {
                            var month = (value.month);
                            var challanno = value.challan.challanno;
                            $("#txtChallan" + month).val(challanno);
                        });
                    }
                },
                error: function (e)
                {
                }
            })

            $.ajax({
                url: "/Data.aspx?Action=GetTDSData&Data1=" + empid + "&Data2=" + FY + "", cache: false, success: function (data)
                {
                    var Data = data.replace("~", "");
                    Data = JSON.parse(Data);

                    if (Data != null)
                    {
                        for (var i = 1; i <= 12; i++)
                        {
                            $("#txtTDS" + i + "").css("background-color", "#FDD0BA");
                        }
                        $.each(Data, function (key, value)
                        {
                            var month = value.month;
                            var tds = value.tds;
                            if ($("#txtTDS" + month + "").val() == tds)
                            {
                                $("#txtTDS" + month + "").css("background-color", "#D3F7CC");
                            }
                        });
                    }
                },
                error: function (e)
                {

                }
            })

        };

        function Format(x)
        {
            x = x.toString();
            if (x.indexOf('.') > 0)
            {
                var mianPart = x.split('.')[0];
                var decPart = x.split('.')[1];
            }
            else
            {
                mianPart = x;
                decPart = "";
            }
            var lastThree = mianPart.substring(mianPart.length - 3);
            var otherNumbers = mianPart.substring(0, mianPart.length - 3);
            if (otherNumbers != '')
                lastThree = ',' + lastThree;
            return otherNumbers.replace(/\B(?=(\d{2})+(?!\d))/g, ",") + lastThree + (decPart == "" ? "" : "." + decPart);
        }

        function AddValues()
        {
            Totals = new Array();

            Totals["TotalDeduction"] = 0;
            Totals["TotalIncome"] = 0;
            Totals["Net"] = 0;
            Totals["Paid"] = 0;
            Totals["RentPaid"] = 0;

            var HRAExmpt = 0;
            var TAExmpt = 0;
            var ChildEduExmpt = 0;
            var _80GGExpmt = 0;

            //var totalBasic = 0;
            for (var i = 1; i <= 12; i++)
            {
                var totIncome = 0;
                $(ctlsIncome).each(function ()
                {
                    var n = GV("#txt" + this + i);

                    if (Totals[this] == undefined)
                        Totals[this] = 0;

                    Totals[this] += n;
                    totIncome += n;
                });

                //$("#lblTotalIncome" + i).html(Format(totIncome));
                $("#txtTotalIncome" + i).val(Format(totIncome));

                Totals["TotalIncome"] += totIncome;

                var totDecduction = 0;
                $(ctlsDeduction).each(function ()
                {
                    var n = GV("#txt" + this + i);

                    if (Totals[this] == undefined)
                        Totals[this] = 0;

                    Totals[this] += n;
                    totDecduction += n;
                });

                //$("#lblTotalDeduction" + i).html(Format(totDecduction));
                $("#txtTotalDeduction" + i).val(Format(totDecduction));

                Totals["TotalDeduction"] += totDecduction;

                $("#lblNet" + i).html(Format(totIncome - totDecduction));

                Totals["Net"] += totIncome - totDecduction;

                Totals["Paid"] += GV("#txtPaid" + i);

                Totals["RentPaid"] += GV("#txtRentPaid" + i);

                //Max HRA should be 50% of Basic Sal in case of Metro othervise 40%
                var salary = GV("#txtBasic" + i) + GV("#txtDA" + i);
                var maxHRA = ($("#ddMetro" + i).val() == "M") ? 0.5 : 0.4;
                //   House Rent Allowances: Commonly known as HRA, exemption being bestowed through section 10(13A) briefed as:
                //   1. An amount equal to 50 per cent of salary, where residential house is situated at Mumbai, Kolkata, Delhi or Chennai and an amount equal to 40 per cent of salary, where residential house is situated at any other place.
                //   2. House rent allowance received by the employee in respect of the period during which rental accommodation is occupied by the employee during the previous year.  
                //   3. Rent paid minus 10 per cent of salary

                //   PLEASE NOTE:
                //   Salary here means Basic+ D.A+ Commission based on fixed % of turnover achieved by an employee. 
                //   MODE OF COMPUTATION OF EXEMPTION: Under section 10(13A), the amount of exemption in respect of house rent allowance received by an employee depends upon the following:
                //   -     Salary of the employee;
                //   -     House rent allowance;
                //   -     Rent paid; and
                //   -     The Place where house is taken on rent.
                //When these four are same throughout the year, the exemption under section 10(13A) should be calculated on “ANNUAL” basis. When, however, there is a 
                //Change in respect of any of the above factors will make the calculation to be done on “MONTHLY” Basis.

                
                HRAExmpt += Math.min(GV("#txtHRA" + i), maxHRA * salary, Math.max(GV("#txtRentPaid" + i) - salary * .1, 0));

                TAExmpt += Math.min(GV("#txtTravelAll" + i), 800);

                var noOfChildren = GV("#txtNoOfSchoolGoingChildren");
                ChildEduExmpt += Math.min(GV("#txtChildrenEducAll" + i), noOfChildren * 100, 200);

                if (GV("#txtHRA" + i) == 0 && GV("#txtNoOfResHoseOwened") == 0)
                {
                    _80GGExpmt += Math.min((GV("#txtRentPaid" + i) - totIncome * .1), 2000, totIncome * .25);
                }
                SaveToLocal();
            }

            $(ctlsIncome).each(function ()
            {
                //$("#txtTotal" + this).html(Format(Totals[this]));
                $("#txt" + this + "Total").val(Format(Totals[this]));
            });

            $(ctlsDeduction).each(function ()
            {
                //$("#lblTotal" + this).html(Format(Totals[this]));
                $("#txt" + this + "Total").val(Format(Totals[this]));
            });
            //$("#lblTotalTotalIncome").html(Format(Totals["TotalIncome"]));txtTotalDeductionTotal
            $("#txtTotalIncomeTotal").val(Format(Totals["TotalIncome"]));
            //$("#lblTotalTotalDeduction").html(Format(Totals["TotalDeduction"]));
            $("#txtTotalDeductionTotal").val(Format(Totals["TotalDeduction"]));
            $("#lblTotalNet").html(Format(Totals["Net"]));

            //$("#lblTotalPaid").html(Format(Totals["Paid"]));
            $("#txtPaidTotal").val(Format(Totals["Paid"]));
            //$("#lblTotalRentPaid").html(Format(Totals["RentPaid"]));
            $("#txtRentPaidTotal").val(Format(Totals["RentPaid"]));

            //tax  on  Totals["Net"]

            var payable = Totals["Net"];
            var tax = 0;
            if (payable <= 250000)
                tax = 0;
            else if (payable <= 500000)
                tax = (payable - 250000) * .1;
            else if (payable <= 1000000)
                tax = (payable - 500000) * .2 + 25000;
            else
                tax = (payable - 1000000) * .3 + 125000;

            //$("#tdTax").html("Tax=" + tax);

            if (GV("#txtMedicalBill") > 15000)
            {
                alert("Maximum allowed value is 15000");
                //$("#txtMedicalBill").val("15000");
                SV3("txtMedicalBill", 15000);
            }
            if (GV("#txtMIP80D") > 35000)
            {
                alert("Maximum allowed value is 35000");
                SV3("txtMIP80D", 35000);
            }
            if (GV("#txt80DD") > 100000)
            {
                alert("Maximum allowed value is 1,00,000");
                SV3("txt80DD", 0);
            }
            if (GV("#txt80DDB") > 60000)
            {
                alert("Maximum allowed value is 60,000");
                SV3("txt80DDB", 0);
            }

            //if (GV("#txtRemainMonthInYear") > 12 || GV("#txtRemainMonthInYear") < 1)
            //{
            //    alert("Please Enter a valid value between 1 to 12");
            //    $("#txtRemainMonthInYear").val("12");
            //}

            $("#lblEmployeePF").text(Totals["PF"]);
            $("#lblVoluntaryPF").text(Totals["VPF"]);

            var totalDeductionVIA = GVL("#lblEmployeePF")
                                + GVL("#lblVoluntaryPF")
                                + GV("#txtPublicPF")
                                + GV("#txtNSC")
                                + GV("#txtTaxSavingMF")
                                + GV("#txtInsurencePremiumPaid")
                                + GV("#txtSavingInPensionPlan")
                                + GV("#txtTaxSavingFD")
                                + GV("#txtSeniorCitizenSaving")
                                + GV("#txtNPS")
                                + GV("#txtChildrenEduFee")
                                + GV("#txtHousingLoanPrincipal")
                                + GV("#txtOtherPOSavings");

            var otheDeductionTotal = GV("#txtEmployerContToNPS")
               + GV("#txtMIP80D")
               + GV("#txt80DD")
               + GV("#txt80DDB")
               + GV("#txt80E")
               + GV("#txt80CCG")
               + GV("#txt80G")
               + GV("#txt80U");

            var otherIncomeTotal = GV("#txt80TTA") + GV("#txtOtherTaxableIncome")

            var rentReceived = GV("#txtRentRecieved");
            var municTaxPaid = GV("#txtMunicipalTaxPaid");

            var repairsandMaintinance = ((rentReceived - municTaxPaid) * 0.3);

            $("#lblRepairsandMaint").text(repairsandMaintinance);
            var interestPaid = GV("#txtInterestPaid");
            var incomeFromHousePropertyLetOut = (rentReceived - municTaxPaid - repairsandMaintinance - interestPaid);

            $("#lblTotalDeductionVIA").text(Format(totalDeductionVIA));
            $("#lblTotalOtherDed").text(Format(otheDeductionTotal));
            $("#lblTotalOtherIncome").text(otherIncomeTotal);
            $("#lblNetAnualValue").text(incomeFromHousePropertyLetOut);
            $("#lblIncomeLossFromHouseProperty").text(Format(incomeFromHousePropertyLetOut));

            //Income Tax Computation
            var totalIncome = Totals["TotalIncome"];
            var employeeContToNPF = GV("#txtEmployerContToNPS");
            var grossSalary = totalIncome + employeeContToNPF;
            $("#lblGrossSal").text(Format(grossSalary)); //Gross Sal includes employee contribution toNPS

            $("#lblConvAllow").text(Format(TAExmpt));
            $("#lblHRAllow").text(Format(HRAExmpt));

            var MedicalExmpt = Math.min(Parse(Totals["Medical"]), GV("#txtMedicalBill"), 15000);// minimum of medical allowance recieved or medical bills submitted or 15000
            $("#lblMR").text(Format(MedicalExmpt));

            var LTAExmpt = Math.min(Totals["LTA"], GV("#txtLTALTC"));
            $("#lblLTA").text(Format(LTAExmpt));

            var UniformExmpt = Math.min(Totals[UniformAll], GV("#txtUniformAllow"));
            $("#lblUniformAllow").text(Format(UniformExmpt));

            //var ChildEduExmpt = Math.min(Parse(Totals["ChildrenEducAll"]), GV("#txtNoOfSchoolGoingChildren") * 100, 200);
            $("#lblChildrenEducAllow").text(Format(ChildEduExmpt));

            var totalAllow = TAExmpt + HRAExmpt + LTAExmpt + MedicalExmpt + UniformExmpt + ChildEduExmpt
            $("#lblTotalAllow").html(Format(totalAllow));

            var salAfterSec10 = grossSalary - totalAllow;
            $("#lblSalAfterSec10").html(Format(salAfterSec10));

            var professionTax = Totals["ProfessionTax"];
            //$("#lblProfesTax").html(Format(professionTax));
            $("#txtProfessionTaxTotal").val(Format(professionTax));

            var incomeCharUnderHeadSal = salAfterSec10 - professionTax;
            $("#lblIncomeChargableUnderHeadSal").html(Format(incomeCharUnderHeadSal));

            var totalOtherIbcome = GVL("#lblTotalOtherIncome");
            $("#lblIncolefromOtherSource").html(Format(totalOtherIbcome));

            var housingLoanInterPaid = GV("#txtHousingLoanInterPaid");
            var incomeFromHousePropLetOutplusSelfOcc = incomeFromHousePropertyLetOut - housingLoanInterPaid;
            $("#lblIncomeLossHouseProp").html(Format(incomeFromHousePropLetOutplusSelfOcc));


            var grossTotalIncome = incomeCharUnderHeadSal + incomeFromHousePropLetOutplusSelfOcc + totalOtherIbcome;
            $("#lblGrostotalIncome").html(Format(grossTotalIncome));

            var _80C = totalDeductionVIA > 100000 ? 100000 : totalDeductionVIA;
            $("#lbl80C").html(Format(_80C)); //investments(80C)

            var _80CCD2 = employeeContToNPF;
            $("#lbl80CCD2").html(Format(_80CCD2));

            var RGESS = GV("#txt80CCG");
            $("#lbl80CCG").html(Format(RGESS * 0.5 > 25000 ? 25000 : RGESS * 0.50));

            var MIP80D = GV("#txtMIP80D");
            SV2("lbl80D", MIP80D);

            var _80DD = GV("#txt80DD");
            SV2("lbl80DD", _80DD);

            var _8080DDB = GV("#txt80DDB");
            SV2("lbl80DDB", _8080DDB);

            var _80E = GV("#txt80E");
            SV2("lbl80E", _80E);

            var amountClaimed80EE = GV("#txtAmountClaimed80EE");
            var housingLoanIntPaid = GV("#txtHousingLoanInterPaid");
            var _80EE = 0;
            if (dateWithin("01-APR-2013", "31-MAR-2014", $("#txtHousingLoanSancDate").val()))
            {
                if (GV("TxtHousingLoanSancAmt") <= 2500000 && GV("#txtValueOfResHouseProp") <= 4000000 && GV("#txtNoOfResHoseOwened") == 1)
                {
                    _80EE = Math.min(100000, 100000 - amountClaimed80EE, housingLoanIntPaid);
                }
            }
            SV2("lbl80EE", _80EE);

            var _80G = GV("#txt80G");
            SV2("lbl80G", _80G);

            var _80GG = _80GGExpmt;
            SV2("lbl80GG", _80GG);

            var _80TTA = GV("#txt80TTA");
            SV2("lbl80TTA", _80TTA);

            var _80U = GV("#txt80U");
            SV2("lbl80U", _80U);

            var totalDedUnderVIA = _80C + _80CCD2 + RGESS + MIP80D + _80DD + _8080DDB + _80E + _80EE + _80G + _80GG + _80TTA + _80U;
            SV2("lblTotalDedUnderVIA", totalDedUnderVIA);

            SV2("lblNetTotalVIA", totalDedUnderVIA);

            var netTaxableIncome = grossTotalIncome - totalDedUnderVIA;
            $("#lblNetTaxableIncome").html(Format(netTaxableIncome));

            var taxOnTotalIncome = CalculateTax(netTaxableIncome);
            $("#lblTaxOnTotalIncome").html(Format(taxOnTotalIncome));

            var rebate = GVL("#lblRebate");
            var taxDue = taxOnTotalIncome - rebate;
            $("#lblTaxDue").html(Format(taxDue));

            var surcharge = 0;
            if (netTaxableIncome > 10000000)
                surcharge = taxDue * .10;
            $("#lblSurchargeOnTotalTax").html(Format(surcharge));

            var eduCess = taxDue * 0.03;
            $("#lblEducCess").html(Format(Math.round(eduCess)));

            var totalTaxDue = taxDue + surcharge + eduCess;
            $("#lblTotalTaxDue").html(Format(Math.round(totalTaxDue)));

            var taxPaidTillDate = Totals["TDS"];
            $("#lblTaxDedTillDate").html(Format(taxPaidTillDate));
            //var taxPaidTillDate = GVL("#lblTaxDedTillDate");

            var balance = totalTaxDue - taxPaidTillDate;
            $("#lblBalance").html(Format(Math.round(balance)));

            var remMonths = GV("#txtRemainMonthInYear");
            var taxPerMonth = (balance / remMonths).toFixed(2);
            $("#lblTaxPerMonth").html(Format(Math.round(taxPerMonth)));

            var ctr = 0;
            var remTotal = 0;
            for (var i = 12; i > 0; i--)
            {
                $("#lblTDSDue" + i + "").html("");
                if ($("#txtTDS" + i + "").val() == "")
                    ctr++;
            }
            if (balance > 0)
            {
                for (var i = 12; i > 0; i--)
                {
                    if ($("#txtTDS" + i + "").val() == "")
                    {
                        $("#lblTDSDue" + i + "").html(Format(Math.round(balance / ctr)));
                        remTotal += Math.round(balance / ctr);
                    }
                }
                $("#lblTotalTDSDue").text(Format(remTotal));
            }
        }

        function dateWithin(StartDate, EndDate, CheckDate)
        {
            var s, e, c;
            s = new Date(StartDate);
            e = new Date(EndDate);
            c = new Date(CheckDate);
            if ((c <= e && c >= s))
            {
                return true;
            }
            return false;
        }

        function CalculateTax(payable)
        {
            var tax = 0;
            if (payable <= 250000)
                tax = 0;
            else if (payable <= 500000)
                tax = (payable - 250000) * .1;
            else if (payable <= 1000000)
                tax = (payable - 500000) * .2 + 25000;
            else
                tax = (payable - 1000000) * .3 + 125000;
            return tax;
        }

        function SV(targetid, destid)
        {
            $("#" + targetid).html(Format(GV("#" + destid)));
        };

        function SV2(targetid, val)
        {
            $("#" + targetid).html(Format(val));
        };
        function SV3(targetid, val)
        {
            $("#" + targetid).val(val);
        };
        function GV(id)
        {
            var n = parseFloat($(id).val());
            return isNaN(n) ? 0 : n;
        }

        function GVL(id)
        {
            var n = parseFloat($(id).text());
            return isNaN(n) ? 0 : n;
        }

        function Parse(val)
        {
            var n = parseFloat(val);
            return isNaN(n) ? 0 : n;
        }

        function CopyValues()
        {
            var selectedMonth = parseInt($("#ddMonthsForCopy").val());

            for (var i = selectedMonth + 1; i <= 12; i++)
            {
                $(ctlsIncome).each(function ()
                {
                    $("#txt" + this + i).val($("#txt" + this + selectedMonth).val());
                });

                $(ctlsDeduction).each(function ()
                {
                    if ((this + i == "TDS" + i))
                        return;
                    $("#txt" + this + i).val($("#txt" + this + selectedMonth).val());
                });

                $(ctlsOther).each(function ()
                {
                    $("#txt" + this + i).val($("#txt" + this + selectedMonth).val());
                });

                $("#ddMetro" + i).val($("#ddMetro" + selectedMonth).val());
                $("#ddCarProvided" + i).val($("#ddCarProvided" + selectedMonth).val());
            }

            AddValues();
        }

        function SaveToLocal()
        {
            window.localStorage.setItem("AllValues", JSON.stringify(GetAllControls()));
        }

        $.fn.serializeObject = function ()
        {
            var o = {};

            $("input[type=text],select", this).each(function ()
            {
                var id = $(this).attr("id");
                var val = $.trim($(this).val())
                o[id] = val;
            });
            return o;
        };
        function GetAllControls() { return $("#form1").serializeObject(); }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <table style="width: 100%;" class="table">
            <tr font-weight: bold;" class="info">
                <td>Company :
                        <asp:Label ID="lblCompany" runat="server" Text=""></asp:Label>
                </td>
                <td>Employee:
                        <asp:Label ID="lblEmployeeName" runat="server" Text=""></asp:Label>
                        <asp:Label ID="lblEmpoyeeID" runat="server" Text="0"></asp:Label>
                </td>
                <td>FY:
                        <asp:Label ID="lblFY" runat="server" Text="0" Visible="false"></asp:Label><asp:Label ID="lblFY2" runat="server" Text="0"></asp:Label></td>
            </tr>
        </table>
        <div>
            <asp:Label ID="lblIncome" runat="server" Text=""></asp:Label>
        </div>
        <div>
            <table style="width: 50%; background-color: #e6e6e6;" class="pull-right no-print">
                <tr>
                    <td>&nbsp;Copy 
                        <asp:DropDownList ID="ddMonthsForCopy" runat="server"></asp:DropDownList>
                        to remaining month
                        <input type="button" value="Update" onclick="CopyValues()" />
                    </td>
                    <td id="tdTax"></td>
                    <td>
                        <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
                    </td>
                    <td style="text-align: right;">
                        <a href="#" class="btn btn-success" id="btnSave" runat="server">Save</a>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div>
        <table style="width: 100%">
            <tr>
                <td style="width: 45%; vertical-align: top;">
                    <table class="bordered" style="width: 100%;" id="taxDeclarationTable">
                        <tbody>
                            <tr>
                                <th colspan="2">Income Tax Declarations- (Section 2)</th>
                            </tr>
                            <tr>
                                <td>Medical Bil</td>
                                <td style="max-width: 55px;">
                                    <asp:TextBox ID="txtMedicalBill" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Leave Travel Allowance</td>
                                <td>
                                    <asp:TextBox ID="txtLTALTC" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Uniform Allowance</td>
                                <td>
                                    <asp:TextBox ID="txtUniformAllow" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>Number of school going children</td>
                                <td>
                                    <asp:TextBox ID="txtNoOfSchoolGoingChildren" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">&nbsp;</td>
                            </tr>
                            <tr>
                                <th>Deduction Under Section Chapter VIA</th>
                                <th>Amount</th>
                            </tr>
                            <tr>
                                <td>Employees Provident Fund</td>
                                <td>
                                    <asp:Label ID="lblEmployeePF" runat="server" Text="0"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>Voluntary Provident Fund</td>
                                <td>
                                    <asp:Label ID="lblVoluntaryPF" runat="server" Text="0"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>Public Provident Fund</td>
                                <td>
                                    <asp:TextBox ID="txtPublicPF" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>National Saving Certificate (NSC)</td>
                                <td>
                                    <asp:TextBox ID="txtNSC" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>Tax Saving Mutual Funds</td>
                                <td>
                                    <asp:TextBox ID="txtTaxSavingMF" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>Insurance Premium Paid</td>
                                <td>
                                    <asp:TextBox ID="txtInsurencePremiumPaid" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>Savings in Pension Plans</td>
                                <td>
                                    <asp:TextBox ID="txtSavingInPensionPlan" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>Tax Saving Fixed Deposit with Banks</td>
                                <td>
                                    <asp:TextBox ID="txtTaxSavingFD" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>Senior Citizens Savings Scheme</td>
                                <td>
                                    <asp:TextBox ID="txtSeniorCitizenSaving" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>National Pension System (NPS)</td>
                                <td>
                                    <asp:TextBox ID="txtNPS" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>Children Education Fee</td>
                                <td>
                                    <asp:TextBox ID="txtChildrenEduFee" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>Housing Loan Principal Repayment/Stamp Duty Paid</td>
                                <td>
                                    <asp:TextBox ID="txtHousingLoanPrincipal" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>Others (Post Office Saving,ULIP, etc.)</td>
                                <td>
                                    <asp:TextBox ID="txtOtherPOSavings" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <th>Total</th>
                                <th class="number">
                                    <asp:Label ID="lblTotalDeductionVIA" runat="server" Text="0.0"></asp:Label></th>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <th>Other Deductions</th>
                                <th>&nbsp;</th>
                            </tr>
                            <tr>
                                <td>Employer Contribution to NPS </td>
                                <td>
                                    <asp:TextBox ID="txtEmployerContToNPS" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>Medical Insurance Premium (sec 80D)</td>
                                <td>
                                    <asp:TextBox ID="txtMIP80D" CssClass="tolltip" runat="server" data-toggle="tooltip" data-placement="right" title="Rs.35000 is allowed if medical insurance policy includes your dependant parent as a senior citizen"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>Medical treatment for handicapped dependents (Sec 80DD)</td>
                                <td>
                                    <asp:TextBox ID="txt80DD" runat="server" title="Maximum Allowed,if disability < 80% RS.50,000.00, esle Rs.1,00,000.00"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>Medical treatment for specified diseases (Sec 80DDB)</td>
                                <td>
                                    <asp:TextBox ID="txt80DDB" runat="server" title="The deduction allowed is equal to he amount actualy paid or Rs.40,000 whichever is less.In case of senior citizen the amount of deduction allowed is Rs.60,000/-"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>Interest on Higher Education Loan(Sec 80E)</td>
                                <td>
                                    <asp:TextBox ID="txt80E" runat="server" title="Only interest amount is allowed"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>Rajiv Gandhi Equity Savings Scheme (RGESS) (Se 80CCG)</td>
                                <td>
                                    <asp:TextBox ID="txt80CCG" runat="server" title="The deduction under the scheme is available only to new retail investors,Please check your eligibility to this scheme.50% of the amount invested,maximum of Rs.25000/- will be allowed as deduction from taxable income"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>Donations to charitable institutions and others (Sec 80G)</td>
                                <td>
                                    <asp:TextBox ID="txt80G" runat="server" title="Please check the eligibility and deductiable amount of donation.Donation made to national relief fund are eligible for 100% deduction from taxable income, and in any other case the deduction is redirect to 50% of amount paid"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>Deduction for permanent disability (80U)</td>
                                <td>
                                    <asp:TextBox ID="txt80U" runat="server" title="If disability is above 40% and below 80% available deduction is Rs.50000.00, If disability is above 80% the limit is RS.1,00,000.00"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <th>Total</th>
                                <th class="number">
                                    <asp:Label ID="lblTotalOtherDed" runat="server" Text="0.0"></asp:Label>
                                </th>
                            </tr>

                            <tr>
                                <th>Other Income</th>
                                <th>&nbsp;</th>
                            </tr>
                            <tr>
                                <td>Interest income from deposit in a savings accounts(80TTA)</td>
                                <td>
                                    <asp:TextBox ID="txt80TTA" runat="server" title="Only income to be updated"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>Any Other Taxable Income (Other than interest income)</td>
                                <td>
                                    <asp:TextBox ID="txtOtherTaxableIncome" runat="server" title="Only income to be updated"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <th>Total</th>
                                <th class="number">
                                    <asp:Label ID="lblTotalOtherIncome" runat="server" Text="0.0"></asp:Label></th>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <th>Income from House property - (Section 3)</th>
                                <th></th>
                            </tr>
                            <tr>
                                <td>Housing Loan Sanction date</td>
                                <td>
                                    <asp:TextBox ID="txtHousingLoanSancDate" runat="server" title="Loan taken durinng FY 2013-2014(01/04/2013) only eligible for additional deduction of Rs.1 lakh"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>Housing loan Sanctioned Amount</td>
                                <td>
                                    <asp:TextBox ID="TxtHousingLoanSancAmt" runat="server" title="Loan sanction value should be less than 25 lakh to get the additional deduction u/s 80EE"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>Value of the residential house Property</td>
                                <td>
                                    <asp:TextBox ID="txtValueOfResHouseProp" runat="server" title="Loan sanction value should be less than 25 lakh to get the additional deduction u/s 80EE"></asp:TextBox></td>
                            </tr>

                            <tr>
                                <td>Amount claimed u/s 80 EE in the FY 2013-2014</td>
                                <td>
                                    <asp:TextBox ID="txtAmountClaimed80EE" runat="server" title="Max deduction allowed u/s 80EE is Rs. 1 lakh, its subject to the amount claimed in the FY 2013-14"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Number of residential houses owned</td>
                                <td>
                                    <asp:TextBox ID="txtNoOfResHoseOwened" runat="server" title="Loan sanction value should be less than 25 lakh to get the additional deduction u/s 80EE"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>Housing Loan Interest paid (Self occupied property)</td>
                                <td>
                                    <asp:TextBox ID="txtHousingLoanInterPaid" runat="server" title="Please update the total intrest paid/payable for the currnt financial year.(Self occupied property only)"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <th>Income from House property- Let Out</th>
                                <th>&nbsp;</th>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>Rent received during the year- (Annual Value)</td>
                                <td>
                                    <asp:TextBox ID="txtRentRecieved" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>Interest paid during the year</td>
                                <td>
                                    <asp:TextBox ID="txtInterestPaid" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>Municipal Tax Paid</td>
                                <td>
                                    <asp:TextBox ID="txtMunicipalTaxPaid" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>Less : Repairs and Maintenance (30% of annual value)</td>
                                <td>
                                    <asp:Label ID="lblRepairsandMaint" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>Net Annual value</td>
                                <td>
                                    <asp:Label ID="lblNetAnualValue" runat="server" Text="0.0"></asp:Label></td>
                            </tr>
                            <tr>
                                <th>Income (Loss) from house property</th>
                                <th class="number">
                                    <asp:Label ID="lblIncomeLossFromHouseProperty" runat="server" Text="0.0"></asp:Label></th>
                            </tr>
                        </tbody>
                    </table>
                </td>

                <td style="width: 5%">&nbsp;
                </td>
                <td style="width: 50%; vertical-align: top;">
                    <table id="tableTaxComputation" class="bordered" style="width: 100%;">
                        <tbody>
                            <tr>
                                <th colspan="3">Income Tax Computations</th>
                                <th>&nbsp;</th>
                            </tr>

                            <tr>
                                <td colspan="3">Gross Salary (includes Employer contribution to NPS **)</td>
                                <td>
                                    <asp:Label ID="lblGrossSal" runat="server" Text="0.0"></asp:Label></td>
                            </tr>
                            <tr>
                                <th colspan="3">Exemptions U/s 10</th>
                                <td>&nbsp;</td>
                            </tr>

                            <tr>
                                <td colspan="2">Conveyance Allowance</td>
                                <td>
                                    <asp:Label ID="lblConvAllow" runat="server" Text="0.0"></asp:Label></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td colspan="2">House Rent Allowance</td>
                                <td>
                                    <asp:Label ID="lblHRAllow" runat="server" Text="0.0"></asp:Label></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td colspan="2">Leave Travel Allowance</td>
                                <td>
                                    <asp:Label ID="lblLTA" runat="server" Text="0.0"></asp:Label></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td colspan="2">Medical Reimbursement</td>
                                <td>
                                    <asp:Label ID="lblMR" runat="server" Text="0.0"></asp:Label></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td colspan="2">Uniform Allowance</td>
                                <td>
                                    <asp:Label ID="lblUniformAllow" runat="server" Text="0.0"></asp:Label></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td colspan="2">Children Education Allowance</td>
                                <td>
                                    <asp:Label ID="lblChildrenEducAllow" runat="server" Text="0.0"></asp:Label></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td colspan="3">Total</td>
                                <td>
                                    <asp:Label ID="lblTotalAllow" runat="server" Text="0.0"></asp:Label></td>
                            </tr>
                            <tr>
                                <td colspan="3">Gross Salary after Section 10</td>
                                <td>
                                    <asp:Label ID="lblSalAfterSec10" runat="server" Text="0.0"></asp:Label></td>
                            </tr>
                            <tr>
                                <td colspan="3">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="3">Deduction U/s 16</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="2">Professional Tax (Sec 16 iii)</td>
                                <td>
                                    <asp:Label ID="lblProfesTax" runat="server" Text="0.0"></asp:Label></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td colspan="3">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="3">Income chargeable under head 'Salaries'</td>
                                <td>
                                    <asp:Label ID="lblIncomeChargableUnderHeadSal" runat="server" Text="0.0"></asp:Label></td>
                            </tr>
                            <tr>
                                <td colspan="3">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="3">Income (loss) on House property. (Let out+self occupied)</td>
                                <td>
                                    <asp:Label ID="lblIncomeLossHouseProp" runat="server" Text="0.0"></asp:Label></td>
                            </tr>
                            <tr>
                                <td colspan="3">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="3">Income from Other Sources</td>
                                <td>
                                    <asp:Label ID="lblIncolefromOtherSource" runat="server" Text="0.0"></asp:Label></td>
                            </tr>
                            <tr>
                                <td colspan="3">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="3">Gross Total Income</td>
                                <td>
                                    <asp:Label ID="lblGrostotalIncome" runat="server" Text="0.0"></asp:Label></td>
                            </tr>
                            <tr>
                                <td colspan="3">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <th colspan="2">Deductions under chapter VI-A</th>

                                <th style="text-align: right; padding-right: 2px;">Rs.</th>
                                <th>&nbsp;</th>
                            </tr>
                            <tr>
                                <td colspan="2">Investments(Sec 80C)</td>

                                <td>
                                    <asp:Label ID="lbl80C" runat="server" Text="0.0"></asp:Label></td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="2">Employer Contribution to NPS (Sec 80CCD2)</td>

                                <td>
                                    <asp:Label ID="lbl80CCD2" runat="server" Text="0.0"></asp:Label></td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="2">Rajiv Gandhi Equity Savings Scheme (Sec 80CCG)</td>

                                <td>
                                    <asp:Label ID="lbl80CCG" runat="server" Text="0.0"></asp:Label></td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="2">Medical Insurance Premium (Sec 80D)</td>

                                <td>
                                    <asp:Label ID="lbl80D" runat="server" Text="0.0"></asp:Label></td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="2">Medical treatment for handicapped dependents (Sec 80DD)</td>

                                <td>
                                    <asp:Label ID="lbl80DD" runat="server" Text="0.0"></asp:Label></td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="2">Medical treatment for specified diseases (Sec 80DDB)</td>

                                <td>
                                    <asp:Label ID="lbl80DDB" runat="server" Text="0.0"></asp:Label></td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="2">Interest on Higher Education Loan(Sec 80E)</td>

                                <td>
                                    <asp:Label ID="lbl80E" runat="server" Text="0.0"></asp:Label></td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="2">Interest on Housing loan (Sec 80EE)</td>

                                <td>
                                    <asp:Label ID="lbl80EE" runat="server" Text="0.0"></asp:Label></td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="2">Donations to charitable institutions and others (Sec 80G)</td>

                                <td>
                                    <asp:Label ID="lbl80G" runat="server" Text="0.0"></asp:Label></td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="2">Deductions in respect of rents paid (Sec 80GG)</td>

                                <td>
                                    <asp:Label ID="lbl80GG" runat="server" Text="0.0"></asp:Label></td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="2">Interest income from deposit in a savings accounts(80TTA)</td>

                                <td>
                                    <asp:Label ID="lbl80TTA" runat="server" Text="0.0"></asp:Label></td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="2">Deduction for permanent disability (80U)</td>

                                <td>
                                    <asp:Label ID="lbl80U" runat="server" Text="0.0"></asp:Label></td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="3">Total</td>
                                <td>
                                    <asp:Label ID="lblNetTotalVIA" runat="server" Text="0"></asp:Label></td>
                            </tr>
                            <tr>
                                <td colspan="3">Net taxable income</td>
                                <td>
                                    <asp:Label ID="lblNetTaxableIncome" runat="server" Text="0"></asp:Label></td>
                            </tr>
                            <tr>
                                <td colspan="3"></td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="3">Tax on Total Income</td>
                                <td>
                                    <asp:Label ID="lblTaxOnTotalIncome" runat="server" Text="0"></asp:Label></td>
                            </tr>
                            <tr>
                                <td colspan="3">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="3">Rebate u/s 87</td>
                                <td>
                                    <asp:Label ID="lblRebate" runat="server" Text="0"></asp:Label></td>
                            </tr>
                            <tr>
                                <td colspan="3">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="3">Tax Due</td>
                                <td>
                                    <asp:Label ID="lblTaxDue" runat="server" Text="0"></asp:Label></td>
                            </tr>
                            <tr>
                                <td colspan="3"></td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="3">Surcharge on Tax</td>
                                <td>
                                    <asp:Label ID="lblSurchargeOnTotalTax" runat="server" Text="0"></asp:Label></td>
                            </tr>
                            <tr>
                                <td colspan="3">Education Cess @3%</td>
                                <td>
                                    <asp:Label ID="lblEducCess" runat="server" Text="0"></asp:Label></td>
                            </tr>
                            <tr>
                                <td colspan="3">Total Tax Due</td>
                                <td>
                                    <asp:Label ID="lblTotalTaxDue" runat="server" Text="0"></asp:Label></td>
                            </tr>
                            <tr>
                                <td colspan="3">Less Tax Deducted Till Date</td>
                                <td>
                                    <asp:Label ID="lblTaxDedTillDate" runat="server" Text="0"></asp:Label></td>
                            </tr>
                            <tr>
                                <td colspan="3">Balance</td>
                                <td>
                                    <asp:Label ID="lblBalance" runat="server" Text="0"></asp:Label></td>
                            </tr>
                            <%--<tr>
                                    <td colspan="3">Remaining Month in the Year</td>
                                    <td>
                                        <asp:TextBox ID="txtRemainMonthInYear" runat="server" Text="12"></asp:TextBox></td>
                                </tr>--%>
                            <%--  <tr>
                                    <th colspan="3">Tax Per Month</th>
                                    <th>
                                        <asp:Label ID="lblTaxPerMonth" runat="server" Text="0.0"></asp:Label></th>
                                </tr>--%>
                        </tbody>
                    </table>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

<%--<!DOCTYPE html>--%>
<%--<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <script src="js/jquery-1.9.1.min.js"></script>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <style type="text/css">
        .table-condensed > tbody > tr > td, .table-condensed > tfoot > tr > td
        {
            padding: 2px;
        }
        
        .table-condensed > thead > tr > th, .table-condensed > tbody > tr > th
        {
            padding: 1px;
        }

        input, button, select, textarea
        {
            line-height: 15px !important;
        }

        table
        {
            border-collapse: collapse;
        }

        #tableSalary tr:hover
        {
            background-color: #e6e6e6;
        }

        .bordered td
        {
            border: 1px solid lightgrey;
            text-indent: 5px;
        }

        input[type=text]
        {
            background-color: #F7F5CC;
            border: 1px solid #c0c0c0;
            text-align: right;
            padding-right: 2px;
        }

        #taxDeclarationTable td
        {
        }

            #tableTaxComputation td:last-child, #taxDeclarationTable td:last-child
            {
                width: 55px;
                padding: 0px;
                text-indent: 0px;
                text-align: right;
                font-weight: bold;
            }

        #tableTaxComputation tr td:first-child + td
        {
            text-align: right;
            padding-right: 5px;
        }

        #tableTaxComputation td:last-child > span, #taxDeclarationTable td:last-child > span
        {
            margin-right: 2px;
        }

        #tableTaxComputation input[type=text], #taxDeclarationTable input[type=text]
        {
            width: 100%;
            margin: 0px;
            border: 0px;
        }

        .number
        {
            text-align: right;
        }

        @media print
        {
            .no-print, .no-print *
            {
                display: none !important;
            }

            .show-print
            {
                display: block !important;
            }

            a:link:after, a:visited:after
            {
                content: "";
            }
        }
    </style>
    <script type="text/javascript">

        var UniformAll = "UniformAll";
        var ctlsIncome = ["Basic", "HRA", "TravelAll", "Medical", "SpecialAll", "Other", "DA", "LTA", "UniformAll", "ChildrenEducAll"]
        var ctlsDeduction = ["PF", "Loan", "TDS", "VPF", "ProfessionTax"];
        var ctlsOther = ["RentPaid", "Paid", "PaidOn"];
        var Totals = new Array();

        $(document).ready(function ()
        {
            //debugger;
            $('.tooltip').tooltip();
            $("input[type=text]").keyup(function ()
            {
                AddValues();
                //SaveToLocal();
            });

            $("select").change(function ()
            {
                AddValues();
                //SaveToLocal();
            });

            var empid = $("#lblEmpoyeeID").text();
            var FY = $("#lblFY2").text().split('-')[0];
            ShowData(empid, FY);

            AddValues();

            $("#btnSave").click(function ()
            {
                var EmpData = window.localStorage.getItem("AllValues");
                $.post("/Data.aspx?Action=UpdateEmployeeSalaryData&Data1=" + empid + "&Data2=" + FY + "", { EmployeeData: EmpData }, function (data)
                {
                    if (data.replace('~', '') == "")
                    {
                        $("#lblMessage").html("<span style='color:green;'>&nbsp;Saved!</span>");
                        ShowData(empid, FY);
                    }
                    else
                    {
                       $("#lblMessage").html("<span style='color:red;'>&nbsp;Not Saved!</span>");
                    }
                });
            });
        });

        function ShowData(empid, FY)
        {
            $.ajax({
                url: "/Data.aspx?Action=GetEmployeeSalaryData&Data1=" + empid + "&Data2=" + FY + "", cache: false, success: function (data)
                {
                    var Data = data.replace("~", "");
                    if (Data != null)
                    {
                        Data = JSON.parse(Data);
                        $.each(Data, function (key, val)
                        {
                            $("#" + key).val(val);
                        });
                        AddValues();
                    }
                },
                error: function (e)
                {
                }
            })

            $.ajax({
                url: "/Data.aspx?Action=GetChallan&Data1=" + empid + "&Data2=" + FY + "", cache: false, success: function (data)
                {
                    var Data = data.replace("~", "");
                    if (Data != null)
                    {
                        Data = JSON.parse(Data);
                        console.log(Data);
                        $.each(Data, function (key, value)
                        {
                            var month = (value.month);
                            var challanno = value.challan.challanno;
                            $("#txtChallan" + month).val(challanno);
                        });
                    }
                },
                error: function (e)
                {
                }
            })

            $.ajax({
                url: "/Data.aspx?Action=GetTDSData&Data1=" + empid + "&Data2=" + FY + "", cache: false, success: function (data)
                {
                    var Data = data.replace("~", "");
                    Data = JSON.parse(Data);

                    if (Data != null)
                    {
                        for (var i = 1; i <= 12; i++)
                        {
                            $("#txtTDS" + i + "").css("background-color", "#FDD0BA");
                        }
                        $.each(Data, function (key, value)
                        {
                            var month = value.month;
                            var tds = value.tds;
                            if ($("#txtTDS" + month + "").val() == tds)
                            {
                                $("#txtTDS" + month + "").css("background-color", "#D3F7CC");
                            }
                        });
                    }
                },
                error: function (e)
                {

                }
            })

        };

        function Format(x)
        {
            x = x.toString();
            if (x.indexOf('.') > 0)
            {
                var mianPart = x.split('.')[0];
                var decPart = x.split('.')[1];
            }
            else
            {
                mianPart = x;
                decPart = "";
            }
            var lastThree = mianPart.substring(mianPart.length - 3);
            var otherNumbers = mianPart.substring(0, mianPart.length - 3);
            if (otherNumbers != '')
                lastThree = ',' + lastThree;
            return otherNumbers.replace(/\B(?=(\d{2})+(?!\d))/g, ",") + lastThree + (decPart == "" ? "" : "." + decPart);
        }

        function AddValues()
        {
            Totals = new Array();

            Totals["TotalDeduction"] = 0;
            Totals["TotalIncome"] = 0;
            Totals["Net"] = 0;
            Totals["Paid"] = 0;
            Totals["RentPaid"] = 0;

            var HRAExmpt = 0;
            var TAExmpt = 0;
            var ChildEduExmpt = 0;
            var _80GGExpmt = 0;

            //var totalBasic = 0;
            for (var i = 1; i <= 12; i++)
            {
                var totIncome = 0;
                $(ctlsIncome).each(function ()
                {
                    var n = GV("#txt" + this + i);

                    if (Totals[this] == undefined)
                        Totals[this] = 0;

                    Totals[this] += n;
                    totIncome += n;
                });

                //$("#lblTotalIncome" + i).html(Format(totIncome));
                $("#txtTotalIncome" + i).val(Format(totIncome));

                Totals["TotalIncome"] += totIncome;

                var totDecduction = 0;
                $(ctlsDeduction).each(function ()
                {
                    var n = GV("#txt" + this + i);

                    if (Totals[this] == undefined)
                        Totals[this] = 0;

                    Totals[this] += n;
                    totDecduction += n;
                });

                //$("#lblTotalDeduction" + i).html(Format(totDecduction));
                $("#txtTotalDeduction" + i).val(Format(totDecduction));

                Totals["TotalDeduction"] += totDecduction;

                $("#lblNet" + i).html(Format(totIncome - totDecduction));

                Totals["Net"] += totIncome - totDecduction;

                Totals["Paid"] += GV("#txtPaid" + i);

                Totals["RentPaid"] += GV("#txtRentPaid" + i);

                //Max HRA should be 50% of Basic Sal in case of Metro othervise 40%
                var salary = GV("#txtBasic" + i) + GV("#txtDA" + i);
                var maxHRA = ($("#ddMetro" + i).val() == "M") ? 0.5 : 0.4;
                //   House Rent Allowances: Commonly known as HRA, exemption being bestowed through section 10(13A) briefed as:
                //   1. An amount equal to 50 per cent of salary, where residential house is situated at Mumbai, Kolkata, Delhi or Chennai and an amount equal to 40 per cent of salary, where residential house is situated at any other place.
                //   2. House rent allowance received by the employee in respect of the period during which rental accommodation is occupied by the employee during the previous year.  
                //   3. Rent paid minus 10 per cent of salary

                //   PLEASE NOTE:
                //   Salary here means Basic+ D.A+ Commission based on fixed % of turnover achieved by an employee. 
                //   MODE OF COMPUTATION OF EXEMPTION: Under section 10(13A), the amount of exemption in respect of house rent allowance received by an employee depends upon the following:
                //   -     Salary of the employee;
                //   -     House rent allowance;
                //   -     Rent paid; and
                //   -     The Place where house is taken on rent.
                //When these four are same throughout the year, the exemption under section 10(13A) should be calculated on “ANNUAL” basis. When, however, there is a 
                //Change in respect of any of the above factors will make the calculation to be done on “MONTHLY” Basis.

                HRAExmpt += Math.min(GV("#txtHRA" + i), maxHRA * salary, Math.max(GV("#txtRentPaid" + i) - salary * .1, 0));

                TAExmpt += Math.min(GV("#txtTravelAll" + i), 800);

                var noOfChildren = GV("#txtNoOfSchoolGoingChildren");
                ChildEduExmpt += Math.min(GV("#txtChildrenEducAll" + i), noOfChildren * 100, 200);

                if (GV("#txtHRA" + i) == 0 && GV("#txtNoOfResHoseOwened") == 0)
                {
                    _80GGExpmt += Math.min((GV("#txtRentPaid" + i) - totIncome * .1), 2000, totIncome * .25);
                }
                SaveToLocal();
            }

            $(ctlsIncome).each(function ()
            {
                //$("#txtTotal" + this).html(Format(Totals[this]));
                $("#txt" + this + "Total").val(Format(Totals[this]));
            });

            $(ctlsDeduction).each(function ()
            {
                //$("#lblTotal" + this).html(Format(Totals[this]));
                $("#txt" + this + "Total").val(Format(Totals[this]));
            });
            //$("#lblTotalTotalIncome").html(Format(Totals["TotalIncome"]));txtTotalDeductionTotal
            $("#txtTotalIncomeTotal").val(Format(Totals["TotalIncome"]));
            //$("#lblTotalTotalDeduction").html(Format(Totals["TotalDeduction"]));
            $("#txtTotalDeductionTotal").val(Format(Totals["TotalDeduction"]));
            $("#lblTotalNet").html(Format(Totals["Net"]));

            //$("#lblTotalPaid").html(Format(Totals["Paid"]));
            $("#txtPaidTotal").val(Format(Totals["Paid"]));
            //$("#lblTotalRentPaid").html(Format(Totals["RentPaid"]));
            $("#txtRentPaidTotal").val(Format(Totals["RentPaid"]));

            //tax  on  Totals["Net"]

            var payable = Totals["Net"];
            var tax = 0;
            if (payable <= 250000)
                tax = 0;
            else if (payable <= 500000)
                tax = (payable - 250000) * .1;
            else if (payable <= 1000000)
                tax = (payable - 500000) * .2 + 25000;
            else
                tax = (payable - 1000000) * .3 + 125000;

            //$("#tdTax").html("Tax=" + tax);

            if (GV("#txtMedicalBill") > 15000)
            {
                alert("Maximum allowed value is 15000");
                //$("#txtMedicalBill").val("15000");
                SV3("txtMedicalBill", 15000);
            }
            if (GV("#txtMIP80D") > 35000)
            {
                alert("Maximum allowed value is 35000");
                SV3("txtMIP80D", 35000);
            }
            if (GV("#txt80DD") > 100000)
            {
                alert("Maximum allowed value is 1,00,000");
                SV3("txt80DD", 0);
            }
            if (GV("#txt80DDB") > 60000)
            {
                alert("Maximum allowed value is 60,000");
                SV3("txt80DDB", 0);
            }

            //if (GV("#txtRemainMonthInYear") > 12 || GV("#txtRemainMonthInYear") < 1)
            //{
            //    alert("Please Enter a valid value between 1 to 12");
            //    $("#txtRemainMonthInYear").val("12");
            //}

            $("#lblEmployeePF").text(Totals["PF"]);
            $("#lblVoluntaryPF").text(Totals["VPF"]);

            var totalDeductionVIA = GVL("#lblEmployeePF")
                                + GVL("#lblVoluntaryPF")
                                + GV("#txtPublicPF")
                                + GV("#txtNSC")
                                + GV("#txtTaxSavingMF")
                                + GV("#txtInsurencePremiumPaid")
                                + GV("#txtSavingInPensionPlan")
                                + GV("#txtTaxSavingFD")
                                + GV("#txtSeniorCitizenSaving")
                                + GV("#txtNPS")
                                + GV("#txtChildrenEduFee")
                                + GV("#txtHousingLoanPrincipal")
                                + GV("#txtOtherPOSavings");

            var otheDeductionTotal = GV("#txtEmployerContToNPS")
               + GV("#txtMIP80D")
               + GV("#txt80DD")
               + GV("#txt80DDB")
               + GV("#txt80E")
               + GV("#txt80CCG")
               + GV("#txt80G")
               + GV("#txt80U");

            var otherIncomeTotal = GV("#txt80TTA") + GV("#txtOtherTaxableIncome")

            var rentReceived = GV("#txtRentRecieved");
            var municTaxPaid = GV("#txtMunicipalTaxPaid");

            var repairsandMaintinance = ((rentReceived - municTaxPaid) * 0.3);

            $("#lblRepairsandMaint").text(repairsandMaintinance);
            var interestPaid = GV("#txtInterestPaid");
            var incomeFromHousePropertyLetOut = (rentReceived - municTaxPaid - repairsandMaintinance - interestPaid);

            $("#lblTotalDeductionVIA").text(Format(totalDeductionVIA));
            $("#lblTotalOtherDed").text(Format(otheDeductionTotal));
            $("#lblTotalOtherIncome").text(otherIncomeTotal);
            $("#lblNetAnualValue").text(incomeFromHousePropertyLetOut);
            $("#lblIncomeLossFromHouseProperty").text(Format(incomeFromHousePropertyLetOut));

            //Income Tax Computation
            var totalIncome = Totals["TotalIncome"];
            var employeeContToNPF = GV("#txtEmployerContToNPS");
            var grossSalary = totalIncome + employeeContToNPF;
            $("#lblGrossSal").text(Format(grossSalary)); //Gross Sal includes employee contribution toNPS

            $("#lblConvAllow").text(Format(TAExmpt));
            $("#lblHRAllow").text(Format(HRAExmpt));

            var MedicalExmpt = Math.min(Parse(Totals["Medical"]), GV("#txtMedicalBill"), 15000);// minimum of medical allowance recieved or medical bills submitted or 15000
            $("#lblMR").text(Format(MedicalExmpt));

            var LTAExmpt = Math.min(Totals["LTA"], GV("#txtLTALTC"));
            $("#lblLTA").text(Format(LTAExmpt));

            var UniformExmpt = Math.min(Totals[UniformAll], GV("#txtUniformAllow"));
            $("#lblUniformAllow").text(Format(UniformExmpt));

            //var ChildEduExmpt = Math.min(Parse(Totals["ChildrenEducAll"]), GV("#txtNoOfSchoolGoingChildren") * 100, 200);
            $("#lblChildrenEducAllow").text(Format(ChildEduExmpt));

            var totalAllow = TAExmpt + HRAExmpt + LTAExmpt + MedicalExmpt + UniformExmpt + ChildEduExmpt
            $("#lblTotalAllow").html(Format(totalAllow));

            var salAfterSec10 = grossSalary - totalAllow;
            $("#lblSalAfterSec10").html(Format(salAfterSec10));

            var professionTax = Totals["ProfessionTax"];
            //$("#lblProfesTax").html(Format(professionTax));
            $("#txtProfessionTaxTotal").val(Format(professionTax));

            var incomeCharUnderHeadSal = salAfterSec10 - professionTax;
            $("#lblIncomeChargableUnderHeadSal").html(Format(incomeCharUnderHeadSal));

            var totalOtherIbcome = GVL("#lblTotalOtherIncome");
            $("#lblIncolefromOtherSource").html(Format(totalOtherIbcome));

            var housingLoanInterPaid = GV("#txtHousingLoanInterPaid");
            var incomeFromHousePropLetOutplusSelfOcc = incomeFromHousePropertyLetOut - housingLoanInterPaid;
            $("#lblIncomeLossHouseProp").html(Format(incomeFromHousePropLetOutplusSelfOcc));


            var grossTotalIncome = incomeCharUnderHeadSal + incomeFromHousePropLetOutplusSelfOcc + totalOtherIbcome;
            $("#lblGrostotalIncome").html(Format(grossTotalIncome));

            var _80C = totalDeductionVIA > 100000 ? 100000 : totalDeductionVIA;
            $("#lbl80C").html(Format(_80C)); //investments(80C)

            var _80CCD2 = employeeContToNPF;
            $("#lbl80CCD2").html(Format(_80CCD2));

            var RGESS = GV("#txt80CCG");
            $("#lbl80CCG").html(Format(RGESS * 0.5 > 25000 ? 25000 : RGESS * 0.50));

            var MIP80D = GV("#txtMIP80D");
            SV2("lbl80D", MIP80D);

            var _80DD = GV("#txt80DD");
            SV2("lbl80DD", _80DD);

            var _8080DDB = GV("#txt80DDB");
            SV2("lbl80DDB", _8080DDB);

            var _80E = GV("#txt80E");
            SV2("lbl80E", _80E);

            var amountClaimed80EE = GV("#txtAmountClaimed80EE");
            var housingLoanIntPaid = GV("#txtHousingLoanInterPaid");
            var _80EE = 0;
            if (dateWithin("01-APR-2013", "31-MAR-2014", $("#txtHousingLoanSancDate").val()))
            {
                if (GV("TxtHousingLoanSancAmt") <= 2500000 && GV("#txtValueOfResHouseProp") <= 4000000 && GV("#txtNoOfResHoseOwened") == 1)
                {
                    _80EE = Math.min(100000, 100000 - amountClaimed80EE, housingLoanIntPaid);
                }
            }
            SV2("lbl80EE", _80EE);

            var _80G = GV("#txt80G");
            SV2("lbl80G", _80G);

            var _80GG = _80GGExpmt;
            SV2("lbl80GG", _80GG);

            var _80TTA = GV("#txt80TTA");
            SV2("lbl80TTA", _80TTA);

            var _80U = GV("#txt80U");
            SV2("lbl80U", _80U);

            var totalDedUnderVIA = _80C + _80CCD2 + RGESS + MIP80D + _80DD + _8080DDB + _80E + _80EE + _80G + _80GG + _80TTA + _80U;
            SV2("lblTotalDedUnderVIA", totalDedUnderVIA);

            SV2("lblNetTotalVIA", totalDedUnderVIA);

            var netTaxableIncome = grossTotalIncome - totalDedUnderVIA;
            $("#lblNetTaxableIncome").html(Format(netTaxableIncome));

            var taxOnTotalIncome = CalculateTax(netTaxableIncome);
            $("#lblTaxOnTotalIncome").html(Format(taxOnTotalIncome));

            var rebate = GVL("#lblRebate");
            var taxDue = taxOnTotalIncome - rebate;
            $("#lblTaxDue").html(Format(taxDue));

            var surcharge = 0;
            if (netTaxableIncome > 10000000)
                surcharge = taxDue * .10;
            $("#lblSurchargeOnTotalTax").html(Format(surcharge));

            var eduCess = taxDue * 0.03;
            $("#lblEducCess").html(Format(Math.round(eduCess)));

            var totalTaxDue = taxDue + surcharge + eduCess;
            $("#lblTotalTaxDue").html(Format(Math.round(totalTaxDue)));

            var taxPaidTillDate = Totals["TDS"];
            $("#lblTaxDedTillDate").html(Format(taxPaidTillDate));
            //var taxPaidTillDate = GVL("#lblTaxDedTillDate");

            var balance = totalTaxDue - taxPaidTillDate;
            $("#lblBalance").html(Format(Math.round(balance)));

            var remMonths = GV("#txtRemainMonthInYear");
            var taxPerMonth = (balance / remMonths).toFixed(2);
            $("#lblTaxPerMonth").html(Format(Math.round(taxPerMonth)));

            var ctr = 0;
            var remTotal = 0;
            for (var i = 12; i > 0; i--)
            {
                $("#lblTDSDue" + i + "").html("");
                if ($("#txtTDS" + i + "").val() == "")
                    ctr++;
            }
            if (balance > 0)
            {
                for (var i = 12; i > 0; i--)
                {
                    if ($("#txtTDS" + i + "").val() == "")
                    {
                        $("#lblTDSDue" + i + "").html(Format(Math.round(balance / ctr)));
                        remTotal += Math.round(balance / ctr);
                    }
                }
                $("#lblTotalTDSDue").text(Format(remTotal));
            }
        }

        function dateWithin(StartDate, EndDate, CheckDate)
        {
            var s, e, c;
            s = new Date(StartDate);
            e = new Date(EndDate);
            c = new Date(CheckDate);
            if ((c <= e && c >= s))
            {
                return true;
            }
            return false;
        }

        function CalculateTax(payable)
        {
            var tax = 0;
            if (payable <= 250000)
                tax = 0;
            else if (payable <= 500000)
                tax = (payable - 250000) * .1;
            else if (payable <= 1000000)
                tax = (payable - 500000) * .2 + 25000;
            else
                tax = (payable - 1000000) * .3 + 125000;
            return tax;
        }

        function SV(targetid, destid)
        {
            $("#" + targetid).html(Format(GV("#" + destid)));
        };

        function SV2(targetid, val)
        {
            $("#" + targetid).html(Format(val));
        };
        function SV3(targetid, val)
        {
            $("#" + targetid).val(val);
        };
        function GV(id)
        {
            var n = parseFloat($(id).val());
            return isNaN(n) ? 0 : n;
        }

        function GVL(id)
        {
            var n = parseFloat($(id).text());
            return isNaN(n) ? 0 : n;
        }

        function Parse(val)
        {
            var n = parseFloat(val);
            return isNaN(n) ? 0 : n;
        }

        function CopyValues()
        {
            var selectedMonth = parseInt($("#ddMonthsForCopy").val());

            for (var i = selectedMonth + 1; i <= 12; i++)
            {
                $(ctlsIncome).each(function ()
                {
                    $("#txt" + this + i).val($("#txt" + this + selectedMonth).val());
                });

                $(ctlsDeduction).each(function ()
                {
                    if ((this + i == "TDS" + i))
                        return;
                    $("#txt" + this + i).val($("#txt" + this + selectedMonth).val());
                });

                $(ctlsOther).each(function ()
                {
                    $("#txt" + this + i).val($("#txt" + this + selectedMonth).val());
                });

                $("#ddMetro" + i).val($("#ddMetro" + selectedMonth).val());
                $("#ddCarProvided" + i).val($("#ddCarProvided" + selectedMonth).val());
            }

            AddValues();
        }

        function SaveToLocal()
        {
            window.localStorage.setItem("AllValues", JSON.stringify(GetAllControls()));
        }

        $.fn.serializeObject = function ()
        {
            var o = {};

            $("input[type=text],select", this).each(function ()
            {
                var id = $(this).attr("id");
                var val = $.trim($(this).val())
                o[id] = val;
            });
            return o;
        };
        function GetAllControls() { return $("#form1").serializeObject(); }
    </script>
</head>
<body>
    <form id="form1" runat="server" autocomplete="off">
        <div>
            <table style="width: 100%;" class="table">
                <tr style="background-color: #7DAED5; font-weight: bold;">
                    <td>Company :
                        <asp:Label ID="lblCompany" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td>Employee:
                        <asp:Label ID="lblEmployeeName" runat="server" Text=""></asp:Label>
                        (<asp:Label ID="lblEmpoyeeID" runat="server" Text="0"></asp:Label>)
                    </td>
                    <td>FY:
                        <asp:Label ID="lblFY" runat="server" Text="0" Visible="false"></asp:Label><asp:Label ID="lblFY2" runat="server" Text="0"></asp:Label></td>
                </tr>
            </table>
            <div style="padding: 0px 10px 0px 10px;">
                <asp:Label ID="lblIncome" runat="server" Text=""></asp:Label>
            </div>
            <div style="padding: 0px 10px 0px 10px;">
                <table style="width: 50%; background-color: #e6e6e6;" class="pull-right no-print">
                    <tr>
                        <td>Copy 
                        <asp:DropDownList ID="ddMonthsForCopy" runat="server"></asp:DropDownList>
                            to remaining month
                        <input type="button" value="Update" onclick="CopyValues()" />
                        </td>
                        <td id="tdTax"></td>
                        <td>
                            <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
                        </td>
                        <td style="text-align: right;">
                            <a href="#" class="btn btn-success" id="btnSave">Save</a>
                        </td>
                    </tr>
                </table>
            </div>
        </div>

        <div style="padding: 0px 10px 0px 10px;">
            <table style="width: 100%">
                <tr>
                    <td style="width: 45%; vertical-align: top;">
                        <table class="bordered" style="width: 100%;" id="taxDeclarationTable">
                            <tbody>
                                <tr>
                                    <th colspan="2">Income Tax Declarations- (Section 2)</th>
                                </tr>
                                <tr>
                                    <td>Medical Bil</td>
                                    <td style="max-width: 55px;">
                                        <asp:TextBox ID="txtMedicalBill" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Leave Travel Allowance</td>
                                    <td>
                                        <asp:TextBox ID="txtLTALTC" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Uniform Allowance</td>
                                    <td>
                                        <asp:TextBox ID="txtUniformAllow" runat="server"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td>Number of school going children</td>
                                    <td>
                                        <asp:TextBox ID="txtNoOfSchoolGoingChildren" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">&nbsp;</td>
                                </tr>
                                <tr>
                                    <th>Deduction Under Section Chapter VIA</th>
                                    <th>Amount</th>
                                </tr>
                                <tr>
                                    <td>Employees Provident Fund</td>
                                    <td>
                                        <asp:Label ID="lblEmployeePF" runat="server" Text="0"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td>Voluntary Provident Fund</td>
                                    <td>
                                        <asp:Label ID="lblVoluntaryPF" runat="server" Text="0"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td>Public Provident Fund</td>
                                    <td>
                                        <asp:TextBox ID="txtPublicPF" runat="server"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td>National Saving Certificate (NSC)</td>
                                    <td>
                                        <asp:TextBox ID="txtNSC" runat="server"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td>Tax Saving Mutual Funds</td>
                                    <td>
                                        <asp:TextBox ID="txtTaxSavingMF" runat="server"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td>Insurance Premium Paid</td>
                                    <td>
                                        <asp:TextBox ID="txtInsurencePremiumPaid" runat="server"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td>Savings in Pension Plans</td>
                                    <td>
                                        <asp:TextBox ID="txtSavingInPensionPlan" runat="server"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td>Tax Saving Fixed Deposit with Banks</td>
                                    <td>
                                        <asp:TextBox ID="txtTaxSavingFD" runat="server"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td>Senior Citizens Savings Scheme</td>
                                    <td>
                                        <asp:TextBox ID="txtSeniorCitizenSaving" runat="server"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td>National Pension System (NPS)</td>
                                    <td>
                                        <asp:TextBox ID="txtNPS" runat="server"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td>Children Education Fee</td>
                                    <td>
                                        <asp:TextBox ID="txtChildrenEduFee" runat="server"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td>Housing Loan Principal Repayment/Stamp Duty Paid</td>
                                    <td>
                                        <asp:TextBox ID="txtHousingLoanPrincipal" runat="server"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td>Others (Post Office Saving,ULIP, etc.)</td>
                                    <td>
                                        <asp:TextBox ID="txtOtherPOSavings" runat="server"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <th>Total</th>
                                    <th class="number">
                                        <asp:Label ID="lblTotalDeductionVIA" runat="server" Text="0.0"></asp:Label></th>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th>Other Deductions</th>
                                    <th>&nbsp;</th>
                                </tr>
                                <tr>
                                    <td>Employer Contribution to NPS </td>
                                    <td>
                                        <asp:TextBox ID="txtEmployerContToNPS" runat="server"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td>Medical Insurance Premium (sec 80D)</td>
                                    <td>
                                        <asp:TextBox ID="txtMIP80D" CssClass="tolltip" runat="server" data-toggle="tooltip" data-placement="right" title="Rs.35000 is allowed if medical insurance policy includes your dependant parent as a senior citizen"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td>Medical treatment for handicapped dependents (Sec 80DD)</td>
                                    <td>
                                        <asp:TextBox ID="txt80DD" runat="server" title="Maximum Allowed,if disability < 80% RS.50,000.00, esle Rs.1,00,000.00"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td>Medical treatment for specified diseases (Sec 80DDB)</td>
                                    <td>
                                        <asp:TextBox ID="txt80DDB" runat="server" title="The deduction allowed is equal to he amount actualy paid or Rs.40,000 whichever is less.In case of senior citizen the amount of deduction allowed is Rs.60,000/-"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td>Interest on Higher Education Loan(Sec 80E)</td>
                                    <td>
                                        <asp:TextBox ID="txt80E" runat="server" title="Only interest amount is allowed"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td>Rajiv Gandhi Equity Savings Scheme (RGESS) (Se 80CCG)</td>
                                    <td>
                                        <asp:TextBox ID="txt80CCG" runat="server" title="The deduction under the scheme is available only to new retail investors,Please check your eligibility to this scheme.50% of the amount invested,maximum of Rs.25000/- will be allowed as deduction from taxable income"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td>Donations to charitable institutions and others (Sec 80G)</td>
                                    <td>
                                        <asp:TextBox ID="txt80G" runat="server" title="Please check the eligibility and deductiable amount of donation.Donation made to national relief fund are eligible for 100% deduction from taxable income, and in any other case the deduction is redirect to 50% of amount paid"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td>Deduction for permanent disability (80U)</td>
                                    <td>
                                        <asp:TextBox ID="txt80U" runat="server" title="If disability is above 40% and below 80% available deduction is Rs.50000.00, If disability is above 80% the limit is RS.1,00,000.00"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <th>Total</th>
                                    <th class="number">
                                        <asp:Label ID="lblTotalOtherDed" runat="server" Text="0.0"></asp:Label>
                                    </th>
                                </tr>

                                <tr>
                                    <th>Other Income</th>
                                    <th>&nbsp;</th>
                                </tr>
                                <tr>
                                    <td>Interest income from deposit in a savings accounts(80TTA)</td>
                                    <td>
                                        <asp:TextBox ID="txt80TTA" runat="server" title="Only income to be updated"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td>Any Other Taxable Income (Other than interest income)</td>
                                    <td>
                                        <asp:TextBox ID="txtOtherTaxableIncome" runat="server" title="Only income to be updated"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <th>Total</th>
                                    <th class="number">
                                        <asp:Label ID="lblTotalOtherIncome" runat="server" Text="0.0"></asp:Label></th>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th>Income from House property - (Section 3)</th>
                                    <th></th>
                                </tr>
                                <tr>
                                    <td>Housing Loan Sanction date</td>
                                    <td>
                                        <asp:TextBox ID="txtHousingLoanSancDate" runat="server" title="Loan taken durinng FY 2013-2014(01/04/2013) only eligible for additional deduction of Rs.1 lakh"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td>Housing loan Sanctioned Amount</td>
                                    <td>
                                        <asp:TextBox ID="TxtHousingLoanSancAmt" runat="server" title="Loan sanction value should be less than 25 lakh to get the additional deduction u/s 80EE"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td>Value of the residential house Property</td>
                                    <td>
                                        <asp:TextBox ID="txtValueOfResHouseProp" runat="server" title="Loan sanction value should be less than 25 lakh to get the additional deduction u/s 80EE"></asp:TextBox></td>
                                </tr>

                                <tr>
                                    <td>Amount claimed u/s 80 EE in the FY 2013-2014</td>
                                    <td>
                                        <asp:TextBox ID="txtAmountClaimed80EE" runat="server" title="Max deduction allowed u/s 80EE is Rs. 1 lakh, its subject to the amount claimed in the FY 2013-14"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Number of residential houses owned</td>
                                    <td>
                                        <asp:TextBox ID="txtNoOfResHoseOwened" runat="server" title="Loan sanction value should be less than 25 lakh to get the additional deduction u/s 80EE"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td>Housing Loan Interest paid (Self occupied property)</td>
                                    <td>
                                        <asp:TextBox ID="txtHousingLoanInterPaid" runat="server" title="Please update the total intrest paid/payable for the currnt financial year.(Self occupied property only)"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <th>Income from House property- Let Out</th>
                                    <th>&nbsp;</th>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>Rent received during the year- (Annual Value)</td>
                                    <td>
                                        <asp:TextBox ID="txtRentRecieved" runat="server"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td>Interest paid during the year</td>
                                    <td>
                                        <asp:TextBox ID="txtInterestPaid" runat="server"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td>Municipal Tax Paid</td>
                                    <td>
                                        <asp:TextBox ID="txtMunicipalTaxPaid" runat="server"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td>Less : Repairs and Maintenance (30% of annual value)</td>
                                    <td>
                                        <asp:Label ID="lblRepairsandMaint" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td>Net Annual value</td>
                                    <td>
                                        <asp:Label ID="lblNetAnualValue" runat="server" Text="0.0"></asp:Label></td>
                                </tr>
                                <tr>
                                    <th>Income (Loss) from house property</th>
                                    <th class="number">
                                        <asp:Label ID="lblIncomeLossFromHouseProperty" runat="server" Text="0.0"></asp:Label></th>
                                </tr>
                            </tbody>
                        </table>
                    </td>

                    <td style="width: 5%">&nbsp;
                    </td>
                    <td style="width: 50%; vertical-align: top;">
                        <table id="tableTaxComputation" class="bordered" style="width: 100%;">
                            <tbody>
                                <tr>
                                    <th colspan="3">Income Tax Computations</th>
                                    <th>&nbsp;</th>
                                </tr>

                                <tr>
                                    <td colspan="3">Gross Salary (includes Employer contribution to NPS **)</td>
                                    <td>
                                        <asp:Label ID="lblGrossSal" runat="server" Text="0.0"></asp:Label></td>
                                </tr>
                                <tr>
                                    <th colspan="3">Exemptions U/s 10</th>
                                    <td>&nbsp;</td>
                                </tr>

                                <tr>
                                    <td colspan="2">Conveyance Allowance</td>
                                    <td>
                                        <asp:Label ID="lblConvAllow" runat="server" Text="0.0"></asp:Label></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td colspan="2">House Rent Allowance</td>
                                    <td>
                                        <asp:Label ID="lblHRAllow" runat="server" Text="0.0"></asp:Label></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td colspan="2">Leave Travel Allowance</td>
                                    <td>
                                        <asp:Label ID="lblLTA" runat="server" Text="0.0"></asp:Label></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td colspan="2">Medical Reimbursement</td>
                                    <td>
                                        <asp:Label ID="lblMR" runat="server" Text="0.0"></asp:Label></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td colspan="2">Uniform Allowance</td>
                                    <td>
                                        <asp:Label ID="lblUniformAllow" runat="server" Text="0.0"></asp:Label></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td colspan="2">Children Education Allowance</td>
                                    <td>
                                        <asp:Label ID="lblChildrenEducAllow" runat="server" Text="0.0"></asp:Label></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td colspan="3">Total</td>
                                    <td>
                                        <asp:Label ID="lblTotalAllow" runat="server" Text="0.0"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td colspan="3">Gross Salary after Section 10</td>
                                    <td>
                                        <asp:Label ID="lblSalAfterSec10" runat="server" Text="0.0"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td colspan="3">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="3">Deduction U/s 16</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="2">Professional Tax (Sec 16 iii)</td>
                                    <td>
                                        <asp:Label ID="lblProfesTax" runat="server" Text="0.0"></asp:Label></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td colspan="3">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="3">Income chargeable under head 'Salaries'</td>
                                    <td>
                                        <asp:Label ID="lblIncomeChargableUnderHeadSal" runat="server" Text="0.0"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td colspan="3">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="3">Income (loss) on House property. (Let out+self occupied)</td>
                                    <td>
                                        <asp:Label ID="lblIncomeLossHouseProp" runat="server" Text="0.0"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td colspan="3">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="3">Income from Other Sources</td>
                                    <td>
                                        <asp:Label ID="lblIncolefromOtherSource" runat="server" Text="0.0"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td colspan="3">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="3">Gross Total Income</td>
                                    <td>
                                        <asp:Label ID="lblGrostotalIncome" runat="server" Text="0.0"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td colspan="3">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <th colspan="2">Deductions under chapter VI-A</th>

                                    <th style="text-align: right; padding-right: 2px;">Rs.</th>
                                    <th>&nbsp;</th>
                                </tr>
                                <tr>
                                    <td colspan="2">Investments(Sec 80C)</td>

                                    <td>
                                        <asp:Label ID="lbl80C" runat="server" Text="0.0"></asp:Label></td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="2">Employer Contribution to NPS (Sec 80CCD2)</td>

                                    <td>
                                        <asp:Label ID="lbl80CCD2" runat="server" Text="0.0"></asp:Label></td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="2">Rajiv Gandhi Equity Savings Scheme (Sec 80CCG)</td>

                                    <td>
                                        <asp:Label ID="lbl80CCG" runat="server" Text="0.0"></asp:Label></td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="2">Medical Insurance Premium (Sec 80D)</td>

                                    <td>
                                        <asp:Label ID="lbl80D" runat="server" Text="0.0"></asp:Label></td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="2">Medical treatment for handicapped dependents (Sec 80DD)</td>

                                    <td>
                                        <asp:Label ID="lbl80DD" runat="server" Text="0.0"></asp:Label></td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="2">Medical treatment for specified diseases (Sec 80DDB)</td>

                                    <td>
                                        <asp:Label ID="lbl80DDB" runat="server" Text="0.0"></asp:Label></td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="2">Interest on Higher Education Loan(Sec 80E)</td>

                                    <td>
                                        <asp:Label ID="lbl80E" runat="server" Text="0.0"></asp:Label></td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="2">Interest on Housing loan (Sec 80EE)</td>

                                    <td>
                                        <asp:Label ID="lbl80EE" runat="server" Text="0.0"></asp:Label></td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="2">Donations to charitable institutions and others (Sec 80G)</td>

                                    <td>
                                        <asp:Label ID="lbl80G" runat="server" Text="0.0"></asp:Label></td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="2">Deductions in respect of rents paid (Sec 80GG)</td>

                                    <td>
                                        <asp:Label ID="lbl80GG" runat="server" Text="0.0"></asp:Label></td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="2">Interest income from deposit in a savings accounts(80TTA)</td>

                                    <td>
                                        <asp:Label ID="lbl80TTA" runat="server" Text="0.0"></asp:Label></td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="2">Deduction for permanent disability (80U)</td>

                                    <td>
                                        <asp:Label ID="lbl80U" runat="server" Text="0.0"></asp:Label></td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="3">Total</td>
                                    <td>
                                        <asp:Label ID="lblNetTotalVIA" runat="server" Text="0"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td colspan="3">Net taxable income</td>
                                    <td>
                                        <asp:Label ID="lblNetTaxableIncome" runat="server" Text="0"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td colspan="3"></td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="3">Tax on Total Income</td>
                                    <td>
                                        <asp:Label ID="lblTaxOnTotalIncome" runat="server" Text="0"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td colspan="3">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="3">Rebate u/s 87</td>
                                    <td>
                                        <asp:Label ID="lblRebate" runat="server" Text="0"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td colspan="3">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="3">Tax Due</td>
                                    <td>
                                        <asp:Label ID="lblTaxDue" runat="server" Text="0"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td colspan="3"></td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="3">Surcharge on Tax</td>
                                    <td>
                                        <asp:Label ID="lblSurchargeOnTotalTax" runat="server" Text="0"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td colspan="3">Education Cess @3%</td>
                                    <td>
                                        <asp:Label ID="lblEducCess" runat="server" Text="0"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td colspan="3">Total Tax Due</td>
                                    <td>
                                        <asp:Label ID="lblTotalTaxDue" runat="server" Text="0"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td colspan="3">Less Tax Deducted Till Date</td>
                                    <td>
                                        <asp:Label ID="lblTaxDedTillDate" runat="server" Text="0"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td colspan="3">Balance</td>
                                    <td>
                                        <asp:Label ID="lblBalance" runat="server" Text="0"></asp:Label></td>
                                </tr>
                                <%--<tr>
                                    <td colspan="3">Remaining Month in the Year</td>
                                    <td>
                                        <asp:TextBox ID="txtRemainMonthInYear" runat="server" Text="12"></asp:TextBox></td>
                                </tr>--%>
<%--  <tr>
                                    <th colspan="3">Tax Per Month</th>
                                    <th>
                                        <asp:Label ID="lblTaxPerMonth" runat="server" Text="0.0"></asp:Label></th>
                                </tr>--%>
<%--                 </tbody>
                        </table>
                    </td>
                </tr>
            </table>
        </div>

    </form>
</body>
</html>--%>
