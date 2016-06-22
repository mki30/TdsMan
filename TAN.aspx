<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="TAN.aspx.cs" Inherits="TAN" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="row-fluid">
            <div class="col-md-8 col-md-offset-2">
                <h1 style="font-family: sans-serif; color: #676768; text-shadow: 0px 1px 3px white;" id="heading" runat="server">Apply for a New TAN Online </h1>
            </div>
        </div>
        <div class="row-fluid text-justify">
            <div class="col-md-12" id="divFrame" runat="server">
                <iframe id="frame" src="" style="border: solid #dbdbdb 1px; width: 100%;" runat="server"></iframe>
            </div>
            <div class="col-md-8  col-md-offset-2" id="divTanProcedure" runat="server" visible="false">
                <p>
                    TAN or Tax Deduction and Collection Account Number is a 10 digit alpha numeric number required to be obtained by all persons who are responsible for deducting or collecting tax. Under Section 203A of the Income Tax Act, 1961, it is mandatory to quote Tax Deduction Account Number (TAN) allotted by the Income Tax Department (ITD) on all TDS returns.
                    <br>
                    <br>
                    Since last few years ITD has revised the structure of TAN. It is a unique 10 digit alphanumeric code. Accordingly, they have issued TAN in this new format to all existing TAN holders.

                </p>
                <p>
                    <span style="font-weight: bold;">Types of TAN Application</span><br>
                    There are two types of TAN Applications<br>
                </p>
                <ul>
                    <li>Application for issuance of new TAN (Form 49B)</li>
                </ul>
                This application form should be used when the deductor has never applied for a TAN or does not have a TAN.
                <ul>
                    <li>Form for Change or Correction in TAN data for TAN Allotted</li>
                </ul>
                This application form should be used by the deductors in case they want a Change or Correction in data associated with their TAN.
        <p></p>
                <h2 id="procedure">Procedure:</h2>
                <p>
                </p>
                <ul style="text-align: justify">
                    <li>STEP 1: Select the category of person for whom TAN is to be obtained and click on next. (Please read the guidelines carefully before filling the form).</li>
                    <li>STEP 2: Fill the form. All fields marked with '*' are mandatory</li>
                    <li>STEP 3: Please ensure that the details provided in the form by you are correct before you proceed to make payment.</li>
                    <li>STEP 4: On making payment Form 49B duly filled shall appear on the screen. Payment receipt and this Form 49B duly filled shall be mailed to you on the email ID as provided by you in the form.</li>
                    <li>STEP 5: Save and take out a print of this Form 49B.</li>
                    <li>STEP 6: This Form duly signed and all supporting documents properly attached should be sent to the following address:-
                <p style="margin: 5px">
                    <span style="font-weight: bold;">Moon Soft Technologies Pvt. Ltd.</span>,<br>
                    22, Shripal Nagar,<br>
                    Saket Ashram Road,<br>
                    Sumerpur - 306902<br>
                    Rajasthan, India.<br>
                    <span style="font-weight: bold;">Tel No.: +91 9166417317, +91 9610253111</span>
                </p>
                    </li>
                    <li>Super scribe the envelope with 'APPLICATION FOR TAN'</li>
                    <li>Your application and identity and address proofs, should reach Moon Soft Technologies Pvt. Ltd. within 15 days from the date of online application.</li>
                    <li>Your TAN Application shall be processed only after receipt of the above documents and receipt of NSDL for TAN Application submission shall be forwarded to your email. </li>
                    <li>For any assistance or help you can mail us at info@etdsdsc.com</li>
                    <li>If there is no discrepancy in your Form 49B and all documents are correct, your TAN CARD shall reach the address mentioned in the form.</li>

                </ul>
                <p></p>
                <h2 id="charge">Charges:</h2>
                <ul>
                    <li>The fees for processing TAN Application is <span style="font-weight: bold;">Rs. 80</span> (including NSDL charge of Rs. 62 and our service tax as applicable)</li>
                </ul>
                <h3 id="guid">Guidelines for TAN Application:</h3>
                <ol style="text-align: justify">
                    <li>Left hand thumb impression, if used, should be attested by a Magistrate or a Notary Public or a Gazetted Officer, under official seal and stamp.</li>
                    <li>'Designation of the person responsible for making payment / collection tax' field is mandatory to fill up, wherever applicable.</li>
                    <li><span style="font-weight: bold;">Deductor / Collector should mention the address of the location where the tax is being deducted. </span>It is compulsory for the deductor / collector to mention at least two details out of four ie (Flat/Door/Block No., Name of Premises/Building/Village, Road/Street/Lane/Post Office and Area/Locality/Taluka/Sub Division). Town/City/District, State/Union Territory and PIN Code are mandatory.</li>
                    <li>The address of applicant should be an Indian Address only.</li>
                    <li>If Telephone Number is mentioned, STD Code is mandatory. In case of mobile number, country code should be mentioned as STD Code.</li>
                    <li>In case the applicant has already been allotted a ten digit alphanumeric TAN, it should not apply again as having or using more than one TAN is illegal. However, different branches/divisions of a deductor /collector may apply for separate TAN for each branch/division.</li>
                    <li>In case deductor /collector has already been allotted TAN and wants any change in particulars (e.g. name, address etc.), it should fill up. 'Form for changes for Correction in TAN data for TAN allotted'.</li>

                </ol>
                <h3 id="faq_q">FAQ:</h3>
                <ul id="faq">
                    <li><span>What is TAN ?</span>
                        TAN or Tax Deduction and Collection Account Number is a 10 digit alpha numeric number required to be obtained by all persons who are responsible for deducting or collecting tax. It is compulsory to quote TAN in all TDS/TCS returns (including e-TDS/TCS return), TDS/TCS payment challans and TDS/TCS certificates.            </li>
                    <li><span>Who can apply for TAN ?</span>
                        All existing assessees or taxpayers or persons who are required to file a return of income, even on behalf of others, must have a TAN. Any person, who intends to enter into economic or financial transactions where quoting TAN is mandatory, must also have a TAN.
                    </li>
                    <li><span>Why is it necessary to have TAN?</span>
                        The provisions of Section 203A of the Income-tax Act, 1961 require all persons who deduct or collect tax at source to apply for the allotment of TAN. The section also makes it mandatory to quote TAN in all TDS/TCS/Annual Information Returns, payment challans and certificates to be issued. If TAN is not quoted, TDS/TCS returns will not be accepted by TIN-Facilitation Centres (TIN-FCs) and challans for TDS/TCS payments will not be accepted by banks. Failure to apply for TAN or not quoting the same in the specified documents attracts a penalty of Rs. 10,000.
                    </li>
                    <li><span>Who must apply for TAN?</span>
                        All those persons who are required to deduct/collect tax at source on behalf of Income Tax Department are required to apply for and obtain TAN.
                    </li>
                    <li><span>What documents should be submitted alongwith the TAN application?</span>
                        No documents are required to be submitted along with the application for allotment of TAN. However, where the application is being made online, the signed acknowledgment which is generated after filling up the form should be forwarded to NSDL. Detailed guidelines for submission of application are available on NSDL-TIN website.
                    </li>
                    <li><span>Is a separate TAN required to be obtained for the purpose of Tax Collection at Source (TCS)?</span>
                        No. TAN which was allotted for Tax Deduction at Source (TDS) can be used for the purpose of TCS. However, if no TAN has been allotted, a duly filled in Form 49B, alongwith the application fees should be submitted at any TIN-FC.</li>
                    <li><span>How will the new TAN number be intimated to the applicant?</span>
                        An allotment letter is dispatched by NSDL at the address provided in Form 49B.
                    </li>
                    <li><span>How can the change in address or details on the basis of which TAN was allotted be communicated to Income Tax Department?</span>
                        Any change or corrections in the data associated with the TAN, should be communicated to ITD by filing up 'Form for Changes or Correction in TAN data for TAN allotted' alongwith the necessary fees at any of the TINFCs, or at NSDL-TIN website.
                    </li>
                    <li><span>If I change my address, should I inform ITD or should I apply for a new TAN?</span>
                        Change of address within a jurisdiction does not change the TAN. However, it may involve a change in the Assessing Officer. Such changes must, therefore, be intimated to ITD so that the TAN database of ITD can be updated. In case of change of address from one jurisdiction to other (e.g. address changes from Bangalore to Mumbai) a new TAN needs to be applied for and previous TAN needs to be surrendered on allotment of fresh TAN.

                    </li>
                    <li><span>What is duplicate TAN?</span>
                        Duplicate TAN is a TAN which has been inadvertently obtained by a person who is responsible for deducting/collecting tax and who already has a TAN allotted to him. It is illegal to possess or use more than one TAN. Different branches/divisions of an entity may, however, have separate TANs.
                    </li>
                    <li><span>Is it necessary to apply for different TAN if a deductor has to deduct tax from different types of payments like salary, interest, dividend etc.?</span>
                        No. TAN once allotted can be used for all type of deductions/collections.
                    </li>
                    <li><span>Should Government deductors apply for TAN?</span>
                        Yes. All Government deductors are also required to quote the TAN on their TDS / TCS / Annual Information Returns.
                    </li>
                    <li><span>In case of multiple DDOs, should all of them apply for TAN?</span>
                        Yes. In such case, the name of the Division; name and location of branch or the designation of the person responsible for deducting/collecting tax, whichever is applicable, should be clearly given in the application for allotment of TAN.

                    </li>
                    <li><span>Can branches of companies/banks have separate TANs?</span>
                        Yes. The name and location of branch or the designation of the person responsible for deducting/collecting tax, whichever is applicable, should be clearly given in the application for allotment of TAN.

                    </li>
                    <li><span>Can a TDS/TCS/Annual Information return be filed without TAN in case TAN has not been allotted?</span>
                        Quoting of TAN is mandatory in all TDS/TCS/Annual Information returns, whether filed in paper or electronic format. The return, whether in paper or electronic format, will not be received in case correct TAN is not quoted.

                    </li>
                    <li><span>Can I quote PAN in place of TAN?</span>
                        No. PAN should never be quoted in the field where TAN is required to be quoted. The purposes for which PAN and TAN are allotted are different. TAN is a unique identification number which is allotted to persons who are deducting or collecting tax at source on behalf of the Income Tax Department. PAN is a unique number allotted to assessees like individuals, companies etc.
                    </li>
                </ul>

            </div>
        </div>

        <%--<div id="sizer" style="margin:0 auto;width:70%;background-color:#D8E4FF; padding:15px; border-radius:5px;">
                <span style="font-family: arial;font-weight: bold;font-size: 15px;color: #143C5C;text-shadow: 1px 1px 2px white;">Select Category</span>
                <div>
                    <label class="label_radio" for="radio-01"><input name="category" id="radio-01" value="1" type="radio"> Central / State Government</label></div>
                    <div><label class="label_radio" for="radio-02"><input name="category" id="radio-02" value="2" type="radio"> Statutory / Autonomous Bodies</label></div>
                    <div><label class="label_radio" for="radio-03"><input name="category" id="radio-03" value="3" type="radio"> Company</label></div>
                    <div><label class="label_radio" for="radio-04"><input name="category" id="radio-04" value="4" type="radio"> Branch/Division of a Company</label></div>
                    <div><label class="label_radio" for="radio-05"><input name="category" id="radio-05" value="5" type="radio"> Individual / Hindu Undivided Family (Karta)</label></div>
                    <div><label class="label_radio" for="radio-06"><input name="category" id="radio-06" value="6" type="radio"> Branch of Individual Business (Sole proprietorship concern)/ Hindu Undivided Family (Karta)</label></div>
                    <div><label class="label_radio" for="radio-07"><input name="category" id="radio-07" value="7" type="radio"> Firm / Association of Persons / Association of Persons (Trusts) / Body of Individuals / Artificial Juridical Person</label></div>
                    <div><label class="label_radio" for="radio-08"><input name="category" id="radio-08" value="8" type="radio">  Branch of Firm / Association of Persons / Association of Persons (Trusts) / Body of Individuals / Artificial Juridical Person</label></div>
                <input type="submit" class="btn btn-success" value="NEXT >>" onclick="if ($('input[name=category]:checked').val() == null) { alert('Please Select Category'); return false }">
            <div>
        </div>
        </div>--%>

        <%--<div style="text-align: center;border-radius:5px;padding: 11px;">
            <table class="table table-bordered" style="width:72% ;margin:0 auto;">
                <tr>
                    <td><a href="/tanprocedure.aspx" target="_blank">Procedure</a><br/></td>
                    <td><a href="/tanguidlines.aspx" target="_blank">Guidelines</a><br/></td>
                    <td><a href="/taninfo.aspx" target="_blank">FAQ</a><br /></td>
                </tr>
            </table>
            </div>--%>
    </div>
</asp:Content>

