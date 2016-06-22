<%@ Page Title="FDI" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="FDI.aspx.cs" Inherits="FDI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        function showonlyone(thechosenone)
        {
            $('.newboxes').each(function (index)
            {
                if ($(this).attr("id") == thechosenone)
                {
                    $(this).show(100);
                }
                else
                {
                    $(this).hide(200);
                }
            });
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1 style="padding-left: 10px;" runat="server" id="heading">Foreign Direct Investment (FDI) in India</h1>
    <div id="divFDI" style="padding: 0px 10px 0px 10px;" runat="server" visible="false">
        <p>
            Investment by a foreign owner in an Indian company is generally referred as Foreign Direct Investment (FDI). FDI in India is governed by the FDI Policy announced by the Government and the provisions of the Foreign Exchange Management Act (FEMA), 1999.
        </p>
        <p>
            While formulation of FDI policies fall under the ambit of the Central Government; FEMA regulations prescribe the mode of investments, i.e. the manner of receiving funds, issue of shares/convertible debentures and preference shares, and reporting investments to the Reserve Bank of India (RBI).
        </p>
        <p>
            A foreign company planning to set up business operations in India shall have the below options:
        </p>

        <h3 class="h3colorblack">Limited Company</h3>
        <p>
            A corporate entity registered anywhere in the world, except few countries, can invest in India by registering as a Limited Company. A Limited Company can be registered in India as a 100% subsidiary or as a joint venture with other investors, including Indian investors.
        </p>
        <p>
            FDI up to 100% in shares of Limited Companies is freely permitted under automatic route, subject to sectoral caps as stipulated in the Consolidated FDI Policy of India.
        </p>
        <p>
            FDI in sectors/activities to the extent permitted under the automatic route does not require any prior approval of either the Government or the RBI. FDI in activities not covered under the automatic route or beyond the sectoral cap as stipulated under the FDI Policy requires prior approval of the FIPB.

        </p>

        <h3 class="h3colorblack">Limited Liability Partnership (LLP)</h3>
        <p>
            Limited Liability Partnership (LLP) is a body corporate with all the features of a limited company. This is a new business organization in India with all the features of LLC in the US and an LLP in the UK. This is an ideal organization for business as compared to a company. The law governing LLPs in India is contained in the Limited Liability Partnership Act, 2008.
        </p>
        <p>
            An LLP combines the advantages of both—'Company' and 'Partnership'—in a single business entity. In an LLP, a partner is not responsible or liable for another partner's misconduct or negligence. Instead, all partners have limited liability, limited to their own acts of commission or omission, similar to shareholders' liabilities in a limited company.
        </p>
        <p>
            FDI is permitted in LLPs operating in business activities where 100% FDI is allowed through the automatic route with the approval of Foreign Investment Promotion Board (FIPB). FDI in LLPs will not be allowed in sectors such as agricultural/plantation activity, print media or real estate business.

        </p>
        <h3 class="h3colorblack">Branch Office</h3>
        <p>
            Business entities registered outside India (foreign company) can establish their business operations in India without creating and registering a subsidiary company. Subject to the RBI guidelines, a foreign company can open a branch office in India. The scope of operations of such offices is typically limited to activities and functions such as country representative office, sourcing, technical and/or marketing support, import and export, etc. Branch office can undertake the business activities that of parent company subject to RBI Approval.
        </p>


        <h3 class="h3colorblack">Liaison Office </h3>
        <p>
            A foreign company can open a Liaison Office (LO) in India Subject to the Reserve Bank of India (RBI) guidelines. The scope of operations of a Liaison office is limited to representing the parent company in India, promoting export/import from/to India and technical/financial collaborations and acting as a communication channel between the parent company and Indian customers. LOs are not allowed to undertake any business activity in India and cannot earn any income in India.
                
        </p>
    </div>
    <div id="divFdiInLtdCompany" style="padding: 0px 10px 0px 10px;" runat="server" visible="false">
        <p>
            Foreign Direct Investment (FDI) is freely permitted in Limited Companies subject to the FDI Policy in almost all sectors except certain strategic areas. 
        </p>
        <p>
            Under the FDI Scheme, non-residents can make investments in shares/convertible debentures/preference shares issued by an Indian company through Automatic Route or Approval Route. 
        </p>
        <ol style="margin-left: 20px; list-style: lower-alpha">
            <li><strong>Automatic Route</strong>
                <p>
                    Under the automatic route, 100% FDI is permitted subject to sector-specific caps as stipulated by the FDI policy. FDI to the permitted extent under the automatic route in specific sectors/activities does not require any prior approval from the RBI or Government of India.
                </p>
            </li>
            <li><strong>Government Route</strong>
                <p>
                    FDI in activities not covered under the automatic route requires prior approval of the Foreign Investment Promotion Board (FIPB). Any Indian company with FIPB approval for FDI does not require additional clearances from the RBI to receive inward remittances and issue shares to non-resident investors.
                </p>
            </li>
        </ol>

    </div>
    <div id="divFDIComplianceByCompany" style="padding: 0px 10px 0px 10px;" runat="server" visible="false">

        <p>
            Indian companies receiving FDI through the Automatic Route must fulfill the following compliance requirements under FDI regulations:
        </p>
        <ul style="margin-left: 20px; list-style: disc;">
            <li><strong>Intimation of inward remittance to the RBI: </strong>
                <p>
                    Indian companies receiving FDI should submit an intimation of amount received to the RBI within 30 days of receiving the inward remittance through the Authorized Dealer Bank (preferably the FDI recipient bank) along with:
                </p>
                <ul style="list-style: disc; margin-left: 20px;">
                    <li>Copy of the Foreign Inward Remittance Certificates (FIRC) for each remittance and </li>
                    <li>Know Your Customer (KYC) report by the bank </li>
                </ul>
                The foreign remitter bank (bank from which the inward remittance originates) has to submit the KYC information to the recipient bank to enable the submission of KYC to the RBI.
            </li>
            <li><strong>Issuance of Shares:</strong>
                <p>
                    Companies should issue shares within 180 days from the date of receipt of inward remittances and file Return of Share Allotment with Regist
                </p>
            </li>
            <li><strong>Post - Issue Requirements:</strong>
                <p>
                    Upon issue of shares, the Indian company should file Form FC-GPR to the RBI through the Authorized Dealer Bank (preferably the FDI recipient bank) within 30 days of date of issue of shares along with: 
                </p>
                <ul style="list-style: disc; margin-left: 20px;">
                    <li>Share Valuation report certified by a Chartered Accountant </li>
                    <li>Certificate by a Company Secretary in the prescribed format </li>
                </ul>
            </li>
        </ul>
    </div>
    <div id="divBranchAndLiason" style="padding: 0px 10px 0px 10px;" runat="server" visible="false">
        <p>
            Business entities registered outside India (Foreign Company) can establish business operations in India without creating and registering a subsidiary company. 
        </p>
        <p>
            Subject to the RBI guidelines, a foreign company can open a Branch Office or Liaison Office in India. The scope of operations of such offices is typically limited to activities and functions such as country representative office, sourcing, technical and/or marketing support, import and export, etc. 
        </p>
        <p>
            Approvals for Branch Offices and Liaison Offices are granted based on the sectors in which the foreign company's principal business is conducted.
        </p>
        <ul style="list-style: disc; margin-left: 20px;">
            <li>RBI route: Where the principal business of the foreign entity falls in sectors where 100% FDI is allowed automatically, only RBI approval is required. </li>
            <li>Government route: For principal business operations falling under sectors where 100% FDI is not allowed through the automatic route; or entities seeking approval are non-governmental organizations (NGOs) or non-profit organizations or government bodies/departments; applications are reviewed by the RBI in consultation with the Ministry of Finance, Government of India.</li>
        </ul>
        Establishing a Branch/Liaison Office in India involves:
        <ul style="list-style: disc; margin-left: 20px;">
            <li>Seeking RBI approval through an Authorized Dealer of a Category I Bank; </li>
            <li>Registration of the branch/liaison office with the Registrar of Companies, New Delhi. </li>
        </ul>
        <section class="carousel">
            <div class="reel" style="overflow: visible; transform: translate(0px, 0px);">
                <article style="width: 100%; margin-top: 20px; text-align: left; margin-bottom: 0px; padding-bottom: 0px;" class="">
                    <h3 class="h3colorblack">Branch Office</h3>
                    <p>
                        Business entities incorporated outside India are allowed to set up Branch Offices in India with specific approval of the RBI. Such branch offices are permitted to represent the parent/group companies and undertake the following activities: 
                    </p>
                    <ul style="list-style: disc; margin-left: 20px;">
                        <li>Export/import of goods; </li>
                        <li>Provide professional or consultancy services; </li>
                        <li>Undertake research work in areas in which the parent company is engaged; </li>
                        <li>Promote technical and/or financial collaboration between Indian companies and parent or overseas group companies; </li>
                        <li>Represent the parent company in India and act as the local buying/selling agent; </li>
                        <li>Render services in Information Technology (IT) and development; </li>
                        <li>Provide technical support to products supplied by parent/group companies; </li>
                        <li>Function as a foreign airline/shipping company. </li>
                    </ul>
                    Generally, branch offices should engage in the same activities as the parent company.
Important Notes:
                    <ul style="list-style: disc; margin-left: 20px;">
                        <li>Retail trading activities of any nature cannot be undertaken by a branch office in India; </li>
                        <li>A branch office cannot carry out manufacturing or processing activities in India, directly or indirectly; </li>
                        <li>Profits earned by branch offices can be freely remitted from India, subject to the payment of applicable taxes. </li>
                    </ul>
                    <p></p>
                </article>
            </div>
            <span class="forward" style="display: inline;"></span><span class="backward" style="display: inline;"></span>
        </section>




        <section class="carousel" style="border-top: #eeeeee solid 1px;">
            <div class="reel" style="overflow: visible; transform: translate(0px, 0px);">
                <article style="width: 100%; margin-top: 0px; text-align: left; margin-bottom: 0px; padding-bottom: 0px;" class="">
                    <h3 class="h3colorblack">Liaison Office</h3>
                    <p>
                        Business entities incorporated outside India are allowed to set up Liaison Office in India with specific approval of the RBI. 
                    </p>
                    <p>
                        A Liaison Office (also known as Representative Office) can undertake only liaison activities, i.e. it can act as a channel of communication between the Head Office abroad and parties in India. LOs are not allowed to undertake any business activity in India and cannot earn any income in India. Expenses of such offices are to be met entirely through inward remittances of foreign exchange by the Head Office of the company. The role of such offices is, therefore, limited to collecting information about possible market opportunities and providing information about the company and its products to the prospective Indian customers. 
                    </p>
                    <p>
                        A liaison office can undertake the following activities in India:
                    </p>
                    <ul style="margin-left: 20px; list-style: disc;">
                        <li>Represent the parent company/group of companies in India;</li>
                        <li>Promote export/import from/to India; </li>
                        <li>Promote technical/financial collaboration between parent/group companies and Indian companies; </li>
                        <li>Act as a channel of communication between the parent company and Indian companies. </li>
                    </ul>
                    <p></p>
                </article>
            </div>
            <span class="forward" style="display: inline;"></span><span class="backward" style="display: inline;"></span>
        </section>


        <section class="carousel" style="border-top: #eeeeee solid 1px;">
            <div class="reel" style="overflow: visible; transform: translate(0px, 0px);">
                <article style="width: 100%; margin-top: 0px; text-align: left; margin-bottom: 0px; padding-bottom: 0px;" class="">
                    <h3 class="h3colorblack">Branch Office – SEZ</h3>
                    <p>
                        RBI approvals are not required to establish a branch/unit in Special Economic Zones (SEZ) to carry out manufacturing and service activities, subject to the following conditions:
                    </p>
                    <ul style="list-style: disc; margin-left: 20px;">
                        <li>Such units are functioning in those sectors where 100% FDI is permitted; </li>
                        <li>Such units comply with part XI of the Companies Act (Sections 592 to 602); and </li>
                        <li>Such units function on a standalone basis. </li>
                    </ul>
                    <p></p>
                </article>
            </div>
            <span class="forward" style="display: inline;"></span><span class="backward" style="display: inline;"></span>
        </section>


        <section class="carousel" style="border-top: #eeeeee solid 1px;">
            <div class="reel" style="overflow: visible; transform: translate(0px, 0px);">
                <article style="width: 100%; margin-top: 0px; text-align: left; margin-bottom: 0px; padding-bottom: 0px;" class="">
                    <h3 class="h3colorblack">Project Office</h3>
                    <p>
                        The RBI grants general permission to foreign companies for setting up Project Offices in India, in instances where these companies secure contracts for executing projects in India from an Indian company. The following conditions should also be satisfied:
                    </p>
                    <ul style="list-style: disc; margin-left: 20px;">
                        <li>The project is funded directly by overseas inward remittances or funded by bilateral/multilateral international financing agencies; </li>
                        <li>The project has been cleared by the appropriate authority; </li>
                        <li>The Indian company or other business entity awarding the contract has received project finance by way of a term loan from an Indian public financial institution or bank. </li>
                    </ul>
                    <strong>Exceptions: </strong>If the above mentioned criteria are not satisfied, or the foreign company's parent entity is incorporated in Pakistan, Bangladesh, Sri Lanka, Afghanistan, Iran or China; applications for setting up a project office should be forwarded to the Foreign Exchange Department, Reserve Bank of India, Central Office, Mumbai, for prior approval. 

                    <p></p>
                </article>
            </div>
            <span class="forward" style="display: inline;"></span><span class="backward" style="display: inline;"></span>
        </section>
    </div>
    <div id="divFaqBranchAndLiason" style="padding: 0px 10px 0px 10px;" runat="server" visible="false">

        <ul class="Compinninnerpage1 accordiancss">
            <li>

                <a href="javascript:showonlyone('f');" id="toggle1">Who can register a Branch Office?</a>
                <div class="newboxes" style="clear: both; display: none;" id="f">
                    <ul id="v-menu1" class="v-menu">
                        <li>
                            <p>
                                A body corporate registered under the relevant laws of  a country (Company, LLC, LLP, LP or One Man Company) can establish business operations in India through a Branch Office without creating and registering a subsidiary company. 
                            </p>
                        </li>
                    </ul>
                </div>
            </li>

            <li>
                <a href="javascript:showonlyone('f1');" id="toggle2">How can a foreign company open its Branch Office in India?</a>
                <div class="newboxes" style="clear: both; display: none;" id="f1">
                    <ul id="v-menu2" class="v-menu">
                        <li>Foreign companies/entities desirous of setting up of Liaison Office / Branch Office (LO/BO) are required to submit their application in Form FNC along with the documents mentioned therein to Foreign Investment Division, Foreign Exchange Department, Reserve Bank of India, Central Office, Mumbai, through an Authorised Dealer bank.
                        </li>
                    </ul>
                </div>
            </li>

            <li>
                <a href="javascript:showonlyone('f2');" id="toggle3">What are the activities permitted for a Branch Office?</a>
                <div class="newboxes" style="clear: both; display: none;" id="f2">
                    <ul id="v-menu3" class="v-menu">
                        <li>The following activities are permitted for a branch office in India:
                         <ul style="margin-left: 15px; list-style: disc;">
                             <li>Carry out export/import of goods; </li>
                             <li>Provide professional or consultancy services; </li>
                             <li>Undertake research work in areas in which the parent company is engaged; </li>
                             <li>Promote technical and/or financial collaboration between Indian companies and parent or overseas group companies; </li>
                             <li>Represent the parent company in India and acting as the local buying/selling agent; </li>
                             <li>Render services in Information Technology (IT) and development; </li>
                             <li>Provide technical support to products supplied by parent/group companies; </li>
                             <li>Function as a foreign airline/shipping company. </li>
                         </ul>
                            Generally, branch offices should engage in the same activities as the parent company. 

                        </li>
                    </ul>
                </div>
            </li>



            <li>
                <a href="javascript:showonlyone('f3');" id="toggle4">Can Branch Offices remit profits outside India?</a>
                <div class="newboxes" style="clear: both; display: none;" id="f3">
                    <ul id="v-menu4" class="v-menu">
                        <li>Branch Offices are permitted to remit profit of the branch after applicable Indian taxes outside India through an Authorised Dealer on production of the following documents.
                         <ul style="list-style: lower-alpha; margin-left: 15px;">
                             <li>A copy of the audited Balance Sheet and Profit and Loss Account for the relevant year;</li>
                             <li>A certificate from a Chartered Accountant with the following details: 
                                 <ul style="list-style: lower-roman; margin-left: 20px;">
                                     <li>The manner of arriving at the remit table profit</li>
                                     <li>Confirmation that the entire remittable profit has been earned by undertaking only permitted activities</li>
                                     <li>Confirmation that the profit does not include any profit on revaluation of the assets of the branch.</li>
                                 </ul>
                             </li>
                         </ul>
                        </li>
                    </ul>
                </div>
            </li>


            <li>
                <a href="javascript:showonlyone('f4');" id="toggle5">Who can register a Liaison Office (LO)?</a>
                <div class="newboxes" style="clear: both; display: none;" id="f4">
                    <ul id="v-menu5" class="v-menu">
                        <li>
                            <p>
                                A body corporate registered under the relevant laws of  a country (Company, LLC, LLP, LP or One Man Company) can establish business operations in India through a Liaison Office (LO) without creating and registering a subsidiary company. 
                            </p>
                        </li>
                    </ul>
                </div>
            </li>

            <li>
                <a href="javascript:showonlyone('f5');" id="toggle6">How can a foreign company open a Liaison Office (LO) in India?</a>
                <div class="newboxes" style="clear: both; display: none;" id="f5">
                    <ul id="v-menu6" class="v-menu">
                        <li>Foreign companies/entities desirous of setting up of Liaison Office/Branch Office (LO/BO) in India are required to submit their application in Form FNC along with the documents mentioned therein to the Foreign Investment Division, Foreign Exchange Department, Reserve Bank of India, Central Office, Mumbai, through an Authorised Dealer bank.
                         <p>
                             Once RBI approval is obtained, theprescribed documentation for registration under the Companies Act should be filed with the Registrar of Companies' office in New Delhi. The ROC reviews the submitted documentation, registers the foreign company's office and issues a Certificate of Registration.
                         </p>
                        </li>
                    </ul>
                </div>
            </li>

            <li>
                <a href="javascript:showonlyone('f6');" id="toggle7">What are the activities permitted for a Liaison Office (LO) in India?</a>
                <div class="newboxes" style="clear: both; display: none;" id="f6">
                    <ul id="v-menu7" class="v-menu">
                        <li>
                            <p>
                                A Liaison Office can undertake the following activities in India:
                            </p>
                            <ul style="list-style: disc; margin-left: 20px;">
                                <li>Representing the parent company/group companies in India. </li>
                                <li>Promoting export/import from/to India. </li>
                                <li>Promoting technical/financial collaborations between parent/group companies and companies in India. </li>
                                <li>Acting as a communication channel between the parent company and Indian companies. </li>
                            </ul>

                            <p></p>
                        </li>
                    </ul>
                </div>
            </li>

            <li>
                <a href="javascript:showonlyone('f7');" id="toggle8">Can a Liaison Office (LO) earn profits in India?</a>
                <div class="newboxes" style="clear: both; display: none;" id="f7">
                    <ul id="v-menu8" class="v-menu">
                        <li>
                            <p>
                                Liaison Offices are not allowed to undertake any business activity in India and cannot earn any income in India.
                            </p>
                            <p>
                                Expenses of such offices are to be met entirely through inward remittances of foreign exchange by the Head Office of the Company.

                            </p>
                        </li>
                    </ul>
                </div>
            </li>


            <li>
                <a href="javascript:showonlyone('f8');" id="toggle9">What is the procedure for closing a Branch Office?</a>
                <div class="newboxes" style="clear: both; display: none;" id="f8">
                    <ul id="v-menu9" class="v-menu">
                        <li>
                            <p>
                                To wind up a Branch/Liaison office, an application has to be made to the RBI through the company-designated Authorised Dealer Category Bank with the following documents: 
                            </p>
                            <ul style="list-style: lower-alpha; margin-left: 15px;">
                                <li>Copy of the RBI's permission/ approval from the sectoral regulator(s) for establishing the BO / LO. </li>
                                <li>Auditor's certificate with the following details:
                                    <ul style="list-style: lower-roman; margin-left: 15px;">
                                        <li>The manner in which the remittable amount has been arrived at and supported by a statement of assets and liabilities of the applicant, and indicating the manner of disposal of assets; </li>
                                        <li>Confirmation that all liabilities in India, including arrears of gratuity and other benefits to employees of the Branch Office, have been either fully met or adequately provided for; and</li>
                                        <li>Confirmation that no income accruing from sources outside India (including proceeds of exports) has remained un-repatriated to India. </li>
                                    </ul>
                                </li>
                                <li>No-objection / Tax Clearance Certificate from the Income Tax Authority for the remittance/s. </li>
                                <li>Confirmation from the applicant/parent company that no legal proceedings in any court in India are pending and there is no legal impediment to the remittance. </li>
                                <li>A report from the ROC regarding compliance with the provisions of the Companies Act, 1956, in case of winding up of the Branch Office in India.</li>
                                <li>Any other document/s, specified by the RBI while granting approval.</li>
                                <li>An intimation is also required to be filed with the ROC as to the closure of Branch / LO.</li>
                             </ul>
                            <p></p>
                        </li>
                    </ul>
                </div>
            </li>
        </ul>
    </div>
</asp:Content>

