<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="NameGuidlines.aspx.cs" Inherits="NameGuidlines" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        function showonlyone(thechosenone)
        {
            
            $('.newboxes').each(function (index)
            {
                alert(thechosenone);
                if ($(this).attr("id") == thechosenone)
                {
                    alert($(this).attr("id"));
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
    <div class="row-fluid" style="text-align: justify;">
        <div class="col-md-12">
            <asp:Panel runat="server" ID="pnlLlpNameAvl" Visible="false">
                <h1>Company-LLP Name Availability</h1>
                <p>As a first step towards registering a  Company or LLP, the promoter should get the proposed Company Name approved by  the respective Registrar of Companies (ROC). Company  name approval and allotment process in India is administered by the Ministry of  Corporate Affairs (MCA) as per the Company Name Availability Guidelines issued  under Companies Act 2013 and LLP Name Availability Guidelines issued under LLP  Act 2008.</p>
                <p>The basic concept of name availability is that name proposed for  registration shall no identical or resemble to an existing Company or LLP name.  Also the proposed name shall be within the rules framed by government of India  from time to time.</p>
                <p>Point to be noted before selecting the name.</p>
                <ol style="list-style: decimal; margin-left: 20px;">
                    <li>Check MCA website <a href="http://www.mca.gov.in">www.mca.gov.in</a> for name availability to see that any company is registered with  similar name.</li>
                    <li>Also see any trademark registered or applicable filed for  trademark with proposed name. Use <a href="http://164.100.176.38/tmrpublicsearch/frmmain.aspx">Trademark  Public Search</a> link to check whether any trademark registered for the  proposed name.</li>
                    <li>Ensure that Company Name and activity has a relation such as for  software development for company name XYZ Software Private Limited.</li>
                </ol>
            </asp:Panel>
        </div>
        <div class="col-md-12">
            <asp:Panel runat="server" ID="pnlCompanyName" Visible="false">
                <h1>Company Name</h1>
                <p>
                    Company Name approval and allotment process in India is administered by the Ministry of Corporate Affairs (MCA) as per the Company Name Availability Guidelines issued under Companies Act 2013.
                </p>
                <p>
                    'Company Name' is the name by which a registered Company is being identified. Generally, name of the Company depicts its Trade Name or Brand Name along with its main activities.
                </p>
                <p>
                    In the case of a private limited company, the name shall end with words "Private Limited" or with word "Limited" in case of a public limited company. Company Name has three parts. 'The Name', 'Activity' and words 'Private Limited' or 'Limited' as the case may be. 
                </p>
                <p>
                    For Example 'CompaniesInn.com India Private Limited'. Here, 'CompaniesInn' stands as unique name, '.com' refers to online services, 'India' stands as a 'noun' and 'Private Limited' refers to the mandatory requirement of last words for a Private Limited Company. We have registered the name 'CompaniesInn' as a Trademark. Thereafter when converted to a Limited Liability Partnership, we have changed the name as 'CompaniesInn.com LLP'.
                </p>
                <strong>The Company Name SHOULD </strong>

                <ul style="list-style: disc;">
                    <li>Be unique</li>
                    <li>Contain a noun and an activity word that reflects its objectives</li>
                    <li>Be in line with Company Name Guidelines issued by Ministry of Corporate Affairs.</li>
                </ul>
                <strong>The Company Name SHOULD NOT</strong>
                <ul style="list-style: disc;">
                    <li>Be same, similar, identical or resembling to the name of an existing Company or LLP registered. Phonetically similar names also to be avoided.</li>
                    <li>Be similar of a registered trade mark or a trade mark for which an application has already been filed</li>
                    <li>Be Offensive</li>
                    <li>Be Undesirable in the opinion of the Central Government (Undesirability of names explained separately</li>
                </ul>

            </asp:Panel>
        </div>
        <div class="col-md-12">
            <asp:Panel runat="server" ID="pnlCompanyNameAvl" Visible="false">
                <h1>Company Name Availability</h1>
                <p>
                    Company Name approval and allotment process in India is administered by the Ministry of Corporate Affairs (MCA) as per the Company Name Availability Guidelines issued under Companies Act 2013.
                </p>
                <p>
                    As per the Company Name Availability Guidelines;
                </p>
                <strong>The name of a Company SHOULD</strong>

                <ul style="list-style: disc;">

                    <li>Be unique</li>

                    <li>Contain a noun and an activity word that reflects its objectives</li>

                    <li>Be in line with Company Name Guidelines issued by Ministry of Corporate Affairs.</li>

                </ul>

                <strong>The Company Name SHOULD NOT</strong>

                <ul style="list-style: disc;">

                    <li>Be same, similar, identical or resembling to the name of an existing Company or LLP registered. Phonetically similar names also to be avoided.</li>

                    <li>Be similar of a registered trade mark or a trade mark for which an application has already been filed</li>

                    <li>Be Offensive</li>

                    <li>Be Undesirable in the opinion of the Central Government (Undesirability of names explained separately</li>
                </ul>

                <p>While determining whether a proposed name is identical with another, the  differences on account of the following shall be disregarded;</p>

                <ol style="list-style: lower-alpha;">
                    <li>the words like Private, Pvt, Pvt., (P), Limited, Ltd, Ltd., LLP, Limited  Liability Partnership;</li>
                    <li>words appearing at the end of the names – company, and company, co., co,  corporation, corp, corpn, corp.;</li>
                    <li>plural version of any of the words appearing in the name;</li>
                    <li>type and case of letters, spacing between letters and punctuation marks;</li>
                    <li>joining words together or separating the words does not make a name  distinguishable from a name that uses the similar, separated or joined words;</li>
                    <li>use of a different tense or number of the  same word does not distinguish one name from another;</li>
                    <li>using different phonetic spellings or spelling variations shall not be  considered as distinguishing one name from another. Illustration (For example,  P.Q. Industries limited is existing then P and Q Industries or Pee Que  Industries or P n Q Industries or P &amp; Q Industries shall not be allowed and  similarly if a name contains numeric character like 3, resemblance shall be  checked with ‘Three’ also;)</li>
                    <li>misspelled words, whether intentionally misspelled or not, do not  conflict with the similar, properly spelled words;</li>
                    <li>the addition of an internet related  designation, such as .com, .net, .edu, .gov, .org, .in does not make a name  distinguishable from another, even where (.) is written as ‘dot’; </li>
                    <li>the  addition of words like New, Modern, Nav, Shri, Sri, Shree, Sree, Om, Jai, Sai,  The, etc. does not make a name distinguishable from an existing name and  similarly, if it is different from the name of the existing company only to the  extent of adding the name of the place, the </li>
                </ol>
            </asp:Panel>
        </div>

        <div class="col-md-12">
            <asp:Panel runat="server" ID="pnlUndesirableNames" Visible="false">
                <h1>Company Name - Undesirable Names</h1>
                <p style="font-weight: bold;">
                    The name shall be considered undesirable, if-
                </p>
                <ul style="list-style: decimal;">
                    <li>It Contravenes the provisions of the Emblems and Names (Prevention and Improper Use) Act, 1950;</li>
                    <li>It includes the name of a registered trade mark or a trade mark which is subject of an application for registration, unless the consent of the owner or applicant for registration, of the trade mark, as the case may be, has been obtained and produced by the promoters;</li>
                    <li>It includes any word or words which are offensive to any section of the people;</li>
                </ul>

                <p style="font-weight: bold;">The  name shall also be considered undesirable, if-</p>

                <ol style="list-style: decimal;">

                    <li>the proposed name is identical with or too nearly resembles the  name of a limited liability partnership;</li>

                    <li>it is not in consonance with the principal objects of the company  as set out in the memorandum of association; Provided that every name need not  be necessarily indicative of the objects of the company, but when there is some  indication of objects in the name, then it shall be in conformity with the  objects mentioned in the memorandum;</li>

                    <li>the company’s main business is financing, leasing, chit fund,  investments, securities or combination thereof, such name shall not be allowed  unless the name is indicative of such related financial activities, viz., Chit  Fund or Investment or Loan, etc.; </li>

                    <li>it resembles closely the popular or abbreviated description of an  existing company or limited liability partnership;</li>

                    <li>the proposed name is identical with or too nearly resembles the  name of a company or limited liability partnership incorporated outside India  and reserved by such company or limited liability partnership with the  Registrar:</li>

                    <li>Provided that if a foreign company is incorporating its subsidiary  company in India, then the original name of the holding company as it is may be  allowed with the addition of word India or name of any Indian state or city, if  otherwise available;</li>

                    <li>any part of the proposed name includes the words indicative of a  separate type of business constitution or legal person or any connotation  thereof e.g. co-operative, sehkari, trust, LLP, partnership, society,  proprietor, HUF, firm, Inc., PLC, GmbH, SA, PTE, Sdn, AG etc.;</li>

                    <li>Explanation.- For the purposes of this sub-clause, it is hereby  clarified that the name including phrase ‘Electoral Trust’ may be allowed for  Registration of companies to</li>

                    <li>be formed under section 8 of the Act, in accordance with the  Electoral Trusts Scheme, 2013 notified by the Central Board of Direct Taxes  (CBDT):</li>

                    <li>Provided that name application is accompanied with an affidavit to  the effect that the name to be obtained shall be only for the purpose of  registration of companies under Electoral Trust Scheme as notified by the  Central Board of Direct Taxes;</li>

                    <li>the proposed name contains the words ‘British India’;</li>

                    <li>the proposed name implies association or connection with embassy  or consulate or a foreign government;</li>

                    <li>the proposed name includes or implies association or connection  with or patronage of a national hero or any person held in high esteem or  important personages who occupied or are occupying important positions in  Government;</li>

                    <li>the proposed name is vague or an abbreviated name such as ‘ABC  limited’ or ‘23K limited’ or ‘DJMO’ Ltd: abbreviated name based on the name of  the promoters will not be allowed. For example:- BMCD Limited representing  first alphabet of the name of the promoter like Bharat, Mahesh, Chandan and  David:</li>

                    <li>Provided that existing company may use its abbreviated name as  part of the name for formation of a new company as subsidiary or joint venture  or associate company but such joint venture or associated company shall not  have an abbreviated name only e.g. Delhi Paper Mills Limited can get a joint  venture or associated company as DPM Papers Limited and not as DPM Limited:</li>

                    <li>Provided further that the companies well known in their respective  field by abbreviated names are allowed to change their names to abbreviation of  their existing name after following the requirements of the Act;</li>

                    <li>the proposed name is identical to the name of a company dissolved  as a result of liquidation proceeding and a period of two years have not  elapsed from the date of such dissolution:</li>

                    <li>Provided that if the proposed name is identical with the name of a  company which is struck off in pursuance of action under section 248 of the  Act, then the same shall not be allowed before the expiry of twenty years from  the publication in the Official Gazette being so struck off;</li>

                    <li>it is identical with or too nearly resembles the name of a limited  liability partnership in liquidation or the name of a limited liability  partnership which is struck off up to a period of five years; </li>

                    <li>the proposed name include words such as ‘Insurance’, ‘Bank’,  ‘Stock Exchange’, ‘Venture Capital’, ‘Asset Management’, ‘Nidhi’, ‘Mutual fund’  etc., unless a declaration is submitted by the applicant that the requirements  mandated by the respective regulator, such as IRDA, RBI, SEBI, MCA etc. have  been complied with by the applicant;</li>

                    <li>the proposed name includes the word “State”, the same shall be  allowed only in case the company is a government company;</li>

                    <li>the proposed name is containing only the name of a continent,  country, state, city such as Asia limited, Germany Limited, Haryana Limited,  Mysore Limited;</li>

                    <li>the name is only a general one, like Cotton Textile Mills Ltd. or  Silk Manufacturing Ltd., and not Lakshmi Silk Manufacturing Co. Ltd;</li>

                    <li>it is intended or likely to produce a misleading impression  regarding the scope or scale of its activities which would be beyond the  resources at its disposal:</li>

                    <li>the proposed name includes name of any foreign country or any city  in a foreign country, the same shall be allowed if the applicant produces any  proof of significance of business relations with such foreign country like  Memorandum of Understanding with a company of such country:<br>
                        Provided  that the name combining the name of a foreign country with the use of India  like India Japan or Japan India shall be allowed if, there is a government to  government participation or patronage and no company shall be incorporated  using the name of an enemy country. Explanation.- For the purposes of this  clause, enemy country means so declared by the Central Government from time to  time.

                    </li>

                </ol>
            </asp:Panel>
        </div>

        <div class="col-md-12">
            <asp:Panel runat="server" ID="pnlCompanyNameBusinessNameEtc" Visible="false">
                <h1>Company Name, Business Name, Trademark, Brand Name, Logo and Domain Name</h1>
                <p>
                    <strong>Company Name</strong>
                </p>
                <p>
                    A 'Company Name' generally refers to the name of a business organization, e.g. CompaniesInn.com LLP. It is the registered name of the organization under relevant legal provisions. The Company name should be referred to all communications, documents, letter heads and invoices.
                </p>
                <strong>Business Name</strong>
                <p>
                    A 'Business Name' refers to the trading name, such as 'CompaniesInn'. It is the usual reference of a company in general business use. It can be different from the Company Name. An organization can open a bank account with Business Name.
                </p>
                <strong>Trademark</strong>
                <p>
                    A trademark is typically a name, word, phrase, logo, symbol, image or a combination of these to distinguish a company's products and services from that of others.  A trademark is also used as a marketing tool for creating awareness and recognition of a company's products or services among customers.
                </p>
                <strong>Brand Name</strong>
                <p>
                    A brand name refers to the name of a product or services of a Company. For eg. 'LegalDoC' is product provided by CompaniesInn.com LLP. A Company can have multiple brand names. A Brand Name can be registered as Trademark.
                </p>
                <strong>Logo</strong>
                <p>
                    A logo is the pictorial or symbolic representation of a brand and it need not contain names or taglines. It could just be a line or a curve to identify the product or service. When the logo includes business or brand name or taglines it is referred to as a Composite Mark.
                </p>
                <strong>Domain Name</strong>
                <p>
                    A unique name that identifies an internet resource such as a website is a domain name. It is an identification string that defines a realm of administrative autonomy, authority or control on the Internet. Domain names are formed by the rules Domain Name System (DNS). Any name registered in the DNS is a domain name.
                </p>
            </asp:Panel>
        </div>

        <div class="col-md-12">
            <asp:Panel runat="server" ID="pnlCompanyNameFaq" Visible="false">
                <h1>Company Names - Facts to be disregarded</h1>
                <p>
                <strong>
                    While  determining whether a proposed name is identical with another, the differences  on account of the following shall be disregarded -
                </strong>
               </p>
                <ol style="list-style: lower-alpha;">

                    <li>the words like Private, Pvt, Pvt., (P), Limited, Ltd, Ltd., LLP,  Limited Liability Partnership;</li>

                    <li>words appearing at the end of the names – company, and company,  co., co, corporation, corp, corpn, corp.;</li>

                    <li>plural version of any of the words appearing in the name;</li>

                    <li>type and case of letters, spacing between letters and punctuation  marks;</li>

                    <li>joining words together or separating the words does not make a  name distinguishable from a name that uses the similar, separated or joined  words;</li>

                    <li>use of a different tense or number of the same word does not  distinguish one name from another;</li>

                    <li>using different phonetic spellings or spelling variations shall  not be considered as distinguishing one name from another. Illustration (For  example, P.Q. Industries limited is existing then P and Q Industries or Pee Que  Industries or P n Q Industries or P &amp; Q Industries shall not be allowed and  similarly if a name contains numeric character like 3, resemblance shall be  checked with ‘Three’ also;)</li>

                    <li>misspelled words, whether intentionally misspelled or not, do not  conflict with the similar, properly spelled words;</li>

                    <li>the addition of an internet related designation, such as .com,  .net, .edu, .gov, .org, .in does not make a name distinguishable from another,  even where (.) is written as ‘dot’;</li>

                    <li>the addition of words like New, Modern, Nav, Shri, Sri, Shree,  Sree, Om, Jai, Sai, The, etc. Does not make a name distinguishable from an  existing name and similarly, if it is different from the name of the existing  company only to the extent of adding the name of the place, the same shall not  be allowed; such names may be allowed only if no objection from the existing  company by way of Board resolution is submitted;</li>

                    <li>different combination of the same words does not make a name  distinguishable from an existing name, e.g., if there is a company in existence  by the name of “Builders and Contractors Limited”, the name “Contractors and  Builders Limited” shall not be allowed unless it is change of name of existing  company;</li>

                    <li>if the proposed name is the Hindi or English translation or  transliteration of the name of an existing company or limited liability  partnership in English or Hindi, as the case may be.</li>
                </ol>
            </asp:Panel>
        </div>

        <div class="col-md-12">
            <asp:Panel runat="server" ID="pnlLlpName" Visible="false">
                <h1>Limited Liability Partnership (LLP) Name</h1>
                <p>
                    LLP Name approval and allotment process in India is administered by the Ministry of Corporate Affairs (MCA) as per the LLP Name Availability Guidelines issued under Limited Liability Partnership Act 2008.
                </p>
                <p>
                    'LLP Name' is the name by which a registered LLP is being identified. Generally, name of the LLP depicts its Trade Name or Brand Name along with its main activities.
                </p>
                <p>
                    In the case of a private limited company, the name shall end with words "Private Limited" or with word "Limited" in case of a public limited company. Company Name has three parts. 'The Name', 'Activity' and words 'Private Limited' or 'Limited' as the case may be. 
                </p>
                <p>
                    For Example 'CompaniesInn.com India Private Limited'. Here, 'CompaniesInn' stands as unique name, '.com' refers to online services, 'India' stands as a 'noun' and 'Private Limited' refers to the mandatory requirement of last words for a Private Limited Company. We have registered the name 'CompaniesInn' as a Trademark. Thereafter when converted to a Limited Liability Partnership, we have changed the name as 'CompaniesInn.com LLP'.
                </p>
                <strong>The Company Name SHOULD </strong>
                <ul style="list-style: disc;">
                    <li>Be unique</li>
                    <li>Contain a noun and an activity word that reflects its objectives</li>
                    <li>Be in line with Company Name Guidelines issued by Ministry of Corporate Affairs.</li>
                </ul>
                <strong>The Company Name SHOULD NOT</strong>

                <ul style="list-style: disc;">

                    <li>Be same, similar, identical or resembling to the name of an existing Company or LLP registered. Phonetically similar names also to be avoided.</li>

                    <li>Be similar of a registered trade mark or a trade mark for which an application has already been filed</li>

                    <li>Be Offensive</li>

                    <li>Be Undesirable in the opinion of the Central Government (Undesirability of names explained separately</li>

                </ul>
            </asp:Panel>
        </div>

        <div class="col-md-12">
            <asp:Panel runat="server" ID="pnlLlpNameGuidlines" Visible="false">
                        <h1 class="h1colorblue" style="padding-bottom: 20px; font-size: 28px; text-align: left;">LLP Name Guidelines</h1>

                        <p>
                            LLP name approval and  allotment process in India is admistered by the Ministry of Corporate Affairs  (MCA) as per the Limited Liability Partnership Rules 2009.
                        </p>
                        <p>A name shall not be  allotted to an LLP if;</p>
                        <ol style="list-style: lower-alpha;">

                            <li>It includes any word or words which are offensive to any section of the people; </li>

                            <li>the proposed name is the exact Hindi or English translation of the name of an existing limited liability partnership in English or Hindi, as       the case may be; </li>

                            <li>the proposed name has a close phonetic resemblance to the name of a LLP in existence, for example, J.K. LLP., Jay Kay LLP; </li>

                            <li>it includes the word Co-operative, Sahakari or the equivalent of word 'co- operative' in the regional languages of the country; </li>

                            <li>it connotes the participation or patronage of the Central or State Government, unless circumstances justify to, e.g., a name may be deemed       undesirable in certain context if it includes any of the words such as       National, Union, Central, Federal, Republic, President, Rashtrapati, etc; </li>

                            <li>the proposed name contains the words 'British India'; </li>

                            <li>the proposed name implies association or connection with any Embassy or Consulate or of a foreign government which suggests connection       with local authorities such as Municipal, Panchayat, Zila Parishad or any       other body connected with the Union or State Government; </li>

                            <li>the proposed name is vague like D.I.M.O. Limited liability partnership or I.V.N.R. Limited liability partnership or S.S.R.P Limited       liability partnership;\ </li>

                            <li>it is different from the name or names of the existing limited liability partnership only to the extent of having the name of a place       within brackets before the word ‘limited liability partnership’, for       example, Indian Press (Delhi) LLP should not be allowed in view of the       existence of the LLP named Indian Press LLP; </li>

                            <li>it includes name of registered Trade mark, unless the consent of the owner of the trade mark has been produced; </li>

                            <li>the proposed name is identical with or too nearly resembles the name of a firm or LLP or company incorporated outside India and reserved       by such firm, LLP or company with the registrar in accordance with these       rules; </li>

                            <li>it is identical with or too nearly resembles the name of the limited liability partnership or a company in liquidation or it is       identical with or too nearly resembles names of the LLP or a company which       is struck off, up to the period of 5 years; </li>

                            <li>it includes words like 'Bank', 'Insurance' and 'Banking', ‘Venture capital’ or ‘mutual fund’ or such similar names without the approval of       the regulatory authority; </li>

                            <li>it is intended or likely to produce a misleading impression regarding the scope or scale of its activities which would be beyond the       resources at its disposal; </li>

                            <li>the proposed name includes words like French, British, German etc., unless the partners satisfy that there is some form of collaboration and       connection with the foreigners of that particular country or place, the       name of which is incorporated in the name; </li>

                            <li>the proposed name of limited liability partnership includes the words company secretary, chartered accountant, advocates or such similar       words as indicative of a profession, as part of the proposed name, the       same shall be allowed only after obtaining approval from the Council       governing such profession or such authority as may be nominated by the       Central Government, in this behalf. </li>

                        </ol>

                        <p>
                            <strong>Reservation of Name by  Foreign LLP</strong><br>
                            A foreign LLP or a foreign  company can reserve its existing name (by which it is registered in the country  of incorporation) for registering&nbsp;an LLP in India. Such reservation can be  made initially for three years and can be renewed on a fresh application.
                        </p>

                        <p>&nbsp;</p>

                   
            </asp:Panel>
        </div>

        <div class="col-md-12">
            <asp:Panel runat="server" ID="pnlTrademarkAndCompany" Visible="false">
                        <h1>Trade Mark and Company - LLP Name</h1>
                        <p>
                            The ultimate protection for a company name is secured only by way of a Trademark. The exclusive usage of Business and Trade names are protected by trademark registration. Registering a company or LLP with a particular name does not provide complete protection, except consideration that another company or LLP will not be registered with the same or a closely-resembling name.

                        </p>

                        <p>
                            If any other person registers a trademark with your company name, he gains priority of the name under trademark laws and is empowered to take legal action against your company for infringement of the trademark and can even request for the change of your company registered name.

                        </p>

                        <p>
                            For example, CompaniesInn.com LLP is registered as an LLP. LLP laws protect the name from being registered by another LLP or Company. But the name 'CompaniesInn.com' per se is not protected under the LLP Act. However, 'CompaniesInn.com' is also a registered Trademark under Class 45 of Trade Mark Law. Trademark registration provides maximum protection of the name, barring its use by anyone in any form of organization for delivering services provided by CompaniesInn.com.

                        </p>

                        <p>
                            Once a Trademark is registered, it gives the protection on an exclusive basis for all products or services under the class where the name is registered.

                        </p>

                        <p>
                            The 'Company Name Availability Guidelines ' also gives priority to a registered trademark and to trademarks for which an application is filed while submitting a company name application. If your company name is unique and you'd like to retain exclusive and priority usage of such name, it is advisable to file a Trademark Application before filing a company name application.

                        </p>
                    
            </asp:Panel>
        </div>

        <div class="col-md-12">
            <asp:Panel runat="server" ID="PanelCompanyNameAvlFaq" Visible="false">
                   <h1 class="h1colorblue" style="padding-bottom: 20px; font-size: 28px; text-align: left;">FAQ- Company Name Availability</h1>
                        <a href="javascript:showonlyone('f');" id="A1">How  to Check Company Name Availability</a>
                        <div class="newboxes" style="clear: both; display: none;" id="f">
                            <ul id="Ul1" class="v-menu">
                                <li>
                                    <p>Possibility  of getting a Company Name can be checked by a search at <a href="http://www.mca.gov.in/DCAPortalWeb/dca/MyMCALogin.do?method=setDefaultProperty&amp;mode=16">‘Check Company or LLP Name’</a> at MCA website. You can check the name by providing  proposed ‘Company or LLP Name” and activities.</p>
                                </li>
                            </ul>
                        </div>
                    <ul>
                    <li>
                        <a href="javascript:showonlyone('f1');" id="A2">MCA  search Result shows ‘No Results Found’. Shall I get the searched Name?</a>
                        <div class="newboxes" style="clear: both; display: none;" id="f2">
                            <ul id="Ul2" class="v-menu">
                                <li>
                                    <p>The MCA  Name Search result will only provide the probability of getting the proposed  name. The search result does not guarantee the availability of Company or LLP  name as the name approval is finally granted by office of Registrar of  Companies (ROC). The ROC office will do more refined search of proposed name  and will also check with Trademark Registry as well before grant of a Company  or LLP Name.</p>
                                </li>
                            </ul>
                        </div>
                    </li>

                    <li>
                        <a href="javascript:showonlyone('f2');" id="A3">How  to make a Company Name Application?</a>
                        <div class="newboxes" style="clear: both; display: none;" id="f3">
                            <ul id="Ul3" class="v-menu">
                                <li>
                                    <p>Application  for availability of Company Name has to be filed with the Registrar of  Companies in Form INC-1. It is preferable to submit the application with  multiple names in the order of preference. Company name application must be in  line with the&nbsp;Company Name Guidelines.</p>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li>
                        <a href="javascript:showonlyone('f3');" id="A4">How many Names can be applied with one application?</a>
                        <div class="newboxes" style="clear: both; display: none;" id="f4">
                            <ul id="Ul4" class="v-menu">
                                <li>
                                    <p>Multiple  names can be submitted for approval in one application in the order of  preference. If the first applied name is not available, ROC will approve the  next name. If you are particular about one name, it is preferable to apply with  one name only and in case that name is not available apply the next name at the  time of resubmission of application. Name application can be resubmitted only  once.</p>
                                </li>
                            </ul>
                        </div>
                    </li>


                    <li>
                        <a href="javascript:showonlyone('f4');" id="A5">How long Company Name is valid for Registration?</a>
                        <div class="newboxes" style="clear: both; display: none;" id="f5">
                            <ul id="Ul5" class="v-menu">
                                <li>
                                    <p>Once  approved, the name will be reserved for 60 days from the date of application.  Company registration documents have to be executed and filed within this time  line.</p>
                                </li>
                            </ul>
                        </div>
                    </li>


                    <li>
                        <a href="javascript:showonlyone('f5');" id="A6">What are the conditions for the use name of relatives  for a Company Name?</a>
                        <div class="newboxes" style="clear: both; display: none;" id="f6">
                            <ul id="Ul6" class="v-menu">
                                <li>
                                    <p>In case the key word used in the name proposed is the name of a  person other than the name(s) of the promoters or their close blood relatives,  No objection from such other person(s) shall be attached with the application  for name. In case the name includes the name of relatives, the proof of  relation shall be attached and it shall be mandatory to furnish the  significance and proof thereof for use of coined words made out of the name of  the promoters or their relatives.</p>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li>
                        <a href="javascript:showonlyone('f6');" id="A7">What are the conditions for use existing Sole  proprietor or Partnership name as Company Name?</a>
                        <div class="newboxes" style="clear: both; display: none;" id="f7">
                            <ul id="Ul7" class="v-menu">
                                <li>
                                    <p>The applicant shall provide a declaration to state whether they  are using or have been using in the last five years , the name applied for  incorporation of company or LLP in any other business constitution like Sole  proprietor or Partnership or any other incorporated or unincorporated entity  and if, yes details thereof and No Objection Certificate from other partners  and associates for use of such name by the proposed Company or LLP, as the case  may be, and also a declaration as to whether such other business shall be taken  over by the proposed company or LLP or not .</p>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li>
                        <a href="javascript:showonlyone('f7');" id="A8">What are words that cannot be used Company Name?</a>
                        <div class="newboxes" style="clear: both; display: none;" id="f8">
                            <ul id="Ul8" class="v-menu">
                                <li>
                                    <p>The following words and combinations thereof shall not be used in  the name of a company in English or any of the languages without previous  approval of the Central Government -</p>
                                    <ol style="list-style: lower-alpha;">
                                        <li>Board;</li>
                                        <li>Commission;</li>
                                        <li>Authority;</li>
                                        <li>Undertaking;</li>
                                        <li>National;</li>
                                        <li>Union;</li>
                                        <li>Central;</li>
                                        <li>Federal;</li>
                                        <li>Republic;</li>
                                        <li>President;</li>
                                        <li>Rashtrapati;</li>
                                        <li>Small Scale Industries;</li>
                                        <li>Khadi and Village Industries Corporation;</li>
                                        <li>Financial, Corporation and the like;</li>
                                        <li>Municipal;</li>
                                        <li>Panchayat;</li>
                                        <li>Development Authority;</li>
                                        <li>Prime Minister or Chief Minister;</li>
                                        <li>Minister;</li>
                                        <li>Nation;</li>
                                        <li>Forest corporation;</li>
                                        <li>Development Scheme;</li>
                                        <li>Statute or Statutory;</li>
                                        <li>Court or Judiciary;</li>
                                        <li>Governor;</li>
                                        <li>the use of word Scheme with the name of Government (s) , State ,  India, Bharat or any government authority or in any manner resembling with the  schemes launched by Central, state or local Governments and authorities; and</li>
                                    </ol>
                                    <p>za) Bureau</p>
                                </li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </asp:Panel>
        </div>
    </div>
</asp:Content>

