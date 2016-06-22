<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="ROC.aspx.cs" Inherits="ROC" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    \
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
    <div class="row-fluid">
        <div class="col-md-12">
            <h1 runat="server" id="heading"></h1>
        </div>
        <div class="col-md-12" id="divRocOffices" runat="server" visible="false">

            <p>
                Registration of Companies and Limited Liability Partnership (LLP) in India are regulated by the Companies Act, 2013 and Rules made there under and is administered by the Ministry of Corporate Affairs through offices of the Registrar of Companies (ROC) in each State.
            </p>
            <p>
                Registrars of Companies (ROC) at different states and Union Territories has  primary duty of registering Companies and LLPs floated in their respective jurisdiction and ensuring that such Companies and LLPs comply with statutory requirements under the Companies Act and Limited Liability Partnership Act. 
            </p>
            <p>
                These offices function as registry of records, relating to the companies and LLPs registered with them, which are available for inspection by members of public online via www.mca.gov.in 
            </p>
            <p>
                Address and Contact details of all Registrar of Companies (ROC) in India are as follows:
            </p>

            <ul>
                <li>
                    <a href="javascript:showonlyone('f');" id="toggle1">Andhra pradesh &amp; telangana</a>
                    <div class="newboxes" style="clear: both; display: none;" id="f">
                        <ul id="v-menu1" class="v-menu">
                            <li>
                                <p>

                                    <strong>Sh. N. Krishnamoorty (ROC Hyderabad)</strong><br>
                                    2nd Floor, CPWD Bldg.<br>
                                    Kendriya Sadan, Sultan Bazar, Koti,<br>
                                    Hyderabad - 500195<br>
                                    Phone: 040-4657937,4652807<br>
                                    Fax: 040-4652807<br>
                                    roc.hyderabad@mca.gov.in<br>
                                </p>
                            </li>
                        </ul>
                    </div>
                </li>
                <li>
                    <a href="javascript:showonlyone('f1');" id="toggle2">Bihar &amp; Jharkhand</a>
                    <div class="newboxes" style="clear: both; display: none;" id="f1">
                        <ul id="v-menu2" class="v-menu">
                            <li>
                                <p>

                                    <strong>Sh. U.S Patole (ROC Patna)</strong><br>
                                    Maurya Lok Complex, Block A<br>
                                    Western Wing, 4th Floor,<br>
                                    Dak Banglow Road<br>
                                    Patna - 800001<br>
                                    Phone: 0612-222172<br>
                                    Fax: 0612-222172<br>
                                    roc.patna@mca.gov.in<br>

                                    <br>
                                    <strong>Sh. Swadhin Barua (ROC Ranchi)</strong><br>
                                    House No-239 , Road No-4<br>
                                    Magistrate Colony, Doranda<br>
                                    Ranchi: 834002, Jharkhand<br>
                                    Phone: 0651-2482811/2480801<br>
                                </p>
                            </li>
                        </ul>
                    </div>
                </li>

                <li>
                    <a href="javascript:showonlyone('f2');" id="toggle3">Goa ,Daman &amp; Diu</a>
                    <div class="newboxes" style="clear: both; display: none;" id="f2">
                        <ul id="v-menu3" class="v-menu">
                            <li>
                                <p>

                                    <strong>Sh.P. Sridhar (ROC Goa)</strong><br>
                                    Company Law Bhawan<br>
                                    EDC Comlex, Plot No. 21<br>
                                    Patto, Panaji, Goa-403 001<br>
                                    Phone/Fax(Off) 0832-2438617 / 2438618<br>
                                    roc.goa@mca.gov.in<br>
                                </p>
                            </li>
                        </ul>
                    </div>
                </li>



                <li>
                    <a href="javascript:showonlyone('f3');" id="toggle4">Jammu and Kashmir</a>
                    <div class="newboxes" style="clear: both; display: none;" id="f3">
                        <ul id="v-menu4" class="v-menu">
                            <li>
                                <p>

                                    <strong>Sh. M.K. Bagri (AOL (acting ROC cum OL) J&amp;K</strong><br>
                                    Hall No.405-408,<br>
                                    South Block, Bahu Plaza,<br>
                                    Rail Head Complex,<br>
                                    Jammu - 180012<br>
                                    Phone: 0191-2470306<br>
                                    Fax: 0191-2470306<br>
                                    roc.jammu@mca.gov.in<br>
                                </p>
                            </li>
                        </ul>
                    </div>
                </li>


                <li>
                    <a href="javascript:showonlyone('f4');" id="toggle5">Kerala</a>
                    <div class="newboxes" style="clear: both; display: none;" id="f4">
                        <ul id="v-menu5" class="v-menu">
                            <li>
                                <p>

                                    <strong>Sh. K.G. Joseph Jackson (ROC Ernakulum)</strong><br>
                                    Company Law Bhawan, BMC Road<br>
                                    Thrikkakara<br>
                                    Kochi - 682021<br>
                                    Phone: 0484-2423749/2421489<br>
                                    Fax: 0484-2422327<br>
                                    roc.ernakulum@mca.gov.in<br>
                                </p>
                            </li>
                        </ul>
                    </div>
                </li>



                <li>
                    <a href="javascript:showonlyone('f5');" id="toggle6">Maharashtra</a>
                    <div class="newboxes" style="clear: both; display: none;" id="f5">
                        <ul id="v-menu6" class="v-menu">
                            <li>
                                <p>

                                    <strong>A) Mumbai</strong><br>
                                    Dr. T. Pandian (ROC Mumbai)<br>
                                    100, Everest,<br>
                                    Marine Drive<br>
                                    Mumbai- 400002.<br>
                                    Phone: 022-22812627/22020295/22846954<br>
                                    Fax: 022-22811977<br>
                                    roc.mumbai@mca.gov.in<br>
                                    <br>

                                    <strong>B) Pune</strong><br>
                                    Sh. Vijay Kumar Khubchandani (ROC Pune)<br>
                                    Registrar Of Companies<br>
                                    PMT Building ,<br>
                                    Pune Stock Exchange,<br>
                                    3rd Floor, Deccan Gymkhana,<br>
                                    Pune-411004<br>
                                    Phone: 020-25521376<br>
                                    Fax: 020-25530042<br>
                                    roc.pune@mca.gov.in<br>
                                </p>
                            </li>
                        </ul>
                    </div>
                </li>



                <li>
                    <a href="javascript:showonlyone('f6');" id="A1">Puducherry</a>
                    <div class="newboxes" style="clear: both; display: none;" id="f6">
                        <ul id="Ul1" class="v-menu">
                            <li>
                                <p>
                                    No. 35 First Floor<br>
                                    Elango Nagar<br>
                                    Puducherry - 605011<br>
                                    Phone: 0413-2240129<br>
                                    roc.pondicherry@mca.gov.in<br>
                                </p>
                            </li>
                        </ul>
                    </div>
                </li>


                <li>
                    <a href="javascript:showonlyone('f7');" id="A2">Rajasthan</a>
                    <div class="newboxes" style="clear: both; display: none;" id="f7">
                        <ul id="Ul2" class="v-menu">
                            <li>
                                <p>
                                    <strong>Sh.R.K.Meena (ROC Jaipur)</strong><br>
                                    Corporate Bhawan<br>
                                    G/6-7, Second Floor, Residency Area<br>
                                    Civil Lines, Jaipur-302001<br>
                                    Phone: 0141-2222465,2222466<br>
                                    Fax: 0141-2222464<br>
                                    roc.jaipur@mca.gov.in<br>
                                </p>
                            </li>
                        </ul>
                    </div>
                </li>


                <li>
                    <a href="javascript:showonlyone('f8');" id="A3">Registrar of Companies, Hyderabad</a>
                    <div class="newboxes" style="clear: both; display: none;" id="f8">
                        <ul id="Ul3" class="v-menu">
                            <li>
                                <p>
                                    Andhra Pradesh &amp; Telangana,<br>
                                    2nd Floor, CPWD Bldg., Kendriya Sadan, Sultan Bazar, Koti, Hyderabad - 500195<br>
                                    Phone: 040-4657937,4652807<br>
                                    Fax: 040-4652807<br>
                                    roc.hyderabad@mca.gov.in
                                </p>
                            </li>
                        </ul>
                    </div>
                </li>

                <li>
                    <a href="javascript:showonlyone('f9');" id="A4">Registrar of Companies, Shillong</a>
                    <div class="newboxes" style="clear: both; display: none;" id="f9">
                        <ul id="Ul4" class="v-menu">
                            <li>
                                <p>
                                    Assam , Meghalaya, Manipura, Tripura, Mizoram, Nagaland &amp; Arunachal Pradesh<br>
                                    Morello Building , Ground Floor, Shillong - 793001<br>
                                    Phone: 0364-2222519<br>
                                    roc.shilong@mca.gov.in
                                </p>
                            </li>
                        </ul>
                    </div>
                </li>


                <li>
                    <a href="javascript:showonlyone('f10');" id="A5">Registrar of Companies, Patna</a>
                    <div class="newboxes" style="clear: both; display: none;" id="f10">
                        <ul id="Ul5" class="v-menu">
                            <li>
                                <p>
                                    Bihar<br>
                                    Maurya Lok Complex, Block A, Western Wing, 4th Floor, Dak Banglow Road, Patna - 800001<br>
                                    Phone: 0612-222172<br>
                                    Fax: 0612-222172<br>
                                    roc.patna@mca.gov.in
                                </p>
                            </li>
                        </ul>
                    </div>
                </li>



                <li>
                    <a href="javascript:showonlyone('f11');" id="A6">Office of Registrar of Companies, Ranchi</a>
                    <div class="newboxes" style="clear: both; display: none;" id="f11">
                        <ul id="Ul6" class="v-menu">
                            <li>
                                <p>
                                    Jharkhand<br>
                                    House No-239 , Road No-4, Magistrate Colony, Doranda, Ranchi: 834002, Jharkhand<br>
                                    Phone: 0651-2482811/2480801<br>
                                    roc.patna@mca.gov.in
                                </p>
                            </li>
                        </ul>
                    </div>
                </li>


                <li>
                    <a href="javascript:showonlyone('f12');" id="A7">Registrar of Companies, Bilaspur</a>
                    <div class="newboxes" style="clear: both; display: none;" id="f12">
                        <ul id="Ul7" class="v-menu">
                            <li>
                                <p>
                                    Chattisgarh<br>
                                    Ist Floor, Ashok Pingley Bhawan, Municipal Corporation, Nehru Chowk, Bilaspur- 495001<br>
                                    Phone: (07752)-250092(D),250094<br>
                                    Fax: (07752)- 250093<br>
                                    roc.bilaspur@mca.gov.in
                                </p>
                            </li>
                        </ul>
                    </div>
                </li>


                <li>
                    <a href="javascript:showonlyone('f13');" id="A8">Registrar of Companies, Delhi</a>
                    <div class="newboxes" style="clear: both; display: none;" id="f13">
                        <ul id="Ul8" class="v-menu">
                            <li>
                                <p>
                                    Delhi &amp; Haryana<br>
                                    4th Floor, IFCI Tower, 61, Nehru Place, New Delhi - 110019<br>
                                    Phone: 011-26235707, 26235708, 26235709<br>
                                    Fax: 011-26235702<br>
                                    roc.delhi@mca.gov.in
                                </p>
                            </li>
                        </ul>
                    </div>
                </li>


                <li>
                    <a href="javascript:showonlyone('f14');" id="A9">Registrar of Companies, Goa</a>
                    <div class="newboxes" style="clear: both; display: none;" id="f14">
                        <ul id="Ul9" class="v-menu">
                            <li>
                                <p>
                                    Goa ,Daman &amp; Diu<br>
                                    Company Law Bhawan, EDC Comlex, Plot No. 21, Patto, Panaji, Goa-403 001<br>
                                    Phone/Fax(Off) 0832-2438617 / 2438618<br>
                                    roc.goa@mca.gov.in
                                </p>
                            </li>
                        </ul>
                    </div>
                </li>



                <li>
                    <a href="javascript:showonlyone('f15');" id="A10">Registrar of Companies, Ahmedabad</a>
                    <div class="newboxes" style="clear: both; display: none;" id="f15">
                        <ul id="Ul10" class="v-menu">
                            <li>
                                <p>
                                    Gujarat<br>
                                    ROC Bhavan , Opp Rupal Park Society, Behind Ankur Bus Stop, Naranpura, Ahmedabad-380013<br>
                                    Phone: 079-27437597,<br>
                                    Fax 079-27438371<br>
                                    roc.ahmedabad@mca.gov.in
                                </p>
                            </li>
                        </ul>
                    </div>
                </li>


                <li>
                    <a href="javascript:showonlyone('f16');" id="A11">Registrar of Companies, Jammu &amp; Kashmir</a>
                    <div class="newboxes" style="clear: both; display: none;" id="f16">
                        <ul id="Ul11" class="v-menu">
                            <li>
                                <p>
                                    Jammu and Kashmir<br>
                                    Hall No.405-408, South Block, Bahu Plaza,Rail Head Complex, Jammu – 180012
                                    <br>
                                    Phone: 0191-2470306<br>
                                    Fax: 0191-2470306<br>
                                    roc.jammu@mca.gov.in
                                </p>
                            </li>
                        </ul>
                    </div>
                </li>


                <li>
                    <a href="javascript:showonlyone('f17');" id="A12">Registrar of Companies, Bangalore</a>
                    <div class="newboxes" style="clear: both; display: none;" id="f17">
                        <ul id="Ul12" class="v-menu">
                            <li>
                                <p>
                                    Karnataka<br>
                                    'E' Wing, 2nd Floor, Kendriya Sadana, Kormangala, Bangalore-560034<br>
                                    Phone: 080-25633105 (Direct),<br>
                                    Fax: 080-25538531<br>
                                    roc.bangalore@mca.gov.in
                                </p>
                            </li>
                        </ul>
                    </div>
                </li>


                <li>
                    <a href="javascript:showonlyone('f18');" id="A13">Registrar of Companies, Ernakulum</a>
                    <div class="newboxes" style="clear: both; display: none;" id="f18">
                        <ul id="Ul13" class="v-menu">
                            <li>
                                <p>
                                    Kerala<br>
                                    Company Law Bhawan, BMC Road, Thrikkakara, Kochi - 682021<br>
                                    Phone: 0484-2423749/2421489<br>
                                    Fax: 0484-2422327<br>
                                    roc.ernakulum@mca.gov.in
                                </p>
                            </li>
                        </ul>
                    </div>
                </li>


                <li>
                    <a href="javascript:showonlyone('f19');" id="A14">Registrar of Companies, Gwalior </a>
                    <div class="newboxes" style="clear: both; display: none;" id="f19">
                        <ul id="Ul14" class="v-menu">
                            <li>
                                <p>
                                    Madhya Pradesh<br>
                                    3rd Floor, 'A' Block, Sanjay Complex, Jayendra Ganj, Gwalior<br>
                                    Phone: 0751-2321907<br>
                                    Fax: 0751-2331853<br>
                                    roc.gwalior@mca.gov.in
                                </p>
                            </li>
                        </ul>
                    </div>
                </li>


                <li>
                    <a href="javascript:showonlyone('f20');" id="A15">Registrar of Companies, Mumbai</a>
                    <div class="newboxes" style="clear: both; display: none;" id="f20">
                        <ul id="Ul15" class="v-menu">
                            <li>
                                <p>
                                    Maharashtra-1<br>
                                    100, Everest, Marine Drive, Mumbai- 400002.<br>
                                    Phone: 022-22812627/22020295/22846954<br>
                                    Fax: 022-22811977<br>
                                    roc.mumbai@mca.gov.in
                                </p>
                            </li>
                        </ul>
                    </div>
                </li>


                <li>
                    <a href="javascript:showonlyone('f21');" id="A16">Registrar of Companies, Pune</a>
                    <div class="newboxes" style="clear: both; display: none;" id="f21">
                        <ul id="Ul16" class="v-menu">
                            <li>
                                <p>
                                    Maharashtra-2<br>
                                    PMT Building , Pune Stock Exchange, 3rd Floor, Deccan Gymkhana, Pune-411004<br>
                                    Phone: 020-25521376<br>
                                    Fax: 020-25530042<br>
                                    roc.pune@mca.gov.in
                                </p>
                            </li>
                        </ul>
                    </div>
                </li>


                <li>
                    <a href="javascript:showonlyone('f22');" id="A17">Registrar of Companies, Cuttack</a>
                    <div class="newboxes" style="clear: both; display: none;" id="f22">
                        <ul id="Ul17" class="v-menu">
                            <li>
                                <p>
                                    Orissa<br>
                                    Corporate Bhawan, 3rd Floor, Plot No. 9 (P), Sector : 1, CDA, Cuttack : 753014<br>
                                    Phone: 0671-2365361, 2366958, 266952,<br>
                                    Fax: 0671-2305361<br>
                                    roc.cuttack@mca.gov.in
                                </p>
                            </li>
                        </ul>
                    </div>
                </li>


                <li>
                    <a href="javascript:showonlyone('f23');" id="A18">Registrar of Companies, Pondicherry</a>
                    <div class="newboxes" style="clear: both; display: none;" id="f23">
                        <ul id="Ul18" class="v-menu">
                            <li>
                                <p>
                                    Puducherry<br>
                                    No. 35 First Floor, Elango Nagar, Puducherry - 605011<br>
                                    Phone: 0413-2240129<br>
                                    roc.pondicherry@mca.gov.in
                                </p>
                            </li>
                        </ul>
                    </div>
                </li>


                <li>
                    <a href="javascript:showonlyone('f24');" id="A19">Registrar of Companies, Chandigarh and Shimla</a>
                    <div class="newboxes" style="clear: both; display: none;" id="f24">
                        <ul id="Ul19" class="v-menu">
                            <li>
                                <p>
                                    Punjab , Chandigarh &amp; Himachal Pradesh<br>
                                    Corporate bhawan, Plot No.4 B, Sector 27 B, Madhya Marg, Chandigarh - 160019<br>
                                    Phone: 0172-2639415,2639416<br>
                                    Fax: 0172-2639416<br>
                                    roc.chandigarh@mca.gov.in
                                </p>
                            </li>
                        </ul>
                    </div>
                </li>



                <li>
                    <a href="javascript:showonlyone('f25');" id="A20">Registrar of Companies, Jaipur</a>
                    <div class="newboxes" style="clear: both; display: none;" id="f25">
                        <ul id="Ul20" class="v-menu">
                            <li>
                                <p>
                                    Rajasthan<br>
                                    Corporate Bhawan, G/6-7, Second Floor, Residency Area, Civil Lines, Jaipur-302001<br>
                                    Phone: 0141-2222465,2222466<br>
                                    Fax: 0141-2222464<br>
                                    roc.jaipur@mca.gov.in
                                </p>
                            </li>
                        </ul>
                    </div>
                </li>


                <li>
                    <a href="javascript:showonlyone('f26');" id="A21">Registrar of Companies, Chennai</a>
                    <div class="newboxes" style="clear: both; display: none;" id="f26">
                        <ul id="Ul21" class="v-menu">
                            <li>
                                <p>
                                    Tamil Nadu-1<br>
                                    Block No.6,B Wing 2nd Floor, Shastri Bhawan 26, Haddows Road, Chennai - 600034<br>
                                    Phone: 044-28270071<br>
                                    Fax: 044-28234298<br>
                                    roc.chennai@mca.gov.in
                                </p>
                            </li>
                        </ul>
                    </div>
                </li>


                <li>
                    <a href="javascript:showonlyone('f27');" id="A22">Registrar of Companies, Coimbatore</a>
                    <div class="newboxes" style="clear: both; display: none;" id="f27">
                        <ul id="Ul22" class="v-menu">
                            <li>
                                <p>
                                    Tamil Nadu-2<br>
                                    Stock Exchange Building, II-Floor, 683, Trichy Road, Singanallur, Coimbatore - 641 005<br>
                                    Phone: (0422) - 2318170 (D), 2318089, 2319640<br>
                                    Fax: (0422) - 2318089<br>
                                    roc.coimbatore@mca.gov.in
                                </p>
                            </li>
                        </ul>
                    </div>
                </li>


                <li>
                    <a href="javascript:showonlyone('f28');" id="A23">Registrar of Companies, Kanpur &amp; Nainital</a>
                    <div class="newboxes" style="clear: both; display: none;" id="f28">
                        <ul id="Ul23" class="v-menu">
                            <li>
                                <p>
                                    Uttar Pradesh &amp; Uttarakhand<br>
                                    10/499 B, Allenganj, Khalasi line Kanpur-208002<br>
                                    Phone: 0512-2550688<br>
                                    Fax: 0512-2540423<br>
                                    roc.kanpur@mca.gov.in
                                </p>
                            </li>
                        </ul>
                    </div>
                </li>



                <li>
                    <a href="javascript:showonlyone('f29');" id="A24">Registrar of Companies, Kolkata</a>
                    <div class="newboxes" style="clear: both; display: none;" id="f29">
                        <ul id="Ul24" class="v-menu">
                            <li>
                                <p>
                                    West Bengal<br>
                                    Nizam Palace, 2nd MSO Building, 2nd Floor, 234/4, A.J.C.B. Road Kolkata - 700020<br>
                                    Phone: 033-2287 7390<br>
                                    Fax 033-22903795<br>
                                    roc.kolkata@mca.gov.in
                                </p>
                            </li>
                        </ul>
                    </div>
                </li>

            </ul>

        </div>

        <div class="col-md-12" id="divRocFilingFees" runat="server" visible="false">
            <p style="font-size: 16px">Using this tool you can compute ROC filing fees for filing forms with Ministry of Corporate Affairs(MCA).</p>
            <label for="username" class="contentformlabel">Form Type</label>
            <select class="formfield2" id="ftype" name="ftype">
                <option value="">Select Form Type</option>
                <option value="214">Company Registration</option>
                <option value="216">OPC and Small Company Registration</option>
                <option value="215">LLP Registration</option>
                <option value="208">Increase of Authorized Capital</option>
                <option value="1">Increase of Authorized Capital Other than Small Company</option>
                <option value="210">Company Forms ROC 15 days</option>
                <option value="211">Company Forms ROC 30 days</option>
                <option value="4">Application to Central Goverment RD Etc</option>
                <option value="213">Increase of Contribution LLP</option>
                <option value="212">Filing LLP Form with ROC</option>
            </select>
            <label class="contentformlabel cap2" style="display: block;">Event Date</label><input class="formfield2 cap2 hasDatepicker" name="date" id="date" value="" style="display: inline-block;">
            <label class="contentformlabel">Capital or Contribution</label><input class="formfield2" name="capital" id="capital" value="">
            <label class="contentformlabel capitalinc cap1" style="display: none;">Increased Capital or Contribution</label><input name="capitalinc" class="formfield2 capitalinc cap1" id="capitalinc" value="" style="display: none;">

            <label for="username" class="contentformlabel capitalinc" style="display: none;">State*</label>
            <select class="formfield2 capitalinc" id="state" name="state" style="display: none;">
                <option value="">Select Your Place</option>
                <option value="1">Andaman and Nicobar</option>
                <option value="2">Andhra Pradesh</option>
                <option value="3">Arunachal Pradesh</option>
                <option value="4">Assam</option>
                <option value="5">Bihar</option>
                <option value="6">Chhattisgarh</option>
                <option value="7">Dadra and Nagar Haveli </option>
                <option value="8">Daman and Diu</option>
                <option value="9">Delhi</option>
                <option value="10">Goa</option>
                <option value="11">Gujarat </option>
                <option value="12">Haryana</option>
                <option value="13">Himachal Pradesh</option>
                <option value="14">Jammu and Kashmir</option>
                <option value="15">Jharkhand</option>
                <option value="16">Karnataka</option>
                <option value="17">Kerala</option>
                <option value="18">Lakshdweep</option>
                <option value="19">Madhya Pradesh</option>
                <option value="20">Maharashtra</option>
                <option value="21">Manipur</option>
                <option value="22">Meghalaya</option>
                <option value="23">Mizoram</option>
                <option value="24">Nagaland</option>
                <option value="25">Odisha</option>
                <option value="26">Puducherry</option>
                <option value="27">Punjab</option>
                <option value="28">Rajasthan</option>
                <option value="29">Sikkim</option>
                <option value="30">Tamil Nadu</option>
                <option value="31">Tripura</option>
                <option value="32">Uttar Pradesh</option>
                <option value="33">Uttarakhand</option>
                <option value="34">West Bengal</option>
            </select><hr>
            <div id="contentformsgobutton" style="margin-top: -10px;">
                <button class="gobtn">Get Fee</button>
            </div>
        </div>
    </div>
</asp:Content>

