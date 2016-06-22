<%@ Page Language="C#" AutoEventWireup="true" CodeFile="IncExp.aspx.cs" Inherits="IncExp" MasterPageFile="~/MasterPage2.master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title></title>
    <style type="text/css">
        .table-condensed > thead > tr > th, .table-condensed > tbody > tr > th
        {
            padding: 1px;
            text-align: center !important;
        }
    </style>
    <script type="text/javascript">
        //var year = '2014';
        //var compID = '1';
        $(document).ready(function ()
        {
            LoadData();
        });

        function MakeTextBoxDisable(id)
        {
            $('#' + id).attr('readonly', true);
            $('#' + id).css('background-color', '#CFCFCF');
        }

        function MakeForm()   //Make initial Form
        {
            var str = "<table id='tableSalary' class='table table-condensed' ><tr><th>Name<th>Apr<th>May<th>Jun<th>Jul<th>Aug<th>Sep<th>Oct<th>Nov<th>Dec<th>Jan<th>Feb<th>Mar<th>Total";

            str += "<tr><td class='boldFont'>Income";
            str += "<tr><td><input type='text' style='width:100px;' id='m_txtIncome1'/><a style='text-decoration:none;' href='#' onclick='AddRowWithOption(\"txtIncome\")'>&nbsp<span class='glyphicon glyphicon-plus'></span></a>";
            str += AddRow("txtIncome", 1);

            str += "<tr><td class='boldFont'>Expense";
            str += "<tr><td><input type='text' style='width:100px;' id='m_txtExpense1'/><a style='text-decoration:none;' href='#' onclick='AddRowWithOption(\"txtExpense\")'>&nbsp<span class='glyphicon glyphicon-plus'></span></a>";
            str += AddRow("txtExpenses", 1);

            str += "<tr><td>&nbsp;</td></tr>"

            str += "<tr><td class='boldFont'>Net";
            for (var i = 1; i <= 12; i++)
            {
                str += "<td><input type='text' style='width:60px;' id='txtDiff" + i + "'/>";
                //MakeTextBoxDisable("txtDiff"+i);
            }
            str += "<td><input type='text' style='width:60px;' id='txtYearlyDiff'/>";

            str += "<tr><td>&nbsp;<tr><td class='boldFont'>TDS";
            for (var i = 1; i <= 12; i++)
            {
                str += "<td><input type='text' style='width:60px;' id='txtTDS" + i + "'/>";
                //MakeTextBoxDisable("txtTDS" + i);
            }
            str += "<td><input type='text' style='width:60px;' id='txtTDSTotal'/>";

            str += "</table>";

            str += "<table id='tableAavTax' class='table table-condensed' style='width:30%;'>"
            str += "<tr><th>Advance Tax<th><th><th>"
            str += "<tr><th>Month<th>Due<th>Deposited<th>Balance"
            str += "<tr><td>15 Jun @15%<td><span id='advaceTaxDue1'></span><td><input type='text' style='width:60px;' id='txtAdvTaxDeposited1'/><td><input type='text' style='width:60px;' id='txtAdvTaxBal1'/>"
            str += "<tr><td>15 Sep @30%<td><span id='advaceTaxDue2'></span><td><input type='text' style='width:60px;' id='txtAdvTaxDeposited2'/><td><input type='text' style='width:60px;' id='txtAdvTaxBal2'/>"
            str += "<tr><td>15 Sec @30%<td><span id='advaceTaxDue3'></span><td><input type='text' style='width:60px;' id='txtAdvTaxDeposited3'/><td><input type='text' style='width:60px;' id='txtAdvTaxBal3'/>"
            str += "<tr><td>15 Mar @25%<td><span id='advaceTaxDue4'></span><td><input type='text' style='width:60px;' id='txtAdvTaxDeposited4'/><td><input type='text' style='width:60px;' id='txtAdvTaxBal4'/>"
            str += "<tr><td>Total<td><span id='advanceTaxDueTotal'></span><td><input type='text' style='width:60px;' id='txtAdvTaxDepositedTotal'/><td><input type='text' style='width:60px;' id='txtAdvTaxBalTotal'/>"
            str += "</table>";

            $("#incExpDiv").html(str);

            BindCalculation();
        }

        function BindCalculation()
        {
            $("input[type=text]").keyup(function ()
            {
                AddValues();
                SaveToLocal();
            });
        }

        function FillLocal()   //create and fill textboxes from local storage 
        {
            MakeForm();
            var data = localStorage.getItem("IncomeExpense");

            if (data != null && data != "")
            {
                var obj = JSON.parse(data);
                var inc = 0;
                var exp = 0;
                $.each(obj, function (key, val)
                {
                    if (key.indexOf("m_txtIncome") > -1)
                    {
                        if (inc > 0)
                            AddRowWithOption("txtIncome");
                        inc++;
                    }

                    if (key.indexOf("m_txtExpense") > -1)
                    {
                        if (exp > 0)
                            AddRowWithOption("txtExpense");
                        exp++;
                    }
                    
                    if (key.indexOf("txtDiff") != -1)  //Make diff textboxes uneditable
                    {
                        console.log(key);
                        $('#' + key).attr('readonly', true);
                        $('#' + key).css('background-color', '#CFCFCF');
                    }
                    if (key.indexOf("txtTDS") != -1)  //Make tds textboxes uneditable
                    {
                        console.log(key);
                        $('#' + key).attr('readonly', true);
                        $('#' + key).css('background-color', '#CFCFCF');
                    }
                    if (key.indexOf("txtExpenses1_") != -1)  //Make expense textboxes uneditable
                    {
                        console.log(key);
                        $('#' + key).attr('readonly', true);
                        $('#' + key).css('background-color', '#CFCFCF');
                    }

                    if (key.indexOf("Total") != -1)  //Make Total textboxes uneditable
                    {
                        console.log(key);
                        $('#' + key).attr('readonly', true);
                        $('#' + key).css('background-color', '#CFCFCF');
                    }
                    if (key.indexOf("TaxBal") != -1)  //Make tax Bal textboxes uneditable
                    {
                        console.log(key);
                        $('#' + key).attr('readonly', true);
                        $('#' + key).css('background-color', '#CFCFCF');
                    }
                    MakeTextBoxDisable("txtYearlyDiff");
                    $("#" + key).val(val);
                });
                CalculateAdvanceTax();
            }
        }

        //Add new row 
        function AddRow(type, indx)
        {
            var str = [""];
            for (var i = 1; i <= 12; i++)
            {
                str[str.length] = "<td><input type='text' style='width:60px;' id='" + type + "" + indx + "_" + i + "'/>";
            }
            str[str.length] = "<td><input type='text' style='width:60px;' id='" + (type == "txtIncome" ? "txtIncomeYearlyTotal" : "txtExpenseYearlyTotal") + indx + "'/>";
            return str.join('');
        }

        //remove row from DOM
        function RemoveRow(obj)
        {
            debugger;
            if (confirmation())
            {
                $(obj).closest("tr").remove();
                AddValues();
                SaveToLocal();
            }
        }

        function confirmation()
        {
            var answer = confirm("Sure to remove?")
            if (answer)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        function GetMaxRowCount(type)
        {
            var ctr = 0;
            $("[id^='m_" + type).each(function ()
            {
                ctr++;
            });
            return ctr;
        }

        //Add new row with remove link in DOM
        function AddRowWithOption(type)
        {
            var ctr = GetMaxRowCount(type);
            var nctr = ctr + 1;
            var str = "<tr>";
            str += "<tr><td><input type='text' style='width:100px;' id='m_" + type + nctr + "'/><a style='text-decoration:none;' href='#' onclick='RemoveRow(this)'>&nbsp<span class='glyphicon glyphicon-remove'></span></a>";
            str += AddRow(type, nctr);
            $("#m_" + type + ctr).closest("tr").after(str);
            BindCalculation();
            AddValues();
        }

        //Add textbox values vertical n horizontal
        function AddValues()
        {
            var vertincome = [];
            var vertexpense = [];
            for (var i = 0; i < 12; i++)
            {
                vertincome[i] = 0;
                vertexpense[i] = 0;
            }

            $("#tableSalary tr").each(function (j)
            {
                if (j > 0)
                {
                    var horizontalsum = 0;
                    $("td", this).each(function (i)
                    {
                        if (i > 0 && i <= 12)
                        {
                            var id = $("input", this).attr("id");
                            if (id != undefined)
                            {
                                var val = parseInt($("#" + id).val());
                                val = isNaN(val) ? 0 : val;

                                if (id.indexOf("Income") > -1)
                                    vertincome[i - 1] += val;

                                if (id.indexOf("Expense") > -1)
                                    vertexpense[i - 1] += val;

                                horizontalsum += val;
                            }
                        }
                    });
                    $("td:last-child input", this).val(horizontalsum);
                }
            });

            for (var i = 0; i < 12; i++)
            {
                $("#txtDiff" + (i + 1)).val(vertincome[i] - vertexpense[i]);
            }

            CalculateAdvanceTax();
        }

        function CalculateAdvanceTax()
        {

            var totalYearlyIncome = $("#txtExpenseYearlyTotal1").val();
            var totaltax = totalYearlyIncome * 0.3;
            var surcharge = totaltax * 0.02;
            var eduCess = totaltax * 0.01;
            var netTaxDue = totaltax + surcharge + eduCess;

            var advanceTaxDue1 = Math.round(netTaxDue * .15);
            var advanceTaxDue2 = Math.round(netTaxDue * .30);
            var advanceTaxDue3 = Math.round(netTaxDue * .30);
            var advanceTaxDue4 = Math.round(netTaxDue * .25);
            var advanceTaxDueTotal = Parse(advanceTaxDue1) + Parse(advanceTaxDue2) + Parse(advanceTaxDue3) + Parse(advanceTaxDue4);

            //for (var i = 1; i <= 4; i++)
            //{
            //    $("#advaceTaxDue"+i+"").text(advanceTaxDue);
            //}

            $("#advaceTaxDue1").text(advanceTaxDue1);
            $("#advaceTaxDue2").text(advanceTaxDue2);
            $("#advaceTaxDue3").text(advanceTaxDue3);
            $("#advaceTaxDue4").text(advanceTaxDue4);
            $("#advanceTaxDueTotal").text(advanceTaxDueTotal);

            var advTaxDeposited1 = GV("#txtAdvTaxDeposited1");
            var advTaxDeposited2 = GV("#txtAdvTaxDeposited2");
            var advTaxDeposited3 = GV("#txtAdvTaxDeposited3");
            var advTaxDeposited4 = GV("#txtAdvTaxDeposited4");
            var advTaxDepositedTotal = (advTaxDeposited1 + advTaxDeposited2 + advTaxDeposited3 + advTaxDeposited4);
            $("#txtAdvTaxDepositedTotal").val(advTaxDepositedTotal);

            var txtAdvTaxBal1 = advanceTaxDue1 - advTaxDeposited1;
            var txtAdvTaxBal2 = advanceTaxDue2 - advTaxDeposited2;
            var txtAdvTaxBal3 = advanceTaxDue3 - advTaxDeposited3;
            var txtAdvTaxBal4 = advanceTaxDue4 - advTaxDeposited4;
            var txtAdvTaxBalTotal = (txtAdvTaxBal1 + txtAdvTaxBal2 + txtAdvTaxBal3 + txtAdvTaxBal4);

            $("#txtAdvTaxBal1").val(txtAdvTaxBal1);
            $("#txtAdvTaxBal2").val(txtAdvTaxBal2);
            $("#txtAdvTaxBal3").val(txtAdvTaxBal3);
            $("#txtAdvTaxBal4").val(txtAdvTaxBal4);
            $("#txtAdvTaxBalTotal").val(txtAdvTaxBalTotal);

        }
        //load data in local storage from database
        function LoadData()
        {
            $.ajax({
                url: "/Data.aspx?Action=LoadIncomeExpense&Data1=" + year + "&Data2=" + compID + "", cache: false, success: function (data)
                {

                    var Data = data.replace("~", "");
                    if (Data != "")
                    {
                        window.localStorage.setItem("IncomeExpense", Data);
                    }
                    else
                    {
                        LoadSalaryData();   //load monthly expenses first time
                    }
                    FillLocal();
                },
                error: function (e)
                {
                }
            })
        }

        //load monthly expenses
        function LoadSalaryData()
        {
            $.ajax({
                url: "/Data.aspx?Action=LoadSalaryData&Data1=" + year + "", cache: false, success: function (data)
                {
                    var Data = data.replace("~", "");
                    if (Data != null)
                    {
                        FillData(JSON.parse(Data));
                    }
                },
                error: function (e)
                {
                }
            })
        }

        //Fill monthly expenses in corresponding textboxes
        function FillData(obj)
        {
            $("#m_txtExpense1").val("Salary");
            $.each(obj, function (key, val)
            {
                $("#" + key).val(val);
            });
            AddValues();
        }

        function SaveData()  //Save all localstorage data to database 
        {
            var IncExpData = window.localStorage.getItem("IncomeExpense");
            $.post("/Data.aspx?Action=UpdateIncomeExpense&Data1=" + year + "&Data2=" + compID + "", { IncomeExpenseData: IncExpData }, function (data)
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
        }

        function SaveToLocal()
        {
            window.localStorage.setItem("IncomeExpense", JSON.stringify(GetAllControls()));
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

    </script>
    <style>
        .table-condensed > tbody > tr > td, .table-condensed > tfoot > tr > td
        {
            padding: 2px;
        }

        .table-condensed > thead > tr > th, .table-condensed > tbody > tr > th
        {
            padding: 1px;
            text-align: right;
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="incExpDiv"></div>
    <div><a class="btn btn-success" href="#" id="btnSave" onclick="SaveData()">Save</a><asp:Label ID="lblMessage" runat="server" Text=""></asp:Label></div>
</asp:Content>


