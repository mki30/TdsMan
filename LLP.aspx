<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="LLP.aspx.cs" Inherits="LLP" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        function showonlyone(thechosenone)
        {
            $('.newboxes').each(function (index)
            {
                if ($(this).attr("id") == thechosenone) {
                    $(this).show(100);
                }
                else {
                    $(this).hide(200);
                }
            });
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <h1 runat="server" id="heading">LLP Registration</h1>
        </div>
    </div>
    <div class="row" id="divLLPReg" runat="server" visible="false" style="text-align: justify;">
        <div class="col-md-12">
            <p>
                A Limited Liability Partnership (LLP) is a form of business that offers the combined features of 'partnership' and 'company' business structures. This business form was introduced in India in April 2009 with the enactment of the Limited Liability Partnership Act, 2008.
            </p>
            <p>
                An LLP combines the advantages of both 'Company' and 'Partnership' in a single business entity. In an LLP, a partner is not responsible or liable for another partner's misconduct or negligence. Instead, all partners have limited liability, limited to their own acts of commission or omission, similar to shareholders' liabilities in a limited company.
            </p>
            <p>
                However, unlike company shareholders, LLP partners have the right to manage the business directly. An LLP also limits the personal liability of a partner for the errors, omissions, incompetence, or negligence of the LLP's employees or other agents. The management of day-to-day business is outlined in the LLP Agreement, providing partners with the freedom to regulate affairs of the business.
            </p>
            <p>
                LLP registration is administered by the Ministry of Corporate Affairs (MCA) through the Office of the Registrar of Companies. The incorporation process is fully electronic, similar to the company registration process, i.e. applications and documents are filed electronically and the Registrar issues a digitally-signed Certificate of Incorporation (COI).
            </p>
            <p>
                <strong>CompaniesInn holds the record of registering the fist LLP in India through the online filing system by MCA on 24-04-2009 (CompaniesInn Consulting LLP, LLPIN AAA-0002). </strong>Since then, CompaniesInn has helped more than 2500+ entrepreneurs for registering their LLPs across India.
            </p>
        </div>
    </div>
    <div class="row" id="divLlpRegRequirements" runat="server" visible="false" style="text-align: justify;">
        <div class="col-md-12">
            <ol style="list-style: lower-alpha;">
                <li><strong>Partners</strong>
                    <p>
                        To register a Limited Liability Partnership (LLP), there should be a minimum of two partners. An individual or a body corporate can become a partner of an LLP. An individual partner, who is an Indian National, should have a Permanent Account Number (PAN) allotted by the Income Tax Department.
                    </p>
                </li>

                <li><strong>Designated Partners</strong>
                    <p>
                        An LLP should have a minimum two 'Designated Partners' who are individuals.  At least one of them should be resident in India. ie, stayed in India not less than 182 in the previous calendar year. Proposed Directors must have a Director Identification Number (DIN) issued by the Ministry of Corporate Affairs. Only individuals can be designated as partners in an LLP. Where a body corporate is one of the LLP partners, it shall nominate an individual as its nominee Designated Partner.
                    </p>
                </li>

                <li><strong>LLP Name</strong>
                    <p>
                        The name of a Limited Liability Partnership (LLP) shall end with words "Limited Liability Partnership of the acronym 'LLP'. LLP Name has three parts, ie., 'The Name', 'Activity' and words "Limited Liability Partnership' or the acronym 'LLP'. Proposed LLP name is required to be approved by the Registrar of Companies
                    </p>
                </li>


                <li><strong>Registered Office Address</strong>
                    <p>
                        LLP should have a registered office address as its statutory communications. An address proof with No-Objection Letter for use of address as Registered Office of LLP from the address owner is also required.
                    </p>
                </li>

                <li><strong>LLP Objects </strong>
                    <p>
                        Objects of the LLP refer to proposed business activities. LLP can have any legal business activities that are legal. It is advisable to identify the main objects of the LLP in a particular line of business.  The name of the LLP must be in line with the main objects. If the name of the LLP is not describing a particular object, then the LLP can have multifaceted objects. 
                    </p>
                </li>

                <li><strong>Digital Signature Certificate (DSC)</strong>
                    <p>
                        All documents are filed online with Registrar of Companies. Online Filing of documents to be authenticated by using a Digital Signature Certificate of the Director obtained from the Certifying Authority in India. 
                    </p>
                </li>

                <li><strong>Professional Certification </strong>
                    <p>
                        Services of a Company Secretary, Chartered Account, Cost Accountant is required to make necessary Certifications and declarations for incorporation of a Limited Liability Partnership (LLP).  


                    </p>
                </li>
            </ol>
        </div>
    </div>
    <div class="row" id="divLlpRegDocument" style="text-align: justify;" runat="server" visible="false">
        <div class="col-md-12">
            <ul style="list-style: decimal; margin-left: 20px;">
                <li>
                    <h3 class="h3colorblack">Designated Partners (Who does not have a DIN)</h3>
                    <ol style="list-style: lower-alpha; margin-left: 20px;">
                        <li><strong>Identity Proof:</strong>
                            <ol style="margin-left: 20px; list-style: lower-roman;">
                                <li>Indian Nationals – Copy of PAN Card (Self certified)</li>
                                <li>Non Indian Nationals – Copy of Passport (Self Certified and notarized)</li>
                            </ol>
                        </li>
                        <li><strong>Address Proof:</strong>
                            <ol style="margin-left: 20px; list-style: lower-roman;">
                                <li>Permanent Address Proof: Copy of Passport or Driving License or Aadhaar Card or) or Voter Identity Card or Telephone Bill or Electricity Bill or Bank Statement (Not older than 2 months)</li>
                                <li>Present Address Proof : Telephone Bill or Electricity Bill or Bank Statement (Not older than 2 months)</li>
                            </ol>
                        </li>
                        <li><strong>Passport Size Photos</strong> - 3 Nos.</li>
                    </ol>
                </li>
                <li>
                    <h3 class="h3colorblack">Partners (If the Partner is not a Designated partner)</h3>
                    <ol style="list-style: lower-alpha; margin-left: 20px;">
                        <li><strong>Identity Proof :</strong>
                            <ol style="margin-left: 20px; list-style: lower-roman;">
                                <li>Indian Nationals – Copy of PAN Card (Self certified) </li>
                                <li>Non Indian Nationals – Copy of Passport (Self Certified and notarized)</li>
                            </ol>
                        </li>

                        <li><strong>Address Proof:</strong>
                            <ol style="margin-left: 20px; list-style: lower-roman;">
                                <li>Permanent Address Proof: Copy of Passport or Driving License or Aadhaar Card or) or Voter Identity Card or Telephone Bill or Electricity Bill or Bank Statement (Not older than 2 months)</li>
                            </ol>

                            <strong>Notes: </strong>
                            <ol style="list-style: lower-alpha; margin-left: 20px;">
                                <li>All the Copies of documents must be self attested by the applicant</li>
                                <li>In case of non-Indian Nationals, the documents are required to be notarized from the home country.</li>
                                <li>The Telephone Bill / Mobile Bill/Electricity Bill / Bank Account Statement must be in the name of applicant and should not be older than 2 months.</li>
                                <li>In case of documents that are in languages other than English, it should be translated to English with the help of a professional translator, carrying his details (name, signature, address, and seal) If the proposed director has a valid Director Identification Number and if he or she is a proposed shareholder, the address in MCA records and should match with present address proof.</li>
                            </ol>
                        </li>
                    </ol>
                </li>

                <li>
                    <h3 class="h3colorblack">Registered Office Address </h3>
                    Copy of Passport or Driving License or Aadhaar Card or Voter Identity Card or Telephone Bill or Electricity Bill or Bank Statement with complete address of proposed registered office of LLP with No-Objection Letter from the address owner for use of address as Registered Office of LLP is also required.
                </li>
            </ul>
        </div>

    </div>

    <div class="row" id="divLlpRegProcess" style="text-align: justify;" runat="server" visible="false">
        <div class="col-md-12">
            <p>
                LLP Registration Process can be divided in to 3 stages and the processes involved are as follows:
            </p>
            <h3 class="h3colorblack">Stage-I:  Pre-Requisites </h3>
            <ul style="list-style: decimal; margin-left: 40px;">
                <li>Identify Partners</li>
                <li>Identify Designated Partners</li>
                <li>Determine the capital contribution profit sharing ratio by partners</li>
                <li>Decide Objects of the LLP</li>
                <li>Decide proposed Names of the LLP</li>
                <li>Decide the State in which the LLP is to be registered.</li>
            </ul>

            <h3 class="h3colorblack">Stage-II:  Documentation and Registration</h3>
            <ul style="list-style: decimal; margin-left: 40px;">
                <li>Obtain Digital Signature Certificate (DSC) for Designated Partners</li>
                <li>Obtain Director Identification Number (DIN) for Directors.</li>
                <li>Apply for LLP Name</li>
                <li>Letters of Consent from each Partner and Designated Partner</li>
                <li>Execute LLP Registration Documents (after name approval)</li>
                <li>Submission of LLP Registration Documents to the Registrar of Companies (ROC)</li>
                <li>Registration and Certificate of Incorporation</li>
            </ul>
            <h3 class="h3colorblack">Stage-III:  LLP Agreement</h3>
            <ul style="list-style: decimal; margin-left: 40px;">
                <li>Drafting and Execution of LLP Agreement by partners</li>
                <li>Filing of LLP Agreement with Registrar within 30 days of registering the LLP.</li>
            </ul>
        </div>
    </div>

    <div class="row" id="llpNameGuidlines" style="text-align: justify;" runat="server" visible="false">
        <div class="col-md-12">
            <p>
                LLP Name approval and allotment process in India is admistered by the Ministry of Corporate Affairs (MCA) as per the Limited Liability Partnership Rules 2009.
            </p>
            <p style="font-weight: bold;">
                A name shall not be allotted to an LLP if -
            </p>
            <ul style="list-style: decimal;">
                <li>It includes any word or words which are offensive to any section of the people; </li>
                <li>the proposed name is the exact Hindi or English translation of the name of an existing limited liability partnership in English or Hindi, as the case may be; </li>
                <li>the proposed name has a close phonetic resemblance to the name of a LLP in existence, for example, J.K. LLP., Jay Kay LLP; </li>
                <li>it includes the word Co-operative, Sahakari or the equivalent of word 'co- operative' in the regional languages of the country; </li>
                <li>it connotes the participation or patronage of the Central or State Government, unless circumstances justify to, e.g., a name may be deemed undesirable in certain context if it includes any of the words such as National, Union, Central, Federal, Republic, President, Rashtrapati, etc; </li>
                <li>the proposed name contains the words 'British India'; </li>
                <li>the proposed name implies association or connection with any Embassy or Consulate or of a foreign government which suggests connection with local authorities such as Municipal, Panchayat, Zila Parishad or any other body connected with the Union or State Government; </li>
                <li>the proposed name is vague like D.I.M.O. Limited liability partnership or I.V.N.R. Limited liability partnership or S.S.R.P Limited liability partnership;\ </li>
                <li>it is different from the name or names of the existing limited liability partnership only to the extent of having the name of a place within brackets before the word 'limited liability partnership', for example, Indian Press (Delhi) LLP should not be allowed in view of the existence of the LLP named Indian Press LLP; </li>
                <li>it includes name of registered Trade mark, unless the consent of the owner of the trade mark has been produced; </li>
                <li>the proposed name is identical with or too nearly resembles the name of a firm or LLP or company incorporated outside India and reserved by such firm, LLP or company with the registrar in accordance with these rules; </li>
                <li>it is identical with or too nearly resembles the name of the limited liability partnership or a company in liquidation or it is identical with or too nearly resembles names of the LLP or a company which is struck off, up to the period of 5 years; </li>
                <li>it includes words like 'Bank', 'Insurance' and 'Banking', 'Venture capital' or 'mutual fund' or such similar names without the approval of the regulatory authority; </li>
                <li>it is intended or likely to produce a misleading impression regarding the scope or scale of its activities which would be beyond the resources at its disposal; </li>
                <li>the proposed name includes words like French, British, German etc., unless the partners satisfy that there is some form of collaboration and connection with the foreigners of that particular country or place, the name of which is incorporated in the name; </li>
                <li>the proposed name of limited liability partnership includes the words company secretary, chartered accountant, advocates or such similar words as indicative of a profession, as part of the proposed name, the same shall be allowed only after obtaining approval from the Council governing such profession or such authority as may be nominated by the Central Government, in this behalf. </li>
            </ul>
        </div>
    </div>

    <div class="row" id="llpRegFaq" style="text-align: justify;" runat="server" visible="false">
        <div class="col-md-12">
            <ul class="Compinninnerpage1 accordiancss">
                <li>

                    <a href="javascript:showonlyone('f');" id="toggle1">What is a Limited Liability Partnership (LLP)?</a>
                    <div class="newboxes" style="clear: both; overflow: hidden;" id="f">
                        <ul id="v-menu1" class="v-menu">
                            <li>
                                <p>
                                    A Limited Liability Partnership (LLP) is an incorporated business form that combines the features of partnership and the LLP form of business. The LLP form of organization was introduced in India by Limited Liability Partnership Act, 2008.
                                </p>
                            </li>
                        </ul>
                    </div>
                </li>

                <li>
                    <a href="javascript:showonlyone('f1');" id="toggle2">Who is a Partner of LLP?</a>
                    <div class="newboxes" style="clear: both; display: none; overflow: hidden;" id="f1">
                        <ul id="v-menu2" class="v-menu">
                            <li>
                                <p>
                                    Partner(s) are the persons who invest capital and holds shares in a LLP. Partners the ultimate owners of the LLP. A person becomes a partner in the LLP in accordance with LLP agreement.
                                </p>
                            </li>
                        </ul>
                    </div>
                </li>

                <li>
                    <a href="javascript:showonlyone('f2');" id="toggle3">Who is a Designated Partner of LLP?</a>
                    <div class="newboxes" style="clear: both; display: none; overflow: hidden;" id="f2">
                        <ul id="v-menu3" class="v-menu">
                            <li>
                                <p>
                                    Designated partners are responsible for the doing all acts and things that are required to be carried out by the LLP in respect of compliance of the provisions and filing of documents/returns/statements under the LLP Act and things as may be specified in the LLP agreement. Every partner need not be a designated partner of the LLP.
                                </p>
                            </li>
                        </ul>
                    </div>
                </li>



                <li>
                    <a href="javascript:showonlyone('f3');" id="toggle4">How many partners and designated partners are required for an LLP?</a>
                    <div class="newboxes" style="clear: both; display: none; overflow: hidden;" id="f3">
                        <ul id="v-menu4" class="v-menu">
                            <li>
                                <p>
                                    LLP should have Minimum 2 partners and 2 Designated Partners. Designated Partner must be a Partner of LLP.
                                </p>
                            </li>
                        </ul>
                    </div>
                </li>


                <li>
                    <a href="javascript:showonlyone('f4');" id="toggle5">Who can become Partners in a LLP?</a>
                    <div class="newboxes" style="clear: both; display: none; overflow: hidden;" id="f4">
                        <ul id="v-menu5" class="v-menu">
                            <li>
                                <p>
                                    Partners of LLP could be Individuals, Companies or LLPs, but only individuals can become Designated Partners of LLP.
                                </p>
                            </li>
                        </ul>
                    </div>
                </li>



                <li>
                    <a href="javascript:showonlyone('f5');" id="toggle6">Who can become a designated partner?</a>
                    <div class="newboxes" style="clear: both; display: none; overflow: hidden;" id="f5">
                        <ul id="v-menu6" class="v-menu">
                            <li>
                                <p>
                                    An LLP should have a minimum of two 'Designated' partners who are individuals and at least one of them should be resident in India.
                                </p>
                            </li>
                        </ul>
                    </div>
                </li>



                <li>
                    <a href="javascript:showonlyone('f6');" id="toggle7">What is the Maximum Number of Partners in LLP?</a>
                    <div class="newboxes" style="clear: both; display: none; overflow: hidden;" id="f6">
                        <ul id="v-menu7" class="v-menu">
                            <li>
                                <p>
                                    Partners are the persons who own the LLP and manage LLP. 
                                </p>
                            </li>
                        </ul>
                    </div>
                </li>



                <li>
                    <a href="javascript:showonlyone('f7');" id="toggle8">What is Contribution?</a>
                    <div class="newboxes" style="clear: both; display: none; overflow: hidden;" id="f7">
                        <ul id="v-menu8" class="v-menu">
                            <li>
                                <p>
                                    Contribution means the amount contributed by each partner agreed in the LLP as per LLP agreement. The contribution is the liability of each partner and LLP can recover the agreed contribution from the partner. A partner can contribute to the capital by cash, goods or services subject to applicable valuation.  
                                </p>
                            </li>
                        </ul>
                    </div>
                </li>


                <li>
                    <a href="javascript:showonlyone('f8');" id="toggle9">What is meant by Objects of the LLP?</a>
                    <div class="newboxes" style="clear: both; display: none; overflow: hidden;" id="f8">
                        <ul id="v-menu9" class="v-menu">
                            <li>
                                <p>
                                    Objects are the proposed business of the LLP. The objects can be any business that is legal. A LLP can have multifaceted objects. It is advisable to identify the main objects of the LLP in a particular line of business. The name of the LLP must be in line with the main objects of the LLP. The objects are described under a Clause in LLP Agreement.
                                </p>
                            </li>
                        </ul>
                    </div>
                </li>


                <li>
                    <a href="javascript:showonlyone('f9');" id="toggle10">Can a LLP do multifarious objects?</a>
                    <div class="newboxes" style="clear: both; display: none; overflow: hidden;" id="f9">
                        <ul id="v-menu10" class="v-menu">
                            <li>
                                <p>
                                    Yes. However, it is advisable to identify the main objects in line with the name of the LLP at the time of LLP Registration.
                                </p>
                            </li>
                        </ul>
                    </div>
                </li>



                <li>
                    <a href="javascript:showonlyone('f10');" id="toggle11">Whether the objects of the LLP can be changes later?</a>
                    <div class="newboxes" style="clear: both; display: none; overflow: hidden;" id="f10">
                        <ul id="v-menu11" class="v-menu">
                            <li>
                                <p>
                                    A LLP can change its objects decision of partners and by amending the LLP Agreement. 
                                </p>
                            </li>
                        </ul>
                    </div>
                </li>

                <li>
                    <a href="javascript:showonlyone('f11');" id="toggle12">How to decide the Name of the LLP?</a>
                    <div class="newboxes" style="clear: both; display: none; overflow: hidden;" id="f11">
                        <ul id="v-menu12" class="v-menu">
                            <li>
                                <p>
                                    A LLP must have a unique Name. The approval of LLP Names is subject to LLP Name Guidelines issued by MCA. The name of the LLP should end with the words 'LLP' or 'Limited Liability Partnership'.
                                </p>
                            </li>
                        </ul>
                    </div>
                </li>


                <li>
                    <a href="javascript:showonlyone('f12');" id="toggle13">How to decide the State in which the LLP is to be registered?</a>
                    <div class="newboxes" style="clear: both; display: none; overflow: hidden;" id="f12">
                        <ul id="v-menu13" class="v-menu">
                            <li>
                                <p>
                                    The jurisdiction of the ROC will depend on the state in which the registered office of LLP is situated. Place of registration depends on the convenience to the promoters. 
                                </p>
                            </li>
                        </ul>
                    </div>
                </li>


                <li>
                    <a href="javascript:showonlyone('f13');" id="toggle14">What is Registered Office of the LLP?</a>
                    <div class="newboxes" style="clear: both; display: none; overflow: hidden;" id="f13">
                        <ul id="v-menu14" class="v-menu">
                            <li>
                                <p>
                                    Registered Office refers to the official correspondence address of a LLP or its principal place of business. The address of the Registered Office will be used for all official communications of the LLP. The LLP shall affix the name and address of its registered office outside every office or place of business in a prominent position. Also, the name, registration number, 'Registered with Limited Liability' and address of its registered office should be mentioned in its business letters, bills and other official publications.
                                </p>
                            </li>
                        </ul>
                    </div>
                </li>



                <li>
                    <a href="javascript:showonlyone('f14');" id="toggle15">Whether registered office can be changed from one place to another?</a>
                    <div class="newboxes" style="clear: both; display: none; overflow: hidden;" id="f14">
                        <ul id="v-menu15" class="v-menu">
                            <li>
                                <p>
                                    The registered office can be changes from one place to another place within the city, or within the state or state to state subject to compliance of requirements under LLP Act
                                </p>
                            </li>
                        </ul>
                    </div>
                </li>


                <li>
                    <a href="javascript:showonlyone('f15');" id="toggle16">Whether Administrative Office can be same or different from Registered Office?</a>
                    <div class="newboxes" style="clear: both; display: none; overflow: hidden;" id="f15">
                        <ul id="v-menu16" class="v-menu">
                            <li>
                                <p>
                                    Administrative Office refers to a place where general Administration of LLP happens. Administrative Office can be same or different from Registered Office.
                                </p>
                            </li>
                        </ul>
                    </div>
                </li>




                <li>
                    <a href="javascript:showonlyone('f16');" id="toggle17">What is a Digital Signature Certificate (DSC) </a>
                    <div class="newboxes" style="clear: both; display: none; overflow: hidden;" id="f16">
                        <ul id="v-menu17" class="v-menu">
                            <li>
                                <p>
                                    DSC is a legally recognised method of signing documents electronically. A digital signature is a type of asymmetric cryptography used to simulate the security properties of a handwritten signature on paper. Digital signature schemes normally give two algorithms, one for signing that involves the user's secret or private key, and one for verifying signatures that involves the user's public key. The output of the signature process is called digital signature. Digital signature certificates are used by programs on the Internet and local machines to confirm the identity of a third party.Digital signatures have often confused with scanned copies of a physical written signature, which do not have any legal backing for authentication of electronic documents.
                                </p>
                            </li>
                        </ul>
                    </div>
                </li>



                <li>
                    <a href="javascript:showonlyone('f17');" id="toggle18">What is use of Digital Signature Certificate (DSC) in LLP Registration?</a>
                    <div class="newboxes" style="clear: both; display: none; overflow: hidden;" id="f17">
                        <ul id="v-menu18" class="v-menu">
                            <li>
                                <p>
                                    All the applications, Documents and Returns filed to the Registrar of Companies (ROC) are submitted online through www.mca.gov.in. These forms need to be authenticated by a Digital Signature Certificate (DSC) issued by the Certifying Authority in India. 
                                </p>
                            </li>
                        </ul>
                    </div>
                </li>


                <li>
                    <a href="javascript:showonlyone('f18');" id="toggle19">How to get a Digital Signature Certificate (DSC) </a>
                    <div class="newboxes" style="clear: both; display: none; overflow: hidden;" id="f18">
                        <ul id="v-menu19" class="v-menu">
                            <li>
                                <p>
                                    In India, Digital Signature Certificate (DSC) is issued by Certifying Authorities appointed under Information Technology Act 2000. NCode Solutions, e-Mudhra and Safescrypt are the Certifying Authorities issuing DSC for MCA use. An application along with Identity and address documents are required to be Certifying Authorities for issue of Digital Signature Certificate
                                </p>
                            </li>
                        </ul>
                    </div>
                </li>



                <li>
                    <a href="javascript:showonlyone('f19');" id="toggle20">What is a Director Identification Number (DIN)? </a>
                    <div class="newboxes" style="clear: both; display: none; overflow: hidden;" id="f19">
                        <ul id="v-menu20" class="v-menu">
                            <li>
                                <p>
                                    Director Identification Number (DIN) is a unique identification number allotted by the Ministry of Corporate Affairs to the Designated Partners of LLP / Directors of Companies. To become a Designated Partner of LLP, the incumbent partner must have DIN. 
                                </p>
                            </li>
                        </ul>
                    </div>
                </li>



                <li>
                    <a href="javascript:showonlyone('f20');" id="toggle21">Director Identification Number (DIN) for Company and LLP are same?</a>
                    <div class="newboxes" style="clear: both; display: none; overflow: hidden;" id="f20">
                        <ul id="v-menu21" class="v-menu">
                            <li>
                                <p>
                                    Yes. DIN being an identification number issued by Ministry of Corporate Affairs, the same is used for Directors of Company and Designated Partners of LLP.
                                </p>
                            </li>
                        </ul>
                    </div>
                </li>



                <li>
                    <a href="javascript:showonlyone('f21');" id="toggle22">How to obtain a Director Identification Number (DIN)? </a>
                    <div class="newboxes" style="clear: both; display: none; overflow: hidden;" id="f21">
                        <ul id="v-menu22" class="v-menu">
                            <li>
                                <p>
                                    A DIN can be obtained by filing an online application with a copy of identity and address proofs using the Digital Signature Certificate (DSC) of applicant and certified by a LLP Secretary / Chartered Accountant / Cost Accountant in Practice.
                                </p>
                            </li>
                        </ul>
                    </div>
                </li>



                <li>
                    <a href="javascript:showonlyone('f22');" id="toggle23">How to check the availability of LLP Name?</a>
                    <div class="newboxes" style="clear: both; display: none; overflow: hidden;" id="f22">
                        <ul id="v-menu23" class="v-menu">
                            <li>
                                <p>
                                    The availability of LLP Name can be verified at www.mca.gov.in. If there is no Company or LLP with similar names registered already, the may be available for registration. The search results do not provide any guarantee that the searched name will be available for registration as the LLP name has to be approved by office of ROC.
                                </p>
                            </li>
                        </ul>
                    </div>
                </li>



                <li>
                    <a href="javascript:showonlyone('f23');" id="toggle24">How to make LLP Name Application?</a>
                    <div class="newboxes" style="clear: both; display: none; overflow: hidden;" id="f23">
                        <ul id="v-menu24" class="v-menu">
                            <li>
                                <p>
                                    An application for LLP Name has to be filed for getting the LLP name approval from the ROC. It is preferable to submit the application with multiple names in the order of preference. LLP name must be in line with the LLP Name Guidelines. 
                                </p>
                            </li>
                        </ul>
                    </div>
                </li>



                <li>
                    <a href="javascript:showonlyone('f24');" id="toggle25">How many Names can be applied with one application?</a>
                    <div class="newboxes" style="clear: both; display: none; overflow: hidden;" id="f24">
                        <ul id="v-menu25" class="v-menu">
                            <li>
                                <p>
                                    Multiple names can be submitted for approval in one application in the order of preference. If the first applied name is not available, ROC will approve the next name. If you are particular about one name, it is preferable to apply with one name only and in case that name is not available apply the next name. Name application can be resubmitted only once.
                                </p>
                            </li>
                        </ul>
                    </div>
                </li>




                <li>
                    <a href="javascript:showonlyone('f25');" id="toggle26">How long LLP Name is valid for Registration?</a>
                    <div class="newboxes" style="clear: both; display: none; overflow: hidden;" id="f25">
                        <ul id="v-menu26" class="v-menu">
                            <li>
                                <p>
                                    The LLP Name shall be available for 90 days from the date of approval. After the expiry of 90 days, a fresh application has to be filed for availing the name for registration. LLP registration documents have to be executed and filed within this time line. 
                                </p>
                            </li>
                        </ul>
                    </div>
                </li>


                <li>
                    <a href="javascript:showonlyone('f26');" id="toggle27">Can I reserve a LLP Name?</a>
                    <div class="newboxes" style="clear: both; display: none; overflow: hidden;" id="f26">
                        <ul id="v-menu27" class="v-menu">
                            <li>
                                <p>
                                    A foreign LLP or a foreign company reserve their existing name that is registered in the country of its regulation or incorporation. This reservation shall be valid for three years and can be renewed through a fresh application. This option is not available for promoters / companies from Inida.
                                </p>
                            </li>
                        </ul>
                    </div>
                </li>



                <li>
                    <a href="javascript:showonlyone('f27');" id="toggle28">I have a trademark. Can I get the same Name for My LLP?</a>
                    <div class="newboxes" style="clear: both; display: none; overflow: hidden;" id="f27">
                        <ul id="v-menu28" class="v-menu">
                            <li>
                                <p>
                                    If the trademark is registered, it gives you the right to get the same name. In case your Trademark application is under process at Trade Mark Registry, your application gets priority for approval as long as there is no similar LLP or LLP registered at Ministry of Corporate Affairs.
                                </p>
                            </li>
                        </ul>
                    </div>
                </li>


                <li>
                    <a href="javascript:showonlyone('f28');" id="toggle29">What is the Guidelines for LLP Name Approval?</a>
                    <div class="newboxes" style="clear: both; display: none; overflow: hidden;" id="f28">
                        <ul id="v-menu29" class="v-menu">
                            <li>
                                <p>
                                    LLP name approval is subject to LLP Name guidelines issued by MCA. Read detailed Guidelines for LLP Name Approval 
                                </p>
                            </li>
                        </ul>
                    </div>
                </li>



                <li>
                    <a href="javascript:showonlyone('f29');" id="toggle30">What are the LLP registration documents?</a>
                    <div class="newboxes" style="clear: both; display: none; overflow: hidden;" id="f29">
                        <ul id="v-menu30" class="v-menu">
                            <li>
                                <p>
                                    LLP Registration documents consists of Subscription Sheet and Consent Letters of Partners and Designated partners of LLP
                                </p>
                            </li>
                        </ul>
                    </div>
                </li>



                <li>
                    <a href="javascript:showonlyone('f30');" id="toggle31">How to Execute the LLP registration documents?</a>
                    <div class="newboxes" style="clear: both; display: none; overflow: hidden;" id="f30">
                        <ul id="v-menu31" class="v-menu">
                            <li>
                                <p>
                                    Subscription Sheet has to be signed by Partners and has to be witnessed by a Professional with his registration Number. The witness could be a Company Secretary/ Chartered Accountant/ Cost Accountant / Advocate or Notary / or any other professional with registration number like Engineers and Doctors. Consent Letters has t be signed by of Partners and Designated partners of LLP
                                </p>
                            </li>
                        </ul>
                    </div>
                </li>



                <li>
                    <a href="javascript:showonlyone('f31');" id="toggle32">How to Submit LLP Registration documents to the Registrar of Companies (ROC)?</a>
                    <div class="newboxes" style="clear: both; display: none; overflow: hidden;" id="f31">
                        <ul id="v-menu32" class="v-menu">
                            <li>
                                <p>
                                    Duly executed Subscription Sheet and Consent Letters has to be submitted to the ROC of the respective state for the LLP registration through online applications along with LLP Registration Fee. Along with Subscription Sheet and Consent Letters, details of partners and designated partners are also required to be filed with the ROC.
                                </p>
                            </li>
                        </ul>
                    </div>
                </li>


                <li>
                    <a href="javascript:showonlyone('f32');" id="toggle33">Whether the originally signed Subscription Sheet and Consent Letters has to be submitted to ROC?</a>
                    <div class="newboxes" style="clear: both; display: none; overflow: hidden;" id="f32">
                        <ul id="v-menu33" class="v-menu">
                            <li>
                                <p>
                                    No. The originally executed Subscription Sheet and Consent Letters are not required to be filed with the ROC. The same has to be preserved by the promoters as permanent records. 
                                </p>
                            </li>
                        </ul>
                    </div>
                </li>
                <li>
                    <a href="javascript:showonlyone('f33');" id="toggle34">Who issues Certificate of Incorporation?</a>
                    <div class="newboxes" style="clear: both; display: none; overflow: hidden;" id="f33">
                        <ul id="v-menu34" class="v-menu">
                            <li>
                                <p>
                                    The ROC will register the LLP after due verification of Subscription Sheet and Consent Letters and other details and will issue the Certificate of Incorporation (COI). ROC will also allocate a LLP Identification Number (LLPIN) to the LLP so registered.
                                </p>
                            </li>
                        </ul>
                    </div>
                </li>
                <li>
                    <a href="javascript:showonlyone('f34');" id="toggle35">How the ROC issues Certificate of Incorporation?</a>
                    <div class="newboxes" style="clear: both; display: none; overflow: hidden;" id="f34">
                        <ul id="v-menu35" class="v-menu">
                            <li>
                                <p>
                                    The Certificate of Incorporation is issued by the ROC in Electronic Format signed with the digital signature certificate. No physical certificate will be issued by the office of ROC.
                                </p>
                            </li>
                        </ul>
                    </div>
                </li>



                <li>
                    <a href="javascript:showonlyone('f35');" id="toggle36">What is LLP Identification Number (LLPIN)?</a>
                    <div class="newboxes" style="clear: both; display: none; overflow: hidden;" id="f35">
                        <ul id="v-menu36" class="v-menu">
                            <li>
                                <p>
                                    LLPIN is a 7 digit alpha numeric registration number allotted by Ministry of Corporate Affairs, Government of India to an LLP.For eg: AAA-0002 is the number allotted by the Ministry of Corporate affairs to Companiesinn Consulting LLP, the first LLP registered online in India.
                                </p>
                            </li>
                        </ul>
                    </div>
                </li>
                <li>
                    <a href="javascript:showonlyone('f36');" id="toggle37">What is LLP Agreement?</a>
                    <div class="newboxes" style="clear: both; display: none; overflow: hidden;" id="f36">
                        <ul id="v-menu37" class="v-menu">
                            <li>
                                <p>
                                    LLP Agreement is an agreement with Partners and LLP describing the mutual rights and duties of each partner, the relationships among individual partners and that of each partner with the LLP. The usual elements that can be defined upfront with an LLP Agreement include management and operating procedures, addition of new partners, decision-making methodologies, etc.
                                </p>
                            </li>
                        </ul>
                    </div>
                </li>
                <li>
                    <a href="javascript:showonlyone('f37');" id="toggle38">When the LLP Agreement has to be executed?</a>
                    <div class="newboxes" style="clear: both; display: none; overflow: hidden;" id="f37">
                        <ul id="v-menu38" class="v-menu">
                            <li>
                                <p>
                                    By subscribing LLP incorporation documents, all partners are agreeing to enter into LLP agreement within 30 days. So all partners need to execute and file LLP Agreement within the time.
                                </p>
                            </li>
                        </ul>
                    </div>
                </li>
            </ul>
        </div>
    </div>

    <div class="row" id="divLlpAgreement" style="text-align: justify;" runat="server" visible="false">
        <div class="col-md-12">

            <p>
                LLP Agreement means a written agreement between the partners of the LLP or between the LLP and its partners which determines the mutual rights and duties of the partners and their rights and duties in relation to LLP.

            </p>

            <p>
                A Limited Liability Partnership (LLP) is a body corporate created by law. As per the LLP law, any two persons can incorporate an LLP by subscribing to the incorporation documents. Once an LLP is formed, the rights and duties of partners are governed by Schedule One of the LLP Act, unless the LLP's partners or the LLP and partners create an LLP agreement.

            </p>

            <p>
                The main benefit of a LLP over other incorporated business structures is that maximum contractual freedom is granted to its partners to tailor the LLP agreement in order to meet their needs and interests. Such a level of freedom is not available to a company, given that a majority of its administrative procedures are framed as per prescribed provisions of the Companies Act.

            </p>

            <p>
                So a well defined LLP Agreement is a must for proper functioning of an LLP.

            </p>


        </div>
    </div>

    <div class="row" id="divContentsOfLlpAggrement" style="text-align: justify;" runat="server" visible="false">
        <div class="col-md-12">
            <p>
                A well structured and drafted LLP agreement is very much required for the successful functioning of an LLP. Since an LLP is not a company and provisions of the company law is not applicable to an LLP, the LLP agreement must address all corporate structure related issues in the LLP agreement.

            </p>

            <p>
                CompaniesInn.com has developed customized LLP agreements after careful study of the LLP Act and Rles. Our standard LLP agreement contains the below mentioned provisions:

            </p>

            <ol style="list-style: lower-alpha; margin-left: 30px;">

                <li>Name of the LLP - The name of the LLP shall end with LLP or Limited Liability Partnership as per the provisions of the LLP Act.</li>

                <li>Date of the agreement and parties of agreement  - Since the LLP agreement is executed after incorporation and as per incorporation, the same needs to be executed within 30 days of incorporation, the date of the LLP agreement must be a date within 30 days from the date of incorporation. As per the LLP Act, an LLP agreement is an agreement between partners of LLP or LLP and partners; hence, the parties of the LLP agreement can be all partners or LLP and all partners. For our agreement, the parties are the LLP and its partners.</li>

                <li>Statement of background - This section describes incorporations details, state of registration, activities of LLP, etc.</li>

                <li>Introductory provisions - Definition of terms used in the LLP agreement, name of the LLP and future name changes, initial partners, new partners admission, business activities, power of LLP, duration, management, accounting, auditing, etc.</li>

                <li>Partners' contribution and method of contribution - How each partners contribute, whether they can take back the contributed amount, interest on contribution, etc.</li>

                <li>LLP record keeping and bank arrangement - Method of keeping LLP books and records.</li>

                <li>Allocation and distribution - How profit of the LLP allocated among the partners and how distribution including interim distribution or final distribution in the LLP.</li>

                <li>Capital and current account - What to be credited and debited in each account.</li>

                <li>Disassociation of partner - How a partner needs to be disassociated from the LLP, what are his rights, notice to existing partners, rights over assets of the LLP including termination of a partner from LLP.</li>

                <li>Redemption and cross purchase of rights - How partners' rights can be redeemed from the LLP, method of readmission, cross purchase, etc.</li>

                <li>Issue of partnership rights - Fresh issue of rights in the LLP including admission of new partner.</li>

                <li>Sales, transfer of partnership rights - Procedures for sale of partner rights, transfer of rights, etc. to existing and new partners.</li>

                <li>Partners' meetings and voting - How the meeting needs to be conducted, decision-making process and voting rights are covered in this clause.</li>

                <li>Partners' rights to records - Rights of each partner to inspect records of LLP and copies of the same.</li>

                <li>Management and fiduciary duty - Who will manage the LLP, how day-to-day management function including fiduciary duty of partners in the LLP.</li>

                <li>Arbitration and general provisions: Method of appointing arbitrator, proceedings, etc.</li>

            </ol>
        </div>
    </div>
    <div class="row" id="divLlpAgreementAndTaxPlanning" style="text-align: justify;" runat="server" visible="false">
        <div class="col-md-12">
            <p>
                As per the Income Tax law, an LLP is considered to be a 'firm'; therefore, tax provisions applicable to a firm are also applied to LLPs, provided the following criteria are satisfied:

            </p>

            <ol style="list-style: lower-alpha; margin-left: 30px;">

                <li>The relation of partners is evidenced by an instrument; and</li>

                <li>The individual shares of partners are specified in the instrument.</li>

            </ol>

            <p>
                Therefore, to avail the benefits of a firm under the Income Tax act, the LLP agreement must be an instrument in writing and each partner's partnership interest identified and specified in the LLP agreement.

            </p>

            <p>
                Other considerations to avail tax benefits while drafting LLP agreements are:

            </p>

            <ol style="list-style: lower-alpha; margin-left: 30px;">

                <li>Interest on capital contribution can be availed as a deduction from LLP income within the overall limit if such provision is provided in the agreement.</li>

                <li>Working partners and the remuneration payable to each working partner should be specified in the LLP agreement. A partner can draw salary from the LLP if his name is indicated in the agreement as working partner.</li>

            </ol>

            <p>
                Hence, one must look into these aspects while preparing an LLP agreement to minimize tax liability among the partners including LLP tax.

            </p>

        </div>
    </div>
    <div class="row" id="divTypesOfLlpAgreement" style="text-align: justify;" runat="server" visible="false">

        <div class="col-md-12">
            <p>
                Many people believe that one set of LLP agreements suit all combinations of the LLP. This is wrong; an LLP agreement shall be selected based on the requirements of each case. Following are the main types of LLP agreements. 

            </p>

            <ul style="list-style: disc; margin-left: 20px;">

                <li style="font-weight: bold;">Equal Rights LLP

 <p style="font-weight: normal;">
     This is an LLP with two or more partners having equal rights/powers with respect to profits/losses as well as decision-making authority (1:1 basis). This type of agreement will be applicable if all partners in an LLP contribute equally to the LLP and have the same rights including management rights. In this type of LLP, all partners will be working partners and receive the same remuneration. This is a type of LLP agreement suitable when all partners contribute equally to the management and business of the LLP.

 </p>


                    <li style="font-weight: bold;">Differential Rights LLP

 <p style="font-weight: normal;">
     This is an LLP with two or more partners having variable rights/powers based on the ratio of capital contribution or other such considerations. This type can be further classified into:

 </p>
                        <ul style="margin-left: 30px; list-style: square; font-weight: normal">

                            <li>LLP Agreement wherein rights are in the ratio of contribution and profit share </li>

                            <li>LLP Agreement wherein rights are in the ratio of contribution only but profit rights differ. Management rights may be equal or in the some other ratio</li>

                        </ul>

                        <p></p>

                    </li>



                    <li style="font-weight: bold;">Absolute Rights LLP

 <p style="font-weight: normal;">
     If an LLP is incorporated with by two persons and only one person is appointed as the nominee or in some cases only as the investor. The agreement needs to be drafted in such a way that one person will get all the management as well as decision making power. 

 </p>

                    </li>



                    <li style="font-weight: bold;">Husband &amp; Wife LLP

 <p style="font-weight: normal;">
     An LLP with a husband and wife as partners; such an agreement can have a structure similar to any of the three LLP agreements listed above. Additionally, a special agreement pertaining to tax liability given the LLP partners' personal relationship is required. We have structured this type of LLP Agreement to meet their goals to minimum family tax liability. 

 </p>

                    </li>





                    <li style="font-weight: bold;">Equal Right and Differential Power LLP

 <p style="font-weight: normal;">
     An LLP with more than two partners, each having equal rights, is an Equal Rights LLP. For operational efficiency, this type of LLP agreement typically delegates specific powers to selected partner(s), subject to receiving unanimous consent from all partners. In this type of LLP, partners have equal rights in all aspects; however, by an LLP Agreement, some specific powers are given to particular partners.

 </p>

                    </li>





                    <li style="font-weight: bold;">Differential Rights and Differential Powers LLP

 <p style="font-weight: normal;">
     This is an LLP with multiple partners holding variable rights and powers. The LLP agreement in such a case needs to specifically define rights/powers and duties of each partner. 

 </p>

                    </li>





                    <li style="font-weight: bold;">Partner Managed LLP

 <p style="font-weight: normal;">
     This is an LLP with multiple partners; administrative/management/operational decision-making powers are vested with specific partners (two or more), while all remaining partners are nominal or investing partners, i.e. no decision-making rights.

 </p>

                    </li>





                    <li style="font-weight: bold;">Board Managed LLP

 <p style="font-weight: normal;">
     This is an LLP with multiple partners and the business is managed by a committee of partners, similar to a company's Board of Directors. While overall control is exercised by all LLP partners, day-to-day management and decision-making is handled by the committee/board.

 </p>

                    </li>



                    <li style="font-weight: bold;">Manager Managed LLP

 <p style="font-weight: normal;">
     This is an LLP with multiple partners and the administrative, management and operational decision-making powers are vested with designated employees with specific powers (two or more). In this case, all partners are investing partners without any decision-making rights on day-to-day affairs of the LLP.

 </p>

                    </li>
            </ul>


        </div>
        <div id="divWhyLlpAgreement" style="padding: 10px;" runat="server" visible="false">
            <p>
                LLP incorporation documents (Form 2) makes it compulsory for the partners of every LLP to execute an LLP agreement within 30 days of formation. Hence, if parties to incorporation document agree to sign an LLP agreement within 30 days of formation, they should also execute an LLP agreement within 30 days from incorporation of LLP.

            </p>

            <p>
                LLP agreement clearly defines the mutual rights and duties of each partner, the relationships among individual partners and that of each partner with the LLP. While drafting an LLP agreement, one must look into first schedule of LLP Act as unless LLP Agreement specify clearly otherwise, the respective entries in the schedule apply to LLP. 

            </p>

            <p>
                The usual elements that can be defined upfront with an LLP Agreement include management and operating procedures, addition of new partners, decision-making methodologies, etc.

            </p>

            <p>
                Hence, a comprehensive LLP agreement is a prerequisite for the smooth functioning of an LLP. The LLP agreement is the ultimate, helpful guide for all activities and matters relating to the LLP.

            </p>

            <p>
                Creating a professional LLP agreement requires in-depth knowledge and experience of several legal areas like LLP, corporate and contract laws as well as excellent drafting skills. CompaniesInn.com has this knowledge and experience, having drafted numerous, bespoke LLP agreements for India-based businesses and entrepreneurs.

            </p>
        </div>
    </div>

</asp:Content>

