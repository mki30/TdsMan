<%@ Page Title="DSC Registration" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="DscApplicationForm.aspx.cs" Inherits="DscApplicationForm" ClientIDMode="Static" EnableEventValidation="false" %>

<%@ Register Src="~/Controls/PaymentControl.ascx" TagPrefix="uc1" TagName="PaymentControl" %>
<%@ Register Src="~/Controls/NotesControl.ascx" TagPrefix="uc1" TagName="NotesControl" %>
<%@ Register Src="~/Controls/StageControl.ascx" TagPrefix="uc1" TagName="StageControl" %>
<%@ Register Src="~/Controls/EmailControl.ascx" TagPrefix="uc1" TagName="EmailControl" %>
<%@ Register Src="~/Controls/PayUMoneycontrol.ascx" TagPrefix="uc1" TagName="PayUMoney" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="/js/bootstrap-datepicker.js"></script>
    <link href="/css/datepicker.css" rel="stylesheet" />
    <script src="/js/dsc-application-form.js"></script>
    <style>
        h1 {
            font: normal 35px/48px "Trebuchet MS",Arial,Helvetica,sans-serif;
            color: #414141;
        }

        /*progress {
    background-color: #f3f3f3;
    border: 0;
    height: 18px;
    border-radius: 9px;
}*/
       
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <uc1:EmailControl runat="server" ID="EmailControl" Visible="false" />
    <div id="divPopMsg" runat="server" visible="false">
        <h4 id="h_success" runat="server"></h4>
        <h5>
            <div id="divSuccessMessage" runat="server"></div>
        </h5>
        <br />
        <input id="btnCloseMessage" type="button" value="OK" onclick="closeMsgBox()" />
        <%--<asp:Button ID="btnCloseMessage" runat="server" Text="OK" CssClass="btn btn-primary btn-sm"  OnClick="btnCloseMessage_Click" />--%>
    </div>
    <div class="row" id="divForAdmin" runat="server" visible="false">
        <div class="col-md-10 col-md-offset-1">
            <div class="panel panel-primary">
                <div class="panel-heading">Admin Panel</div>
                <div class="panel-body">
                    <table class="table bordrless">
                        <tr>
                            <td style="width: 50%; vertical-align: top !important;">
                                <table class="table bordrless">
                                    <tr>
                                        <td>Order No</td>
                                        <td>
                                            <asp:Label ID="lblOrderNo" runat="server" Text="" Style="font-weight: bold;"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>Transaction ID</td>
                                        <td>
                                            <asp:Label ID="lblTransactionId" runat="server" Text="" Style="font-weight: bold;"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>Payment Done</td>

                                        <td>
                                            <asp:Label ID="lblPayment" runat="server" Text=""></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>ID Proof</td>
                                        <td>
                                            <asp:Label ID="lblIdProof" runat="server" Text=""></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>Add Proof</td>
                                        <td>
                                            <asp:Label ID="lblAddressProof" runat="server" Text=""></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>Certificate</td>
                                        <td>
                                            <asp:Label ID="lblCertificate" runat="server" Text=""></asp:Label>
                                            <asp:CheckBox ID="chkDownloaded" runat="server" Text="Downloaded" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Stage</td>

                                        <td>
                                            <asp:Label ID="lblStage" runat="server" Text=""></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>Assigned To</td>
                                        <td>
                                            <asp:Label ID="lblAssignTask" runat="server" Text=""></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>Application From</td>
                                        <td>
                                            <asp:Label ID="lblDownloadApplicationForm" runat="server" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <table class="table bordrless">
                                    <tr>
                                        <td colspan="3">
                                            <asp:CheckBox ID="chkComplete" runat="server" Text="Complete" />
                                            <br />
                                            <asp:CheckBox ID="chkDocReceived" runat="server" Text="Document received" />
                                            <asp:Literal ID="ltDocNotRecievd" runat="server"></asp:Literal>
                                            <br />
                                            <asp:CheckBox ID="chkDelete" runat="server" Text="Delete" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Way Bill No:</td>
                                        <td>
                                            <asp:TextBox ID="txtBillNo" runat="server" CssClass="form-control"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Courier Comp:</td>
                                        <td>
                                            <asp:TextBox ID="txtCompany" runat="server" CssClass="form-control"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>
                                            <asp:Literal ID="ltDocCouriered" runat="server"></asp:Literal></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <%--<tr>
                            <td>
                                <asp:Button ID="btnDocNotReceived" runat="server" Text="Doc not received mail" OnClick="btnDocNotReceived_Click" /></td>
                            <td>
                                <asp:Button ID="btnDocCouriered" runat="server" Text="Doc couriered mail" OnClick="btnDocCouriered_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnAutoFillForm" runat="server" Text="Form Autofill" OnClick="btnAutoFillForm_Click" />
                            </td>
                        </tr>--%>
                    </table>
                    <uc1:NotesControl runat="server" ID="NotesControl" />
                    <br />
                    <uc1:StageControl runat="server" ID="StageControl" />
                </div>
            </div>
        </div>
    </div>

    <div class="row" runat="server" id="divMainForm">
        <div class="row-fluid">
            <div class="col-md-1">
            </div>
            <div class="col-md-5">
                <h1 id="heading" runat="server">DSC Application</h1>
            </div>
            <div class="col-md-5">
                <%--    <h4 class="pull-right"><a href="/Forms/class2ind.pdf" id="formDownload" runat="server" target="_blank">Download application form <i class="glyphicon glyphicon-download-alt"></i></a></h4>--%>
            </div>
            <div class="col-md-1">
            </div>
        </div>
        <div class="row-fluid" id="main">
            <div class="col-md-10 col-md-offset-1">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        Certificate Details
                        <label runat="server" id="lblID" style="display: none;">0</label>
                        <label runat="server" id="lblClassType" style="display: none;">2</label>
                        <asp:Label ID="lblErrorMsg" runat="server" Text="" CssClass="label label-danger pull-right"></asp:Label>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <table class="table BorderLess RightAlign">
                                <tbody>

                                    <tr id="userTypeRow" runat="server">
                                        <td>User Type <span class="mandatory">*</span></td>
                                        <td>
                                            <asp:DropDownList ID="ddUserType" runat="server" CssClass="form-control calculatePrice">
                                                <asp:ListItem Value="0" Selected="True">Individual</asp:ListItem>
                                                <asp:ListItem Value="1">Organization</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr id="certfTypeRow" runat="server">
                                        <td>Certificate Type<span class="mandatory">*</span></td>
                                        <td>
                                            <asp:DropDownList ID="ddCertificateType" runat="server" CssClass="form-control calculatePrice">
                                                <asp:ListItem Value="0" Selected="True">Signature</asp:ListItem>
                                                <asp:ListItem Value="1">Encryption</asp:ListItem>
                                                <asp:ListItem Value="2">Both</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Certificate Validity<span class="mandatory">*</span></td>
                                        <td>
                                            <asp:DropDownList ID="ddCertificateValidity" runat="server" CssClass="form-control calculatePrice">
                                                <asp:ListItem Value="0" Selected="True">1 Year</asp:ListItem>
                                                <asp:ListItem Value="1">2 Years</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr id="rowUsbToken" runat="server">
                                        <td>
                                            <div>Need USB Token<span class="mandatory">*</span></div>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddUsbToken" runat="server" CssClass="form-control calculatePrice">
                                                <asp:ListItem Value="0" Selected="True">Yes (Rs.500)</asp:ListItem>
                                                <asp:ListItem Value="1">No</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="col-md-6">
                            <asp:Label ID="lblPriceTable" runat="server" Text=""><img src="Images/progress2.gif" /></asp:Label>
                        </div>
                    </div>
                </div>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        Applicant  Details
                    </div>
                    <table class="table BorderLess RightAlign">
                        <tbody>
                            <tr>
                                <td>Name<span class="mandatory">*</span></td>
                                <td>
                                    <asp:TextBox ID="givenname" placeholder="Name" runat="server" CssClass="form-control"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="surname" runat="server" placeholder="Surname (Optional)" CssClass="form-control"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="initial" runat="server" placeholder="Initial (Optional)" CssClass="form-control"></asp:TextBox>
                                </td>
                            </tr>
                            <tr class="rowOrganization">
                                <td>Organization<span class="mandatory">*</span> </td>
                                <td>
                                    <asp:TextBox ID="orgnames" runat="server" placeholder="Organization Name" CssClass="form-control"></asp:TextBox>

                                </td>
                                <td>Department<span class="mandatory">*</span></td>
                                <td>
                                    <asp:TextBox ID="dptmt" runat="server" placeholder="Department" CssClass="form-control"></asp:TextBox>

                                </td>
                            </tr>
                            <tr class="sub-rows">
                                <td>Gender<span class="mandatory">*</span></td>
                                <td style="text-align: left;">
                                    <asp:DropDownList ID="ddGender" runat="server" RepeatDirection="Horizontal" CssClass="form-control">
                                        <asp:ListItem Value="">Select</asp:ListItem>
                                        <asp:ListItem Value="1">Male</asp:ListItem>
                                        <asp:ListItem Value="2">Female</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>Date Of Birth<span class="mandatory">*</span></td>
                                <td>
                                    <asp:TextBox ID="txtDOB" runat="server" CssClass="form-control"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Address<span class="mandatory">*</span> </td>
                                <td colspan="3">
                                    <asp:TextBox ID="address" TextMode="MultiLine" runat="server" placeholder="Address" CssClass="form-control" AutoCompleteType="None"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>PIN<span class="mandatory">*</span></td>
                                <td>
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="postalcodes" runat="server" placeholder="Postal Code" CssClass="form-control forcenumeric" MaxLength="6"></asp:TextBox></td>
                                            <td><a href="#" onclick="return GetPhysicalVerificationOnUserClick();" id="aPinCheck" runat="server">check</a></td>
                                        </tr>
                                    </table>
                                </td>

                                <td>District<span class="mandatory">*</span> </td>
                                <td>
                                    <asp:TextBox ID="district" placeholder="District" runat="server" CssClass="form-control forcealphabet"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>State<span class="mandatory">*</span> </td>
                                <td>
                                    <asp:DropDownList ID="state" runat="server" CssClass="form-control">
                                        <asp:ListItem Value="">Select a State</asp:ListItem>
                                        <asp:ListItem Value="ANDAMAN AND NICOBAR ISLANDS">ANDAMAN AND NICOBAR ISLANDS</asp:ListItem>
                                        <asp:ListItem Value="ANDHRA PRADESH">ANDHRA PRADESH</asp:ListItem>
                                        <asp:ListItem Value="ARUNACHAL PRADESH">ARUNACHAL PRADESH</asp:ListItem>
                                        <asp:ListItem Value="ASSAM">ASSAM</asp:ListItem>
                                        <asp:ListItem Value="BIHAR">BIHAR</asp:ListItem>
                                        <asp:ListItem Value="CHANDIGARH">CHANDIGARH</asp:ListItem>
                                        <asp:ListItem Value="CHATTISGARH">CHATTISGARH</asp:ListItem>
                                        <asp:ListItem Value="DADRA AND NAGAR HAVELI">DADRA AND NAGAR HAVELI</asp:ListItem>
                                        <asp:ListItem Value="DAMAN AND DIU">DAMAN AND DIU</asp:ListItem>
                                        <asp:ListItem Value="DELHI">DELHI</asp:ListItem>
                                        <asp:ListItem Value="GOA">GOA</asp:ListItem>
                                        <asp:ListItem Value="GUJARAT">GUJARAT</asp:ListItem>
                                        <asp:ListItem Value="HARYANA">HARYANA</asp:ListItem>
                                        <asp:ListItem Value="HIMACHAL PRADESH">HIMACHAL PRADESH</asp:ListItem>
                                        <asp:ListItem Value="JAMMU AND KASHMIR">JAMMU AND KASHMIR</asp:ListItem>
                                        <asp:ListItem Value="JHARKHAND">JHARKHAND</asp:ListItem>
                                        <asp:ListItem Value="KARNATAKA">KARNATAKA</asp:ListItem>
                                        <asp:ListItem Value="KERALA">KERALA</asp:ListItem>
                                        <asp:ListItem Value="LAKSHADWEEP">LAKSHADWEEP</asp:ListItem>
                                        <asp:ListItem Value="MADHYA PRADESH">MADHYA PRADESH</asp:ListItem>
                                        <asp:ListItem Value="MAHARASHTRA">MAHARASHTRA</asp:ListItem>
                                        <asp:ListItem Value="MANIPUR">MANIPUR</asp:ListItem>
                                        <asp:ListItem Value="MEGHALAYA">MEGHALAYA</asp:ListItem>
                                        <asp:ListItem Value="MIZORAM">MIZORAM</asp:ListItem>
                                        <asp:ListItem Value="NAGALAND">NAGALAND</asp:ListItem>
                                        <asp:ListItem Value="ORISSA">ORISSA</asp:ListItem>
                                        <asp:ListItem Value="PONDICHERRY">PONDICHERRY</asp:ListItem>
                                        <asp:ListItem Value="PUNJAB">PUNJAB</asp:ListItem>
                                        <asp:ListItem Value="RAJASTHAN">RAJASTHAN</asp:ListItem>
                                        <asp:ListItem Value="SIKKIM">SIKKIM</asp:ListItem>
                                        <asp:ListItem Value="TAMIL NADU">TAMIL NADU</asp:ListItem>
                                        <asp:ListItem Value="TRIPURA">TRIPURA</asp:ListItem>
                                        <asp:ListItem Value="UTTAR PRADESH">UTTAR PRADESH</asp:ListItem>
                                        <asp:ListItem Value="UTTARANCHAL">UTTARANCHAL</asp:ListItem>
                                        <asp:ListItem Value="WEST BENGAL">WEST BENGAL</asp:ListItem>
                                        <asp:ListItem Value="OTHER">OTHER</asp:ListItem>
                                    </asp:DropDownList>
                                    <input type="hidden" name="otherstatehidden" id="otherstatehidden" />
                                </td>
                                <td>Country<span class="mandatory">*</span></td>
                                <td style="text-align: left;">
                                    <span class="country font-grey">INDIA</span> <span class="dnfont_countrys"></span>
                                </td>
                            </tr>

                            <tr>
                                <td style="vertical-align: top">PAN<span class="mandatory">*</span></td>
                                <td>
                                    <asp:TextBox ID="pannos" placeholder="PAN" runat="server" CssClass="form-control" MaxLength="10"></asp:TextBox>
                                    <%--<span class="dnred">PAN is mandatory for Income Tax usage</span>--%>
                                </td>
                                <td>Nationality<span class="mandatory">*</span></td>
                                <td>
                                    <asp:DropDownList ID="nationality" runat="server" CssClass="form-control">
                                        <asp:ListItem Value="1" Selected="True">Indian</asp:ListItem>
                                        <asp:ListItem Value="3">Afghanistan</asp:ListItem>
                                        <asp:ListItem Value="501">Aland Islands</asp:ListItem>
                                        <asp:ListItem Value="502">Albania</asp:ListItem>
                                        <asp:ListItem Value="503">Algeria</asp:ListItem>
                                        <asp:ListItem Value="504">American Samoa</asp:ListItem>
                                        <asp:ListItem Value="505">Andorra</asp:ListItem>
                                        <asp:ListItem Value="506">Angola</asp:ListItem>
                                        <asp:ListItem Value="507">Anguilla</asp:ListItem>
                                        <asp:ListItem Value="508">Antarctica</asp:ListItem>
                                        <asp:ListItem Value="509">Antigua And Barbuda</asp:ListItem>
                                        <asp:ListItem Value="510">Argentina</asp:ListItem>
                                        <asp:ListItem Value="511">Armenia</asp:ListItem>
                                        <asp:ListItem Value="512">Aruba</asp:ListItem>
                                        <asp:ListItem Value="513">Australia</asp:ListItem>
                                        <asp:ListItem Value="514">Austria</asp:ListItem>
                                        <asp:ListItem Value="515">Azerbaijan</asp:ListItem>
                                        <asp:ListItem Value="516">Bahamas</asp:ListItem>
                                        <asp:ListItem Value="517">Bahrain</asp:ListItem>
                                        <asp:ListItem Value="518">Bangladesh</asp:ListItem>
                                        <asp:ListItem Value="519">Barbados</asp:ListItem>
                                        <asp:ListItem Value="520">Belarus</asp:ListItem>
                                        <asp:ListItem Value="521">Belgium</asp:ListItem>
                                        <asp:ListItem Value="522">Belize</asp:ListItem>
                                        <asp:ListItem Value="25">Benin</asp:ListItem>
                                        <asp:ListItem Value="524">Bermuda</asp:ListItem>
                                        <asp:ListItem Value="525">Bhutan</asp:ListItem>
                                        <asp:ListItem Value="526">Bolivia, Plurinational State Of</asp:ListItem>
                                        <asp:ListItem Value="527">Bosnia And Herzegovina</asp:ListItem>
                                        <asp:ListItem Value="528">Botswana</asp:ListItem>
                                        <asp:ListItem Value="529">Bouvet Island</asp:ListItem>
                                        <asp:ListItem Value="530">Brazil</asp:ListItem>
                                        <asp:ListItem Value="531">British Indian Ocean Territory</asp:ListItem>
                                        <asp:ListItem Value="532">Brunei Darussalam</asp:ListItem>
                                        <asp:ListItem Value="533">Bulgaria</asp:ListItem>
                                        <asp:ListItem Value="534">Burkina Faso</asp:ListItem>
                                        <asp:ListItem Value="535">Burundi</asp:ListItem>
                                        <asp:ListItem Value="536">Cambodia</asp:ListItem>
                                        <asp:ListItem Value="537">Cameroon</asp:ListItem>
                                        <asp:ListItem Value="538">Canada</asp:ListItem>
                                        <asp:ListItem Value="539">Cape Verde</asp:ListItem>
                                        <asp:ListItem Value="540">Cayman Islands</asp:ListItem>
                                        <asp:ListItem Value="541">Central African Republic</asp:ListItem>
                                        <asp:ListItem Value="542">Chad</asp:ListItem>
                                        <asp:ListItem Value="543">Chile</asp:ListItem>
                                        <asp:ListItem Value="544">China</asp:ListItem>
                                        <asp:ListItem Value="545">Christmas Island</asp:ListItem>
                                        <asp:ListItem Value="546">Cocos (Keeling) Islands</asp:ListItem>
                                        <asp:ListItem Value="547">Colombia</asp:ListItem>
                                        <asp:ListItem Value="548">Comoros</asp:ListItem>
                                        <asp:ListItem Value="549">Congo</asp:ListItem>
                                        <asp:ListItem Value="550">Congo, The Democratic Republic Of The</asp:ListItem>
                                        <asp:ListItem Value="551">Cook Islands</asp:ListItem>
                                        <asp:ListItem Value="552">Costa Rica</asp:ListItem>
                                        <asp:ListItem Value="553">Cote D'Ivoire</asp:ListItem>
                                        <asp:ListItem Value="554">Croatia</asp:ListItem>
                                        <asp:ListItem Value="555">Cuba</asp:ListItem>
                                        <asp:ListItem Value="556">Cyprus</asp:ListItem>
                                        <asp:ListItem Value="557">Czech Republic</asp:ListItem>
                                        <asp:ListItem Value="558">Denmark</asp:ListItem>
                                        <asp:ListItem Value="559">Djibouti</asp:ListItem>
                                        <asp:ListItem Value="560">Dominica</asp:ListItem>
                                        <asp:ListItem Value="561">Dominican Republic</asp:ListItem>
                                        <asp:ListItem Value="562">Ecuador</asp:ListItem>
                                        <asp:ListItem Value="563">Egypt</asp:ListItem>
                                        <asp:ListItem Value="564">El Salvador</asp:ListItem>
                                        <asp:ListItem Value="565">Equatorial Guinea</asp:ListItem>
                                        <asp:ListItem Value="566">Eritrea</asp:ListItem>
                                        <asp:ListItem Value="567">Estonia</asp:ListItem>
                                        <asp:ListItem Value="568">Ethiopia</asp:ListItem>
                                        <asp:ListItem Value="569">Falkland Islands (Malvinas)</asp:ListItem>
                                        <asp:ListItem Value="570">Faroe Islands</asp:ListItem>
                                        <asp:ListItem Value="571">Fiji</asp:ListItem>
                                        <asp:ListItem Value="572">Finland</asp:ListItem>
                                        <asp:ListItem Value="75">France</asp:ListItem>
                                        <asp:ListItem Value="574">French Guiana</asp:ListItem>
                                        <asp:ListItem Value="575">French Polynesia</asp:ListItem>
                                        <asp:ListItem Value="576">French Southern Territories</asp:ListItem>
                                        <asp:ListItem Value="577">Gabon</asp:ListItem>
                                        <asp:ListItem Value="578">Gambia</asp:ListItem>
                                        <asp:ListItem Value="579">Georgia</asp:ListItem>
                                        <asp:ListItem Value="580">Germany</asp:ListItem>
                                        <asp:ListItem Value="581">Ghana</asp:ListItem>
                                        <asp:ListItem Value="582">Gibraltar</asp:ListItem>
                                        <asp:ListItem Value="583">Greece</asp:ListItem>
                                        <asp:ListItem Value="584">Greenland</asp:ListItem>
                                        <asp:ListItem Value="585">Grenada</asp:ListItem>
                                        <asp:ListItem Value="586">Guadeloupe</asp:ListItem>
                                        <asp:ListItem Value="587">Guam</asp:ListItem>
                                        <asp:ListItem Value="588">Guatemala</asp:ListItem>
                                        <asp:ListItem Value="589">Guernsey</asp:ListItem>
                                        <asp:ListItem Value="90">Guinea</asp:ListItem>
                                        <asp:ListItem Value="591">Guinea-Bissau</asp:ListItem>
                                        <asp:ListItem Value="592">Guyana</asp:ListItem>
                                        <asp:ListItem Value="593">Haiti</asp:ListItem>
                                        <asp:ListItem Value="594">Heard Island And Mcdonald Islands</asp:ListItem>
                                        <asp:ListItem Value="595">Holy See (Vatican City State)</asp:ListItem>
                                        <asp:ListItem Value="596">Honduras</asp:ListItem>
                                        <asp:ListItem Value="597">Hong Kong</asp:ListItem>
                                        <asp:ListItem Value="598">Hungary</asp:ListItem>
                                        <asp:ListItem Value="599">Iceland</asp:ListItem>
                                        <asp:ListItem Value="100">Indonesia</asp:ListItem>
                                        <asp:ListItem Value="602">Iran, Islamic Republic Of</asp:ListItem>
                                        <asp:ListItem Value="102">Iraq</asp:ListItem>
                                        <asp:ListItem Value="604">Ireland</asp:ListItem>
                                        <asp:ListItem Value="605">Isle Of Man</asp:ListItem>
                                        <asp:ListItem Value="104">Israel</asp:ListItem>
                                        <asp:ListItem Value="607">Italy</asp:ListItem>
                                        <asp:ListItem Value="608">Jamaica</asp:ListItem>
                                        <asp:ListItem Value="107">Japan</asp:ListItem>
                                        <asp:ListItem Value="610">Jersey</asp:ListItem>
                                        <asp:ListItem Value="611">Jordan</asp:ListItem>
                                        <asp:ListItem Value="109">Kazakhstan</asp:ListItem>
                                        <asp:ListItem Value="613">Kenya</asp:ListItem>
                                        <asp:ListItem Value="614">Kiribati</asp:ListItem>
                                        <asp:ListItem Value="615">Korea, Democratic People'S Republic Of</asp:ListItem>
                                        <asp:ListItem Value="616">Korea, Republic Of</asp:ListItem>
                                        <asp:ListItem Value="617">Kuwait</asp:ListItem>
                                        <asp:ListItem Value="618">Kyrgyzstan</asp:ListItem>
                                        <asp:ListItem Value="619">Lao People'S Democratic Republic</asp:ListItem>
                                        <asp:ListItem Value="620">Latvia</asp:ListItem>
                                        <asp:ListItem Value="621">Lebanon</asp:ListItem>
                                        <asp:ListItem Value="622">Lesotho</asp:ListItem>
                                        <asp:ListItem Value="623">Liberia</asp:ListItem>
                                        <asp:ListItem Value="624">Libyan Arab Jamahiriya</asp:ListItem>
                                        <asp:ListItem Value="625">Liechtenstein</asp:ListItem>
                                        <asp:ListItem Value="626">Lithuania</asp:ListItem>
                                        <asp:ListItem Value="627">Luxembourg</asp:ListItem>
                                        <asp:ListItem Value="628">Macao</asp:ListItem>
                                        <asp:ListItem Value="629">Macedonia, The Former Yugoslav Republic Of</asp:ListItem>
                                        <asp:ListItem Value="630">Madagascar</asp:ListItem>
                                        <asp:ListItem Value="631">Malawi</asp:ListItem>
                                        <asp:ListItem Value="632">Malaysia</asp:ListItem>
                                        <asp:ListItem Value="633">Maldives</asp:ListItem>
                                        <asp:ListItem Value="634">Mali</asp:ListItem>
                                        <asp:ListItem Value="635">Malta</asp:ListItem>
                                        <asp:ListItem Value="636">Marshall Islands</asp:ListItem>
                                        <asp:ListItem Value="637">Martinique</asp:ListItem>
                                        <asp:ListItem Value="638">Mauritania</asp:ListItem>
                                        <asp:ListItem Value="639">Mauritius</asp:ListItem>
                                        <asp:ListItem Value="640">Mayotte</asp:ListItem>
                                        <asp:ListItem Value="641">Mexico</asp:ListItem>
                                        <asp:ListItem Value="642">Micronesia, Federated States Of</asp:ListItem>
                                        <asp:ListItem Value="643">Moldova, Republic Of</asp:ListItem>
                                        <asp:ListItem Value="644">Monaco</asp:ListItem>
                                        <asp:ListItem Value="645">Mongolia</asp:ListItem>
                                        <asp:ListItem Value="646">Montenegro</asp:ListItem>
                                        <asp:ListItem Value="647">Montserrat</asp:ListItem>
                                        <asp:ListItem Value="648">Morocco</asp:ListItem>
                                        <asp:ListItem Value="649">Mozambique</asp:ListItem>
                                        <asp:ListItem Value="650">Myanmar</asp:ListItem>
                                        <asp:ListItem Value="651">Namibia</asp:ListItem>
                                        <asp:ListItem Value="652">Nauru</asp:ListItem>
                                        <asp:ListItem Value="146">Nepal</asp:ListItem>
                                        <asp:ListItem Value="654">Netherlands</asp:ListItem>
                                        <asp:ListItem Value="655">Netherlands Antilles</asp:ListItem>
                                        <asp:ListItem Value="656">New Caledonia</asp:ListItem>
                                        <asp:ListItem Value="657">New Zealand</asp:ListItem>
                                        <asp:ListItem Value="658">Nicaragua</asp:ListItem>
                                        <asp:ListItem Value="659">Niger</asp:ListItem>
                                        <asp:ListItem Value="660">Nigeria</asp:ListItem>
                                        <asp:ListItem Value="661">Niue</asp:ListItem>
                                        <asp:ListItem Value="662">Norfolk Island</asp:ListItem>
                                        <asp:ListItem Value="663">Northern Mariana Islands</asp:ListItem>
                                        <asp:ListItem Value="664">Norway</asp:ListItem>
                                        <asp:ListItem Value="665">Oman</asp:ListItem>
                                        <asp:ListItem Value="666">Pakistan</asp:ListItem>
                                        <asp:ListItem Value="667">Palau</asp:ListItem>
                                        <asp:ListItem Value="668">Palestinian Territory, Occupied</asp:ListItem>
                                        <asp:ListItem Value="669">Panama</asp:ListItem>
                                        <asp:ListItem Value="670">Papua New Guinea</asp:ListItem>
                                        <asp:ListItem Value="671">Paraguay</asp:ListItem>
                                        <asp:ListItem Value="672">Peru</asp:ListItem>
                                        <asp:ListItem Value="673">Philippines</asp:ListItem>
                                        <asp:ListItem Value="674">Pitcairn</asp:ListItem>
                                        <asp:ListItem Value="675">Poland</asp:ListItem>
                                        <asp:ListItem Value="676">Portugal</asp:ListItem>
                                        <asp:ListItem Value="677">Puerto Rico</asp:ListItem>
                                        <asp:ListItem Value="678">Qatar</asp:ListItem>
                                        <asp:ListItem Value="680">Romania</asp:ListItem>
                                        <asp:ListItem Value="681">Russian Federation</asp:ListItem>
                                        <asp:ListItem Value="682">Rwanda</asp:ListItem>
                                        <asp:ListItem Value="679">R�union</asp:ListItem>
                                        <asp:ListItem Value="683">Saint Barth�lemy</asp:ListItem>
                                        <asp:ListItem Value="684">Saint Helena</asp:ListItem>
                                        <asp:ListItem Value="685">Saint Kitts And Nevis</asp:ListItem>
                                        <asp:ListItem Value="686">Saint Lucia</asp:ListItem>
                                        <asp:ListItem Value="687">Saint Martin</asp:ListItem>
                                        <asp:ListItem Value="688">Saint Pierre And Miquelon</asp:ListItem>
                                        <asp:ListItem Value="689">Saint Vincent And The Grenadines</asp:ListItem>
                                        <asp:ListItem Value="690">Samoa</asp:ListItem>
                                        <asp:ListItem Value="691">San Marino</asp:ListItem>
                                        <asp:ListItem Value="692">Sao Tome And Principe</asp:ListItem>
                                        <asp:ListItem Value="182">Saudi Arabia</asp:ListItem>
                                        <asp:ListItem Value="694">Senegal</asp:ListItem>
                                        <asp:ListItem Value="695">Serbia</asp:ListItem>
                                        <asp:ListItem Value="696">Seychelles</asp:ListItem>
                                        <asp:ListItem Value="697">Sierra Leone</asp:ListItem>
                                        <asp:ListItem Value="186">Singapore</asp:ListItem>
                                        <asp:ListItem Value="699">Slovakia</asp:ListItem>
                                        <asp:ListItem Value="700">Slovenia</asp:ListItem>
                                        <asp:ListItem Value="701">Solomon Islands</asp:ListItem>
                                        <asp:ListItem Value="702">Somalia</asp:ListItem>
                                        <asp:ListItem Value="703">South Africa</asp:ListItem>
                                        <asp:ListItem Value="704">South Georgia And The South Sandwich Islands</asp:ListItem>
                                        <asp:ListItem Value="705">Spain</asp:ListItem>
                                        <asp:ListItem Value="706">Sri Lanka</asp:ListItem>
                                        <asp:ListItem Value="707">Sudan</asp:ListItem>
                                        <asp:ListItem Value="708">Suriname</asp:ListItem>
                                        <asp:ListItem Value="709">Svalbard And Jan Mayen</asp:ListItem>
                                        <asp:ListItem Value="710">Swaziland</asp:ListItem>
                                        <asp:ListItem Value="711">Sweden</asp:ListItem>
                                        <asp:ListItem Value="712">Switzerland</asp:ListItem>
                                        <asp:ListItem Value="713">Syrian Arab Republic</asp:ListItem>
                                        <asp:ListItem Value="714">Taiwan, Province Of China</asp:ListItem>
                                        <asp:ListItem Value="715">Tajikistan</asp:ListItem>
                                        <asp:ListItem Value="716">Tanzania, United Republic Of</asp:ListItem>
                                        <asp:ListItem Value="717">Thailand</asp:ListItem>
                                        <asp:ListItem Value="718">Timor-Leste</asp:ListItem>
                                        <asp:ListItem Value="719">Togo</asp:ListItem>
                                        <asp:ListItem Value="720">Tokelau</asp:ListItem>
                                        <asp:ListItem Value="721">Tonga</asp:ListItem>
                                        <asp:ListItem Value="722">Trinidad And Tobago</asp:ListItem>
                                        <asp:ListItem Value="723">Tunisia</asp:ListItem>
                                        <asp:ListItem Value="724">Turkey</asp:ListItem>
                                        <asp:ListItem Value="725">Turkmenistan</asp:ListItem>
                                        <asp:ListItem Value="726">Turks And Caicos Islands</asp:ListItem>
                                        <asp:ListItem Value="727">Tuvalu</asp:ListItem>
                                        <asp:ListItem Value="728">Uganda</asp:ListItem>
                                        <asp:ListItem Value="729">Ukraine</asp:ListItem>
                                        <asp:ListItem Value="730">United Arab Emirates</asp:ListItem>
                                        <asp:ListItem Value="731">United Kingdom</asp:ListItem>
                                        <asp:ListItem Value="215">United States</asp:ListItem>
                                        <asp:ListItem Value="733">United States Minor Outlying Islands</asp:ListItem>
                                        <asp:ListItem Value="734">Uruguay</asp:ListItem>
                                        <asp:ListItem Value="735">Uzbekistan</asp:ListItem>
                                        <asp:ListItem Value="736">Vanuatu</asp:ListItem>
                                        <asp:ListItem Value="737">Venezuela, Bolivarian Republic Of</asp:ListItem>
                                        <asp:ListItem Value="738">Viet Nam</asp:ListItem>
                                        <asp:ListItem Value="739">Virgin Islands, British</asp:ListItem>
                                        <asp:ListItem Value="740">Virgin Islands, U.S.</asp:ListItem>
                                        <asp:ListItem Value="741">Wallis And Futuna</asp:ListItem>
                                        <asp:ListItem Value="742">Western Sahara</asp:ListItem>
                                        <asp:ListItem Value="743">Yemen</asp:ListItem>
                                        <asp:ListItem Value="744">Zambia</asp:ListItem>
                                        <asp:ListItem Value="745">Zimbabwe</asp:ListItem>
                                    </asp:DropDownList></td>
                            </tr>
                            <tr class="sub-rows">
                                <td>Mobile<span class="mandatory">*</span></td>
                                <td>
                                    <asp:TextBox ID="mobilenumber" placeholder="Mobile No" CssClass="form-control forcenumeric" runat="Server" autocomplete="off" MaxLength="10"></asp:TextBox>
                                </td>
                                <td>Email<span class="mandatory">*</span></td>
                                <td>
                                    <asp:TextBox ID="emailid" placeholder="Email" CssClass="form-control" runat="Server" autocomplete="off" MaxLength="100"></asp:TextBox>
                                </td>
                            </tr>
                        </tbody>
                    </table>

                </div>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        Document Details
                    </div>
                    <table class='table BorderLess RightAlign'>
                        <tr>
                            <td style="width: 15%;">ID Document<span class="mandatory">*</span></td>
                            <td style="width: 55%;" colspan="2">
                                <asp:DropDownList ID="identificationdocs" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="">Select</asp:ListItem>
                                    <asp:ListItem Value="158">Any Government. issued photo ID card bearing the signature of the individual</asp:ListItem>
                                    <asp:ListItem Value="91">Bank Passbook with photo and signature of the holder, attested by the bank official</asp:ListItem>
                                    <asp:ListItem Value="409">Driving License.</asp:ListItem>
                                    <asp:ListItem Value="5">PAN Card</asp:ListItem>
                                    <asp:ListItem Value="2">Passport</asp:ListItem>
                                    <asp:ListItem Value="157">Photo ID Card issued by Ministry of Home Affairs of Centre or State Government</asp:ListItem>
                                    <asp:ListItem Value="156">Post Office ID Card</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:Button ID="btnFile1" data-for="FileUpload1" runat="server" Text="Upload File" class="btn btn-info"/>
                                <div id="divProgress" style="display: none" data-for="FileUpload1" class="divProgress">
                                    <progress id="progressBar" max="100" value="0"  data-for="FileUpload1" class="progress"></progress>
                                    <span class="progress-value" id="ProgrssValue" data-for="FileUpload1">10%</span>
                                </div>

                                <div class="none">
                                    <asp:FileUpload ID="FileUpload1" runat="server" class="file" accept=".pdf,.jpg"/>
                                </div>
                            </td>
                            <%--<td><a href="#" runat="server" id="aUpload1" visible="false">View</a></td>--%>
                            <td colspan="2">
                                <asp:Label ID="lblView1" runat="server" ForeColor="Red" /></td>
                        </tr>
                        <tr>
                            <td style="width: 15%;">ID Number<span class="mandatory">*</span></td>
                            <td style="width: 55%;" colspan="2">
                                <asp:TextBox ID="iddocnumber" placeholder="Identification Document Number" CssClass="form-control" runat="Server" autocomplete="off" MaxLength="20"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td style="width: 15%;">Address Proof<span class="mandatory">*</span></td>
                            <td style="width: 55%;" colspan="2">
                                <asp:DropDownList ID="addrsproofdocs" runat="Server" CssClass="form-control">
                                    <asp:ListItem Value="">Select</asp:ListItem>
                                    <asp:ListItem Value="396">Aadhar Card</asp:ListItem>
                                    <asp:ListItem Value="161">Bank Statement signed by the bank</asp:ListItem>
                                    <asp:ListItem Value="164">Certificate of Registration for owned Vehicle</asp:ListItem>
                                    <asp:ListItem Value="93">Driving License</asp:ListItem>
                                    <asp:ListItem Value="160">Gas Connection</asp:ListItem>
                                    <asp:ListItem Value="10">Latest Electricity Bill</asp:ListItem>
                                    <asp:ListItem Value="9">Latest Telephone Bill</asp:ListItem>
                                    <asp:ListItem Value="92">Passport</asp:ListItem>
                                    <asp:ListItem Value="163">Property Tax or Corporation or Municipal Corporation receipt</asp:ListItem>
                                    <asp:ListItem Value="162">Service Tax or VAT or Sales Tax registration certificate</asp:ListItem>
                                    <asp:ListItem Value="95">Voters ID Card</asp:ListItem>
                                    <asp:ListItem Value="159">Water Bill</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:Button ID="btnFile2" data-for="FileUpload2" runat="server" Text="Upload File" class="btn btn-info"/>
                                <div id="divProgress2" style="display: none" data-for="FileUpload2" class="divProgress">
                                    <progress id="progress2" max="100" value="0" class="progress" data-for="FileUpload2"></progress>
                                    <span class="progress-value" id="ProgrssValue2" data-for="FileUpload2">10%</span>
                                </div>
                                <div class="none">
                                    <asp:FileUpload ID="FileUpload2" runat="server" CssClass="file" accept=".pdf,.jpg"/>
                                </div>
                            </td>
                            <%--<td><a href="#" runat="server" id="aUpload2" visible="false">View</a></td>--%>
                            <td>
                                <asp:Label ID="lblView2" runat="server" ForeColor="Red" /></td>
                        </tr>
                        <tr class="rowOrganization" style="display: none;">
                            <td>Certified true copy <span class="mandatory">*</span> </td>
                            <td colspan="2">
                                <div id="certified_true_copylist">
                                    <asp:DropDownList class="select-text form-control" ID="certitruecopyorg" runat="Server" CssClass="form-control">
                                        <asp:ListItem Value="">Select</asp:ListItem>
                                        <asp:ListItem Value="40">Annual Report</asp:ListItem>
                                        <asp:ListItem Value="36">Certificate of Incorporation</asp:ListItem>
                                        <asp:ListItem Value="41">Latest Income Tax Return</asp:ListItem>
                                        <asp:ListItem Value="43">Latest Organisation Bank details from the Bank</asp:ListItem>
                                        <asp:ListItem Value="37">Memorandum of Association</asp:ListItem>
                                        <asp:ListItem Value="38">Registered Partnership Deed</asp:ListItem>
                                        <asp:ListItem Value="42">Statement of Income issued by Chartered Accountant</asp:ListItem>
                                        <asp:ListItem Value="39">Valid Business License</asp:ListItem>
                                    </asp:DropDownList>
                                    from Company Secretary / a Director / Partner of the organization<br />
                                </div>
                            </td>
                            <td>
                                <asp:Button ID="btnFile3" data-for="FileUpload5" runat="server" Text="Upload File" class="btn btn-info"/>
                                <div id="divProgress3" style="display: none" data-for="FileUpload5" class="divProgress">
                                    <progress id="progress1" max="100" value="0" class="progress" data-for="FileUpload5"></progress>
                                    <span class="progress-value" id="ProgressValue" data-for="FileUpload5">10%</span>
                                </div>
                                <div class="none">
                                    <asp:FileUpload ID="FileUpload5" runat="server" CssClass="file" accept=".pdf,.jpg"/>
                                </div>
                                </td>
                            <%--<td><a href="#" runat="server" id="aUpload5" visible="false">View</a></td>--%>
                            <td>
                                <asp:Label ID="lblView3" runat="server" ForeColor="Red" /></td>
                        </tr>
                        <tr class="rowOrganization" style="display: none;" runat="server" visible="false">
                            <td>Authorization Letter <span class="mandatory">*</span>
                                <br />
                                <span class="download_here"><a target="_blank" href="inc/pdf/Government.pdf">(Download here and print in the Organization letterhead)</a></span> </td>
                            <td colspan="2">
                                <div id="docrequiredlist">
                                    <select class="select-text form-control" id="digitdocs" name="digitdocs">
                                        <option value="">Select</option>
                                        <option value="34">Authorization Letter in favor of the certificate applicant from the Organization as per the format given in the application</option>
                                    </select>
                                </div>
                            </td>
                        </tr>
                        <tr class="rowOrganization" style="display: none;" runat="server" visible="false">
                            <td>Organisation PAN<span class="mandatory">*</span></td>
                            <td colspan="2">Attested phoyocopy of Organisation PAN</td>
                        </tr>
                        <tr class="rowOrganization" style="display: none;" runat="server" visible="false">
                            <td>List of Directors/Members/Partners with their complete name and addresses on Letter Head</td>
                            <td colspan="2">
                                <div id="Div1">
                                    <select class="select-text form-control" id="listofdirectors">
                                        <option value="">Select</option>
                                        <option value="Yes">Yes</option>
                                    </select>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>Steps to be taken after submission of form
                                <ol>
                                    <li>Download the application form received in the email</li>
                                    <li>Print the form</li>
                                    <li>Paste passport size photo</li>
                                    <li>Cross sign the photo</li>
                                    <li>Scan the 2 pages application form</li>
                                    <li>Upload the 2 pages on the website, you will find the login link in your email received after submission of this form</li>
                                </ol>

                            </td>
                            <td><a href="Help/How-to-upload-dsc-form.aspx">Help</a></td>
                        </tr>
                        <tr id="tdDownload1" runat="server" visible="false">
                            <td></td>
                            <td>
                                <asp:Button ID="btnAutoFillForm" runat="server" Text="Download Form Page 1" OnClick="btnAutoFillForm_Click" class="btn btn-primary"/></td>
                            <td colspan="2" class="pull-right">
                                <asp:Button ID="btnFile4" data-for="FileUpload3" runat="server" Text="Upload File" class="btn btn-info"/>
                                <div id="divProgress4" style="display: none" data-for="FileUpload3" class="divProgress">
                                    <progress id="progress4" max="100" value="0" class="progress" data-for="FileUpload3"></progress>
                                    <span class="progress-value" id="Progressvalue3" data-for="FileUpload3">10%</span>
                                </div>
                                <div class="none">
                                    <asp:FileUpload ID="FileUpload3" runat="server" CssClass="file" accept=".pdf,.jpg"/>
                                </div>
                            </td>
                            <td>Upload Form Page 1</td>
                        </tr>

                        <tr id="tdDownload2" runat="server" visible="false">
                            <td></td>
                            <td>
                                <asp:Button ID="btnAutoFillForm0" runat="server" Text="Download Form Page 2" OnClick="btnAutoFillForm0_Click" class="btn btn-primary"/></td>
                            <%--<td>&nbsp;</td>--%>
                            <td colspan="2" class="pull-right">
                                <asp:Button ID="btnFile5" data-for="FileUpload4" runat="server" Text="Upload File" class="btn btn-info"/>
                                <div id="divProgress5" style="display: none" data-for="FileUpload4" class="divProgress">
                                    <progress id="progress3" max="100" value="0" class="progress" data-for="FileUpload4"></progress>
                                    <span class="progress-value" id="ProgressValue4" data-for="FileUpload4">10%</span>
                                </div>
                                <div class="none">
                                <asp:FileUpload ID="FileUpload4" runat="server" CssClass="file" accept=".pdf,.jpg"/>
                                </div>
                                </td>
                            <td>Upload Form Page 2</td>
                        </tr>

                        <tr>
                            <td colspan="5">
                                <div id="orgtype_div" style="display: none;">
                                    <table class='table'>
                                        <tbody>
                                            <tr>
                                                <td>Organisation Type<span class="mandatory">*</span> </td>
                                                <td colspan="3" class="fields-font-radio">
                                                    <div id="identity_document">
                                                        <span class="field-items">
                                                            <input type="radio" name="organisation_type" id="bank_document" value="bank" runat="server" />
                                                            <label for="bank_document">Bank</label>
                                                        </span>
                                                        <span class="field-items">
                                                            <input type="radio" name="organisation_type" id="government_document" value="government" runat="server" />
                                                            <label for="government_document">Government</label>
                                                        </span>
                                                        <span class="field-items">
                                                            <input type="radio" name="organisation_type" id="other_document" value="other" runat="server" />
                                                            <label for="other_document">Others</label>
                                                        </span>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        Document Submission
                    </div>

                    <table class="table BorderLess RightAlign">
                        <tbody>
                            <tr>
                                <td style="width: 20%">Submission Type <span class="mandatory">*</span>
                                </td>
                                <td>
                                    <asp:DropDownList ID="physicalverification" runat="server" CssClass="form-control">
                                        <asp:ListItem Value="0">Select</asp:ListItem>
                                        <%--<asp:ListItem Value="0">Pickup at door step (Self Attested Documents)</asp:ListItem>
                                        <asp:ListItem Value="1">Courier Documents to Us</asp:ListItem>--%>
                                    </asp:DropDownList>
                                </td>
                                <td style="width: 30%"></td>
                            </tr>

                            <%-- <tr class="pickup_address" style="display:none;">
                                <td>
                                    <span id="cityverify">Pickup City<span class="mandatory">*</span></span>
                                </td>
                                <td>
                                    <asp:DropDownList ID="pickupcities" onchange="pickupcityfill()" class="form-control" runat="server">
                                        <asp:ListItem Value="">Select a city</asp:ListItem>
                                        <asp:ListItem Value="AGRA">AGRA</asp:ListItem>
                                        <asp:ListItem Value="AHMEDABAD">AHMEDABAD</asp:ListItem>
                                        <asp:ListItem Value="AHMEDNAGAR">AHMEDNAGAR</asp:ListItem>
                                        <asp:ListItem Value="ALIGHARH">ALIGHARH</asp:ListItem>
                                        <asp:ListItem Value="AMBALA">AMBALA</asp:ListItem>
                                        <asp:ListItem Value="AMRITSAR">AMRITSAR</asp:ListItem>
                                        <asp:ListItem Value="ANKLESHWAR">ANKLESHWAR</asp:ListItem>
                                        <asp:ListItem Value="AURANGABAD">AURANGABAD</asp:ListItem>
                                        <asp:ListItem Value="BANGALORE">BANGALORE</asp:ListItem>
                                        <asp:ListItem Value="BARELI">BARELI</asp:ListItem>
                                        <asp:ListItem Value="BARODA">BARODA</asp:ListItem>
                                        <asp:ListItem Value="BHADOHI">BHADOHI</asp:ListItem>
                                        <asp:ListItem Value="BHARUCH">BHARUCH</asp:ListItem>
                                        <asp:ListItem Value="BHOPAL">BHOPAL</asp:ListItem>
                                        <asp:ListItem Value="BHUBHANESHWAR">BHUBHANESHWAR</asp:ListItem>
                                        <asp:ListItem Value="CALICUT">CALICUT</asp:ListItem>
                                        <asp:ListItem Value="CHANDIGARH">CHANDIGARH</asp:ListItem>
                                        <asp:ListItem Value="CHENNAI">CHENNAI</asp:ListItem>
                                        <asp:ListItem Value="COCHIN">COCHIN</asp:ListItem>
                                        <asp:ListItem Value="COIMBATORE">COIMBATORE</asp:ListItem>
                                        <asp:ListItem Value="CUTTACK">CUTTACK</asp:ListItem>
                                        <asp:ListItem Value="DEHRADUN">DEHRADUN</asp:ListItem>
                                        <asp:ListItem Value="DELHI">DELHI</asp:ListItem>
                                        <asp:ListItem Value="DHANBAD">DHANBAD</asp:ListItem>
                                        <asp:ListItem Value="FARIDABAD">FARIDABAD</asp:ListItem>
                                        <asp:ListItem Value="GANDHINAGAR">GANDHINAGAR</asp:ListItem>
                                        <asp:ListItem Value="GHAZIABAD">GHAZIABAD</asp:ListItem>
                                        <asp:ListItem Value="GORAKHPUR">GORAKHPUR</asp:ListItem>
                                        <asp:ListItem Value="GURGAON">GURGAON</asp:ListItem>
                                        <asp:ListItem Value="GUWAHATI">GUWAHATI</asp:ListItem>
                                        <asp:ListItem Value="HARIDWAR">HARIDWAR</asp:ListItem>
                                        <asp:ListItem Value="HYDERABAD">HYDERABAD</asp:ListItem>
                                        <asp:ListItem Value="INDORE">INDORE</asp:ListItem>
                                        <asp:ListItem Value="JABALPUR">JABALPUR</asp:ListItem>
                                        <asp:ListItem Value="JAIPUR">JAIPUR</asp:ListItem>
                                        <asp:ListItem Value="JALANDHAR">JALANDHAR</asp:ListItem>
                                        <asp:ListItem Value="JALGAON">JALGAON</asp:ListItem>
                                        <asp:ListItem Value="JAMSHEDPUR ">JAMSHEDPUR </asp:ListItem>
                                        <asp:ListItem Value="KANPUR">KANPUR</asp:ListItem>
                                        <asp:ListItem Value="KOLHAPUR">KOLHAPUR</asp:ListItem>
                                        <asp:ListItem Value="KOLKATA">KOLKATA</asp:ListItem>
                                        <asp:ListItem Value="LUCKNOW">LUCKNOW</asp:ListItem>
                                        <asp:ListItem Value="LUDHIANA">LUDHIANA</asp:ListItem>
                                        <asp:ListItem Value="MANGALORE">MANGALORE</asp:ListItem>
                                        <asp:ListItem Value="MEERUT">MEERUT</asp:ListItem>
                                        <asp:ListItem Value="MOHALI">MOHALI</asp:ListItem>
                                        <asp:ListItem Value="MORADABAD">MORADABAD</asp:ListItem>
                                        <asp:ListItem Value="MUMBAI">MUMBAI</asp:ListItem>
                                        <asp:ListItem Value="NAGPUR">NAGPUR</asp:ListItem>
                                        <asp:ListItem Value="NASIK">NASIK</asp:ListItem>
                                        <asp:ListItem Value="NOIDA">NOIDA</asp:ListItem>
                                        <asp:ListItem Value="PANCHKULA">PANCHKULA</asp:ListItem>
                                        <asp:ListItem Value="PATIALA">PATIALA</asp:ListItem>
                                        <asp:ListItem Value="PATNA">PATNA</asp:ListItem>
                                        <asp:ListItem Value="PUNE">PUNE</asp:ListItem>
                                        <asp:ListItem Value="RAJKOT">RAJKOT</asp:ListItem>
                                        <asp:ListItem Value="RANCHI">RANCHI</asp:ListItem>
                                        <asp:ListItem Value="RUDRAPUR">RUDRAPUR</asp:ListItem>
                                        <asp:ListItem Value="TRIVANDRUM">TRIVANDRUM</asp:ListItem>
                                        <asp:ListItem Value="VARANASI">VARANASI</asp:ListItem>
                                        <asp:ListItem Value="VISHAKHAPATTNAM">VISHAKHAPATTNAM</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td></td>
                            </tr>
                            <tr class="pickup_address" style="display:none;">
                                <td></td>
                                <td colspan="2" style="text-align: left;">If you are not in any one of the cities listed, please call 0120-4322456.</td>
                            </tr>
                            <tr class="pickup_address" style="display:none;">
                                <td>Pickup Address<span class="mandatory">*</span></td>
                                <td>
                                    <asp:DropDownList runat="server" ID="sameasabove" CssClass="form-control">
                                        <asp:ListItem Value="0">Same as in applicant details</asp:ListItem>
                                        <asp:ListItem Value="1">Other address</asp:ListItem>
                                    </asp:DropDownList></td>
                                <td></td>
                            </tr>
                            --%>
                            <tr class="pickup_address" style="display: none;" id="pickNote" runat="server">
                                <td></td>
                                <td colspan="2" style="text-align: left;"><b>Note: </b>Pickup of the documents would be done within the next 72 hours.</td>
                                <td></td>
                            </tr>
                            <tr class="pickup_address" style="display: none;" id="pickPin" runat="server">
                                <td>Postalcode<span class="mandatory">*</span> </td>
                                <td class="fields-space">
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="pickuppostal" runat="server" placeholder="Postalcode" class="txtup form-control" autocomplete="off" MaxLength="6"></asp:TextBox></td>
                                            <td><a href="#" onclick="return GetAddressOnUserClick();" id="aAddCheck">check</a></td>
                                        </tr>
                                    </table>
                                </td>

                            </tr>
                            <tr class="pickup_address" style="display: none;" id="pickAddress" runat="server">
                                <td>Address<span class="mandatory">*</span> </td>
                                <td>
                                    <asp:TextBox ID="pickupaddress" runat="server" placeholder="Address" class="txtup form-control" autocomplete="off" MaxLength="150" TextMode="MultiLine"></asp:TextBox>

                                </td>
                            </tr>
                            <%--<tr class="sub-addres" style="display:none;">
                                <td>City<span class="mandatory">*</span> </td>
                                <td class="fields-space">
                                    <asp:TextBox ID="pickupcity" runat="server" placeholder="City" class="txtup form-control" autocomplete="off" MaxLength="20"></asp:TextBox>
                                </td>
                            </tr>--%>



                            <tr id="CourierNote" style="display: none;" runat="server">
                                <td colspan="5" style="text-align: left;">
                                    <b>Note: </b>please  courier self attested copies of the documents to us at following address-
                                    <br />
                                    <pre>
                                        Garg Shekhar & Co., Chartered Accountants,
                                        T - 5, Aditya City Centre,Vaibhav Khand, Indirapuram,
                                        Ghaziabad - 201014,UP, India</pre>
                                </td>
                            </tr>

                        </tbody>
                    </table>

                </div>
                <div class="row-fluid">
                    <table class="pull-right" style="width: 100%;">
                        <tr>
                            <td>
                                <input type="button" id="clearButton" value="Clear" class="btn btn-warning pull-left" onclick="ClearForm()" runat="server" /></td>
                            <td>
                                <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>&nbsp;
                            </td>
                            <td>
                                <asp:Button ID="btnSubmit" runat="server" Text="Proceed" CssClass="btn btn-success pull-right" OnClick="btnSubmit_Click" OnClientClick="return Validate();" />
                                <span id="Progress" style="display: none; color: green">Please Wait.............<img id="imgProgress" src="Images/progress2.gif" /></span>
                            </td>
                        </tr>
                    </table>
                </div>


            </div>
        </div>
    </div>
    <%--<div class="row-fluid" runat="server" visible="false" id="divPayUMoney">
        <div class="col-md-12 col-md-offset-3">
            <asp:Label ID="lbl1" runat="server" Text="Processing............" Font-Size="Large" />
           <%--<uc1:PayUMoney runat="server" ID="PayUMoneyControl" />
        </div>
      
    </div>--%>
    <div class="row-fluid" visible="false" runat="server">
        <div class="col-md-12 col-md-offset-3">
            <uc1:PayUMoney runat="server" ID="PayUMoneyControl" />
        </div>
    </div>
    <div class="row-fluid" runat="server" visible="false" id="divSummary">
        <div class="col-md-6 col-md-offset-3">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    Certificate Details
                </div>
                <div class="panel-body">
                    <h4>Data successfully saved with following details!</h4>
                    <table class="table table-bordered">
                        <tr>
                            <td>Certificate Class  </td>
                            <td><%= Global.GetText(classType) %></td>
                        </tr>
                        <tr>
                            <td>Certificate Type</td>
                            <td><%=ddCertificateType.SelectedItem.Text %></td>
                        </tr>
                        <tr>
                            <td>Validity</td>
                            <td><%=ddCertificateValidity.SelectedItem.Text %></td>
                        </tr>
                        <tr>
                            <td>Certificate Cost</td>
                            <td id="tdCertCost" runat="server"></td>
                        </tr>
                        <tr>
                            <td>Token Price</td>
                            <td id="tdTokenCost" runat="server"></td>
                        </tr>
                        <tr>
                            <td>Service Tax</td>
                            <td id="tdServiceTax" runat="server"></td>
                        </tr>
                        <tr>
                            <td>Total Cost</td>
                            <td>
                                <asp:Label ID="lblTotalCost" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="col-md-5" id="DeductBalance" runat="server" visible="false">
                    <asp:Button ID="btnDeductFromBalance" runat="server" Text="Deduct From Balance" OnClick="btnDeductFromBalance_Click" CssClass="btn btn-success center-block" style="margin-top:25px!important;"/>
                    <br />
                </div>
                <div class="col-md-5">
                    <asp:Button ID="btnProceedToPayment" runat="server" Text="Proceed To Payment" OnClick="btnProceedToPayment_Click" CssClass="btn btn-success center-block" style="margin-top:25px!important;"/>
                    <br />
                </div>
                <div class="col-md-2" style="margin-top: 40px;" visible="false" runat="server" id="divAutoPay">
                    <asp:CheckBox ID="chkAdmin" runat="server" Text="AutoPay" />
                </div>
                <br />


                <%--<div>
                    <asp:Button ID="btnProceedToPayment" runat="server" Text="Proceed To Payment" OnClick="btnProceedToPayment_Click" CssClass="btn btn-success center-block" />
                    <br />
                </div>--%>
            </div>
        </div>

    </div>

    <div>
        <div class="col-md-12 col-md-offset-1" id="Div2" runat="server">
            <asp:Label ID="lblMessage" runat="server" Text="" ForeColor="Green" Font-Size="Large" CssClass="control-label" />

        </div>
    </div>
    <%-- <div class="row-fluid" runat="server" visible="false" id="divSummary">
        <div class="col-md-6 col-md-offset-3">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    Certificate Details
                </div>
                <div class="panel-body">
                    <h4>Data successfully saved with following details!</h4>
                    <table class="table table-bordered">
                        <tr>
                            <td>Certificate Class  </td>
                            <td><%= Global.GetText(classType) %></td>
                        </tr>
                        <tr>
                            <td>Certificate Type</td>
                            <td><%=ddCertificateType.SelectedItem.Text %></td>
                        </tr>
                        <tr>
                            <td>Validity</td>
                            <td><%=ddCertificateValidity.SelectedItem.Text %></td>
                        </tr>
                        <tr>
                            <td>Certificate Cost</td>
                            <td id="tdCertCost" runat="server"></td>
                        </tr>
                        <tr>
                            <td>Token Price</td>
                            <td id="tdTokenCost" runat="server"></td>
                        </tr>
                        <tr>
                            <td>Service Tax</td>
                            <td id="tdServiceTax" runat="server"></td>
                        </tr>
                        <tr>
                            <td>Total Cost</td>
                            <td>
                                <asp:Label ID="lblTotalCost" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>
                <div>
                    <asp:Button ID="btnProceedToPayment" runat="server" Text="Proceed To Payment" OnClick="btnProceedToPayment_Click" CssClass="btn btn-success center-block" />
                    <br />
                </div>
            </div>
        </div>

    </div>--%>

    <div class="row-fluid" runat="server" visible="false" id="divPayment">
        <div class="col-md-8 col-md-offset-2">
            <uc1:PaymentControl runat="server" ID="PaymentControl" />
        </div>
    </div>
    <div class="row-fluid" runat="server">
        <div class="col-md-8 col-md-offset-2">
            <table class="table BorderLess RightAlign" id="adminPay" runat="server" visible="false">
                <tr>
                    <td>Balance:<asp:Label ID="lblBalance" runat="server" Text=""></asp:Label></td>
                    <td>
                        <asp:Button ID="btnPayFromAccount" runat="server" Text="Pay From Account" CssClass="btn btn-warning" OnClick="btnPayFromAccount_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </div>

    <div class="row-fluid" runat="server">
        <div class="col-md-8 col-md-offset-2">
            <asp:Label ID="lblPaymtMsg" runat="server" Text=""></asp:Label>
        </div>
    </div>
    <asp:HiddenField ID="hidTotalCost" runat="server" />
    <asp:HiddenField ID="hidCertificateCost" runat="server" />
    <asp:HiddenField ID="hidTokenPrice" runat="server" />
    <asp:HiddenField ID="hidServiceTax" runat="server" />
</asp:Content>

