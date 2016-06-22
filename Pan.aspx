<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="Pan.aspx.cs" Inherits="Pan" Async="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script>
        $(document).ready(function () {
            ShowHide();
            $("#ddSelect").change(function () {
                ShowHide();
            });
            function ShowHide() {
                if ($("#ddSelect").val() == 'A') {
                    $("#trName").hide(); $("#trAck").show(); $("#trDOB").hide();

                }
                if ($("#ddSelect").val() == 'N') {
                    $("#trDOB").show(); $("#trName").show(); $("#trAck").hide();
                }
            }
        });
    </script>
    <style>
        b {
            font-size: small;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row-fluid text-justify">
        <div class="col-md-8 col-md-offset-2" id="divAbouPan" runat="server" visible="false">
            <b>WHAT IS PAN?</b>
            <p>Permanent Account Number (PAN) is a ten-digit alphanumeric number, issued in the form of a laminated card, by the Income Tax Department, to any "person" who applies for it or to whom the department allots the number without an application.</p>
            <p>PAN enables the department to link all transactions of the "person" with the department. These transactions include tax payments, TDS/TCS credits, returns of income/wealth/gift/FBT, specified transactions, correspondence, and so on. PAN, thus, acts as an identifier for the "person" with the tax department.</p>
            <p>PAN was introduced to facilitates linking of various documents, including payment of taxes, assessment, tax demand, tax arrears etc. relating to an assessee, to facilitate easy retrieval of information and to facilitate matching of information relating to investment, raising of loans and other business activities of taxpayers collected through various sources, both internal as well as external, for detecting and combating tax evasion and widening of tax base.</p>
            <p>A typical PAN is AFZPK7190K.</p>
            <p>
                First three characters i.e. "AFZ" in the above PAN are alphabetic series running from AAA to ZZZ<p>
                    <p>Fourth character of PAN i.e. "P" in the above PAN represents the status of the PAN holder. "P" stands for Individual, "F" stands for Firm, "C" stands for Company, "H" stands for HUF, "A" stands for AOP, "T" stands for TRUST etc.</p>
                    <p>Fifth character i.e. "K" in the above PAN represents first character of the PAN holder's last name/surname.</p>
                    <p>Next four characters i.e. "7190" in the above PAN are sequential number running from 0001 to 9999.</p>
                </p>
                Last character i.e. "K" in the above PAN is an alphabetic check digit.
            </p>
            <b>WHY IS IT NECESSARY TO HAVE PAN?</b>
            <p>It is mandatory to quote PAN on return of income, all correspondence with any income tax authority. From 1 January 2005 it has become mandatory to quote PAN on challans for any payments due to Income Tax Department.</p>
            <p>It is also compulsory to quote PAN in all documents pertaining to the following financial transactions :-</p>
            <ol>
                <li>sale or purchase of any immovable property valued at five lakh rupees or more;
                </li>
                <li>sale or purchase of a motor vehicle or vehicle, [the sale or purchase of a motor vehicle or vehicle does not include two wheeled vehicles, inclusive of any detachable side-car having an extra wheel, attached to the motor vehicle;]
                </li>
                <li>a time deposit, exceeding fifty thousand rupees, with a banking company ;
                </li>
                <li>a deposit, exceeding fifty thousand rupees, in any account with Post Office Savings Bank;</li>
                <li>a contract of a value exceeding one lakh rupees for sale or purchase of securities;</li>
                <li>opening a bank account;</li>
                <li>making an application for installation of a telephone connection (including a cellular telephone connection);</li>
                <li>payment to hotels and restaurants against their bills for an amount exceeding twenty-five thousand rupees at any one time ;</li>
                <li>payment in cash for purchase of bank drafts or pay orders or banker's cheques for an amount aggregating fifty thousand rupees or more during any one day;</li>
                <li>deposit in cash aggregating fifty thousand rupees or more with a bank during any one day;</li>
                <li>payment in cash in connection with travel to any foreign country of an amount exceeding twenty-five thousand rupees at any one time.</li>
                <li>making an application for issue of credit card or debit card.</li>
                <li>payment of an amount of fifty thousand rupees or more to a Mutual Fund for purchase of its units;</li>
                <li>payment of an amount of fifty thousand rupees or more to a company for acquiring shares issued by it;</li>
                <li>payment of an amount of fifty thousand rupees or more to a company or an institution for acquiring debentures or bonds issued by it;</li>
                <li>payment of an amount of fifty thousand rupees or more to the Reserve Bank of India</li>
                <li>payment of an amount aggregating fifty thousand rupees or more in a year as life insurance premium to an insurer</li>
                <li>payment to a dealer,—
    <ol style="list-style-type: upper-roman;">
        <li>(i) of an amount of five lakh rupees or more at any one time; or </li>
        <li>(ii) against, a bill for an amount of five lakh rupees or more, for purchase of bullion or jewellery</li>
    </ol>
                </li>
            </ol>
            <b>PAN – LEGAL FRAMEWORK</b>
            <p>
                The legal authority for allotment and use of the new series of PAN is derived from Section 139A of the Income-tax Act, 1961. This section lays down the framework for PAN, e.g, who is required to apply for PAN, who else can apply for PAN, who will allot PAN, transactions where PAN is required to be quoted, use of PAN in TDS certificates and TDS returns, that one person can have only one PAN and the manner of applying for PAN.
                The manner of applying for PAN is laid down in Rule 114 of the Income-tax Rules, 1962. This rule, amended in 2011, also specifies the copies of documents required to be submitted along with the PAN application (in form 49A or 49AA, as the case may be) as proof of identity and address of the PAN applicant.
            </p>
        </div>
        <iframe id="frme" src="" style="border: solid #dbdbdb 1px; width: 100%;" runat="server" visible="true"></iframe>
        <div class="col-md-12" id="divPanStatus" runat="server" visible="false">
            <div class="panel panel-primary">
                <div class="panel-heading" id="pnlHeading" runat="server"></div>
                <div class="panel panel-body">
                    <table class="table BorderLess">
                        <%--<tr>
                            <td colspan="3" width="50%">
                                <b>Please select type of application:</b>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><b>Application Type</b></td>
                            <td colspan="2">
                                <select name="ST_SEARCH_TYPE" onchange="searchType();" class="form-control">
                                    <option value="">-- Select -- </option>
                                    <option value="P">PAN -  New / Change Request </option>
                                    <option value="T">TAN - New / Change Request </option>
                                </select></td>
                        </tr>--%>
                        <tr id="trSearch" runat="server">
                            <td><b>Search By </b></td>
                            <td>
                                <select name="ST_SEARCH_TYPE" onchange="searchType();" class="form-control" id="ddSelect" runat="server">
                                    <option value="">-- Select -- </option>
                                    <option value="A">ACKNOWLEDGEMENT NUMBER</option>
                                    <option value="N">Name</option>
                                </select>
                                <asp:Label ID="lblAck" runat="server" Text="ACKNOWLEDGEMENT NUMBER" Visible="false"/>
                            </td>
                        </tr>
                        <tr id="trAck">

                            <td>
                                <b>ACKNOWLEDGEMENT NUMBER</b>
                            </td>
                            <td>
                                <input type="text" name="ST_ACK_NUM" id="txtAcknowledge" value="" length="40" maxlength="15" class="form-control" runat="server" />
                            </td>
                        </tr>
                        <tr id="trName" runat="server">

                            <td><b><span style="color: red">*</span>NAME</b></td>

                            <td>
                                <%--<asp:TextBox size="25" name="ST_LST_MN_NM" maxlength="75" class="form-control" placeholder="LASTNAME" disabled="disabled" ID="TextBox1" runat="server" />--%>
                                <input type="text" name="ST_LST_MN_NM" size="25" maxlength="75" class="form-control" placeholder="LASTNAME" id="txtLName" runat="server" /></td>
                            <td>
                                <input type="text" name="ST_FST_MN_NM" size="25" maxlength="25" class="form-control" placeholder="FIRSTNAME" id="txtFName" runat="server" /></td>
                            <td>
                                <input type="text" name="ST_MDL_MN_NM" size="25" maxlength="25" class="form-control" placeholder="MIDDLE NAME" id="txtMName" runat="server" /></td>

                        </tr>
                        <tr id="trDOB" runat="server">

                            <td>
                                <b>Date of Birth</b>
                            </td>

                            <td>
                                <table>
                                    <tr>
                                        <td>
                                            <select name="ST_DT_BRTH_DD" class="form-control" id="ddDD" runat="server">
                                                <option value="">DD
                                                </option>
                                                <option value="01">1
                                                </option>
                                                <option value="02">2
                                                </option>
                                                <option value="03">3
                                                </option>
                                                <option value="04">4
                                                </option>
                                                <option value="05">5
                                                </option>
                                                <option value="06">6
                                                </option>
                                                <option value="07">7
                                                </option>
                                                <option value="08">8
                                                </option>
                                                <option value="09">9
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
                                            </select></td>
                                        <td>
                                            <select name="ST_DT_BRTH_MM" class="form-control" id="ddMM" runat="server">
                                                <option value="">MM
                                                </option>
                                                <option value="01">JAN
                                                </option>
                                                <option value="02">FEB
                                                </option>
                                                <option value="03">MAR
                                                </option>
                                                <option value="04">APR
                                                </option>
                                                <option value="05">MAY
                                                </option>
                                                <option value="06">JUN
                                                </option>
                                                <option value="07">JUL
                                                </option>
                                                <option value="08">AUG
                                                </option>
                                                <option value="09">SEP
                                                </option>
                                                <option value="10">OCT
                                                </option>
                                                <option value="11">NOV
                                                </option>
                                                <option value="12">DEC
                                                </option>
                                            </select></td>
                                        <td>
                                            <input type="text" name="ST_DT_BRTH_YYYY" value="" size="4" maxlength="4" class="form-control" placeholder="YYYY" id="txtYear" runat="server"></td>


                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="5">
                                <i><font color="RED"><b>*</b></font>(Name should be as mentioned in the application form. Applicants other than 'Individuals' should write their name in the field for Last Name/Surname only)</i>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                        </tr>
                         <tr>
                            <td align="CENTER" colspan="5">

                                <asp:Label ID="lblError" runat="server" />

                            </td>
                        </tr>
                        <tr>
                            <td align="CENTER" colspan="3">

                                <asp:Button ID="btnSumbit" runat="server" Text="Submit" maxlength="10" class="btn btn-primary" OnClick="btnSumbit_Click" />

                            </td>
                        </tr>
                       



                    </table>
                </div>
            </div>
        </div>
    </div>

</asp:Content>


