<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="PanApplicationFormNew.aspx.cs" Inherits="PanApplicationFormNew" %>

<%@ Register Src="~/Controls/PayUMoneycontrol.ascx" TagPrefix="uc1" TagName="PayUMoneycontrol" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <link href="css/master.css" rel="stylesheet" />
    <style>
        .header:before {
            height: 120px!important;
        }

        input {
            text-align: -webkit-center;
        }

        .row {
            margin-left: 0px!important;
            margin-right: 0px!important;
        }

        .wdth {
            width: 315px;
            height: 215px;
        }

        h1 {
            font-size: x-large;
        }

        @media (min-width: 750px) and (max-width: 1403px) {
            .form_content {
                float: left;
                width: 957px;
                height: auto;
                margin-left: -10px;
            }

            /*.section_inner_left_div1 {
                width: 300px;
            }*/
            .wdth {
                width: 300px;
            }

            .section_inner_left {
                width: 420px;
            }

            .panel-body {
                padding: 5px;
            }

            .form_content .large_big [type=text] {
                width: 150px;
            }
        }

        b {
            font-size: small;
            font-weight: 500;
        }

        .form-control {
            padding: 0px;
        }

        .col-md-3, .col-md-4, .col-md-5, .col-md-6, .col-md-7, .col-md-8, .col-md-9, .col-md-10, .col-md-11, .col-md-12 {
            padding-left: 0px;
            padding-right: 0px;
        }

        .chk {
            margin-left: 45px!important;
        }
    </style>
    <script>

        $(document).ready(function () {
            showDataOnChange();
            showDataOnLoad();
            if ($("#chkincomess1").attr('checked'))
                $("#radiv").show();
        });
        function showDataOnLoad() {
            if ($("#proofofidentity option:selected").text() != "Select")
                $("#blankline").text($("#proofofidentity option:selected").text() + " ");
            if ($("#proofofresidence option:selected").text() != "Select")
                $("#blankline1").text($("#proofofresidence option:selected").text() + " ");
            if ($("#dobproof option:selected").text() != "Select")
                $("#blankline2").text($("#dobproof option:selected").text() + " ");
            if ($("#firstnameupp").val() != "")
                $("#namepapplicantblank").text($("#firstnameupp").val() + " " + $("#middlenameupp").val() + " " + $("#lastnameupp").val() + " ");
        }
        function showDataOnChange() {
            $('#proofofidentity').change(function () {

                $("#blankline").text($("#proofofidentity option:selected").text() + " ");
            });
            $('#proofofresidence').change(function () {
                $("#blankline1").text($("#proofofresidence option:selected").text() + " ");
            });
            $('#dobproof').change(function () {
                $("#blankline2").text($("#dobproof option:selected").text() + " ");
            });
            $('#lastnameupp').blur(function () {

                $("#namepapplicantblank").text($("#firstnameupp").val() + " " + $("#middlenameupp").val() + " " + $("#lastnameupp").val() + " ");
            });
            $('#district').blur(function () {

                $("#city").text($("#district").val());
            });
            $('#ddTanCategory').change(function () {
                TANCategory();
            });

        }
        function TANCategory() {
            if ($('#ddTanCategory').val() == "1") {
                $("#TANHeading").text("Company");
                $('#tdCategoryTAN').show();
                $('#tdCategoryTAN1').show();
                $('#tdCategoryTAN2').show();
                $('#tdCategoryTAN3').show();
                $('label[for="Radio1"]').text('Central Government Company / Corporation established by Central Act');
                $('label[for="Radio2"]').text('State Government Company / Corporation established by State Act');
                $('label[for="Radio3"]').text('Other Company');
                $('#Radio4').hide(); $('label[for="Radio4"]').hide();
                $('#tdName1').text('Name of Company');
                $('#tdName2').hide(); $('#Text2').hide();
                $('#tdName3').hide(); $('#Text3').hide();
                $('#tdName4').hide(); $('#Text4').hide();
                $('#tdDesignation').show(); $('#Text5').show();
                $('#tdTitle').show();
            }
            if ($('#ddTanCategory').val() == "2") {
                $('#TANHeading').text('Branch / Division of a Company');
                $("#TANHeading").text("Branch / Division of a Company");
                $('#tdCategoryTAN').show();
                $('#tdCategoryTAN1').show();
                $('#tdCategoryTAN2').show();
                $('#tdCategoryTAN3').show();
                $('label[for="Radio1"]').text('Central Government Company / Corporation established by Central Act');
                $('label[for="Radio2"]').text('State Government Company / Corporation established by State Act');
                $('label[for="Radio3"]').text('Other Company');
                $('#Radio4').hide(); $('label[for="Radio4"]').hide();
                $('#tdName1').text('Name of Company');
                $('#tdName2').text('Name of Division');
                $('#tdName3').text('Name/Location of Branch');
                $('#tdName1').show(); $('#Text1').show();
                $('#tdName2').show(); $('#Text2').show();
                $('#tdName3').show(); $('#Text3').show();
                $('#tdDesignation').show(); $('#Text5').show();
                $('#tdName4').hide(); $('#Text4').hide();
                $('#tdTitle').show();
            }
            if ($('#ddTanCategory').val() == "3") {
                $('#TANHeading').text('Individual / Hindu Undivided Family(karta)');
                $("#TANHeading").text("Individual / Hindu Undivided Family(karta)");
                $('#tdCategoryTAN').show();
                $('#tdCategoryTAN1').show();
                $('#tdCategoryTAN2').show();
                $('#tdCategoryTAN3').show();
                $('label[for="Radio1"]').text('Individual');
                $('label[for="Radio2"]').text('Hindu Undivided Family (Karta)');
                $('#Radio3').hide(); $('label[for="Radio3"]').hide();
                $('#Radio4').hide(); $('label[for="Radio4"]').hide();
                $('#tdName1').text('Last Name/SurName');
                $('#tdName2').text('First Name');
                $('#tdName3').text('Middle Name');
                $('#tdName1').show(); $('#Text1').show();
                $('#tdName2').show(); $('#Text2').show();
                $('#tdName3').show(); $('#Text3').show();
                $('#tdName4').hide(); $('#Text4').hide();
                $('#tdDesignation').hide(); $('#Text5').hide();
                $('#tdTitle').show();
            }
            if ($('#ddTanCategory').val() == "4") {
                $('#TANHeading').text('Branch of Individual Business (Sole proprietorship concern) / Hindu Undivided Family (Karta)');
                $("#TANHeading").text("Branch of Individual Business (Sole proprietorship concern) / Hindu Undivided Family (Karta))");
                $('#tdCategoryTAN').show();
                $('#tdCategoryTAN1').show();
                $('#tdCategoryTAN2').show();
                $('#tdCategoryTAN3').show();
                $('label[for="Radio1"]').text('Branch of Individual business');
                $('label[for="Radio2"]').text('Branch of Hindu Undivided Family ');
                $('#Radio3').hide(); $('label[for="Radio3"]').hide();
                $('#Radio4').hide(); $('label[for="Radio4"]').hide();
                $('#tdName1').text('Last Name/SurName');
                $('#tdName2').text('First Name');
                $('#tdName3').text('Middle Name');
                $('#tdName4').text('Name/Location of Branch');
                $('#tdName1').show(); $('#Text1').show();
                $('#tdName2').show(); $('#Text2').show();
                $('#tdName3').show(); $('#Text3').show();
                $('#tdName4').show(); $('#Text4').show();
                $('#tdDesignation').hide(); $('#Text5').hide();
                $('#tdTitle').show();
            }
            if ($('#ddTanCategory').val() == "5") {
                $('#TANHeading').text('Firm / Association of Persons / Association of Persons (Trusts) / Body of Individuals / Artificial juridical Person');
                $("#TANHeading").text("Firm / Association of Persons / Association of Persons (Trusts) / Body of Individuals / Artificial juridical Person");
                $('#tdCategoryTAN').hide(); $('#tdCategoryTAN1').hide(); $('#tdCategoryTAN2').hide(); $('#tdCategoryTAN3').hide();
                $('#tdName1').text('Name');
                $('#tdName1').show(); $('#Text1').show();
                $('#tdName2').hide(); $('#Text2').hide();
                $('#tdName3').hide(); $('#Text3').hide();
                $('#tdName4').hide(); $('#Text4').hide();
                $('#tdDesignation').hide(); $('#Text5').hide();
                $('#tdTitle').hide();
            }
            if ($('#ddTanCategory').val() == "6") {
                $('#TANHeading').text('Branch of Firm / Association of Persons / Association of Persons (Trusts) / Body of Individuals / Artificial juridical Person');
                $("#TANHeading").text("Branch of Firm / Association of Persons / Association of Persons(Trusts) / Body of Individuals / Artificial Juridical Person");
                $('#tdCategoryTAN').hide(); $('#tdCategoryTAN1').hide(); $('#tdCategoryTAN2').hide(); $('#tdCategoryTAN3').hide();
                $('#tdName1').text('Name of Firm / Association of Persons / Association of Persons (Trusts) / Body of Individuals / Artificial Juridical Person');
                $('#tdName2').text('Name / Location of Branch');
                $('#tdName1').show(); $('#Text1').show();
                $('#tdName2').show(); $('#Text2').show();
                $('#tdName3').hide(); $('#Text3').hide();
                $('#tdName4').hide(); $('#Text4').hide();
                $('#tdDesignation').hide(); $('#Text5').hide();
                $('#tdTitle').hide();
            }
        }
        function enableothernamenamediv() {
            if ($("#chk").attr('checked')) {
                $("#firstnameothr").removeAttr('disabled');
                $("#firstnameothr").css('background-color', 'white');
                $("#middlenameothr").removeAttr('disabled');
                $("#middlenameothr").css('background-color', 'white');
                $("#lastnameothr").removeAttr('disabled');
                $("#lastnameothr").css('background-color', 'white');
            }
            else {
                $("#firstnameothr").attr('disabled', 'disabled');
                $("#firstnameothr").css('background-color', '#E9E9E9');
                $("#middlenameothr").attr('disabled', 'disabled');
                $("#middlenameothr").css('background-color', '#E9E9E9');
                $("#lastnameothr").attr('disabled', 'disabled');
                $("#lastnameothr").css('background-color', '#E9E9E9');
            }
        }

        function showbusinesstypesel() {
            if ($("#chksalary3").attr('checked'))
                $("#businesscode").removeAttr('disabled');
        }
        function showoffice() {
            if ($("#resid2").attr('checked'))
                $("#proofofoffice").removeAttr('disabled');
        }
        function showres() {
            if ($("#resid1").attr('checked'))
                $("#proofofoffice").attr('disabled', 'diabled');
        }

        function showra() {
            if ($('#chkincomess1').attr('checked'))
                $("#radiv").show();
            else
                $("#radiv").css('display', 'none');
        }
        function enableincchk() {
            if ($('#chkincome').attr('checked')) {
                $("#chksalary1").attr('disabled', 'disabled');
                $("#chksalary2").attr('disabled', 'disabled');
                $("#chksalary3").attr('disabled', 'disabled');
                $("#chksalary4").attr('disabled', 'disabled');
                $("#chksalary5").attr('disabled', 'disabled');
                $("#businesscode").attr('disabled', 'disabled');
                $("#annualincome").attr('disabled', 'disabled');
            }
            else {

                $("#chksalary1").removeAttr('disabled');
                $("#chksalary2").removeAttr('disabled');
                $("#chksalary3").removeAttr('disabled');
                $("#chksalary4").removeAttr('disabled');
                $("#chksalary5").removeAttr('disabled');
            }
        }
        function enableincome() {
            if ($('#chksalary1').attr('checked') || $('#chksalary2').attr('checked') || $('#chksalary3').attr('checked') || $('#chksalary4').attr('checked') || $('#chksalary5').attr('checked'))
                $("#annualincome").removeAttr('disabled');
            else
                $("#annualincome").attr('disabled', 'disabled');

        }
        function Validate() {

            //$("#btnSubmit").css('display', 'none');
            //$("#Progress").show();
            if (location.href.indexOf('tan') > 0) { $("#btnsubmit").click(); return; }
            if ($("#firstnameupp").val() == "") {
                $("#firstnameupp").focus();
                alert("Name is mandatory!");
                //NotValid();
                return false;
            }
            if ($("#print_firstname").val() == "") {
                $("#print_firstname").focus();
                alert("Print Name is mandatory!");
                //NotValid();
                return false;
            }
            if ($("#father_fname").val() == "") {
                $("#father_fname").focus();
                alert("Father's name is mandatory!");
                //NotValid();
                return false;
            }

            if (!($("#gender1").is(':checked') || $("#gender2").is(':checked'))) {
                alert("Gender is mandatory!");
                $("#gender1").focus();
                return false;
            }
            if (!($("#RadioGroup10").is(':checked') || $("#RadioGroup11").is(':checked'))) {
                alert("Marital Status is mandatory!");
                $("#RadioGroup10").focus();
                return false;
            }
            if ($("#aadharnumber").val() == "") {
                alert("Aadhar number is mandatory");
                $("#aadharnumber").focus();
                return false;
            }

            if ($("#dd").val() == "" || $("#mm").val() == "" || $("#dob_year").val() == "") {
                alert("Date of birth is mandatory");
                $("#dd").focus();
                return false;
            }
            if ($("#mobilenumber").val() == "") {
                alert("Mobile number is mandatory");
                $("#mobilenumber").focus();
                return false;
            }

            if ($("#emailids").val() == "") {
                alert("Email is mandatory");
                $("#emailids").focus();
                return false;
            }
            if ($("#proofofidentity").val() == "") {
                alert("Identity proof is mandatory");
                $("#proofofidentity").focus();
                return false;
            }
            if ($("#proofofresidence").val() == "") {
                alert("Address proof is mandatory");
                $("#proofofresidence").focus();
                return false;
            }
            if ($("#dobproof").val() == "") {
                alert("DOB proof is mandatory");
                $("#dobproof").focus();
                return false;
            }
            if (!($("#resid1").is(':checked') || $("#resid2").is(':checked'))) {
                alert("Communication is mandatory!");
                $("#resid1").focus();
                return false;
            }
            if ($("#resid2").is(':checked')) {
                if ($("#proofofoffice").val() == "") {
                    alert("Office Address Proof is mandatory!");
                    $("#proofofoffice").focus();
                    return false;
                }
            }
            if ($("#chkbusiness").is(':checked')) {
                if ($("#businesscode").val() == "") {
                    alert("Please select business type.!");
                    $("#businesscode").focus();
                    return false;
                }
            }
            if ($("#chksource").is(':checked')) {
                if ($("#otherincome").val() == "") {
                    alert("Please select other source of income.!");
                    $("#otherincome").focus();
                    return false;
                }
            }
            if ($("#flatroomnoresidence").val() == "") {
                alert("Please enter Flat/Room Number");
                $("#flatroomnoresidence").focus();
                return false;
            }
            if ($("#arealocalityresidence").val() == "") {
                alert("Please enter Area/Locality of Residence");
                $("#arealocalityresidence").focus();
                return false;
            }
            if ($("#searchstate").val() == "") {
                alert("Please select State");
                $("#searchstate").focus();
                return false;
            }
            if ($("#district").val() == "") {
                alert("Please select District/City/Town");
                $("#district").focus();
                return false;
            }
            if ($("#pincoderesidence").val() == "") {
                alert("Please select PinCode");
                $("#pincoderesidence").focus();
                return false;
            }
            if ($("#resid2").is(':checked')) {
                if ($("#nameofofc").val() == "") {
                    alert("Please select Name of Office");
                    $("#nameofofc").focus();
                    return false;
                }
                if ($("#floorrommno").val() == "") {
                    alert("Please select Floor/Room Number");
                    $("#floorrommno").focus();
                    return false;
                }
                if ($("#arealocaldiv").val() == "") {
                    alert("Please select Area/Locality of Office");
                    $("#arealocaldiv").focus();
                    return false;
                }
                if ($("#stateunion").val() == "") {
                    alert("Please select State");
                    $("#stateunion").focus();
                    return false;
                }
                if ($("#towncity").val() == "") {
                    alert("Please select Town/City");
                    $("#towncity").focus();
                    return false;
                }
                if ($("#pincodezipcode").val() == "") {
                    alert("Please select PinCode");
                    $("#pincodezipcode").focus();
                    return false;
                }

            }
            if ($("#chkincomess1").is(':checked')) {
                if (!($("#shri1").is(':checked') || $("#shri2").is(':checked') || $("#shri3").is(':checked'))) {
                    alert("Title is mandatory!");
                    $("#shri1").focus();
                    return false;
                }
                if ($("#rafirstname").val() == "") {
                    alert("Please select Representative Name");
                    $("#rafirstname").focus();
                    return false;
                }
                if ($("#ra_flatroom").val() == "") {
                    alert("Please select Floor/Room Number");
                    $("#ra_flatroom").focus();
                    return false;
                }
                if ($("#ra_area").val() == "") {
                    alert("Please select Area/Locality.");
                    $("#ra_area").focus();
                    return false;
                }
                if ($("#stateunion1").val() == "") {
                    alert("Please select State");
                    $("#stateunion1").focus();
                    return false;
                }
                if ($("#towncity2").val() == "") {
                    alert("Please select Town/City");
                    $("#towncity2").focus();
                    return false;
                }
                if ($("#ra_pinzip").val() == "") {
                    alert("Please select PinCode");
                    $("#ra_pinzip").focus();
                    return false;
                }
                if ($("#ra_country").val() == "") {
                    alert("Please select Country");
                    $("#ra_country").focus();
                    return false;
                }

            }
            $("#btnsubmit").click();

        }
        function disableother() {
            if ($("#chkincome").attr('checked')) {
                $("#chkbusiness").attr('disabled', 'disabled');
                $("#businesscode").attr('disabled', 'disabled');
                $("#chksource").attr('disabled', 'disabled');
                $("#otherincome").attr('disabled', 'disabled');
            }
            else {
                $("#chkbusiness").removeAttr('disabled');
                $("#chksource").removeAttr('disabled');
            }
        }
        function enablebusiness() {
            if ($("#chkbusiness").attr('checked'))
                $("#businesscode").removeAttr('disabled');
            else
                $("#businesscode").attr('disabled', 'disabled');
        }
        function enableotherincome() {
            if ($("#chksource").attr('checked'))
                $("#otherincome").removeAttr('disabled');
            else
                $("#otherincome").attr('disabled', 'disabled');
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
        <div class="col-md-12">

            <div class="form_content" id="content" runat="server">
                <%--<div class="progressimgdiv">
                    <img src="images/progress_bar_main.png" width="537" height="34" align="center">
                </div>--%>
                <table class="table BorderLess">

                    <tr>
                        <td colspan="3">
                            <h1 id="head" runat="server"></h1>
                        </td>
                        <td></td>
                        <td></td>
                        <td visible="false" runat="server" id="tdTANCategory">
                            <select id="ddTanCategory" style="width: 200px;" class="form-control" runat="server">
                                <option value="0">-- Category of Deductors -- </option>
                                <%--<option value="1">Central / State Government / Local Authority  </option>
                                <option value="2">Statutory / Autonomous Bodies  </option>--%>
                                <option value="1">Company </option>
                                <option value="2">Branch / Division of a Company </option>
                                <option value="3">Individual / Hindu Undivided Family(karta)  </option>
                                <option value="4">Branch of Individual Business(Sole proprietorship concern) / Hindu Undivided Family(karta)   </option>
                                <option value="5">Firm / Association of Persons / Association of Persons (Trusts) / Body of Individuals / Artificial juridical Person  </option>
                                <option value="6">Branch of Firm / Association of Persons / Association of Persons (Trusts) / Body of Individuals / Artificial juridical Person</option>
                            </select></td>
                        <td>
                            <asp:Label ID="lblErrorMsg" runat="server" Text="" CssClass="label label-danger pull-right" Style="margin-top: 17px;"></asp:Label></td>
                    </tr>
                </table>
                <div class="col-md-12" visible="false" runat="server" id="divCorrection">
                    <div class="panel panel-primary">
                        <div class="panel panel-heading">
                            PAN CARD INFORMATION
                        </div>
                        <div class="panel panel-body">
                            <table class="table BorderLess">
                                <tr>
                                    <td colspan="2">PAN Number<span class="mandatory">*</span>
                                    </td>
                                    <td>
                                        <input name="pannumber" placeholder="PAN Number" type="text" id="pannumber" onchange="upperMe('pannumber')" autocomplete="off" maxlength="10" class="form-control" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">Please select the items you want to correct or change<span class="mandatory">*</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Correction/Change in PAN Card Holder's Name </td>
                                    <td style="margin-left: 10px;">
                                        <input name="selectitems" id="changeinholdersname00" type="checkbox" class="chk" runat="server" /></td>

                                    <td>Correction/Change in PAN Card Holder's Father’s Name</td>
                                    <td>
                                        <input name="selectitems" id="changeinfathersname01" type="checkbox" class="chk" runat="server" /></td>
                                </tr>
                                <tr>

                                    <td>Correction in Date Of Birth (as printed on card)</td>
                                    <td>
                                        <input name="selectitems" id="changeindob10" type="checkbox" class="chk" runat="server" /></td>

                                    <td>Correction/Change in Address for Communication</td>
                                    <td>
                                        <input name="selectitems" id="changeinaddress11" type="checkbox" class="chk" runat="server" /></td>
                                </tr>
                                <tr>

                                    <td>Correction/Change in Signature (as printed on card)</td>
                                    <td>
                                        <input name="selectitems" id="changeinsign20" type="checkbox" class="chk" runat="server" /></td>

                                    <td>Correction/Change in Gender</td>
                                    <td>
                                        <input name="selectitems" id="changeingender21" type="checkbox" class="chk" runat="server" /></td>
                                </tr>
                                <tr>

                                    <td>Correction/Change in Photo (as printed on card) </td>
                                    <td>
                                        <input name="selectitems" id="changeinphoto30" type="checkbox" class="chk" runat="server" /></td>

                                    <td>Correction/Updation of AADHAAR number</td>
                                    <td>
                                        <input name="selectitems" id="changeinaadhar31" type="checkbox" onclick="showaadharnumber()" class="chk" runat="server" /></td>
                                </tr>

                            </table>
                        </div>
                    </div>
                </div>
                <div class="col-md-12" id="pnlPersonal" runat="server">
                    <div class="panel panel-primary">
                        <div class="panel panel-heading">
                            PERSONAL INFORMATION

                        </div>
                        <div class="panel panel-body">

                            <table class="table BorderLess">
                                <tbody>
                                    <tr>
                                        <td>Category of Applicant<span class="mandatory">*</span>

                                        <td colspan="3">

                                            <input type="radio" name="category" value="1" id="category10" runat="server" />
                                            <label for="category10">Individuals</label>


                                            <input type="radio" name="category" value="2" id="category11" runat="server" />
                                            <label for="category11">Army</label>


                                            <input type="radio" name="category" value="3" id="category12" runat="server" />
                                            <label for="category12">Navy</label>


                                            <input type="radio" name="category" value="4" id="category13" runat="server" />
                                            <label for="category13">Air Force</label>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Name of the applicant<span class="mandatory">*</span>
                                            <%--<span class="category_applicant">Name of the applicant</span><span class="mandatory">*</span> <span class="tooltip tooltipstered">
                                        <img src="images/help_icon.png" width="19" height="19"></span></td>--%>
                                        <td>

                                            <input name="firstnameupp" placeholder="First Name" type="text" id="firstnameupp" onchange="upperMe('firstnameupp')" autocomplete="off" onkeypress="return lettersOnly(event)" onblur="initialvalidation('firstnameupp');" maxlength="25" runat="server" class="form-control">
                                        </td>
                                        <td>

                                            <input name="middlenameupp" placeholder="Middle Name" type="text" id="middlenameupp" class="txtup form-control" onchange="upperMe('middlenameupp')" autocomplete="off" onkeypress="return lettersOnly(event)" onblur="initialvalidation('middlenameupp');" maxlength="25" runat="server">
                                        </td>
                                        <td>

                                            <input name="lastname" placeholder="Last Name" type="text" id="lastnameupp" class="txtup form-control" onchange="upperMe('lastnameupp')" autocomplete="off" onkeypress="return lettersOnly(event)" onblur="initialvalidation('lastnameupp');" maxlength="25" runat="server">
                                        </td>
                                        <td>
                                            <%--  <label for="dd">Date of Birth</label>
                                        <span class="mandatory">*</span>--%>
                                            Date of Birth<span class="mandatory">*</span>
                                        </td>
                                        <td>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <select name="dd" id="dd" style="width: 50px; color: rgb(204, 204, 204);" onchange="ddchange();" runat="server" class="form-control">
                                                            <option value="">DD
                                                            </option>
                                                            <option value="1">1
                                                            </option>
                                                            <option value="2">2
                                                            </option>
                                                            <option value="3">3
                                                            </option>
                                                            <option value="4">4
                                                            </option>
                                                            <option value="5">5
                                                            </option>
                                                            <option value="6">6
                                                            </option>
                                                            <option value="7">7
                                                            </option>
                                                            <option value="8">8
                                                            </option>
                                                            <option value="9">9
                                                            </option>
                                                            <option value="10">10
                                                            </option>
                                                            <option value="11">11
                                                            </option>
                                                            <option value="12">12
                                                            </option>
                                                            <option value="13">13
                                                            </option>
                                                            <option value="14">14
                                                            </option>
                                                            <option value="15">15
                                                            </option>
                                                            <option value="16">16
                                                            </option>
                                                            <option value="17">17
                                                            </option>
                                                            <option value="18">18
                                                            </option>
                                                            <option value="19">19
                                                            </option>
                                                            <option value="20">20
                                                            </option>
                                                            <option value="21">21
                                                            </option>
                                                            <option value="22">22
                                                            </option>
                                                            <option value="23">23
                                                            </option>
                                                            <option value="24">24
                                                            </option>
                                                            <option value="25">25
                                                            </option>
                                                            <option value="26">26
                                                            </option>
                                                            <option value="27">27
                                                            </option>
                                                            <option value="28">28
                                                            </option>
                                                            <option value="29">29
                                                            </option>
                                                            <option value="30">30
                                                            </option>
                                                            <option value="31">31
                                                            </option>
                                                        </select>
                                                    </td>
                                                    <td>
                                                        <select name="mm" id="mm" onchange="mmchange()" style="width: 60px; color: rgb(204, 204, 204);" runat="server" class="form-control">
                                                            <option value="">MM
                                                            </option>
                                                            <option value="1">JAN
                                                            </option>
                                                            <option value="2">FEB
                                                            </option>
                                                            <option value="3">MAR
                                                            </option>
                                                            <option value="4">APR
                                                            </option>
                                                            <option value="5">MAY
                                                            </option>
                                                            <option value="6">JUN
                                                            </option>
                                                            <option value="7">JUL
                                                            </option>
                                                            <option value="8">AUG
                                                            </option>
                                                            <option value="9">SEP
                                                            </option>
                                                            <option value="10">OCT
                                                            </option>
                                                            <option value="11">NOV
                                                            </option>
                                                            <option value="12">DEC
                                                            </option>
                                                        </select>
                                                    </td>
                                                    <td>
                                                        <input name="dob_year" id="dob_year" placeholder="YYYY" type="text" class="txtup form-control" autocomplete="off" maxlength="4" onkeypress="return isNumber(event)" runat="server" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <%--<label for="Print_firstname">Name on the PAN Card</label>
                                        <span class="mandatory">*</span>--%>
                                            Name on the PAN Card<span class="mandatory">*</span>
                                        </td>
                                        <td colspan="2">

                                            <input name="print_firstname" id="print_firstname" placeholder="First Name" type="text" class="txtup form-control" onchange="upperMe('print_firstname')" autocomplete="off" style="width: 271px;" onkeypress="return lettersOnly(event)" maxlength="50" runat="server">
                                        </td>
                                        <td class="category_pad">

                                            <input name="print_lastname" id="print_lastname" placeholder="Last Name" type="text" class="txtup form-control" onchange="upperMe('print_lastname')" autocomplete="off" onkeypress="return lettersOnly(event)" runat="server">
                                        </td>
                                        <td>Gender<span class="mandatory">*</span></td>
                                        <td>

                                            <input type="radio" name="gender" value="0" id="gender1" runat="server">
                                            <label for="gender1">Male</label>


                                            <input type="radio" name="gender" value="1" id="gender2" runat="server">
                                            <label for="gender2">Female</label>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <%--<label for="chk">Any other name</label>--%>
                                            Any other name
                                            <input type="checkbox" name="chk" id="chk" value="1" onclick="enableothernamenamediv()" runat="server"></td>
                                        <td>

                                            <input name="First other name" type="text" id="firstnameothr" class="txtup form-control" onchange="upperMe('firstnameothr')" style="background-color: #E9E9E9" disabled="disabled" autocomplete="off" onkeypress="return lettersOnly(event)" onblur="initialvalidation('firstnameothr');" maxlength="25" runat="server">
                                        </td>
                                        <td>

                                            <input name="Middle other name" type="text" id="middlenameothr" class="txtup form-control" onchange="upperMe('middlenameothr')" style="background-color: #E9E9E9" disabled="disabled" autocomplete="off" onkeypress="return lettersOnly(event)" onblur="initialvalidation('middlenameothr');" maxlength="25" runat="server">
                                        </td>
                                        <td>

                                            <input name="Last other name" type="text" id="lastnameothr" class="txtup form-control" onchange="upperMe('lastnameothr')" style="background-color: #E9E9E9" disabled="disabled" autocomplete="off" onkeypress="return lettersOnly(event)" onblur="initialvalidation('lastnameothr');" maxlength="25" runat="server">
                                        </td>
                                        <td>Marital Status<span class="mandatory">*</span></td>
                                        <td>

                                            <input type="radio" name="maritalstatus" value="0" id="RadioGroup10" runat="server">
                                            <label for="RadioGroup10" style="cursor: pointer">Single</label>


                                            <input type="radio" name="maritalstatus" value="1" id="RadioGroup11" runat="server">
                                            <label for="RadioGroup11">Married</label>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Father's Name <span class="mandatory">*</span>
                                        </td>
                                        <td>

                                            <input name="" id="father_fname" placeholder="First Name" type="text" class="txtup form-control" onchange="upperMe('father_fname')" autocomplete="off" onkeypress="return lettersOnly(event)" onblur="initialvalidation('father_fname');" maxlength="25" runat="server">
                                        </td>
                                        <td>

                                            <input name="" id="father_mname" placeholder="Middle Name" type="text" class="txtup form-control" onchange="upperMe('father_mname')" autocomplete="off" onkeypress="return lettersOnly(event)" onblur="initialvalidation('father_mname');" maxlength="25" runat="server">
                                        </td>
                                        <td>

                                            <input name="" id="father_lname" placeholder="Last Name" type="text" class="txtup form-control" onchange="upperMe('father_lname')" autocomplete="off" onkeypress="return lettersOnly(event)" onblur="initialvalidation('father_lname');" maxlength="25" runat="server">
                                        </td>
                                        <td>AADHAAR</td>
                                        <td>

                                            <input name="input" type="text" id="aadharnumber" class="numeric form-control" maxlength="12" placeholder="AADHAAR Number" autocomplete="off" style="width: 157px;" onkeypress="return isNumber(event)" runat="server">
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="col-md-12" id="pnlTANInfo" runat="server" visible="false">
                    <div class="panel panel-primary">
                        <div class="panel panel-heading" id="TANHeading">
                            Company
                        </div>
                        <div class="panel panel-body">
                            <table class="table BorderLess">
                                <tr id="trTANNumber" runat="server" visible="false">
                                    <td>TAN Number
                                    </td>
                                    <td colspan="2">
                                        <asp:TextBox ID="txtTANNumber" runat="server" Text=""  CssClass="form-control"/>
                                    </td>
                                </tr>
                                <tr id="tdCategoryTAN">
                                    <td id="tdCategoryType">Company: <span class="mandatory">*</span><br />
                                    </td>
                                    <td>
                                        <input type="radio" name="category" value="1" id="Radio1" runat="server" />
                                    </td>
                                    <td>
                                        <label for="Radio1">Central Government Company / Corporation established by Central Act</label>
                                    </td>
                                </tr>
                                <tr id="tdCategoryTAN1">
                                    <td></td>
                                    <td>
                                        <input type="radio" name="category" value="2" id="Radio2" runat="server" />
                                    </td>
                                    <td>
                                        <label for="Radio2">State Government Company / Corporation established by Central Act</label>
                                    </td>
                                </tr>
                                <tr id="tdCategoryTAN2">
                                    <td></td>
                                    <td>
                                        <input type="radio" name="category" value="3" id="Radio3" runat="server" />
                                    </td>
                                    <td>
                                        <label for="Radio3">Other Company</label>
                                    </td>
                                </tr>
                                <tr id="tdCategoryTAN3">
                                    <td></td>
                                    <td>
                                        <input type="radio" name="category" value="4" id="Radio4" runat="server" style="display: none" />
                                    </td>
                                    <td>
                                        <label for="Radio4"></label>
                                    </td>
                                </tr>
                                <tr id="tdTitle">
                                    <td colspan="2">Title
                                    </td>
                                    <td colspan="2">
                                        <table>
                                            <tr>
                                                <td style="width: 300px;">
                                                    <input type="radio" name="title" value="Shri" id="title1" runat="server">
                                                    <label for="title1" style="cursor: pointer">Shri</label></td>
                                                <td style="width: 300px;">
                                                    <input type="radio" name="title" value="Smt." id="title2" runat="server">
                                                    <label for="title2">Smt</label></td>
                                                <td style="width: 300px;">
                                                    <input type="radio" name="title" value="Kumari" id="title3" runat="server">
                                                    <label for="title3">Kumari</label></td>
                                            </tr>
                                        </table>
                                    </td>

                                </tr>
                                <tr>
                                    <td id="tdName1">Name of Company<span class="mandatory">*</span>
                                    <td colspan="2">
                                        <input name="" id="Text1" placeholder="" type="text" class="form-control" runat="server">
                                    </td>
                                </tr>
                                <tr>
                                    <td id="tdName2" style="display: none;">Name of organisation<span class="mandatory">*</span>
                                    </td>
                                    <td colspan="2">
                                        <input name="" id="Text2" placeholder="" type="text" class="form-control" runat="server" style="display: none;">
                                    </td>
                                </tr>
                                <tr>
                                    <td id="tdName3" style="display: none;">Name of department <span class="mandatory">*</span>
                                    </td>
                                    <td colspan="2">
                                        <input name="" id="Text3" placeholder="" type="text" class="form-control" runat="server" style="display: none;">
                                    </td>
                                </tr>
                                <tr>
                                    <td id="tdName4" style="display: none;">Name of ministry</td>
                                    <td colspan="2">
                                        <input name="" id="Text4" placeholder="" type="text" class="form-control" runat="server" style="display: none;">
                                </tr>
                                <tr>
                                    <td id="tdDesignation">Designation  the person responsible for making the payment/collecting tax </td>
                                    <td colspan="2">
                                        <input name="" id="Text5" placeholder="" type="text" class="form-control" runat="server">
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <%-- <div class="tab1_div" style="clear: both"><span class="tab-numbering">1</span>PERSONAL INFORMATION</div>
                <div class="section_div" style="border: 1px solid #CCC; background-color: #FFFFFF">
                    <div class="category_section">
                        <div class="section_inner">
                            <table style="width: 100%;">
                                <tbody>
                                    <tr>
                                        <td class="row_left"><span class="category_applicant">Category of Applicant</span><span class="mandatory">*</span> <span class="tooltip tooltipstered">
                                            <img src="images/help_icon.png" width="19" height="19"></span></td>
                                        <td colspan="3" class="category_pad">
                                            <div class="field_items">
                                                <input checked="checked" type="radio" name="category" value="1" id="category10">
                                                <label for="category10">Individuals</label>
                                            </div>
                                            <div class="field_items_s">
                                                <input type="radio" name="category" value="2" id="category11">
                                                <label for="category11">Army</label>
                                            </div>
                                            <div class="field_items_s">
                                                <input type="radio" name="category" value="3" id="category12">
                                                <label for="category12">Navy</label>
                                            </div>
                                            <div class="field_items_s">
                                                <input type="radio" name="category" value="4" id="category13">
                                                <label for="category13">Air Force</label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="fonttable"><span class="category_applicant">Name of the applicant</span><span class="mandatory">*</span> <span class="tooltip tooltipstered">
                                            <img src="images/help_icon.png" width="19" height="19"></span></td>
                                        <td class="category_pad">
                                            <div class="medium">
                                                <input name="firstnameupp" placeholder="First Name" type="text" id="firstnameupp" onchange="upperMe('firstnameupp')" autocomplete="off" onkeypress="return lettersOnly(event)" onblur="initialvalidation('firstnameupp');" maxlength="25" runat="server" class="form-control">
                                            </div>
                                        </td>
                                        <td class="category_pad">
                                            <div class="medium">
                                                <input name="middlenameupp" placeholder="Middle Name" type="text" id="middlenameupp" class="txtup form-control" onchange="upperMe('middlenameupp')" autocomplete="off" onkeypress="return lettersOnly(event)" onblur="initialvalidation('middlenameupp');" maxlength="25" runat="server" >
                                            </div>
                                        </td>
                                        <td class="category_pad">
                                            <div class="medium">
                                                <input name="lastname" placeholder="Last Name" type="text" id="lastnameupp" class="txtup form-control" onchange="upperMe('lastnameupp')" autocomplete="off" onkeypress="return lettersOnly(event)" onblur="initialvalidation('lastnameupp');" maxlength="25" runat="server">
                                            </div>
                                        </td>
                                        <td class="fonttable">
                                            <label for="dd">Date of Birth</label>
                                            <span class="mandatory">*</span></td>
                                        <td class="fonttable">
                                            <div class="medium">
                                                <select name="dd" id="dd" style="width: 50px; color: rgb(204, 204, 204);" onchange="ddchange();" runat="server" class="form-control">
                                                    <option value="">DD
                                                    </option>
                                                    <option value="1">1
                                                    </option>
                                                    <option value="2">2
                                                    </option>
                                                    <option value="3">3
                                                    </option>
                                                    <option value="4">4
                                                    </option>
                                                    <option value="5">5
                                                    </option>
                                                    <option value="6">6
                                                    </option>
                                                    <option value="7">7
                                                    </option>
                                                    <option value="8">8
                                                    </option>
                                                    <option value="9">9
                                                    </option>
                                                    <option value="10">10
                                                    </option>
                                                    <option value="11">11
                                                    </option>
                                                    <option value="12">12
                                                    </option>
                                                    <option value="13">13
                                                    </option>
                                                    <option value="14">14
                                                    </option>
                                                    <option value="15">15
                                                    </option>
                                                    <option value="16">16
                                                    </option>
                                                    <option value="17">17
                                                    </option>
                                                    <option value="18">18
                                                    </option>
                                                    <option value="19">19
                                                    </option>
                                                    <option value="20">20
                                                    </option>
                                                    <option value="21">21
                                                    </option>
                                                    <option value="22">22
                                                    </option>
                                                    <option value="23">23
                                                    </option>
                                                    <option value="24">24
                                                    </option>
                                                    <option value="25">25
                                                    </option>
                                                    <option value="26">26
                                                    </option>
                                                    <option value="27">27
                                                    </option>
                                                    <option value="28">28
                                                    </option>
                                                    <option value="29">29
                                                    </option>
                                                    <option value="30">30
                                                    </option>
                                                    <option value="31">31
                                                    </option>
                                                </select>
                                                <select name="mm" id="mm" onchange="mmchange()" style="width: 60px; color: rgb(204, 204, 204);" runat="server" class="form-control">
                                                    <option value="">MM
                                                    </option>
                                                    <option value="1">JAN
                                                    </option>
                                                    <option value="2">FEB
                                                    </option>
                                                    <option value="3">MAR
                                                    </option>
                                                    <option value="4">APR
                                                    </option>
                                                    <option value="5">MAY
                                                    </option>
                                                    <option value="6">JUN
                                                    </option>
                                                    <option value="7">JUL
                                                    </option>
                                                    <option value="8">AUG
                                                    </option>
                                                    <option value="9">SEP
                                                    </option>
                                                    <option value="10">OCT
                                                    </option>
                                                    <option value="11">NOV
                                                    </option>
                                                    <option value="12">DEC
                                                    </option>
                                                </select>
                                                <input name="dob_year" id="dob_year" placeholder="YYYY" type="text" class="txtup form-control" autocomplete="off" maxlength="4" onkeypress="return isNumber(event)" runat="server" />
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="fonttable">
                                            <label for="Print_firstname">Name on the PAN Card</label>
                                            <span class="mandatory">*</span><span class="tooltip tooltipstered">
                                                <img src="images/help_icon.png" width="19" height="19"></span></td>
                                        <td colspan="2" class="category_pad">
                                            <div class="mediumss">
                                                <input name="print_firstname" id="print_firstname" placeholder="First Name" type="text" class="txtup form-control" onchange="upperMe('print_firstname')" autocomplete="off" style="width: 271px;" onkeypress="return lettersOnly(event)" maxlength="50" runat="server">
                                            </div>
                                        </td>
                                        <td class="category_pad">
                                            <div class="medium">
                                                <input name="print_lastname" id="print_lastname" placeholder="Last Name" type="text" class="txtup form-control" onchange="upperMe('print_lastname')" autocomplete="off" onkeypress="return lettersOnly(event)" runat="server">
                                            </div>
                                        </td>
                                        <td class="fonttable">Gender<span class="mandatory">*</span></td>
                                        <td>
                                            <div class="field_items_2">
                                                <input type="radio" name="gender" value="0" id="gender1" runat="server">
                                                <label for="gender1">Male</label>
                                            </div>
                                            <div class="field_items_2">
                                                <input type="radio" name="gender" value="1" id="gender2" runat="server">
                                                <label for="gender2">Female</label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="fonttable">
                                            <label for="chk">Any other name</label>
                                            <span href="#" class="tooltip tooltipstered">
                                                <img src="images/help_icon.png" width="19" height="19"></span>
                                            <input type="checkbox" name="chk" id="chk" value="1" onclick="enableothernamenamediv()" runat="server"></td>
                                        <td class="category_pad">
                                            <div class="medium">
                                                <input name="First other name" type="text" id="firstnameothr" class="txtup form-control" onchange="upperMe('firstnameothr')" style="background-color: #E9E9E9" disabled="disabled" autocomplete="off" onkeypress="return lettersOnly(event)" onblur="initialvalidation('firstnameothr');" maxlength="25" runat="server">
                                            </div>
                                        </td>
                                        <td class="category_pad">
                                            <div class="medium">
                                                <input name="Middle other name" type="text" id="middlenameothr" class="txtup form-control" onchange="upperMe('middlenameothr')" style="background-color: #E9E9E9" disabled="disabled" autocomplete="off" onkeypress="return lettersOnly(event)" onblur="initialvalidation('middlenameothr');" maxlength="25" runat="server">
                                            </div>
                                        </td>
                                        <td class="category_pad">
                                            <div class="medium">
                                                <input name="Last other name" type="text" id="lastnameothr" class="txtup form-control" onchange="upperMe('lastnameothr')" style="background-color: #E9E9E9" disabled="disabled" autocomplete="off" onkeypress="return lettersOnly(event)" onblur="initialvalidation('lastnameothr');" maxlength="25" runat="server">
                                            </div>
                                        </td>
                                        <td class="fonttable">Marital Status<span class="mandatory">*</span></td>
                                        <td>
                                            <div class="field_items_2">
                                                <input type="radio" name="maritalstatus" value="0" id="RadioGroup10" runat="server">
                                                <label for="RadioGroup10" style="cursor: pointer">Single</label>
                                            </div>
                                            <div class="field_items_2">
                                                <input type="radio" name="maritalstatus" value="1" id="RadioGroup11" runat="server">
                                                <label for="RadioGroup11">Married</label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="fonttable">Father's Name <span class="mandatory">*</span><span class="tooltip tooltipstered">
                                            <img src="images/help_icon.png" width="19" height="19"></span></td>
                                        <td class="category_pad">
                                            <div class="medium">
                                                <input name="" id="father_fname" placeholder="First Name" type="text" class="txtup form-control" onchange="upperMe('father_fname')" autocomplete="off" onkeypress="return lettersOnly(event)" onblur="initialvalidation('father_fname');" maxlength="25" runat="server">
                                            </div>
                                        </td>
                                        <td class="category_pad">
                                            <div class="medium">
                                                <input name="" id="father_mname" placeholder="Middle Name" type="text" class="txtup form-control" onchange="upperMe('father_mname')" autocomplete="off" onkeypress="return lettersOnly(event)" onblur="initialvalidation('father_mname');" maxlength="25" runat="server">
                                            </div>
                                        </td>
                                        <td class="category_pad">
                                            <div class="medium">
                                                <input name="" id="father_lname" placeholder="Last Name" type="text" class="txtup form-control" onchange="upperMe('father_lname')" autocomplete="off" onkeypress="return lettersOnly(event)" onblur="initialvalidation('father_lname');" maxlength="25" runat="server">
                                            </div>
                                        </td>
                                        <td class="fonttable">AADHAAR</td>
                                        <td>
                                            <div class="medium">
                                                <input name="input" type="text" id="aadharnumber" class="numeric form-control" maxlength="12" placeholder="AADHAAR Number" autocomplete="off" style="width: 157px;" onkeypress="return isNumber(event)" runat="server">
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>--%>

                <div class="col-md-4">
                    <div class="panel panel-primary wdth">
                        <div class="panel-heading">CONTACT DETAILS</div>
                        <div class="panel-body">
                            <table class="table BorderLess">
                                <tbody>
                                    <tr>
                                        <td>Mobile<span class="mandatory">*</span>
                                        </td>
                                        <td>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <input name="" type="text" id="" class="numeric form-control" maxlength="7" value="91" style="text-align: center; background-color: #E9E9E9; width: 60px; float: left;" disabled="disabled" autocomplete="off" />
                                                    </td>
                                                    <td>
                                                        <input type="text" name="input" id="mobilenumber" maxlength="10" placeholder="Mobile No" autocomplete="off" onkeypress="return isNumber(event)" runat="server" class="form-control" style="width: 120px; float: right;">
                                                    </td>
                                                </tr>
                                            </table>


                                        </td>

                                    </tr>
                                    <tr>
                                        <td>Email ID<span class="mandatory">*</span>
                                        </td>
                                        <td>
                                            <input type="text" name="input" id="emailids" placeholder="Email ID" style="width: 180px;" autocomplete="off" maxlength="37" runat="server" class="form-control" />

                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Land Line</td>
                                        <td>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <input name="" type="text" id="codenumb" class="numeric form-control" maxlength="7" autocomplete="off" placeholder="STD" onkeypress="return isNumber(event)" runat="server" style="text-align: center; background-color: #E9E9E9; width: 60px; float: left;" />
                                                    </td>
                                                    <td>
                                                        <input name="" type="text" id="codephn" class="numeric form-control" maxlength="10" style="width: 120px; float: right;" autocomplete="off" placeholder="phone no" onkeypress="return isNumber(event)" runat="server">
                                                    </td>
                                                </tr>
                                            </table>

                                        </td>
                                    </tr>
                                    <tr id="tdComm" runat="server">
                                        <td>Communication<span class="mandatory">*</span></td>
                                        <td>

                                            <input type="radio" name="add" value="0" id="resid1" runat="server" onclick="showres();">
                                            <label for="residence">Residence</label>

                                            <input type="radio" name="add" value="1" id="resid2" runat="server" onclick="showoffice();">
                                            <label for="office">Office</label>

                                        </td>
                                    </tr>
                                </tbody>
                            </table>

                        </div>
                    </div>
                </div>
                <div class="col-md-4" runat="server" id="divDocument">
                    <div class="panel panel-primary wdth">
                        <div class="panel-heading">DOCUMENT PROOF</div>
                        <div class="panel-body">
                            <table class="table BorderLess">
                                <tbody>
                                    <tr>
                                        <td>ID Proof<span class="mandatory">*</span></td>
                                        <td>

                                            <select name="proofofidentity" id="proofofidentity" style="width: 150px; color: rgb(204, 204, 204);" runat="server" class="form-control">
                                                <option value="">Select</option>
                                                <option value="1">Voters Identity Card</option>
                                                <option value="2">Driving License</option>
                                                <option value="3">Passport</option>
                                                <option value="13">Certificate of Identity signed by a Gazetted Officer in prescribed format only</option>
                                                <option value="14">Certificate of Identity signed by a MP in prescribed format only</option>
                                                <option value="15">Certificate of Identity signed by a MLA in prescribed format only</option>
                                                <option value="16">Certificate of Identity signed by a Municipal Councilor in prescribed format only</option>
                                                <option value="17">Aadhar Card issues by Unique Identification Authority of India</option>
                                                <option value="18">Ration Card with photograph</option>
                                                <option value="19">Arms License</option>
                                                <option value="20">Pensioner Card with Photograph</option>
                                                <option value="21">Central Government Health Scheme Card</option>
                                                <option value="22">Ex-servicemen Contributory Heath Scheme photo card</option>
                                                <option value="24">Photo Identity card issued by the Central Government/State Government/Public Sector Undertaking</option>
                                                <option value="26">Bank certificate in original on letter head from the branch
 (along with name and stamp of the issuing officer) containing duly attested photograph and
  bank account number of the applicant</option>
                                            </select>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Address Proof<span class="mandatory">*</span></td>
                                        <td>

                                            <select name="proofofresidence" id="proofofresidence" onchange="residchange();replaceproofofresidence()" style="width: 150px; color: rgb(204, 204, 204);" runat="server" class="form-control">
                                                <option value="">Select</option>
                                                <option value="1">Voters Identity Card</option>
                                                <option value="2">Driving License</option>
                                                <option value="3">Passport</option>
                                                <option value="4">Bank Account Statement</option>
                                                <option value="5">Credit Card Statement</option>
                                                <option value="7">Landline telephone or broadband connection bill </option>
                                                <option value="8">Employer Certificate</option>
                                                <option value="10">Electricity Bill</option>
                                                <option value="11">Depository Account Statement</option>
                                                <option value="13">Certificate of Address signed by a Gazetted Officer in prescribed format only</option>
                                                <option value="18">Certificate of Address signed by a MP in prescribed format only</option>
                                                <option value="19">Certificate of Address signed by a MLA in prescribed format only</option>
                                                <option value="20">Certificate of Address signed by a Municipal Councillor  in prescribed format only</option>
                                                <option value="21">Aadhar Card issues by Unique Identification Authority of India</option>
                                                <option value="22">Water Bill</option>
                                                <option value="23">Consumer Gas Connection Card</option>
                                                <option value="24">Credit Card Statement</option>
                                                <option value="26">Passport of the spouse</option>
                                                <option value="27">Post office pass book </option>
                                                <option value="29">Domicile Certificate issued by the Government</option>
                                                <option value="30">Allotment letter of accommodation issued by Central/state Government less than 3 years old</option>
                                                <option value="31">Property Registration Document</option>
                                                <option value="32">Latest Property Tax Assessment Order</option>
                                                <option value="33">Elector's Photo Identity Card</option>
                                            </select>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Date of Birth<span class="mandatory">*</span></td>
                                        <td>
                                            <select name="dobproof" id="dobproof" onchange="idhange();replaceproofofdob()" style="width: 150px; color: rgb(204, 204, 204);" runat="server" class="form-control">
                                                <option value="">Select</option>
                                                <option value="1">Birth Certificate issued by the Municipal Authority</option>
                                                <option value="2">Pension Payment Order</option>
                                                <option value="3">Marriage certificate issued by Registrar of Marriages</option>
                                                <option value="4">Matriculation certificate</option>
                                                <option value="5">Domicile certificate issued </option>
                                                <option value="6">Affidavit sworn before a magistrate stating the date of birth by the Government</option>
                                                <option value="7">Driving License</option>
                                                <option value="8">Passport</option>
                                            </select>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Office Address</td>
                                        <td>
                                            <select name="proofofoffice" id="proofofoffice" onchange="proofofofficehange()" style="width: 150px; color: rgb(204, 204, 204);" disabled="disabled" runat="server" class="form-control">
                                                <option value="">Select</option>
                                                <option value="1">Credit Card Statement carrying Office Address </option>
                                                <option value="2">Bank Account Statement carrying Office Address </option>
                                                <option value="3">Employer Certificate carrying Office Address </option>
                                                <option value="4">Electricity Bill carrying Office Address </option>
                                                <option value="5">Telephone Bill carrying Office Address </option>
                                                <option value="6">Depository Account Statement carrying Office Address </option>
                                                <option value="7">Office Property Tax Assessment Order</option>
                                                <option value="8">Bank Account Statement carrying Office Address </option>
                                            </select></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="col-md-4" runat="server" id="divIncome">
                    <div class="panel panel-primary wdth">
                        <div class="panel-heading">INCOME SOURCE</div>
                        <div class="panel-body">
                            <table class="table BorderLess">
                                <tbody>
                                    <tr>
                                        <td>
                                            <input type="checkbox" name="chksalary" id="chkincome" value="6" onclick="disableother()" runat="server" /></td>
                                        <td>Salaried Employee</td>

                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="checkbox" name="chkbusiness" id="chkbusiness" value="1" onclick="enablebusiness()" runat="server" /></td>
                                        <td>Business/Profession</td>
                                        <td>
                                            <select name="businesscode" id="businesscode" onchange="businesscodechange()" style="width: 140px; float: left; color: #C7C7C7" disabled="disabled" runat="server" class="form-control">
                                                <option value="">BUSINESS TYPE</option>
                                                <option value="1">Medical Profession and Business</option>
                                                <option value="2">Engineering</option>
                                                <option value="3">Architecture</option>
                                                <option value="4">Chartered Accountant / Accountancy</option>
                                                <option value="5">Interior Decoration</option>
                                                <option value="6">Technical Consultancy</option>
                                                <option value="7">Company Secretary</option>
                                                <option value="8">Legal Practitioner and Solicitors</option>
                                                <option value="9">Government Contractors</option>
                                                <option value="10">Insurance Agency</option>
                                                <option value="11">Films, TV and Such other Entertainment</option>
                                                <option value="12">Information technology</option>
                                                <option value="13">Builders and developers</option>
                                                <option value="14">Members of Stock Exchange, Share Brokers and Sub- Brokers</option>
                                                <option value="15">Performing Arts and Yatra</option>
                                                <option value="16">Operation of Ships, Hovercrafts, Aircrafts  or  Helicopters</option>
                                                <option value="17">Plying Taxies, Lorries, Trucks, Buses or other commercial vehicles</option>
                                                <option value="18">Ownership of Horses or Jockeys</option>
                                                <option value="19">Cinema Halls and other theatres</option>
                                                <option value="20">Others</option>
                                            </select></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="checkbox" name="chksource" id="chksource" value="1" onclick="enableotherincome()" runat="server" /></td>
                                        <td>Other Source of income</td>
                                        <td>
                                            <select name="otherincome" id="otherincome" style="width: 140px; float: left; color: #C7C7C7" disabled="disabled" runat="server" class="form-control">
                                                <option value="">SOURCE OF INCOME</option>
                                                <option value="1">Capital Gains</option>
                                                <option value="2">House Property</option>
                                                <option value="3">Other Sources</option>
                                                <option value="4">Capital Gains & House Property</option>
                                                <option value="5">House Property & Other Sources</option>
                                                <option value="6">Capital Gains & Other Sources</option>
                                                <option value="7">Capital Gains, House Property & Other Sources</option>
                                                <option value="8">No Income</option>
                                            </select></td>
                                    </tr>
                                </tbody>

                            </table>
                        </div>
                    </div>
                </div>

                <div class="col-md-8" runat="server" id="divTanDetails" visible="false">
                    <div class="panel panel-primary">
                        <div class="panel-heading">OTHER DETAILS</div>
                        <div class="panel-body">
                            <table class="table BorderLess">
                                <tbody>
                                    <tr>
                                        <td colspan="2">Nationality</td>
                                        <td style="width: 20px;">
                                            <input type="checkbox" name="chkIndian" id="chkIndian" runat="server" /></td>
                                        <td>Indian</td>
                                        <td style="width: 20px;">
                                            <input type="checkbox" name="chkForeign" id="chkForeign" runat="server" /></td>
                                        <td>Foreign</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">Permanent Account Number</td>
                                        <td colspan="4">
                                            <input type="text" id="txtPAN" placeholder="PAN Number" runat="server" class="form-control"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">Tax Deduction Account Number</td>
                                        <td colspan="4">
                                            <input type="text" id="txtTAN" placeholder="TAN Number" runat="server" class="form-control"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">Tax Collection Account Number</td>
                                        <td colspan="4">
                                            <input type="text" id="txtTCS" placeholder="TCS Number" runat="server" class="form-control"></td>
                                    </tr>
                                </tbody>

                            </table>
                        </div>
                    </div>
                </div>


                <%--<div class="tab_main">
                    <div class="tab1_div"><span class="tab-numbering">2</span>CONTACT DETAILS</div>
                    <div class="tab1_div" id="tab_space"><span class="tab-numbering">3</span>DOCUMENT PROOF</div>
                    <div class="tab1_div" id="tab1_space"><span class="tab-numbering">4</span>INCOME SOURCE</div>
                </div>
                <div class="section_div">
                    <div class="section_inner_left_div1" style="border: 1px solid #CCC; background-color: #FFFFFF">
                        <div class="cont_left">
                            <table border="0" cellspacing="2" cellpadding="2" width="100%">
                                <tbody>
                                    <tr>
                                        <td class="fonttable">Mobile<span class="mandatory">*</span><span class="tooltip tooltipstered">
                                            <img src="images/help_icon.png" width="19" height="19"></span></td>
                                        <td class="category_pad">
                                            <div class="small" style="width: 60px; float: left;">
                                                <input name="" type="text" id="" class="numeric form-control" maxlength="7" value="91" style="text-align: center; background-color: #E9E9E9" disabled="disabled" autocomplete="off" />
                                            </div>
                                            <div class="medium">
                                                <input type="text" name="input" id="mobilenumber" maxlength="10" placeholder="Mobile No" autocomplete="off" onkeypress="return isNumber(event)" runat="server" class="form-control">
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="fonttable">Email ID<span class="mandatory">*</span><span class="tooltip tooltipstered">
                                            <img src="images/help_icon.png" width="19" height="19"></span></td>
                                        <td class="category_pad">
                                            <div class="medium">
                                                <input type="text" name="input" id="emailids" placeholder="Email ID" style="width: 180px; text-transform: uppercase" autocomplete="off" maxlength="37" runat="server" class="form-control" />
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="fonttable">Land Line<span class="tooltip tooltipstered">
                                            <img src="images/help_icon.png" width="19" height="19"></span></td>
                                        <td class="category_pad">
                                            <div class="small" style="width: 60px; float: left;">
                                                <input name="" type="text" id="codenumb" class="numeric form-control" maxlength="7" autocomplete="off" placeholder="STD" onkeypress="return isNumber(event)" runat="server">
                                            </div>
                                            <div class="medium" style="width: 125px; float: left;">
                                                <input name="" type="text" id="codephn" class="numeric form-control" maxlength="10" style="width: 120px;" autocomplete="off" placeholder="phone number" onkeypress="return isNumber(event)" runat="server">
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="fonttable">Communication<span class="mandatory">*</span></td>
                                        <td class="">

                                            <div class="field_items_2">
                                                <input type="radio" name="add" value="0" id="resid1" runat="server">
                                                <label for="residence">Residence</label>
                                            </div>
                                            <div class="field_items_2">
                                                <input type="radio" name="add" value="1" id="resid2" runat="server">
                                                <label for="office">Office</label>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="section_inner_left_div1 tabbord">
                        <div class="cont_left">
                            <table border="0" cellspacing="2" cellpadding="2">
                                <tbody>
                                    <tr>
                                        <td class="fonttable">ID Proof<span class="mandatory">*</span></td>
                                        <td class="prof_left category_pad">
                                            <div class="medium_1">
                                                <select name="proofofidentity" id="proofofidentity" style="width: 150px; color: rgb(204, 204, 204);" onchange="selchange();replaceprrofid()" runat="server" class="form-control">
                                                    <option value="">Select</option>
                                                    <option value="1">Voters Identity Card</option>
                                                    <option value="2">Driving License</option>
                                                    <option value="3">Passport</option>
                                                    <option value="13">Certificate of Identity signed by a Gazetted Officer in prescribed format only</option>
                                                    <option value="14">Certificate of Identity signed by a MP in prescribed format only</option>
                                                    <option value="15">Certificate of Identity signed by a MLA in prescribed format only</option>
                                                    <option value="16">Certificate of Identity signed by a Municipal Councilor in prescribed format only</option>
                                                    <option value="17">Aadhar Card issues by Unique Identification Authority of India</option>
                                                    <option value="18">Ration Card with photograph</option>
                                                    <option value="19">Arms License</option>
                                                    <option value="20">Pensioner Card with Photograph</option>
                                                    <option value="21">Central Government Health Scheme Card</option>
                                                    <option value="22">Ex-servicemen Contributory Heath Scheme photo card</option>
                                                    <option value="24">Photo Identity card issued by the Central Government/State Government/Public Sector Undertaking</option>
                                                    <option value="26">Bank certificate in original on letter head from the branch
 (along with name and stamp of the issuing officer) containing duly attested photograph and
  bank account number of the applicant</option>
                                                </select>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="fonttable">Address Proof<span class="mandatory">*</span></td>
                                        <td class="prof_left category_pad">
                                            <div class="medium_1">
                                                <select name="proofofresidence" id="proofofresidence" onchange="residchange();replaceproofofresidence()" style="width: 150px; color: rgb(204, 204, 204);" runat="server" class="form-control">
                                                    <option value="">Select</option>
                                                    <option value="1">Voters Identity Card</option>
                                                    <option value="2">Driving License</option>
                                                    <option value="3">Passport</option>
                                                    <option value="4">Bank Account Statement</option>
                                                    <option value="5">Credit Card Statement</option>
                                                    <option value="7">Landline telephone or broadband connection bill </option>
                                                    <option value="8">Employer Certificate</option>
                                                    <option value="10">Electricity Bill</option>
                                                    <option value="11">Depository Account Statement</option>
                                                    <option value="13">Certificate of Address signed by a Gazetted Officer in prescribed format only</option>
                                                    <option value="18">Certificate of Address signed by a MP in prescribed format only</option>
                                                    <option value="19">Certificate of Address signed by a MLA in prescribed format only</option>
                                                    <option value="20">Certificate of Address signed by a Municipal Councillor  in prescribed format only</option>
                                                    <option value="21">Aadhar Card issues by Unique Identification Authority of India</option>
                                                    <option value="22">Water Bill</option>
                                                    <option value="23">Consumer Gas Connection Card</option>
                                                    <option value="24">Credit Card Statement</option>
                                                    <option value="26">Passport of the spouse</option>
                                                    <option value="27">Post office pass book </option>
                                                    <option value="29">Domicile Certificate issued by the Government</option>
                                                    <option value="30">Allotment letter of accommodation issued by Central/state Government less than 3 years old</option>
                                                    <option value="31">Property Registration Document</option>
                                                    <option value="32">Latest Property Tax Assessment Order</option>
                                                    <option value="33">Elector's Photo Identity Card</option>
                                                </select>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="fonttable">Date of Birth<span class="mandatory">*</span></td>
                                        <td class="prof_left category_pad">
                                            <div class="medium_1">
                                                <select name="dobproof" id="dobproof" onchange="idhange();replaceproofofdob()" style="width: 150px; color: rgb(204, 204, 204);" runat="server" class="form-control">
                                                    <option value="">Select</option>
                                                    <option value="1">Birth Certificate issued by the Municipal Authority</option>
                                                    <option value="2">Pension Payment Order</option>
                                                    <option value="3">Marriage certificate issued by Registrar of Marriages</option>
                                                    <option value="4">Matriculation certificate</option>
                                                    <option value="5">Domicile certificate issued </option>
                                                    <option value="6">Affidavit sworn before a magistrate stating the date of birth by the Government</option>
                                                    <option value="7">Driving License</option>
                                                    <option value="8">Passport</option>
                                                </select>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="fonttable " style="padding-bottom: 14px;"><span class="ofcadrs">Office Address<span class="mandatory" id="ofcmand" style="display: none; width: 5px;">*</span></span></td>
                                        <td class="prof_left category_pad">
                                            <select name="proofofoffice" id="proofofoffice" onchange="proofofofficehange()" style="width: 150px; color: rgb(204, 204, 204);" disabled="disabled" runat="server" class="form-control">
                                                <option value="">Select</option>
                                                <option value="1">Credit Card Statement carrying Office Address </option>
                                                <option value="2">Bank Account Statement carrying Office Address </option>
                                                <option value="3">Employer Certificate carrying Office Address </option>
                                                <option value="4">Electricity Bill carrying Office Address </option>
                                                <option value="5">Telephone Bill carrying Office Address </option>
                                                <option value="6">Depository Account Statement carrying Office Address </option>
                                                <option value="7">Office Property Tax Assessment Order</option>
                                                <option value="8">Bank Account Statement carrying Office Address </option>
                                            </select></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="section_inner_left_div1 tabbord" style="">
                        <div class="cont_left">
                            <table border="0" cellspacing="2" cellpadding="2">
                                <tbody>
                                    <tr>
                                        <td class="fonttable pad_top">
                                            <input type="checkbox" name="chksalary" id="chkincome" value="6" onclick="disableother()" runat="server" /></td>
                                        <td class="fonttable pad_top category_pad">
                                            <label for="chkincome">Salaried Employee</label></td>
                                        <td colspan="2" class="fonttable pad_top category_pad" style="padding-top: 2px; padding-left: 7px;"></td>
                                    </tr>
                                    <tr>
                                        <td class="fonttable pad_top">
                                            <input type="checkbox" name="chkbusiness" id="chkbusiness" value="1" onclick="enablebusiness()" runat="server" /></td>
                                        <td class="fonttable pad_top category_pad">
                                            <label for="chkbusiness">Business/Profession</label></td>
                                        <td class="fonttable pad_top" style="padding-left: 7px;">
                                            <select name="businesscode" id="businesscode" onchange="businesscodechange()" style="width: 140px; float: left; color: #C7C7C7" disabled="disabled" runat="server" class="form-control">
                                                <option value="">BUSINESS TYPE</option>
                                                <option value="1">Medical Profession and Business</option>
                                                <option value="2">Engineering</option>
                                                <option value="3">Architecture</option>
                                                <option value="4">Chartered Accountant / Accountancy</option>
                                                <option value="5">Interior Decoration</option>
                                                <option value="6">Technical Consultancy</option>
                                                <option value="7">Company Secretary</option>
                                                <option value="8">Legal Practitioner and Solicitors</option>
                                                <option value="9">Government Contractors</option>
                                                <option value="10">Insurance Agency</option>
                                                <option value="11">Films, TV and Such other Entertainment</option>
                                                <option value="12">Information technology</option>
                                                <option value="13">Builders and developers</option>
                                                <option value="14">Members of Stock Exchange, Share Brokers and Sub- Brokers</option>
                                                <option value="15">Performing Arts and Yatra</option>
                                                <option value="16">Operation of Ships, Hovercrafts, Aircrafts  or  Helicopters</option>
                                                <option value="17">Plying Taxies, Lorries, Trucks, Buses or other commercial vehicles</option>
                                                <option value="18">Ownership of Horses or Jockeys</option>
                                                <option value="19">Cinema Halls and other theatres</option>
                                                <option value="20">Others</option>
                                            </select></td>
                                    </tr>
                                    <tr>
                                        <td class="fonttable pad_top">
                                            <input type="checkbox" name="chksource" id="chksource" value="1" onclick="enableotherincome()" runat="server" /></td>
                                        <td class="fonttable pad_top category_pad">
                                            <label for="chksource">Other Source of income</label></td>
                                        <td class="fonttable pad_top" style="padding-left: 7px;">
                                            <select name="otherincome" id="otherincome" style="width: 140px; float: left; color: #C7C7C7" disabled="disabled" runat="server" class="form-control">
                                                <option value="">SOURCE OF INCOME</option>
                                                <option value="1">Capital Gains</option>
                                                <option value="2">House Property</option>
                                                <option value="3">Other Sources</option>
                                                <option value="4">Capital Gains & House Property</option>
                                                <option value="5">House Property & Other Sources</option>
                                                <option value="6">Capital Gains & Other Sources</option>
                                                <option value="7">Capital Gains, House Property & Other Sources</option>
                                                <option value="8">No Income</option>
                                            </select></td>
                                    </tr>
                                </tbody>
                         
                            </table>
                        </div>
                    </div>
                </div>--%>
                <div class="col-md-12" id="divAddressPaN" runat="server">
                    <div class="panel panel-primary">
                        <div class="panel panel-heading">
                            ADDRESS INFORMATION
                        </div>
                        <div class="panel panel-body">
                            <table class="table BorderLess">
                                <tr>
                                    <td colspan="2">
                                        <h1>Residence Address <span class="mandatory">*</span>
                                        </h1>
                                    </td>
                                    <td colspan="2">
                                        <h1><span class="ofcadrswid">Office Address<span style="font-size: 12px" id="opttext"> (Optional)</span> <span class="mandatory" id="mand" style="display: none">*</span></span> </h1>
                                    </td>

                                </tr>
                                <tr>
                                    <td>Flat/Room/Door/Block No.</td>
                                    <td>
                                        <input name="input" type="text" id="flatroomnoresidence" autocomplete="off" maxlength="25" runat="server" class="form-control"></td>
                                    <td>Name of Office</td>
                                    <td>
                                        <input name="input" type="text" id="nameofofc" autocomplete="off" maxlength="25" runat="server" class="form-control"></td>
                                </tr>
                                <tr>
                                    <td>Name of Premises/Building/Village</td>
                                    <td>
                                        <input name="input" type="text" id="premiseresidence" autocomplete="off" maxlength="25" runat="server" class="form-control"></td>
                                    <td>Flat/Room/Door/Block No.</td>
                                    <td>
                                        <input name="input" type="text" id="floorrommno" autocomplete="off" maxlength="25" runat="server" class="form-control"></td>
                                </tr>
                                <tr>
                                    <td>Road/Street/Lane/Post Office</td>
                                    <td>
                                        <input name="input" type="text" id="roadstreetresidence" autocomplete="off" maxlength="25" runat="server" class="form-control"></td>
                                    <td>Name of Premises/Building/Village</td>
                                    <td>
                                        <input name="input" type="text" id="nameofpremis" autocomplete="off" maxlength="25" runat="server" class="form-control"></td>
                                </tr>
                                <tr>
                                    <td>Area/Locality/Taluka/Sub-Division</td>
                                    <td>
                                        <input name="input" type="text" id="arealocalityresidence" autocomplete="off" maxlength="25" runat="server" class="form-control"></td>
                                    <td>Road/Street/Lane/Post Office</td>
                                    <td>
                                        <input name="input" type="text" id="roadstreet" autocomplete="off" maxlength="25" runat="server" class="form-control"></td>
                                </tr>
                                <tr>
                                    <td>State/Union Territory</td>
                                    <td>
                                        <select name="searchstate" id="searchstate" onchange="getdistrict('districtcodedisplay',this.value);searchstatechange()" onkeyup="getdistrict('districtcodedisplay',this.value);" style="color: #C7C7C7" runat="server" class="form-control">
                                            <option value="">Select</option>
                                            <option value="3">ANDAMAN &amp; NICOBAR ISLANDS</option>
                                            <option value="4">ANDHRA PRADESH</option>
                                            <option value="5">ARUNACHAL PRADESH</option>
                                            <option value="6">ASSAM</option>
                                            <option value="7">BIHAR</option>
                                            <option value="8">CHANDIGARH</option>
                                            <option value="36">CHHATTISGARH</option>
                                            <option value="10">DADRA &amp; NAGAR HAVELI</option>
                                            <option value="9">DAMAN &amp; DIU</option>
                                            <option value="26">DELHI</option>
                                            <option value="11">GOA</option>
                                            <option value="12">GUJARAT</option>
                                            <option value="13">HARYANA</option>
                                            <option value="14">HIMACHAL PRADESH</option>
                                            <option value="15">JAMMU &amp; KASHMIR</option>
                                            <option value="16">JHARKHAND</option>
                                            <option value="17">KARNATAKA</option>
                                            <option value="18">KERALA</option>
                                            <option value="19">LAKSHADWEEP</option>
                                            <option value="24">MADHYA PRADESH</option>
                                            <option value="20">MAHARASHTRA</option>
                                            <option value="21">MANIPUR</option>
                                            <option value="22">MEGHALAYA</option>
                                            <option value="23">MIZORAM</option>
                                            <option value="25">NAGALAND</option>
                                            <option value="27">ORISSA</option>
                                            <option value="28">PONDICHERRY</option>
                                            <option value="29">PUNJAB</option>
                                            <option value="30">RAJASTHAN</option>
                                            <option value="31">SIKKIM</option>
                                            <option value="32">TAMIL NADU</option>
                                            <option value="33">TRIPURA</option>
                                            <option value="34">UTTAR PRADESH</option>
                                            <option value="35">UTTARAKHAND</option>
                                            <option value="37">WEST BENGAL</option>
                                        </select></td>
                                    <td>Area/Locality/Taluka/Sub-Division</td>
                                    <td>
                                        <input name="input" type="text" id="arealocaldiv" autocomplete="off" maxlength="25" runat="server" class="form-control" /></td>
                                </tr>
                                <tr>
                                    <td>Town/City/District</td>
                                    <td>
                                        <input name="district" type="text" id="district" runat="server" class="form-control"></td>
                                    <td>State/Union Territory</td>
                                    <td>
                                        <select name="stateunion" id="stateunion" onchange="getdistrict1('districtcodedisplay1',this.value);stateunionchange()" onkeyup="getdistrict1('districtcodedisplay1',this.value);" style="color: #C7C7C7" runat="server" class="form-control">
                                            <option value="">Select</option>
                                            <option value="3">ANDAMAN &amp; NICOBAR ISLANDS</option>
                                            <option value="4">ANDHRA PRADESH</option>
                                            <option value="5">ARUNACHAL PRADESH</option>
                                            <option value="6">ASSAM</option>
                                            <option value="7">BIHAR</option>
                                            <option value="8">CHANDIGARH</option>
                                            <option value="36">CHHATTISGARH</option>
                                            <option value="10">DADRA &amp; NAGAR HAVELI</option>
                                            <option value="9">DAMAN &amp; DIU</option>
                                            <option value="26">DELHI</option>
                                            <option value="11">GOA</option>
                                            <option value="12">GUJARAT</option>
                                            <option value="13">HARYANA</option>
                                            <option value="14">HIMACHAL PRADESH</option>
                                            <option value="15">JAMMU &amp; KASHMIR</option>
                                            <option value="16">JHARKHAND</option>
                                            <option value="17">KARNATAKA</option>
                                            <option value="18">KERALA</option>
                                            <option value="19">LAKSHADWEEP</option>
                                            <option value="24">MADHYA PRADESH</option>
                                            <option value="20">MAHARASHTRA</option>
                                            <option value="21">MANIPUR</option>
                                            <option value="22">MEGHALAYA</option>
                                            <option value="23">MIZORAM</option>
                                            <option value="25">NAGALAND</option>
                                            <option value="27">ORISSA</option>
                                            <option value="28">PONDICHERRY</option>
                                            <option value="29">PUNJAB</option>
                                            <option value="30">RAJASTHAN</option>
                                            <option value="31">SIKKIM</option>
                                            <option value="32">TAMIL NADU</option>
                                            <option value="33">TRIPURA</option>
                                            <option value="34">UTTAR PRADESH</option>
                                            <option value="35">UTTARAKHAND</option>
                                            <option value="37">WEST BENGAL</option>
                                        </select></td>
                                </tr>
                                <tr>
                                    <td>Pincode</td>
                                    <td>
                                        <input name="pincoderesidence" type="text" id="pincoderesidence" maxlength="6" class="numeric form-control" autocomplete="off" onkeypress="return isNumber(event)" runat="server"></td>
                                    <td>Town/City/District</td>
                                    <td>
                                        <input name="towncity" type="text" id="towncity" runat="server" class="form-control"></td>
                                </tr>
                                <tr>
                                    <td>Country</td>
                                    <td>
                                        <input name="input" type="text" id="residence_country" value="INDIA" style="background: rgb(241,241,241)" disabled="disabled" runat="server" class="form-control">
                                    <td>Pincode</td>
                                    <td>
                                        <input name="input" type="text" id="pincodezipcode" class="numeric form-control" maxlength="6" autocomplete="off" onkeypress="return isNumber(event)" runat="server"></td>
                                </tr>
                            </table>




                        </div>

                    </div>

                </div>
                <div class="col-md-12" id="divAddressTAN" runat="server" visible="false">
                    <div class="panel panel-primary">
                        <div class="panel panel-heading">
                            ADDRESS INFORMATION
                        </div>
                        <div class="panel panel-body">
                            <table class="table BorderLess">

                                <tr>
                                    <td>Flat/Room/Door/Block No.</td>
                                    <td>
                                        <input name="input" type="text" id="txtFlat" autocomplete="off" maxlength="25" runat="server" class="form-control"></td>

                                </tr>
                                <tr>
                                    <td>Name of Premises/Building/Village</td>
                                    <td>
                                        <input name="input" type="text" id="txtBuilding" autocomplete="off" maxlength="25" runat="server" class="form-control"></td>

                                </tr>
                                <tr>
                                    <td>Road/Street/Lane/Post Office</td>
                                    <td>
                                        <input name="input" type="text" id="txtRoad" autocomplete="off" maxlength="25" runat="server" class="form-control"></td>

                                </tr>
                                <tr>
                                    <td>Area/Locality/Taluka/Sub-Division</td>
                                    <td>
                                        <input name="input" type="text" id="txtArea" autocomplete="off" maxlength="25" runat="server" class="form-control"></td>

                                </tr>
                                <tr>
                                    <td>State/Union Territory</td>
                                    <td>
                                        <select name="searchstate" id="ddState" onchange="getdistrict('districtcodedisplay',this.value);searchstatechange()" onkeyup="getdistrict('districtcodedisplay',this.value);" style="color: #C7C7C7" runat="server" class="form-control">
                                            <option value="">Select</option>
                                            <option value="3">ANDAMAN &amp; NICOBAR ISLANDS</option>
                                            <option value="4">ANDHRA PRADESH</option>
                                            <option value="5">ARUNACHAL PRADESH</option>
                                            <option value="6">ASSAM</option>
                                            <option value="7">BIHAR</option>
                                            <option value="8">CHANDIGARH</option>
                                            <option value="36">CHHATTISGARH</option>
                                            <option value="10">DADRA &amp; NAGAR HAVELI</option>
                                            <option value="9">DAMAN &amp; DIU</option>
                                            <option value="26">DELHI</option>
                                            <option value="11">GOA</option>
                                            <option value="12">GUJARAT</option>
                                            <option value="13">HARYANA</option>
                                            <option value="14">HIMACHAL PRADESH</option>
                                            <option value="15">JAMMU &amp; KASHMIR</option>
                                            <option value="16">JHARKHAND</option>
                                            <option value="17">KARNATAKA</option>
                                            <option value="18">KERALA</option>
                                            <option value="19">LAKSHADWEEP</option>
                                            <option value="24">MADHYA PRADESH</option>
                                            <option value="20">MAHARASHTRA</option>
                                            <option value="21">MANIPUR</option>
                                            <option value="22">MEGHALAYA</option>
                                            <option value="23">MIZORAM</option>
                                            <option value="25">NAGALAND</option>
                                            <option value="27">ORISSA</option>
                                            <option value="28">PONDICHERRY</option>
                                            <option value="29">PUNJAB</option>
                                            <option value="30">RAJASTHAN</option>
                                            <option value="31">SIKKIM</option>
                                            <option value="32">TAMIL NADU</option>
                                            <option value="33">TRIPURA</option>
                                            <option value="34">UTTAR PRADESH</option>
                                            <option value="35">UTTARAKHAND</option>
                                            <option value="37">WEST BENGAL</option>
                                        </select></td>

                                </tr>
                                <tr>
                                    <td>Town/City/District</td>
                                    <td>
                                        <input name="district" type="text" id="txtDistrict" runat="server" class="form-control"></td>

                                </tr>
                                <tr>
                                    <td>Pincode</td>
                                    <td>
                                        <input name="pincoderesidence" type="text" id="txtPin" maxlength="6" class="numeric form-control" autocomplete="off" onkeypress="return isNumber(event)" runat="server"></td>

                                </tr>
                                <tr>
                                    <td>Country</td>
                                    <td>
                                        <input name="input" type="text" id="txtCountry" value="INDIA" style="background: rgb(241,241,241)" disabled="disabled" runat="server" class="form-control">
                                </tr>
                            </table>




                        </div>

                    </div>

                </div>
                <%--<div class="panel panel-body">
                            <div class="section_inner_left">
                                <h1>Residence Address <span class="mandatory">*</span>
                                    </h1>
                                <div class="add_row">
                                    <div class="row_left1">Flat/Room/Door/Block No.</div>
                                    <div class="large_big">
                                        <input name="input" type="text" id="flatroomnoresidence" autocomplete="off" maxlength="25" runat="server" class="form-control">
                                    </div>
                                </div>
                                <div class="add_row">
                                    <div class="row_left1">Name of Premises/Building/Village</div>
                                    <div class="large_big">
                                        <input name="input" type="text" id="premiseresidence" autocomplete="off" maxlength="25" runat="server" class="form-control">
                                    </div>
                                </div>
                                <div class="add_row">
                                    <div class="row_left1">Road/Street/Lane/Post Office</div>
                                    <div class="large_big">
                                        <input name="input" type="text" id="roadstreetresidence" autocomplete="off" maxlength="25" runat="server" class="form-control">
                                    </div>
                                </div>
                                <div class="add_row">
                                    <div class="row_left1">Area/Locality/Taluka/Sub-Division</div>
                                    <div class="large_big">
                                        <input name="input" type="text" id="arealocalityresidence" autocomplete="off" maxlength="25" runat="server" class="form-control">
                                    </div>
                                </div>
                                <div class="add_row">
                                    <div class="row_left1">State/Union Territory</div>
                                    <div class="large_big">
                                        <select name="searchstate" id="searchstate" onchange="getdistrict('districtcodedisplay',this.value);searchstatechange()" onkeyup="getdistrict('districtcodedisplay',this.value);" style="width: 203px; color: #C7C7C7" runat="server" class="form-control">
                                            <option value="">Select</option>
                                            <option value="3">ANDAMAN &amp; NICOBAR ISLANDS</option>
                                            <option value="4">ANDHRA PRADESH</option>
                                            <option value="5">ARUNACHAL PRADESH</option>
                                            <option value="6">ASSAM</option>
                                            <option value="7">BIHAR</option>
                                            <option value="8">CHANDIGARH</option>
                                            <option value="36">CHHATTISGARH</option>
                                            <option value="10">DADRA &amp; NAGAR HAVELI</option>
                                            <option value="9">DAMAN &amp; DIU</option>
                                            <option value="26">DELHI</option>
                                            <option value="11">GOA</option>
                                            <option value="12">GUJARAT</option>
                                            <option value="13">HARYANA</option>
                                            <option value="14">HIMACHAL PRADESH</option>
                                            <option value="15">JAMMU &amp; KASHMIR</option>
                                            <option value="16">JHARKHAND</option>
                                            <option value="17">KARNATAKA</option>
                                            <option value="18">KERALA</option>
                                            <option value="19">LAKSHADWEEP</option>
                                            <option value="24">MADHYA PRADESH</option>
                                            <option value="20">MAHARASHTRA</option>
                                            <option value="21">MANIPUR</option>
                                            <option value="22">MEGHALAYA</option>
                                            <option value="23">MIZORAM</option>
                                            <option value="25">NAGALAND</option>
                                            <option value="27">ORISSA</option>
                                            <option value="28">PONDICHERRY</option>
                                            <option value="29">PUNJAB</option>
                                            <option value="30">RAJASTHAN</option>
                                            <option value="31">SIKKIM</option>
                                            <option value="32">TAMIL NADU</option>
                                            <option value="33">TRIPURA</option>
                                            <option value="34">UTTAR PRADESH</option>
                                            <option value="35">UTTARAKHAND</option>
                                            <option value="37">WEST BENGAL</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="add_row">
                                    <div class="row_left1">Town/City/District</div>
                                    <div class="large_big">
                                        <div id="districtcodedisplay">
                                            <input name="district" type="text" id="district" runat="server" class="form-control">
                                        </div>
                                    </div>
                                </div>
                                <div class="add_row">
                                    <div class="row_left1">Pincode</div>
                                    <div class="large_big">
                                        <input name="pincoderesidence" type="text" id="pincoderesidence" maxlength="6" class="numeric form-control" autocomplete="off" onkeypress="return isNumber(event)" runat="server">
                                    </div>
                                </div>
                                <div class="add_row">
                                    <div class="row_left1">Country</div>
                                    <div class="large_big">
                                        <input name="input" type="text" id="residence_country" value="INDIA" style="background: rgb(241,241,241)" disabled="disabled" runat="server" class="form-control">
                                    </div>
                                </div>
                            </div>

                            <div class="section_inner_left">
                                <h1><span class="ofcadrswid">Office Address<span style="font-size: 12px" id="opttext"> (Optional)</span> <span class="mandatory" id="mand" style="display: none">*</span></span> <span class="tooltip tooltipstered">
                                    <img src="images/help_icon.png" width="19" height="19" id="ofctoolt"></span></h1>
                                <div class="add_row">
                                    <div class="row_left1">Name of Office</div>
                                    <div class="large_big">
                                        <div class="textfieldread">
                                            <input name="input" type="text" id="nameofofc" autocomplete="off" maxlength="25" runat="server" class="form-control">
                                        </div>
                                    </div>
                                </div>
                                <div class="add_row">
                                    <div class="row_left1">Flat/Room/Door/Block No.</div>
                                    <div class="large_big">
                                        <div class="textfieldread">
                                            <input name="input" type="text" id="floorrommno" autocomplete="off" maxlength="25" runat="server" class="form-control">
                                        </div>
                                    </div>
                                </div>
                                <div class="add_row">
                                    <div class="row_left1 ">Name of Premises/Building/Village</div>
                                    <div class="large_big">
                                        <div class="textfieldread">
                                            <input name="input" type="text" id="nameofpremis" autocomplete="off" maxlength="25" runat="server" class="form-control">
                                        </div>
                                    </div>
                                </div>
                                <div class="add_row">
                                    <div class="row_left1">Road/Street/Lane/Post Office</div>
                                    <div class="large_big">
                                        <div class="textfieldread">
                                            <input name="input" type="text" id="roadstreet" autocomplete="off" maxlength="25" runat="server" class="form-control">
                                        </div>
                                    </div>
                                </div>
                                <div class="add_row">
                                    <div class="row_left1">Area/Locality/Taluka/Sub-Division</div>
                                    <div class="large_big">
                                        <div class="textfieldread">
                                            <input name="input" type="text" id="arealocaldiv" autocomplete="off" maxlength="25" runat="server" class="form-control" />
                                        </div>
                                    </div>
                                </div>
                                <div class="add_row">
                                    <div class="row_left1">State/Union Territory</div>
                                    <div class="large_big">
                                        <div class="textfieldread">
                                            <select name="stateunion" id="stateunion" onchange="getdistrict1('districtcodedisplay1',this.value);stateunionchange()" onkeyup="getdistrict1('districtcodedisplay1',this.value);" style="width: 203px; color: #C7C7C7" runat="server" class="form-control">
                                                <option value="">Select</option>
                                                <option value="3">ANDAMAN &amp; NICOBAR ISLANDS</option>
                                                <option value="4">ANDHRA PRADESH</option>
                                                <option value="5">ARUNACHAL PRADESH</option>
                                                <option value="6">ASSAM</option>
                                                <option value="7">BIHAR</option>
                                                <option value="8">CHANDIGARH</option>
                                                <option value="36">CHHATTISGARH</option>
                                                <option value="10">DADRA &amp; NAGAR HAVELI</option>
                                                <option value="9">DAMAN &amp; DIU</option>
                                                <option value="26">DELHI</option>
                                                <option value="11">GOA</option>
                                                <option value="12">GUJARAT</option>
                                                <option value="13">HARYANA</option>
                                                <option value="14">HIMACHAL PRADESH</option>
                                                <option value="15">JAMMU &amp; KASHMIR</option>
                                                <option value="16">JHARKHAND</option>
                                                <option value="17">KARNATAKA</option>
                                                <option value="18">KERALA</option>
                                                <option value="19">LAKSHADWEEP</option>
                                                <option value="24">MADHYA PRADESH</option>
                                                <option value="20">MAHARASHTRA</option>
                                                <option value="21">MANIPUR</option>
                                                <option value="22">MEGHALAYA</option>
                                                <option value="23">MIZORAM</option>
                                                <option value="25">NAGALAND</option>
                                                <option value="27">ORISSA</option>
                                                <option value="28">PONDICHERRY</option>
                                                <option value="29">PUNJAB</option>
                                                <option value="30">RAJASTHAN</option>
                                                <option value="31">SIKKIM</option>
                                                <option value="32">TAMIL NADU</option>
                                                <option value="33">TRIPURA</option>
                                                <option value="34">UTTAR PRADESH</option>
                                                <option value="35">UTTARAKHAND</option>
                                                <option value="37">WEST BENGAL</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="add_row">
                                    <div class="row_left1">Town/City/District</div>
                                    <div class="large_big">
                                        <div id="districtcodedisplay1">
                                            <div class="textfieldread">

                                                <input name="towncity" type="text" id="towncity" runat="server" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="add_row">
                                    <div class="row_left1">Pincode</div>
                                    <div class="large_big">
                                        <div class="textfieldread">
                                            <input name="input" type="text" id="pincodezipcode" class="numeric form-control" maxlength="6" autocomplete="off" onkeypress="return isNumber(event)" runat="server">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>--%>
                <%-- <div class="tab1_div tab1_sub"><span class="tab-numbering">5</span>ADDRESS INFORMATION</div>
                <div class="section_div field_top tabbordadrs">
                    <div class="section_inner_left" style="padding-left: 10px; margin-bottom: 10px;">
                        <h1>Residence Address <span class="mandatory">*</span><span class="tooltip tooltipstered">
                            <img src="images/help_icon.png" width="19" height="19"></span></h1>
                        <div class="add_row">
                            <div class="row_left1">Flat/Room/Door/Block No.</div>
                            <div class="large_big">
                                <input name="input" type="text" id="flatroomnoresidence" autocomplete="off" maxlength="25" runat="server" class="form-control">
                            </div>
                        </div>
                        <div class="add_row">
                            <div class="row_left1">Name of Premises/Building/Village</div>
                            <div class="large_big">
                                <input name="input" type="text" id="premiseresidence" autocomplete="off" maxlength="25" runat="server" class="form-control">
                            </div>
                        </div>
                        <div class="add_row">
                            <div class="row_left1">Road/Street/Lane/Post Office</div>
                            <div class="large_big">
                                <input name="input" type="text" id="roadstreetresidence" autocomplete="off" maxlength="25" runat="server" class="form-control">
                            </div>
                        </div>
                        <div class="add_row">
                            <div class="row_left1">Area/Locality/Taluka/Sub-Division</div>
                            <div class="large_big">
                                <input name="input" type="text" id="arealocalityresidence" autocomplete="off" maxlength="25" runat="server" class="form-control">
                            </div>
                        </div>
                        <div class="add_row">
                            <div class="row_left1">State/Union Territory</div>
                            <div class="large_big">
                                <select name="searchstate" id="searchstate" onchange="getdistrict('districtcodedisplay',this.value);searchstatechange()" onkeyup="getdistrict('districtcodedisplay',this.value);" style="width: 203px; color: #C7C7C7" runat="server" class="form-control">
                                    <option value="">Select</option>
                                    <option value="3">ANDAMAN &amp; NICOBAR ISLANDS</option>
                                    <option value="4">ANDHRA PRADESH</option>
                                    <option value="5">ARUNACHAL PRADESH</option>
                                    <option value="6">ASSAM</option>
                                    <option value="7">BIHAR</option>
                                    <option value="8">CHANDIGARH</option>
                                    <option value="36">CHHATTISGARH</option>
                                    <option value="10">DADRA &amp; NAGAR HAVELI</option>
                                    <option value="9">DAMAN &amp; DIU</option>
                                    <option value="26">DELHI</option>
                                    <option value="11">GOA</option>
                                    <option value="12">GUJARAT</option>
                                    <option value="13">HARYANA</option>
                                    <option value="14">HIMACHAL PRADESH</option>
                                    <option value="15">JAMMU &amp; KASHMIR</option>
                                    <option value="16">JHARKHAND</option>
                                    <option value="17">KARNATAKA</option>
                                    <option value="18">KERALA</option>
                                    <option value="19">LAKSHADWEEP</option>
                                    <option value="24">MADHYA PRADESH</option>
                                    <option value="20">MAHARASHTRA</option>
                                    <option value="21">MANIPUR</option>
                                    <option value="22">MEGHALAYA</option>
                                    <option value="23">MIZORAM</option>
                                    <option value="25">NAGALAND</option>
                                    <option value="27">ORISSA</option>
                                    <option value="28">PONDICHERRY</option>
                                    <option value="29">PUNJAB</option>
                                    <option value="30">RAJASTHAN</option>
                                    <option value="31">SIKKIM</option>
                                    <option value="32">TAMIL NADU</option>
                                    <option value="33">TRIPURA</option>
                                    <option value="34">UTTAR PRADESH</option>
                                    <option value="35">UTTARAKHAND</option>
                                    <option value="37">WEST BENGAL</option>
                                </select>
                            </div>
                        </div>
                        <div class="add_row">
                            <div class="row_left1">Town/City/District</div>
                            <div class="large_big">
                                <div id="districtcodedisplay">
                                    <input name="district" type="text" id="district" runat="server" class="form-control">
                                 
                                </div>
                            </div>
                        </div>
                        <div class="add_row">
                            <div class="row_left1">Pincode</div>
                            <div class="large_big">
                                <input name="pincoderesidence" type="text" id="pincoderesidence" maxlength="6" class="numeric form-control" autocomplete="off" onkeypress="return isNumber(event)" runat="server">
                            </div>
                        </div>
                        <div class="add_row">
                            <div class="row_left1">Country</div>
                            <div class="large_big">
                                <input name="input" type="text" id="residence_country" value="INDIA" style="background: rgb(241,241,241)" disabled="disabled" runat="server" class="form-control">
                            </div>
                        </div>
                    </div>
                    <div class="section_inner_left" style="margin-bottom: 10px;">
                        <h1><span class="ofcadrswid">Office Address<span style="font-size: 12px" id="opttext"> (Optional)</span> <span class="mandatory" id="mand" style="display: none">*</span></span> <span class="tooltip tooltipstered">
                            <img src="images/help_icon.png" width="19" height="19" id="ofctoolt"></span></h1>
                        <div class="add_row">
                            <div class="row_left1">Name of Office</div>
                            <div class="large_big">
                                <div class="textfieldread">
                                    <input name="input" type="text" id="nameofofc" autocomplete="off" maxlength="25" runat="server" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="add_row">
                            <div class="row_left1">Flat/Room/Door/Block No.</div>
                            <div class="large_big">
                                <div class="textfieldread">
                                    <input name="input" type="text" id="floorrommno" autocomplete="off" maxlength="25" runat="server" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="add_row">
                            <div class="row_left1 ">Name of Premises/Building/Village</div>
                            <div class="large_big">
                                <div class="textfieldread">
                                    <input name="input" type="text" id="nameofpremis" autocomplete="off" maxlength="25" runat="server" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="add_row">
                            <div class="row_left1">Road/Street/Lane/Post Office</div>
                            <div class="large_big">
                                <div class="textfieldread">
                                    <input name="input" type="text" id="roadstreet" autocomplete="off" maxlength="25" runat="server" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="add_row">
                            <div class="row_left1">Area/Locality/Taluka/Sub-Division</div>
                            <div class="large_big">
                                <div class="textfieldread">
                                    <input name="input" type="text" id="arealocaldiv" autocomplete="off" maxlength="25" runat="server" class="form-control" />
                                </div>
                            </div>
                        </div>
                        <div class="add_row">
                            <div class="row_left1">State/Union Territory</div>
                            <div class="large_big">
                                <div class="textfieldread">
                                    <select name="stateunion" id="stateunion" onchange="getdistrict1('districtcodedisplay1',this.value);stateunionchange()" onkeyup="getdistrict1('districtcodedisplay1',this.value);" style="width: 203px; color: #C7C7C7" runat="server" class="form-control">
                                        <option value="">Select</option>
                                        <option value="3">ANDAMAN &amp; NICOBAR ISLANDS</option>
                                        <option value="4">ANDHRA PRADESH</option>
                                        <option value="5">ARUNACHAL PRADESH</option>
                                        <option value="6">ASSAM</option>
                                        <option value="7">BIHAR</option>
                                        <option value="8">CHANDIGARH</option>
                                        <option value="36">CHHATTISGARH</option>
                                        <option value="10">DADRA &amp; NAGAR HAVELI</option>
                                        <option value="9">DAMAN &amp; DIU</option>
                                        <option value="26">DELHI</option>
                                        <option value="11">GOA</option>
                                        <option value="12">GUJARAT</option>
                                        <option value="13">HARYANA</option>
                                        <option value="14">HIMACHAL PRADESH</option>
                                        <option value="15">JAMMU &amp; KASHMIR</option>
                                        <option value="16">JHARKHAND</option>
                                        <option value="17">KARNATAKA</option>
                                        <option value="18">KERALA</option>
                                        <option value="19">LAKSHADWEEP</option>
                                        <option value="24">MADHYA PRADESH</option>
                                        <option value="20">MAHARASHTRA</option>
                                        <option value="21">MANIPUR</option>
                                        <option value="22">MEGHALAYA</option>
                                        <option value="23">MIZORAM</option>
                                        <option value="25">NAGALAND</option>
                                        <option value="27">ORISSA</option>
                                        <option value="28">PONDICHERRY</option>
                                        <option value="29">PUNJAB</option>
                                        <option value="30">RAJASTHAN</option>
                                        <option value="31">SIKKIM</option>
                                        <option value="32">TAMIL NADU</option>
                                        <option value="33">TRIPURA</option>
                                        <option value="34">UTTAR PRADESH</option>
                                        <option value="35">UTTARAKHAND</option>
                                        <option value="37">WEST BENGAL</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="add_row">
                            <div class="row_left1">Town/City/District</div>
                            <div class="large_big">
                                <div id="districtcodedisplay1">
                                    <div class="textfieldread">
                                        
                                        <input name="towncity" type="text" id="towncity" runat="server" class="form-control">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="add_row">
                            <div class="row_left1">Pincode</div>
                            <div class="large_big">
                                <div class="textfieldread">
                                    <input name="input" type="text" id="pincodezipcode" class="numeric form-control" maxlength="6" autocomplete="off" onkeypress="return isNumber(event)" runat="server">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>--%>
                <div class="col-md-12" runat="server" id="divRA">

                    <%--<fieldset style="background-color: #FFFFFF">--%>
                    <div class="panel panel-primary">
                        <%--<legend>REPRESENTATIVE ASSESSEE (RA)</legend>--%>
                        <div class="panel panel-heading">
                            REPRESENTATIVE ASSESSEE (RA)
                        </div>

                        <div class="panel-body" runat="server">
                            <input type="checkbox" name="chkincomess1" id="chkincomess1" value="1" onclick="showra()" style="margin-top: 3px;" runat="server">
                            <label for="chkincomess1">Representative Assessee is applicable</label>
                            <table class="table BorderLess" id="radiv" runat="server" style="display: none">
                                <tbody>
                                    <tr>

                                        <td>Title<span class="mandatory" id="repmand2" style="display: none">*</span></td>
                                        <td>
                                            <input type="radio" name="rstitle" value="Shri" id="shri1" runat="server">
                                            <label for="shri1" style="cursor: pointer">Shri</label></td>


                                        <td>
                                            <input type="radio" name="rstitle" value="Smt." id="shri2" runat="server">
                                            <label for="shri2">Smt</label></td>


                                        <td>
                                            <input type="radio" name="rstitle" value="Kumari" id="shri3" runat="server">
                                            <label for="shri3">Kumari</label></td>
                                    </tr>
                                    <tr>
                                        <td>Name <span class="mandatory" id="repmand1" style="display: none">*</span>
                                        </td>

                                        <td>
                                            <input name="rafirstname" id="rafirstname" placeholder="First Name" type="text" class="txtup form-control" onchange="upperMe('rafirstname')" autocomplete="off" onkeypress="return lettersOnly(event)" onblur="initialvalidation('rafirstname');" maxlength="25" runat="server"></td>


                                        <td>
                                            <input name="ramiddlename" id="ramiddlename" placeholder="Middle Name" type="text" class="txtup form-control" onchange="upperMe('ramiddlename')" autocomplete="off" onkeypress="return lettersOnly(event)" onblur="initialvalidation('ramiddlename');" maxlength="25" runat="server"></td>


                                        <td>
                                            <input name="ralastname" id="ralastname" placeholder="Last Name" type="text" class="txtup form-control" onchange="upperMe('ralastname')" autocomplete="off" style="text-transform: uppercase" onkeypress="return lettersOnly(event)" onblur="initialvalidation('ralastname');" maxlength="25" runat="server"></td>
                                    </tr>


                                    <tr>
                                        <td style="width: 240px;">Flat/Room/Door/Block No.<span class="mandatory" id="repmand3" style="display: none">*</span></td>
                                        <td>
                                            <input name="input" type="text" id="ra_flatroom" autocomplete="off" maxlength="25" runat="server" class="form-control">
                                        </td>
                                        <td style="width: 240px;">Name of Premises/Building/Village<span class="mandatory" id="repmand4" style="display: none">*</span></td>
                                        <td>

                                            <input name="input" type="text" id="ra_premise" autocomplete="off" maxlength="25" runat="server" class="form-control">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Road/Street/Lane/Post Office<span class="mandatory" id="repmand5" style="display: none">*</span></td>
                                        <td>
                                            <input name="input" type="text" id="ra_roadstreet" autocomplete="off" maxlength="25" runat="server" class="form-control">
                                        </td>
                                        <td>Area/Locality/Taluka/Sub-Division<span class="mandatory" id="repmand6" style="display: none">*</span></td>
                                        <td>
                                            <input name="input" type="text" id="ra_area" autocomplete="off" maxlength="25" runat="server" class="form-control">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>State/Union Territory<span class="mandatory" id="repmand7" style="display: none">*</span></td>
                                        <td>

                                            <select name="stateunion1" id="stateunion1" onchange="getdistrict2('districtcodedisplay2',this.value);stateunion1change()" onkeyup="getdistrict2('districtcodedisplay2',this.value);" style="color: #CCC" runat="server" class="form-control">
                                                <option value="">Select</option>
                                                <option value="3">ANDAMAN &amp; NICOBAR ISLANDS</option>
                                                <option value="4">ANDHRA PRADESH</option>
                                                <option value="5">ARUNACHAL PRADESH</option>
                                                <option value="6">ASSAM</option>
                                                <option value="7">BIHAR</option>
                                                <option value="8">CHANDIGARH</option>
                                                <option value="36">CHHATTISGARH</option>
                                                <option value="10">DADRA &amp; NAGAR HAVELI</option>
                                                <option value="9">DAMAN &amp; DIU</option>
                                                <option value="26">DELHI</option>
                                                <option value="11">GOA</option>
                                                <option value="12">GUJARAT</option>
                                                <option value="13">HARYANA</option>
                                                <option value="14">HIMACHAL PRADESH</option>
                                                <option value="15">JAMMU &amp; KASHMIR</option>
                                                <option value="16">JHARKHAND</option>
                                                <option value="17">KARNATAKA</option>
                                                <option value="18">KERALA</option>
                                                <option value="19">LAKSHADWEEP</option>
                                                <option value="24">MADHYA PRADESH</option>
                                                <option value="20">MAHARASHTRA</option>
                                                <option value="21">MANIPUR</option>
                                                <option value="22">MEGHALAYA</option>
                                                <option value="23">MIZORAM</option>
                                                <option value="25">NAGALAND</option>
                                                <option value="27">ORISSA</option>
                                                <option value="28">PONDICHERRY</option>
                                                <option value="29">PUNJAB</option>
                                                <option value="30">RAJASTHAN</option>
                                                <option value="31">SIKKIM</option>
                                                <option value="32">TAMIL NADU</option>
                                                <option value="33">TRIPURA</option>
                                                <option value="34">UTTAR PRADESH</option>
                                                <option value="35">UTTARAKHAND</option>
                                                <option value="37">WEST BENGAL</option>
                                            </select>

                                        </td>
                                        <td>Town/City/District<span class="mandatory" id="repmand8" style="display: none">*</span></td>
                                        <td>


                                            <input name="input" type="text" id="towncity2" runat="server" class="form-control">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Pincode<span class="mandatory" id="repmand9" style="display: none">*</span></td>
                                        <td>
                                            <input name="input" type="text" id="ra_pinzip" class="numeric form-control" maxlength="6" autocomplete="off" onkeypress="return isNumber(event)" runat="server">
                                        </td>
                                        <td>Country</td>
                                        <td>

                                            <input name="input" type="text" id="ra_country" value="INDIA" disabled="disabled" style="background-color: #F1F1F1" autocomplete="off" runat="server" class="form-control">
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <%--</fieldset>--%>
                </div>
                <div class="col-md-12">
                    <div class="panel panel-primary" id="declaration" runat="server">
                        <div class="panel panel-heading">DECLARATION</div>
                        <div class="panel panel-body" style="width: 97%; margin-bottom: 10px;" id="divDEclarationPaN" runat="server">

                            <p>I have enclosed <span id="blankline" style="text-decoration: underline;">________________________ </span><span id="prfid" style="text-decoration: underline; display: none;"></span>as proof of identity, <span id="blankline1" style="text-decoration: underline;">________________________</span> <span id="prfid1" style="text-decoration: underline; display: none;"></span>as proof of address and <span id="blankline2" style="text-decoration: underline;">________________________</span><span id="prfid3" style="text-decoration: underline; display: none;"></span> as proof of date of birth.</p>
                            <br>
                            I <span id="namepapplicantblank" style="text-decoration: underline;">________________________</span><span id="namepapplicant" style="text-decoration: underline; display: none;"></span>, the applicant, in the capacity of  do hereby declare that what is stated above is true to the best of my information and belief.
              <p></p>
                        </div>
                        <div class="panel panel-body" style="width: 97%; margin-bottom: 10px;" id="divDeclarationTan" runat="server" visible="false">

                            <p>
                                I/We,<span id="Span1" style="text-decoration: underline;">________________________ </span>in my/our capacity as <span id="Span3" style="text-decoration: underline;">________________________</span>   do hereby declare that what is stated above is true to the best of my/our knowledge and belief.
                            <br>
                                <p></p>
                        </div>
                        <div style="padding-left: 14px; padding-top: 5px;">
                            <table>
                                <tr>
                                    <td>Date: </td>
                                    <td id="date" runat="server"></td>
                                </tr>
                            </table>
                        </div>

                        <div style="width: 230px; float: right; margin-top: -20px;">
                            <table>
                                <tr>
                                    <td>City of residence: </td>
                                    <td id="city" runat="server"></td>
                                </tr>
                            </table>
                        </div>
                    </div>

                </div>
                <div>
                    <asp:Button ID="btnsubmit" runat="server" Text="Submit" class="buy" Style="cursor: pointer; display: none" OnClick="btnsubmit_Click" />
                    <div class="col-md-6">
                    </div>
                    <div class="col-md-6">
                        <a class="btn btn-success" onclick="return Validate()" style="cursor: pointer; margin-left: 330px" id="Submit" runat="server">Submit</a>
                        <%--<a class="btn btn-primary" onclick="resetvalues()" style="cursor: pointer;margin-left: 330px" id="Reset" runat="server" >Reset</a>--%>
                    </div>

                    <div>
                        <asp:Label ID="lblMesage" runat="server" ForeColor="Green" Font-Italic="true" />
                    </div>
                </div>

            </div>
        </div>
    </div>
    <div class="row" runat="server" visible="false" id="divSummary">
        <div class="col-md-6 col-md-offset-3">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    PAN  Details
                </div>
                <div class="panel-body">
                    <h4>Data successfully saved with following details!</h4>
                    <table class="table table-bordered">
                        <tr>
                            <td>
                                <label for="Name">Name</label></td>
                            <td>
                                <asp:Label ID="Name" runat="server" /></td>
                        </tr>
                        <tr>
                            <td>
                                <label for="Mobile">Mobile</label></td>
                            <td>
                                <asp:Label ID="Mobile" runat="server" /></td>
                        </tr>
                        <tr>
                            <td>
                                <label for="Email">Email</label></td>
                            <td>
                                <asp:Label ID="Email" runat="server" /></td>
                        </tr>
                        <tr>
                            <td>
                                <label for="Amount">Amount</label></td>
                            <td>
                                <asp:Label ID="Amount" runat="server" /></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <asp:Button ID="btnPay" runat="server" Text="Pay Now" OnClick="btnPay_Click" CssClass="btn btn-success" />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>


    </div>
    </div>
    </div>
    <div class="row" runat="server" visible="false">
        <uc1:PayUMoneycontrol runat="server" ID="PayUMoneycontrol" />
        <div class="col-md-8 ">
            <asp:Label ID="lblMessage" runat="server" Text="" Style="text-align: center" ForeColor="Green" Font-Size="Medium" />
        </div>
        <div class="col-md-4">
        </div>
    </div>
    <label id="lblId" runat="server" style="display: none"></label>
    <%--<div class="row" runat="server" visible="false">
        <div class="col-md-8">
            <asp:Button ID="btnPay" runat="server" Text="Pay Now" OnClick="btnPay_Click" />
        </div>
        <div class="col-md-4">
        </div>
    </div>--%>
    <%--<tbody>
                            <tr>
                                <td class="fonttable pad_top">
                                    <input type="checkbox" name="chksalary" id="chkincome" value="6" onclick="enableincchk()"></td>
                                <td class="fonttable pad_top category_pad">
                                    <label for="chkincome">No Income</label></td>
                                <td colspan="2" class="fonttable pad_top category_pad" style="padding-top: 2px; padding-left: 7px;">
                                    <select name="annualincome" id="annualincome" class="fonttable" style="width: 140px; color: rgb(204, 204, 204);" onchange="annualincomechange()" disabled="disabled" runat="server">
                                        <option value="">ANNUAL INCOME</option>
                                        <option value="2">Less Than 3,00,000</option>
                                        <option value="3">Between 3,00,001 to 5,00,000</option>
                                        <option value="4">Between 5,00,001 to 8,00,000</option>
                                        <option value="5">Greater than 8,00,000</option>
                                    </select></td>
                            </tr>
                            <tr>
                                <td class="fonttable pad_top">
                                    <input type="checkbox" name="chksalary" id="chksalary1" value="1" onclick="enableincome()"></td>
                                <td class="fonttable pad_top category_pad">
                                    <label for="chksalary1">Salary</label></td>
                                <td class="fonttable pad_top" style="padding-left: 7px;">
                                    <input type="checkbox" name="chksalary" id="chksalary2" value="3" onclick="enableincome()"></td>
                                <td class="fonttable pad_top category_pad">
                                    <label for="chksalary2">House Property</label></td>
                            </tr>
                            <tr>
                                <td class="fonttable pad_top">
                                    <input type="checkbox" name="chksalary" id="chksalary3" value="2" onclick="showbusinesstypesel(); enableincome()"></td>
                                <td class="fonttable pad_top category_pad">
                                    <label for="chksalary3">Business/Profession </label>
                                </td>
                                <td colspan="2" class="fonttable pad_top category_pad" style="padding-top: 2px; padding-left: 7px;">
                                    <select name="businesscode" id="businesscode" onchange="businesscodechange()" style="width: 140px; float: left; color: #C7C7C7" disabled="disabled" runat="server">
                                        <option value="">BUSINESS TYPE</option>
                                        <option value="1">Medical Profession and Business</option>
                                        <option value="2">Engineering</option>
                                        <option value="3">Architecture</option>
                                        <option value="4">Chartered Accountant / Accountancy</option>
                                        <option value="5">Interior Decoration</option>
                                        <option value="6">Technical Consultancy</option>
                                        <option value="7">Company Secretary</option>
                                        <option value="8">Legal Practitioner and Solicitors</option>
                                        <option value="9">Government Contractors</option>
                                        <option value="10">Insurance Agency</option>
                                        <option value="11">Films, TV and Such other Entertainment</option>
                                        <option value="12">Information technology</option>
                                        <option value="13">Builders and developers</option>
                                        <option value="14">Members of Stock Exchange, Share Brokers and Sub- Brokers</option>
                                        <option value="15">Performing Arts and Yatra</option>
                                        <option value="16">Operation of Ships, Hovercrafts, Aircrafts  or  Helicopters</option>
                                        <option value="17">Plying Taxies, Lorries, Trucks, Buses or other commercial vehicles</option>
                                        <option value="18">Ownership of Horses or Jockeys</option>
                                        <option value="19">Cinema Halls and other theatres</option>
                                        <option value="20">Others</option>
                                    </select></td>
                            </tr>
                            <tr>
                                <td class="fonttable pad_top">
                                    <input type="checkbox" name="chksalary" id="chksalary4" value="4" onclick="enableincome()"></td>
                                <td class="fonttable pad_top category_pad">
                                    <label for="chksalary4">Capital Gains</label></td>
                                <td class="fonttable pad_top" style="padding-left: 7px;">
                                    <input type="checkbox" name="chksalary" id="chksalary5" value="5" onclick="enableincome()"></td>
                                <td class="fonttable pad_top category_pad">
                                    <label for="chksalary5">Other Sources</label></td>
                            </tr>
                        </tbody>--%>
</asp:Content>

