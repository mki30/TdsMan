<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="info.aspx.cs" Inherits="info" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div class="container-fluid">
                    <div class="col-md-4">
                        <ul class="Compinnfootul">
                            <li>
                                <h5>Tools</h5>
                            </li>
                            <li><a href="/salary-calculator">Salary Calculator</a></li>
                            <li><a href="/advance-tax-estimator">Advance Tax Calculator</a></li>
                            <li><a href="/pan-verification">Pan Verification</a></li>
                            <li><a href="/useful-form-download">Useful Forms</a></li>
                            <li><a target="_blank" href="https://onlineservices.tin.egov-nsdl.com/etaxnew/tdsnontds.jsp">Pay Tax Online (Challan 281)</a></li>
                            <li><a target="_blank" href="https://www.tin-nsdl.com/bank-center-data.php">Search BSR Code</a></li>
                            <%--<a id="a1" runat="server" onclick="window.print()" style="cursor:pointer;"><b class="glyphicon glyphicon-print"></b>&nbsp;Print</a>--%>
                            <li>
                                <h5>Incorporate</h5>
                            </li>
                            <%--<li><a href="/incorporate-sole-proprietorship">Sole Proprietorship</a></li>--%>
                            <li><a href="/incorporate-private-limited-company">Private Limited Company</a></li>
                            <%--<li><a href="/incorporate-partnership-firm">Partnership Firm</a></li>--%>
                            <%--<li><a href="/incorporate-co-operatives">Co-operatives</a></li>--%>
                            <li><a href="/incorporate-public-limited-company">Public Limited Company</a></li>
                            <%--<li><a href="/incorporate-joint-hindu-family-business">Joint Hindu Family Business</a></li>--%>
                            <li><a href="/incorporate-limited-liability-partnership">Limited Liability Partnership (LLP)</a></li>
                            <li><a href="/incorporate-one-person-company">OPC</a></li>
                            <li>
                                <h5>Articles LLP Registration</h5>
                            </li>
                            <li><a href="/llp-registration">LLP Registration</a></li>
                            <li><a href="/llp-registration-requirements">Requirements for LLP Registration</a></li>
                            <li><a href="/llp-registration-required-documents">Documents Required for LLP Registration</a></li>
                            <li><a href="/llp-registration-process">LLP Registration Process</a></li>
                            <li><a href="/llp-name-guidelines">LLP Name Guidelines</a></li>
                            <li><a href="/llp-registration-FAQ">LLP Registration FAQ</a></li>
                            <li>
                                <h5>FDI in India</h5>
                            </li>
                            <li><a href="/fdi-foreign-direct-investment-in-india">Foreign Direct Investment</a></li>
                            <li><a href="/fdi-in-limited-company">Incorporation Foreign National</a></li>
                            <li><a href="/fdi-compliances-by-company">Foreign Investment Compliance</a></li>
                            <li><a href="/fdi-branch-office-liaison-office">How to Open Branch in India</a></li>
                            <li><a href="/fdi-branch-office-liaison-office-faq">FAQ Branch Opening</a></li>
                        </ul>
                    </div>
                    <div class="col-md-4">
                        <ul class="Compinnfootul">
                            <%--<li>
                                <h5>Membership Plans</h5>
                            </li>
                            <li><a href="/legaldoc-entrepreneur-plan.php">Entrepreneur</a></li>
                            <li><a href="/legaldoc_start_up_plan.php">Start-up</a></li>
                            <li><a href="/legaldoc_business_plan.php">Business</a></li>
                            <li><a href="/legaldoc_professional_plan.php">Professional</a></li>--%>

                            <li>
                                <h5>Articles Company Registration</h5>
                            </li>
                            <li><a href="/reg-company-registration" class="focus">Company Registration</a></li>

                            <li><a href="/reg-requirements-for-private-company-registration">Requirements Private Company</a></li>

                            <li><a href="/reg-requirements-of-one-person-company-registration">Requirements OPC Company</a></li>

                            <li><a href="/reg-requirements-of-public-company-registration">Requirements Public Company</a></li>

                            <li><a href="/reg-company-registration-process">Company Registration Process</a></li>

                            <li><a href="/reg-company-name-availability-guidelines">Company Name</a></li>

                            <li><a href="/reg-commencement-of-business-by-a-company">Business Commencement</a></li>

                            <li><a href="/reg-documents-required-for-company-registration">Documents Company Registration</a></li>

                            <li><a href="/reg-company-registration-FAQ">Company Registration FAQ</a></li>
                            <li>
                                <h5>Articles LLP Agreements</h5>
                            </li>
                            <li><a href="/llp-agreement">LLP Agreement</a></li>

                            <li><a href="/llp-contents-of-an-agreement">Contents of LLP Agreement</a></li>

                            <li><a href="/llp-agreement-and-tax-planning">LLP Agreement and Tax Planning</a></li>

                            <li><a href="/llp-types-of-agreements">Types of LLP Agreements</a></li>

                            <li><a href="/llp-why-agreement" class="focus">Why LLP Agreement</a></li>
                            <li>
                                <h5>Articles Trademark</h5>
                            </li>
                            <li><a href="/trademark-registration" class="focus">Trademark Registration</a></li>
                            <li><a href="/trademark-registration-process">Trademark Registration Process</a></li>
                            <li><a href="/trademark-fast-track-registration">Fast-Track Trademark Registration</a></li>
                            <li><a href="/trademark-classification-of-goods-and-services">Trademark Classification of Goods and Services</a></li>
                            <li><a href="/trademark-registration-faq">Trademark Registration FAQ</a></li>
                            <li>
                                <h5>Registrar of Companies</h5>
                            </li>
                            <li><a href="/roc-registrar-of-companies-in-india">ROC Office</a></li>
                            <li><a href="/roc-filing-fees">ROC Filing Fees</a></li>
                        </ul>
                    </div>
                    <div class="col-md-4">
                        <ul class="Compinnfootul">
                            <li>
                                <h5>Folow us</h5>
                            </li>
                            <li>
                                <a href="#">
                                    <img src="Images/facebook-icon.png" /></a>&nbsp;
                                <a href="#">
                                    <img src="Images/social-twitter-button-blue-icon.png" /></a>&nbsp;
                                <a href="#">
                                    <img src="Images/google-plus-icon.png" /></a></li>
                            <li>
                                <h5>Connect with us</h5>
                            </li>
                            <%--<li><a href="#">Feedback</a></li>--%>
                            <li><a href="/contact">Contact</a></li>
                            <li><a href="/about">About</a></li>
                            <li><a href="/whyus">Why Us</a></li>
                            <li><a href="/disclaimer">Disclaimer</a></li>
                            <li><a href="/privacypolicy">Privacy Policy</a></li>

                            <li style="padding-top: 10px;">Payment by &nbsp; :&nbsp;<img src="http://companiesinn.com/newhedfoot/images/pay.gif" /></li>
                            <li>
                                <h5>Articles Name Guidelines</h5>
                            </li>
                            <li><a href="/nameguidelines-company-llp-name-availability">Company-LLP Name Availability</a></li>

                            <li><a href="/nameguidelines-company-name">Company Name</a></li>

                            <li><a href="/nameguidelines-company-name-availability">Company Name Availability</a></li>

                            <li><a href="/nameguidelines-company-name-undesirable-names">Company Name - Undesirable Names</a></li>

                            <li><a href="/nameguidelines-companyname-businessname-trademark-brandname-logo-and-domain-name">Company Name, Business Name etc.</a></li>

                            <li><a href="/nameguidelines-company-names-facts-to-be-disregarded">Company Names - Facts disregarded</a></li>

                            <li><a href="/nameguidelines-limited-liability-partnership-name">Limited Liability Partnership Name</a></li>

                            <li><a href="/nameguidelines-llp-name-guidelines" class="focus">LLP Name Guidelines</a></li>

                            <li><a href="/nameguidelines-trade-mark-and-company-llp-name">Trademark and Company</a></li>

                            <li><a href="/nameguidelines-company-name-availability-faq">FAQ- Company Name Availability</a></li>
                            <%--<li>
                                <h5>Articles Intellectual Property Rights</h5>
                            </li>
                            <li><a href="/intellectual-property-rights.php">Intellectual Property Rights</a></li>

                            <li><a href="/trademark.php" class="focus">Trademark</a></li>

                            <li><a href="/patent.php">Patent</a></li>

                            <li><a href="/copyright.php">Copyright</a></li>

                            <li><a href="/industrial-designs.php">Industrial Designs</a></li>

                            <li><a href="/geographical-indications.php">Geographical Indications</a></li>
                            <li>
                                <h5>Articles Bookkeeping</h5>
                            </li>
                            <li><a href="/book-keeping.php">Book-keeping</a></li>
                            <li><a href="/audit-of-accounts.php">Audit</a></li>
                            <li><a href="/accounting.php">Accounting</a></li>--%>
                        </ul>
                    </div>
                </div>
</asp:Content>

