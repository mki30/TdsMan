<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="Trademark.aspx.cs" Inherits="Trademark" %>

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
    <div class="row-fluid">
        <div class="col-md-12">
            <h1 id="heading" runat="server"></h1>
        </div>
        <div class="col-md-12" id="divTrademarkReg" runat="server" visible="false">
            <p>
                A Trademark is typically a name, word, phrase, logo, symbol, image or a combination of these to distinguish a company's products and services from those of others.  It is also used as a marketing tool to create awareness and recognition of products or services among customers.
            </p>
            <p>
                A trademark is the intellectual property of its holder; and ownership of a trademark flows from the business usage of the trademark.
            </p>
            <p>
                A company/individual should register the trademark in order to possess the complete ownership of the mark and to protect the same from misuse by another person/business entity. Only if the trademark is registered, the owner gets the legal rights to take action against people or companies who infringe on their trademark. 
            </p>
            <p>
                Under trademark, goods and services are categorised into 45 classes. It is very important to identify the class in which the goods/servicesfit into and file an application under the relevant class. If a trademark is used for goods and services under different classes, separate applications are required to be filed under each class to get protection of trademark for the respective goods and services.
            </p>
        </div>
        <div class="col-md-12" id="divTrademarkRegProcess" runat="server" visible="false">

            <p>
            </p>
            <h3 class="h3colorblack">Stage 1:  Classification and Filing of Trademark Application </h3>
            <ul style="list-style: lower-alpha; margin-left: 40px;">
                <li><strong>Classification of Goods and Services </strong>
                    <p>
                        Entire range of goods and services are categorised into 45 Classes under the trademark law. The applicant needs to identify the correct and relevant class under which the trademark should be registered. This is crucial since trademark protection is accorded only in the class where application is filed. If the same trademark is used for goods and services that fall under different classes, then separate applications for each class should be submitted.
                    </p>
                </li>

                <li><strong>Filing of Trademark Application </strong>
                    <p>
                        Once the classification is complete, an application should be submitted to the Trademark Registry along with prescribed details such as the applicant's name and permanent address, the chosen trademark, goods and/or services relating to the chosen trademark, and any other relevant information, along with the specified filing fee. Image(s) of the trademark, if available, should also be filed with the application.
                    </p>
                </li>
            </ul>
            <h3 class="h3colorblack">Stage 2: Examination and Registration of Trademark</h3>

            <ul style="list-style: lower-alpha; margin-left: 40px;">
                <li><strong>Examination of the Application </strong>
                    <p>
                        The trademark examiner reviews the application and prepares an examination report. This process usually takes 8-10 months. The report confirms the validity of the submitted application or alternatively, states any objections and/or other queries that the examiner may have. 
In case of the latter, i.e. if objections and queries are raised by the examiner, the applicant must respond within the stipulated time, else the application is rejected.
                    </p>
                </li>

                <li><strong>Publication of Trademark </strong>
                    <p>
                        If there are no objections or if the applicant's responses to the raised objections are accepted by the Trademark Registry, the application is published in the Trademarks Journal, along with all relevant details, including the applicant's name and address, trademark image, etc.
                    </p>
                    <p>
                        Any person, organisation or other entity can file their opposition to the published application within three months from the date of publication in the Journal. Objections can be raised in instances where the proposed trademark is identical to or closely resembles an already registered trademark. Where such opposition is raised, the applicant needs to submit counter the opposition and the final decision in such matters is made by the Trademark Registry.
                    </p>
                    <p>
                        It is important to note that if the Registry's decision is in favour of the opposing party, the proposed trademark will not registered and moreover, the applicant may be required to pay costs incurred by the opposing party.
                    </p>
                </li>

                <li><strong>Registration of Trademark </strong>
                    <p>
                        If there is no opposition raised within the stipulated period, the trademark will be registered and a registration certificate is issued by the Trademark Registry. The registration certificate is valid for a period of 10 years. Upon expiry, registration should be renewed by filing a fresh application and paying the prescribed renewal fee.
                    </p>
                </li>
            </ul>
            Usually, the trademark registration process in India takes 16-18 months

            <p></p>

        </div>
        <div class="col-md-12" id="divFastTrackTrademarkReg" runat="server" visible="false">

            <p>
                The Trademark Registry provides an expedite route for speeding up the trademark registration process under the fast-track mode by remitting an application fee equal to five times the regular fee for trademark registration.
            </p>
            <p>
                The Trademark Registry takes up the examination of such applications immediately and the examination report will be provided within 3 months of application. Thereafter, publication of the trademark application will also be expedited, if there are no objections raised by the Registry.
            </p>
            <p>
                By following this expedited application process, the overall time for completing trademark registration can be reduced to 6-8 months.

            </p>

        </div>
        <div class="col-md-12" id="divTrademarkClassification" runat="server" visible="false">
            (The Fourth Schedule to Trade Marks Rules, 2002)
            <h3>GOODS / PRODUCTS</h3>

            <h4>CLASSES:</h4>

            <div class="middle">
                <div class="listing_option">
                    <div style="border-top: 0px solid rgb(208, 209, 210); padding-top: 5px;" class="picturebox od-eq">
                        <div class="content">
                            <div class="short_discription">
                                <span class="brd_acc88">Classes 1</span>
                                <p>
                                    Chemical used in  industry, science, photography, agriculture, horticulture and forestry; unprocessed  artificial resins, unprocessed plastics; manures; fire extinguishing  compositions; tempering and soldering preparations; chemical substances for  preserving foodstuffs; tanning substances; adhesive used in industry...
                                </p>
                            </div>
                            <div class="discription">
                                <span class="brd_acc88">Classes 1</span><br>
                                <ul style="margin-left: 20px; list-style: disc;">
                                    <li>Chemicals used in industry, science and photography, as well as in agriculture, horticulture and forestry</li>
                                    <li>unprocessed artificial resins, unprocessed plastics</li>
                                    <li>manures</li>
                                    <li>fire extinguishing compositions</li>
                                    <li>tempering and soldering preparations</li>
                                    <li>chemical substances for preserving foodstuffs</li>
                                    <li>tanning substances</li>
                                    <li>adhesives used in industry</li>
                                </ul>
                                <strong>Explanatory Note</strong>
                                <p>Class 1 includes mainly chemical products used in industry, science and agriculture, including those which go to the making of products belonging to other classes.</p>

                                This Class includes, in particular:<ul>

                                    <li>compost</li>
                                    <li>salt for preserving other than for foodstuffs</li>
                                </ul>
                                This Class does not include, in particular:
                                <ul type="disc">
                                    <li>raw natural resins</li>
                                    <li>chemical products for use in medical science</li>
                                    <li>fungicides, herbicides and preparations for destroying vermin</li>
                                    <li>adhesives for stationery or household purposes</li>
                                    <li>salt for preserving foodstuffs</li>
                                    <li>straw mulch</li>
                                </ul>

                            </div>
                        </div>
                        <div class="clear"></div>
                        <button class="readmore">Read More</button>
                        <button style="display: none;" class="less">Less</button>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>

            <div class="middle">
                <div class="listing_option">
                    <div style="border-top: 0px solid rgb(208, 209, 210); padding-top: 5px;" class="picturebox od-eq">
                        <div class="content">
                            <div class="short_discription">
                                <span class="brd_acc88">Classes 2</span>
                                <p>
                                    Paints, varnishes, lacquers; preservatives against rust and against deterioration of wood; colorants; mordents; raw natural resins; metals in foil and powder form for painters; decorators; printers and artists...
                                </p>
                            </div>
                            <div class="discription">
                                <span class="brd_acc88">Classes 2</span>
                                <ul type="disc">
                                    <li>Paints, varnishes, lacquers</li>
                                    <li>preservatives against rust and against deterioration of wood</li>
                                    <li>colorants</li>
                                    <li>mordants</li>
                                    <li>raw natural resins</li>
                                    <li>metals in foil and powder form for painters, decorators, printers and artists.</li>
                                </ul>
                                <strong>Explanatory Note</strong><br>
                                <br>
                                Class 2 includes mainly paints, colorants  and preparations used for the protection against corrosion.<br>
                                <br>
                                This Class includes, in particular:
	      <ul>
              <li>paints, varnishes and lacquers for industry,       handicrafts and arts</li>
              <li>dyestuffs for clothing </li>
              <li>colorants for foodstuffs and beverages</li>
          </ul>
                                This Class does not include, in  particular:
	      <ul type="disc">
              <li>unprocessed artificial resins</li>
              <li>laundry blueing</li>
              <li>cosmetic dyes</li>
              <li>paint boxes (articles for use in school) </li>
              <li>insulating paints and varnishes </li>
          </ul>
                            </div>
                        </div>
                        <div class="clear"></div>
                        <button class="readmore">Read More</button>
                        <button style="display: none;" class="less">Less</button>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>


            <div class="middle">
                <div class="listing_option">
                    <div style="border-top: 0px solid rgb(208, 209, 210); padding-top: 5px;" class="picturebox od-eq">
                        <div class="content">
                            <div class="short_discription">
                                <span class="brd_acc88">Classes 3</span>
                                <p>
                                    Bleaching preparations and other substances for laundry use; cleaning; polishing; scouring and abrasive preparations; soaps; perfumery, essential oils, cosmetics, hair lotions, dentifrices....
                                </p>
                            </div>
                            <div class="discription">
                                <span class="brd_acc88">Classes 3</span>
                                <ul type="disc">
                                    <li>Bleaching preparations and other  substances for laundry use</li>
                                    <li>cleaning, polishing, scouring and abrasive preparations</li>
                                    <li>soaps</li>
                                    <li>perfumery, essential oils, cosmetics, hair lotions</li>
                                    <li>dentifrices</li>
                                </ul>
                                <strong>Explanatory Note</strong><br>
                                <br>
                                Class 3 includes mainly cleaning  preparations and toilet preparations.<br>
                                <br>
                                This Class includes, in particular:
	      <ul>
              <li>deodorants for personal use </li>
              <li>sanitary preparations being toiletries </li>
          </ul>
                                <p>This Class does not include, in  particular:</p>
                                <ul type="disc">
                                    <li>chemical chimney cleaners</li>
                                    <li>degreasing preparations for use in manufacturing       processes </li>
                                    <li>deodorants other than for personal use </li>
                                    <li>sharpening stones and grindstones (hand tools)</li>
                                </ul>
                            </div>
                        </div>
                        <div class="clear"></div>
                        <button class="readmore">Read More</button>
                        <button style="display: none;" class="less">Less</button>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>

            <div class="middle">
                <div class="listing_option">
                    <div style="border-top: 0px solid rgb(208, 209, 210); padding-top: 5px;" class="picturebox od-eq">
                        <div class="content">
                            <div class="short_discription">
                                <span class="brd_acc88">Classes 4</span>
                                <p>
                                    Industrial oils and greases; lubricants; dust absorbing, wetting and binding compositions; fuels (including motor spirit) and illuminants; candles, wicks.....
                                </p>
                            </div>
                            <div class="discription">
                                <span class="brd_acc88">Classes 4</span>
                                <ul type="disc">
                                    <li>Industrial oils and greases</li>
                                    <li>lubricants</li>
                                    <li>dust absorbing, wetting and binding compositions</li>
                                    <li>fuels (including motor spirit) and illuminants</li>
                                    <li>candles and wicks for lighting</li>
                                </ul>
                                <strong>Explanatory Note</strong><br>
                                Class 4 includes mainly industrial  oils and greases, fuels and illuminants.<br>
                                <br>
                                This Class does not include, in  particular:
	      <ul>
              <li>certain special industrial oils and greases (consult       the Alphabetical List of Goods)</li>
          </ul>
                            </div>
                        </div>
                        <div class="clear"></div>
                        <button class="readmore">Read More</button>
                        <button style="display: none;" class="less">Less</button>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>

            <div class="middle">
                <div class="listing_option">
                    <div style="border-top: 0px solid rgb(208, 209, 210); padding-top: 5px;" class="picturebox od-eq">
                        <div class="content">
                            <div class="short_discription">
                                <span class="brd_acc88">Classes 5</span>
                                <p>
                                    Pharmaceutical, veterinary and sanitary preparations; dietetic substances adapted for medical use, food for babies; plasters, materials for dressings; materials for stopping teeth, dental wax; disinfectants; preparation for destroying vermin; fungicides, herbicides.....
                                </p>
                            </div>
                            <div class="discription">
                                <span class="brd_acc88">Classes 5</span>
                                <ul type="disc">
                                    <li>Pharmaceutical and veterinary  preparations</li>
                                    <li>sanitary preparations for medical purposes</li>
                                    <li>dietetic substances adapted for medical use, food for babies</li>
                                    <li>plasters, materials for dressings</li>
                                    <li>material for stopping teeth, dental wax</li>
                                    <li>disinfectants</li>
                                    <li>preparations for destroying vermin</li>
                                    <li>fungicides, herbicides</li>
                                </ul>
                                <strong>Explanatory Note</strong><br>
                                Class 5 includes mainly  pharmaceuticals and other preparations for medical purposes.<br>
                                <br>
                                This Class includes, in particular:
	      <ul>
              <li>sanitary preparations for personal hygiene, other than       toiletries</li>
              <li>deodorants other than for personal use</li>
              <li>cigarettes without tobacco, for medical purposes </li>
          </ul>
                                <p>This Class does not include, in  particular:</p>
                                <ul type="disc">
                                    <li>sanitary preparations being toiletries</li>
                                    <li>deodorants for personal use</li>
                                    <li>supportive bandages </li>
                                </ul>
                            </div>
                        </div>
                        <div class="clear"></div>
                        <button class="readmore">Read More</button>
                        <button style="display: none;" class="less">Less</button>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>


            <div class="middle">
                <div class="listing_option">
                    <div style="border-top: 0px solid rgb(208, 209, 210); padding-top: 5px;" class="picturebox od-eq">
                        <div class="content">
                            <div class="short_discription">
                                <span class="brd_acc88">Classes 6</span>
                                <p>
                                    Common metals and their alloys; metal building materials; transportable buildings of metal; materials of metal for railway tracks; non-electric cables and wires of common metal; ironmongery, small items of metal hardware; pipes and tubes of metal; safes; goods of common metal not included in other classes; ores....
                                </p>
                            </div>
                            <div class="discription">
                                <span class="brd_acc88">Classes 6</span>

                                <ul type="disc">
                                    <li>Common metals and their alloys</li>
                                    <li>metal building materials</li>
                                    <li>transportable buildings of metal</li>
                                    <li>materials of metal for railway tracks</li>
                                    <li>non-electric cables and wires of common metal</li>
                                    <li>ironmongery, small items of metal hardware</li>
                                    <li>pipes and tubes of metal</li>
                                    <li>safes<br>
                                        goods of common metal not included in other classes</li>
                                    <li>ores</li>
                                </ul>
                                <p>
                                    <strong>Explanatory Note</strong><br>
                                    Class 6 includes mainly unwrought  and partly wrought common metals as well as simple products made of them.<br>
                                    <br>
                                    This Class does not include, in  particular:
                                </p>
                                <ul>
                                    <li>bauxite </li>
                                    <li>mercury, antimony, alkaline and alkaline-earth metals </li>
                                    <li>metals in foil and powder form for painters,       decorators, printers and artists </li>
                                </ul>
                            </div>
                        </div>
                        <div class="clear"></div>
                        <button class="readmore">Read More</button>
                        <button style="display: none;" class="less">Less</button>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>

            <div class="middle">
                <div class="listing_option">
                    <div style="border-top: 0px solid rgb(208, 209, 210); padding-top: 5px;" class="picturebox od-eq">
                        <div class="content">
                            <div class="short_discription">
                                <span class="brd_acc88">Classes 7</span>
                                <p>
                                    Machines and machine tools; motors and engines (except for land vehicles); machine coupling and transmission components (except for land vehicles); agricultural implements other than hand-operated; incubators for eggs....
                                </p>
                            </div>
                            <div class="discription">
                                <span class="brd_acc88">Classes 7</span>
                                <ul type="disc">
                                    <li>Machines and machine tools</li>
                                    <li>motors and engines (except for land vehicles)</li>
                                    <li>machine coupling and transmission components (except for land vehicles)</li>
                                    <li>agricultural implements other than hand-operated</li>
                                    <li>incubators for eggs</li>
                                </ul>
                                <strong>Explanatory Note</strong><br>
                                Class 7 includes mainly machines,  machine tools, motors and engines.<br>
                                <br>
                                This Class includes, in particular:
	      <ul>
              <li>parts of motors and engines (of all kinds); </li>
              <li>electric cleaning machines and apparatus. </li>
          </ul>
                                This Class does not include, in  particular:
	      <ul type="disc">
              <li>certain special machines and machine tools (consult the       Alphabetical List of Goods) </li>
              <li>hand tools and implements, hand-operated</li>
              <li>motors and engines for land vehicles</li>
          </ul>
                            </div>
                        </div>
                        <div class="clear"></div>
                        <button class="readmore">Read More</button>
                        <button style="display: none;" class="less">Less</button>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>

            <div class="middle">
                <div class="listing_option">
                    <div style="border-top: 0px solid rgb(208, 209, 210); padding-top: 5px;" class="picturebox od-eq">
                        <div class="content">
                            <div class="short_discription">
                                <span class="brd_acc88">Classes 8</span>
                                <p>
                                    Hand tools and implements (hand-operated); cutlery; side arms; razors....
                                </p>
                            </div>
                            <div class="discription">
                                <span class="brd_acc88">Classes 8</span>
                                <ul type="disc">
                                    <li>Hand tools and implements  (hand-operated)</li>
                                    <li>cutlery</li>
                                    <li>side arms</li>
                                    <li>razors</li>
                                </ul>
                                <p>
                                    <strong>Explanatory Note</strong><br>
                                    Class 8 includes mainly  hand-operated implements used as tools in the respective professions.
                                </p>
                                <p>This Class includes, in particular: </p>
                                <ul>
                                    <li>cutlery of precious metals; </li>
                                    <li>electric razors and clippers (hand instruments) </li>
                                </ul>
                                <p>This Class does not include, in  particular:</p>
                                <ul type="disc">
                                    <li>certain special instruments (consult the Alphabetical       List of Goods)</li>
                                    <li>machine tools and implements driven by a motor </li>
                                    <li>surgical cutlery </li>
                                    <li>paper knives </li>
                                    <li>fencing weapons </li>
                                </ul>
                            </div>
                        </div>
                        <div class="clear"></div>
                        <button class="readmore">Read More</button>
                        <button style="display: none;" class="less">Less</button>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>

            <div class="middle">
                <div class="listing_option">
                    <div style="border-top: 0px solid rgb(208, 209, 210); padding-top: 5px;" class="picturebox od-eq">
                        <div class="content">
                            <div class="short_discription">
                                <span class="brd_acc88">Classes 9</span>
                                <p>
                                    Scientific, nautical, surveying, electric, photographic, cinematographic, optical, weighing, measuring, signalling, checking (supervision), life saving and teaching apparatus and instruments; apparatus for recording, transmission or reproduction of sound or images; magnetic data carriers, recording discs; automatic vending machines and mechanisms for coin-operated apparatus; cash registers, calculating machines, data processing equipment and computers; fire extinguishing apparatus.....
                                </p>
                            </div>
                            <div class="discription">
                                <span class="brd_acc88">Classes 9</span>
                                <ul type="disc">
                                    <li>Scientific, nautical, surveying,  photographic, cinematographic, optical, weighing, measuring, signalling,  checking (supervision), life-saving and teaching apparatus and instruments</li>
                                    <li>apparatus and instruments for conducting, switching, transforming,  accumulating, regulating or controlling electricity</li>
                                    <li>apparatus for recording, transmission or reproduction of sound or images</li>
                                    <li>magnetic data carriers, recording discs</li>
                                    <li>automatic vending machines and mechanisms for coin-operated apparatus</li>
                                    <li>cash registers, calculating machines, data processing equipment and computers</li>
                                    <li>fire-extinguishing apparatus.</li>
                                </ul>
                                <strong>Explanatory Note</strong><br>
                                <br>
                                This Class includes, in particular:
	      <ul>
              <li>apparatus and instruments for scientific research in       laboratories </li>
              <li>apparatus and instruments for controlling ships, such       as apparatus and instruments for measuring and for transmitting orders</li>
              <li>the following electrical apparatus and instruments:
	          <ol>
                  <li>certain electrothermic tools and apparatus, such as        electric soldering irons, electric flat irons which, if they were not        electric, would belong to Class 8</li>
                  <li>apparatus and devices which, if not electrical, would        be listed in various classes, i.e., electrically heated clothing,        cigar-lighters for automobiles </li>
              </ol>
              </li>
              <li>protractors</li>
              <li>punched card office machines</li>
              <li>amusement apparatus adapted for use with an external       display screen or monitor</li>
              <li>all computer programs and software regardless of       recording media or means of dissemination, that is, software recorded on       magnetic media or downloaded from a remote computer network </li>
          </ul>
                                This Class does not include, in  particular:
	      <ul type="disc">
              <li>the following electrical apparatus and instruments: </li>
              <ol start="1" type="1">
                  <li>electromechanical apparatus for the kitchen (grinders        and mixers for foodstuffs, fruit presses, electrical coffee mills, etc.),        and certain other apparatus and instruments driven by an electrical        motor, all coming under Class 7</li>
                  <li>electric razors and clippers (hand instruments) </li>
                  <li>electric toothbrushes and combs</li>
                  <li>electrical apparatus for space heating or for the        heating of liquids, for cooking, ventilating, etc.</li>
              </ol>
              <li>clocks and watches and other chronometric instruments</li>
              <li>control clocks </li>
          </ul>
                            </div>
                        </div>
                        <div class="clear"></div>
                        <button class="readmore">Read More</button>
                        <button style="display: none;" class="less">Less</button>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>

            <div class="middle">
                <div class="listing_option">
                    <div style="border-top: 0px solid rgb(208, 209, 210); padding-top: 5px;" class="picturebox od-eq">
                        <div class="content">
                            <div class="short_discription">
                                <span class="brd_acc88">Classes 10</span>
                                <p>
                                    Surgical, medical, dental and veterinary apparatus and instruments, artificial limbs, eyes and teeth; orthopaedic articles; suture materials.....
                                </p>
                            </div>
                            <div class="discription">
                                <span class="brd_acc88">Classes 10</span>
                                <ul>
                                    <li>Surgical, medical, dental and  veterinary apparatus and instruments, artificial limbs, eyes and teeth</li>
                                    <li>orthopedic articles</li>
                                    <li>suture materials.</li>
                                </ul>
                                <p>
                                    <strong>Explanatory Note</strong><br>
                                    Class 10 includes mainly medical  apparatus, instruments and articles.<br>
                                </p>
                                <p>This Class includes, in particular:</p>
                                <ul type="disc">
                                    <li>special furniture for medical use; </li>
                                    <li>hygienic rubber articles (consult the Alphabetical List       of Goods); </li>
                                    <li>supportive bandages. </li>
                                </ul>
                            </div>
                        </div>
                        <div class="clear"></div>
                        <button class="readmore">Read More</button>
                        <button style="display: none;" class="less">Less</button>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>

            <div class="middle">
                <div class="listing_option">
                    <div style="border-top: 0px solid rgb(208, 209, 210); padding-top: 5px;" class="picturebox od-eq">
                        <div class="content">
                            <div class="short_discription">
                                <span class="brd_acc88">Classes 11</span>
                                <p>
                                    Apparatus for lighting, heating, steam generating, cooking, refrigerating, drying ventilating, water supply and sanitary purposes.....
                                </p>
                            </div>
                            <div class="discription">
                                <span class="brd_acc88">Classes 11</span>
                                Apparatus for lighting, heating,  steam generating, cooking, refrigerating, drying, ventilating, water supply and  sanitary purposes.
          <p><strong>Explanatory Note</strong></p>
                                <p>This Class includes, in particular:</p>
                                <ul type="disc">
                                    <li>air conditioning apparatus; </li>
                                    <li>bedwarmers, hot water bottles, warming pans, electric       or non-electric; </li>
                                    <li>electrically heated cushions (pads) and blankets, not       for medical purposes; </li>
                                    <li>electric kettles; </li>
                                    <li>electric cooking utensils. </li>
                                </ul>
                                <p>This Class does not include, in  particular:</p>
                                <ul type="disc">
                                    <li>steam producing apparatus (parts of machines) </li>
                                    <li>electrically heated clothing  </li>
                                </ul>
                            </div>
                        </div>
                        <div class="clear"></div>
                        <button class="readmore">Read More</button>
                        <button style="display: none;" class="less">Less</button>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>

            <div class="middle">
                <div class="listing_option">
                    <div style="border-top: 0px solid rgb(208, 209, 210); padding-top: 5px;" class="picturebox od-eq">
                        <div class="content">
                            <div class="short_discription">
                                <span class="brd_acc88">Classes 12</span>
                                <p>
                                    Vehicles; apparatus for locomotion by land, air or water....
                                </p>
                            </div>
                            <div class="discription">
                                <span class="brd_acc88">Classes 12</span>
                                <ul>
                                    <li>Vehicles</li>
                                    <li>apparatus for locomotion by land, air or water.</li>
                                </ul>
                                <p>
                                    <strong>Explanatory Note</strong><br>
                                    <br>
                                    This Class includes, in particular:
                                </p>
                                <ul type="disc">
                                    <li>motors and engines for land vehicles</li>
                                    <li>couplings and transmission components for land       vehicles</li>
                                    <li>air cushion vehicles</li>
                                </ul>
                                <p>This Class does not include, in  particular:</p>
                                <ul type="disc">
                                    <li>certain parts of vehicles (consult the Alphabetical       List of Goods)</li>
                                    <li>railway material of metal  </li>
                                    <li>motors, engines, couplings and transmission components       other than for land vehicles </li>
                                    <li>parts of motors and engines (of all kinds)</li>
                                </ul>
                            </div>
                        </div>
                        <div class="clear"></div>
                        <button class="readmore">Read More</button>
                        <button style="display: none;" class="less">Less</button>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>

            <div class="middle">
                <div class="listing_option">
                    <div style="border-top: 0px solid rgb(208, 209, 210); padding-top: 5px;" class="picturebox od-eq">
                        <div class="content">
                            <div class="short_discription">
                                <span class="brd_acc88">Classes 13</span>
                                <p>
                                    Firearms; ammunition and projectiles; explosives; fire works....
                                </p>
                            </div>
                            <div class="discription">
                                <span class="brd_acc88">Classes 13</span>
                                <ul>
                                    <li>Firearms</li>
                                    <li>ammunition and projectiles</li>
                                    <li>explosives</li>
                                    <li>fireworks.</li>
                                </ul>
                                <p>
                                    <strong>Explanatory Note</strong><br>
                                    Class 13 includes mainly firearms  and pyrotechnical products.<br>
                                </p>
                                <p>This Class does not include, in  particular:</p>
                                <ul type="disc">
                                    <li>matches </li>
                                </ul>
                            </div>
                        </div>
                        <div class="clear"></div>
                        <button class="readmore">Read More</button>
                        <button style="display: none;" class="less">Less</button>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>

            <div class="middle">
                <div class="listing_option">
                    <div style="border-top: 0px solid rgb(208, 209, 210); padding-top: 5px;" class="picturebox od-eq">
                        <div class="content">
                            <div class="short_discription">
                                <span class="brd_acc88">Classes 14</span>
                                <p>
                                    Precious metals and their alloys and goods in precious metals or coated therewith, not included in other classes; jewellery, precious stones; horological and other chronometric instruments....
                                </p>
                            </div>
                            <div class="discription">
                                <span class="brd_acc88">Classes 14</span>
                                <ul>
                                    <li>Precious metals and their alloys and  goods in precious metals or coated therewith, not included in other classes</li>
                                    <li>jewellery, precious stones</li>
                                    <li>horological and chronometric instruments.<br>
                                    </li>
                                </ul>
                                <p>
                                    <strong>Explanatory Note</strong><br>
                                    Class 14 includes mainly precious  metals, goods in precious metals not included in other classes and, in general  jewellery, clocks and watches.<br>
                                </p>
                                <p>This Class includes, in particular:</p>
                                <ul type="disc">
                                    <li>jewellery (i.e., imitation jewellery and jewellery of       precious metal and stones); </li>
                                    <li>cuff links, tie pins. </li>
                                </ul>
                                <p>This Class does not include, in  particular:</p>
                                <ul type="disc">
                                    <li>goods in precious metals classified according to their       function or purpose, for example, metals in foil and powder form for       painters, decorators, printers and artists,       amalgam of gold for dentists, cutlery,       electric contacts, pen nibs of gold,       teapots, gold and silver embroidery,       cigar boxes; </li>
                                    <li>objects of art not of precious metals (classified       according to the material of which they consist). </li>
                                </ul>
                            </div>
                        </div>
                        <div class="clear"></div>
                        <button class="readmore">Read More</button>
                        <button style="display: none;" class="less">Less</button>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>

            <div class="middle">
                <div class="listing_option">
                    <div style="border-top: 0px solid rgb(208, 209, 210); padding-top: 5px;" class="picturebox od-eq">
                        <div class="content">
                            <div class="short_discription">
                                <span class="brd_acc88">Classes 15</span>
                                <p>
                                    Musical instruments....
                                </p>
                            </div>
                            <div class="discription">
                                <span class="brd_acc88">Classes 15</span>
                                <ul>
                                    <li>Musical instruments</li>
                                </ul>
                                <p>
                                    <strong>Explanatory Note</strong><br>
                                    This Class includes, in particular:
                                </p>
                                <ul type="disc">
                                    <li>mechanical pianos and their accessories </li>
                                    <li>musical boxes</li>
                                    <li>electrical and electronic musical instruments</li>
                                </ul>
                                <p>This Class does not include, in  particular:</p>
                                <ul type="disc">
                                    <li>apparatus for the recording, transmission,       amplification and reproduction of sound </li>
                                </ul>
                            </div>
                        </div>
                        <div class="clear"></div>
                        <button class="readmore">Read More</button>
                        <button style="display: none;" class="less">Less</button>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>

            <div class="middle">
                <div class="listing_option">
                    <div style="border-top: 0px solid rgb(208, 209, 210); padding-top: 5px;" class="picturebox od-eq">
                        <div class="content">
                            <div class="short_discription">
                                <span class="brd_acc88">Classes 16</span>
                                <p>
                                    Paper, cardboard and goods made from these materials, not included in other classes; printed matter; bookbinding material; photographs; stationery; adhesives for stationery or household  purposes; artists' materials; paint brushes; typewriters and office requisites (except furniture); instructional and teaching material (except apparatus); plastic materials for packaging (not included in other classes); playing cards; printers' type; printing blocks....
                                </p>
                            </div>
                            <div class="discription">
                                <span class="brd_acc88">Classes 16</span>
                                <ul>
                                    <li>Paper, cardboard and goods made from  these materials, not included in other classes;</li>
                                    <li>printed matter;<br>
                                    </li>
                                    <li>bookbinding material;<br>
                                    </li>
                                    <li>photographs;<br>
                                    </li>
                                    <li>stationery;<br>
                                    </li>
                                    <li>adhesives for stationery or household purposes;<br>
                                    </li>
                                    <li>artists' materials;<br>
                                    </li>
                                    <li>paint brushes;<br>
                                    </li>
                                    <li>typewriters and office requisites (except furniture);<br>
                                    </li>
                                    <li>instructional and teaching material (except apparatus);<br>
                                    </li>
                                    <li>plastic materials for packaging (not included in other classes);<br>
                                    </li>
                                    <li>printers' type;<br>
                                    </li>
                                    <li>printing blocks.<br>
                                    </li>
                                </ul>
                                <p>
                                    <strong>Explanatory Note</strong><br>
                                    Class 16 includes mainly paper,  goods made from that material and office requisites.
                                </p>
                                <p>This Class includes, in particular:</p>
                                <ul type="disc">
                                    <li>paper knives</li>
                                    <li>duplicators</li>
                                    <li>plastic sheets, sacks and bags for wrapping and       packaging </li>
                                </ul>
                                <p>This Class does not include, in  particular:</p>
                                <ul type="disc">
                                    <li>certain goods made of paper and cardboard (consult the       Alphabetical List of Goods)</li>
                                    <li>colours</li>
                                    <li>hand tools for artists (for example, spatulas,       sculptors' chisels) </li>
                                </ul>
                            </div>
                        </div>
                        <div class="clear"></div>
                        <button class="readmore">Read More</button>
                        <button style="display: none;" class="less">Less</button>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>

            <div class="middle">
                <div class="listing_option">
                    <div style="border-top: 0px solid rgb(208, 209, 210); padding-top: 5px;" class="picturebox od-eq">
                        <div class="content">
                            <div class="short_discription">
                                <span class="brd_acc88">Classes 17</span>
                                <p>
                                    Rubber, gutta percha, gum, asbestos, mica and goods made from these materials and not included in other classes; plastics in extruded form for use in manufacture; packing, stopping and insulating materials; flexible pipes, not of metal....
                                </p>
                            </div>
                            <div class="discription">
                                <span class="brd_acc88">Classes 17</span>
                                <ul>
                                    <li>Rubber, gutta-percha, gum, asbestos,  mica and goods made from these materials and not
                                        <br>
                                        included in other classes              </li>
                                    <li>plastics in extruded form for use in manufacture              </li>
                                    <li>packing, stopping and insulating materials              </li>
                                    <li>flexible pipes, not of metal            </li>
                                </ul>
                                <p>
                                    <strong>Explanatory Note</strong><br>
                                    Class 17 includes mainly electrical,  thermal and acoustic insulating materials and plastics, being for use in  manufacture in the form of sheets, blocks and rods.<br>
                                </p>
                                <p>This Class includes, in particular:</p>
                                <ul type="disc">
                                    <li>rubber material for recapping tyres</li>
                                    <li>padding and stuffing materials of rubber or plastics</li>
                                    <li>floating anti-pollution barriers</li>
                                </ul>
                            </div>
                        </div>
                        <div class="clear"></div>
                        <button class="readmore">Read More</button>
                        <button style="display: none;" class="less">Less</button>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>

            <div class="middle">
                <div class="listing_option">
                    <div style="border-top: 0px solid rgb(208, 209, 210); padding-top: 5px;" class="picturebox od-eq">
                        <div class="content">
                            <div class="short_discription">
                                <span class="brd_acc88">Classes 18</span>
                                <p>
                                    Leather and imitations of leather, and goods made of these materials and not included in other classes; animal skins, hides, trunks and travelling bags; umbrellas, parasols and walking sticks; whips, harness and saddlery....
                                </p>
                            </div>
                            <div class="discription">
                                <span class="brd_acc88">Classes 18</span>
                                <ul>
                                    <li>Leather and imitations of leather,  and goods made of these materials and not included in other classes</li>
                                    <li>animal skins, hides;<br>
                                    </li>
                                    <li>trunks and travelling bags;<br>
                                    </li>
                                    <li>umbrellas, parasols and walking sticks;<br>
                                    </li>
                                    <li>whips, harness and saddlery.<br>
                                    </li>
                                </ul>
                                <p>
                                    <strong>Explanatory Note</strong><br>
                                    Class 18 includes mainly leather,  leather imitations, travel goods not included in other classes and saddlery.
                                </p>
                                <p>This Class does not include, in  particular:</p>
                                <ul type="disc">
                                    <li>clothing, footwear, headgear (consult the Alphabetical       List of Goods). </li>
                                </ul>
                            </div>
                        </div>
                        <div class="clear"></div>
                        <button class="readmore">Read More</button>
                        <button style="display: none;" class="less">Less</button>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>

            <div class="middle">
                <div class="listing_option">
                    <div style="border-top: 0px solid rgb(208, 209, 210); padding-top: 5px;" class="picturebox od-eq">
                        <div class="content">
                            <div class="short_discription">
                                <span class="brd_acc88">Classes 19</span>
                                <p>
                                    Building materials, (non-metallic), non-metallic rigid pipes for building; asphalt, pitch and bitumen; non-metallic transportable buildings; monuments, not of metal....
                                </p>
                            </div>
                            <div class="discription">
                                <span class="brd_acc88">Classes 19</span>
                                <ul>
                                    <li>Building materials (non-metallic);<br>
                                    </li>
                                    <li>non-metallic rigid pipes for building;<br>
                                    </li>
                                    <li>asphalt, pitch and bitumen;<br>
                                    </li>
                                    <li>non-metallic transportable buildings;<br>
                                    </li>
                                    <li>monuments, not of metal.<br>
                                    </li>
                                </ul>
                                <p>
                                    <strong>Explanatory Note</strong><br>
                                    Class 19 includes mainly  non-metallic building materials.<br>
                                </p>
                                <p>This Class includes, in particular:</p>
                                <ul type="disc">
                                    <li>semi-worked woods (for example, beams, planks, panels); </li>
                                    <li>veneers; </li>
                                    <li>building glass (for example, floor slabs, glass tiles); </li>
                                    <li>glass granules for marking out roads; </li>
                                    <li>letter boxes of masonry. </li>
                                </ul>
                                <p>This Class does not include, in  particular:</p>
                                <ul type="disc">
                                    <li>cement preservatives and cement-waterproofing       preparations</li>
                                    <li>fireproofing preparations</li>
                                </ul>
                            </div>
                        </div>
                        <div class="clear"></div>
                        <button class="readmore">Read More</button>
                        <button style="display: none;" class="less">Less</button>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>

            <div class="middle">
                <div class="listing_option">
                    <div style="border-top: 0px solid rgb(208, 209, 210); padding-top: 5px;" class="picturebox od-eq">
                        <div class="content">
                            <div class="short_discription">
                                <span class="brd_acc88">Classes 20</span>
                                <p>
                                    Furniture, mirrors, picture frames; goods(not included in other classes) of wood, cork, reed, cane, wicker, horn, bone, ivory, whalebone, shell, amber, mother- of-pearl, meerschaum and substitutes for all these materials, or of plastics....
                                </p>
                            </div>
                            <div class="discription">
                                <span class="brd_acc88">Classes 20</span>
                                <ul>
                                    <li>Furniture, mirrors, picture frames </li>
                                    <li>goods (not included in other classes) of wood, cork, reed, cane, wicker, horn,  bone, ivory, whalebone, shell, amber, mother-of-pearl, meerschaum and  substitutes for all these materials, or of plastics.<br>
                                    </li>
                                </ul>
                                <p>
                                    <strong>Explanatory Note</strong><br>
                                    Class 20 includes mainly furniture  and its parts and plastic goods, not included in other classes.<br>
                                    <br>
                                    This Class includes, in particular:
                                </p>
                                <ul type="disc">
                                    <li>metal furniture and furniture for camping</li>
                                    <li>bedding (for example, mattresses, spring mattresses,       pillows)</li>
                                    <li>looking glasses and furnishing or toilet mirrors</li>
                                    <li>registration number plates not of metal</li>
                                    <li>letter boxes not of metal or masonry</li>
                                </ul>
                                <p>This Class does not include, in  particular:</p>
                                <ul type="disc">
                                    <li>certain special types of mirrors, classified according       to their function or purpose (consult the Alphabetical List of Goods)</li>
                                    <li>special furniture for laboratories </li>
                                    <li>special furniture for medical use</li>
                                    <li>bedding linen</li>
                                    <li>eiderdowns </li>
                                </ul>
                            </div>
                        </div>
                        <div class="clear"></div>
                        <button class="readmore">Read More</button>
                        <button style="display: none;" class="less">Less</button>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>

            <div class="middle">
                <div class="listing_option">
                    <div style="border-top: 0px solid rgb(208, 209, 210); padding-top: 5px;" class="picturebox od-eq">
                        <div class="content">
                            <div class="short_discription">
                                <span class="brd_acc88">Classes 21</span>
                                <p>
                                    Household or kitchen utensils and containers(not of precious metal or coated therewith); combs and sponges; brushes(except paints brushes); brush making materials; articles for cleaning purposes; steelwool; unworked or semi-worked glass (except glass used in building); glassware, porcelain and earthenware not included in other classes....
                                </p>
                            </div>
                            <div class="discription">
                                <span class="brd_acc88">Classes 21</span>
                                <ul>
                                    <li>Household or kitchen utensils and  containers;<br>
                                    </li>
                                    <li>combs and sponges;<br>
                                    </li>
                                    <li>brushes (except paint brushes);<br>
                                    </li>
                                    <li>brush-making materials;<br>
                                    </li>
                                    <li>articles for cleaning purposes;<br>
                                    </li>
                                    <li>steelwool;<br>
                                    </li>
                                    <li>unworked or semi-worked glass (except glass used in building);<br>
                                    </li>
                                    <li>glassware, porcelain and earthenware not included in other classes.<br>
                                    </li>
                                </ul>
                                <p>
                                    <strong>Explanatory Note</strong><br>
                                    Class 21 includes mainly small,  hand-operated utensils and apparatus for household and kitchen use as well as  toilet utensils, glassware and articles in porcelain.<br>
                                    <br>
                                    This Class includes, in particular:
                                </p>
                                <ul type="disc">
                                    <li>utensils and containers for household and kitchen use,       for example, kitchen utensils, pails, pans of iron, of aluminium, of       plastics or of other materials, small hand-operated apparatus for mincing,       grinding, pressing, etc.; </li>
                                    <li>electric combs; </li>
                                    <li>electric toothbrushes; </li>
                                    <li>dish stands and decanter stands. </li>
                                </ul>
                                <p>This Class does not include, in  particular:</p>
                                <ul type="disc">
                                    <li>certain goods made of glass, porcelain and earthenware       (consult the Alphabetical List of Goods); </li>
                                    <li>cleaning preparations, soaps, etc.; </li>
                                    <li>small apparatus for mincing, grinding, pressing, etc.,       driven by electricity; </li>
                                    <li>razors and shaving apparatus, clippers (hand       instruments), metal implements and utensils for manicure and pedicure ; </li>
                                    <li>cooking utensils, electric; </li>
                                    <li>toilet mirrors  </li>
                                </ul>
                            </div>
                        </div>
                        <div class="clear"></div>
                        <button class="readmore">Read More</button>
                        <button style="display: none;" class="less">Less</button>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>

            <div class="middle">
                <div class="listing_option">
                    <div style="border-top: 0px solid rgb(208, 209, 210); padding-top: 5px;" class="picturebox od-eq">
                        <div class="content">
                            <div class="short_discription">
                                <span class="brd_acc88">Classes 22</span>
                                <p>
                                    Ropes, string, nets, tents, awnings, tarpaulins, sails, sacks and bags (not included in other classes) padding and stuffing materials (except of rubber or plastics); raw fibrous textile materials....
                                </p>
                            </div>
                            <div class="discription">
                                <span class="brd_acc88">Classes 22</span>
                                <ul>
                                    <li>Ropes, string, nets, tents, awnings,  tarpaulins, sails, sacks and bags (not included in other classes);<br>
                                    </li>
                                    <li>padding and stuffing materials (except of rubber or plastics);<br>
                                    </li>
                                    <li>raw fibrous textile materials.<br>
                                    </li>
                                </ul>
                                <p>
                                    <strong>Explanatory Note</strong><br>
                                    Class 22 includes mainly rope and  sail manufacture products, padding and stuffing materials and raw fibrous  textile materials.<br>
                                    <br>
                                    This Class includes, in particular:
                                </p>
                                <ul type="disc">
                                    <li>cords and twines in natural or artificial textile       fibres, paper or plastics. </li>
                                </ul>
                                <p>This Class does not include, in  particular:</p>
                                <ul type="disc">
                                    <li>certain nets, sacks and bags (consult the Alphabetical       List of Goods)</li>
                                    <li>strings for musical instruments</li>
                                </ul>
                            </div>
                        </div>
                        <div class="clear"></div>
                        <button class="readmore">Read More</button>
                        <button style="display: none;" class="less">Less</button>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>

            <div class="middle">
                <div class="listing_option">
                    <div style="border-top: 0px solid rgb(208, 209, 210); padding-top: 5px;" class="picturebox od-eq">
                        <div class="content">
                            <div class="short_discription">
                                <span class="brd_acc88">Classes 23</span>
                                <p>
                                    Yarns and threads, for textile use....
                                </p>
                            </div>
                            <div class="discription">
                                <span class="brd_acc88">Classes 23</span>
                                <ul>
                                    <li>Yarns and threads, for textile use.</li>
                                </ul>
                            </div>
                        </div>
                        <div class="clear"></div>
                        <button class="readmore">Read More</button>
                        <button style="display: none;" class="less">Less</button>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>

            <div class="middle">
                <div class="listing_option">
                    <div style="border-top: 0px solid rgb(208, 209, 210); padding-top: 5px;" class="picturebox od-eq">
                        <div class="content">
                            <div class="short_discription">
                                <span class="brd_acc88">Classes 24</span>
                                <p>
                                    Textiles and textile goods, not included in other classes; bed and table covers...
                                </p>
                            </div>
                            <div class="discription">
                                <span class="brd_acc88">Classes 24</span>
                                <ul>
                                    <li>Textiles and textile goods, not  included in other classes;<br>
                                    </li>
                                    <li>bed and table covers.<br>
                                    </li>
                                </ul>
                                <p>
                                    <strong>Explanatory Note</strong><br>
                                    Class 24 includes mainly textiles  (piece goods) and textile covers for household use.<br>
                                    <br>
                                    This Class includes, in particular:
                                </p>
                                <ul type="disc">
                                    <li>bedding linen of paper. </li>
                                </ul>
                                <p>This Class does not include, in  particular:</p>
                                <ul type="disc">
                                    <li>certain special textiles (consult the Alphabetical List       of Goods)</li>
                                    <li>electrically heated blankets, for medical purposes       and not for medical purposes </li>
                                    <li>table linen of paper </li>
                                    <li>horse blankets </li>
                                </ul>
                            </div>
                        </div>
                        <div class="clear"></div>
                        <button class="readmore">Read More</button>
                        <button style="display: none;" class="less">Less</button>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>
            <div class="middle">
                <div class="listing_option">
                    <div style="border-top: 0px solid rgb(208, 209, 210); padding-top: 5px;" class="picturebox od-eq">
                        <div class="content">
                            <div class="short_discription">
                                <span class="brd_acc88">Classes 25</span>
                                <p>
                                    Clothing, footwear, headgear....
                                </p>
                            </div>
                            <div class="discription">
                                <span class="brd_acc88">Classes 25</span>
                                <ul>
                                    <li>Clothing, footwear, headgear.<br>
                                    </li>
                                </ul>
                                <p>
                                    <strong>Explanatory Note</strong><br>
                                    <br>
                                    This Class does not include, in  particular:
                                </p>
                                <ul type="disc">
                                    <li>certain clothing and footwear for special use (consult       the Alphabetical List of Goods)</li>
                                </ul>
                            </div>
                        </div>
                        <div class="clear"></div>
                        <button class="readmore">Read More</button>
                        <button style="display: none;" class="less">Less</button>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>

            <div class="middle">
                <div class="listing_option">
                    <div style="border-top: 0px solid rgb(208, 209, 210); padding-top: 5px;" class="picturebox od-eq">
                        <div class="content">
                            <div class="short_discription">
                                <span class="brd_acc88">Classes 26</span>
                                <p>
                                    Lace and embroidery, ribbons and braid; buttons, hooks and eyes, pins and needles; artificial flowers....
                                </p>
                            </div>
                            <div class="discription">
                                <span class="brd_acc88">Classes 26</span>
                                <ul>
                                    <li>Lace and embroidery, ribbons and  braid;<br>
                                    </li>
                                    <li>buttons, hooks and eyes, pins and needles;<br>
                                    </li>
                                    <li>artificial flowers.<br>
                                    </li>
                                </ul>
                                <p>
                                    <strong>Explanatory Note</strong><br>
                                    Class 26 includes mainly  dressmakers' articles.<br>
                                </p>
                                <p>This Class includes, in particular:</p>
                                <ul type="disc">
                                    <li>slide fasteners</li>
                                </ul>
                                <p>This Class does not include, in  particular:</p>
                                <ul type="disc">
                                    <li>certain special types of hooks (consult the       Alphabetical List of Goods) </li>
                                    <li>certain special types of needles (consult the       Alphabetical List of Goods) </li>
                                    <li>yarns and threads for textile use</li>
                                </ul>
                            </div>
                        </div>
                        <div class="clear"></div>
                        <button class="readmore">Read More</button>
                        <button style="display: none;" class="less">Less</button>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>

            <div class="middle">
                <div class="listing_option">
                    <div style="border-top: 0px solid rgb(208, 209, 210); padding-top: 5px;" class="picturebox od-eq">
                        <div class="content">
                            <div class="short_discription">
                                <span class="brd_acc88">Classes 27</span>
                                <p>
                                    Carpets, rugs, mats and matting, linoleum and other materials for covering existing floors; wall hangings(non-textile)....
                                </p>
                            </div>
                            <div class="discription">
                                <span class="brd_acc88">Classes 27</span>
                                <ul>
                                    <li>Carpets, rugs, mats and matting,  linoleum and other materials for covering existing floors;<br>
                                    </li>
                                    <li>wall hangings (non-textile).<br>
                                    </li>
                                </ul>
                                <p>
                                    <strong>Explanatory Note</strong><br>
                                    Class 27 includes mainly products  intended to be added as furnishings to previously constructed floors and walls<br>
                                    <br>
                                    This Class does not include, in  particular:
                                </p>
                                <ul type="disc">
                                    <li>wooden flooring</li>
                                </ul>
                            </div>
                        </div>
                        <div class="clear"></div>
                        <button class="readmore">Read More</button>
                        <button style="display: none;" class="less">Less</button>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>

            <div class="middle">
                <div class="listing_option">
                    <div style="border-top: 0px solid rgb(208, 209, 210); padding-top: 5px;" class="picturebox od-eq">
                        <div class="content">
                            <div class="short_discription">
                                <span class="brd_acc88">Classes 28</span><p>
                                    Games and playthings, gymnastic and sporting articles not included in other classes; decorations for Christmas trees....
                                </p>
                            </div>
                            <div class="discription">
                                <span class="brd_acc88">Classes 28</span>
                                <ul>
                                    <li>Games and playthings;<br>
                                    </li>
                                    <li>gymnastic and sporting articles not included in other classes;<br>
                                    </li>
                                    <li>decorations for Christmas trees.<br>
                                    </li>
                                </ul>
                                <p>
                                    <strong>Explanatory Note</strong><br>
                                    This Class includes, in particular:
                                </p>
                                <ul type="disc">
                                    <li>fishing tackle; </li>
                                    <li>equipment for various sports and games. </li>
                                </ul>
                                <p>This Class does not include, in  particular:</p>
                                <ul type="disc">
                                    <li>Christmas tree candles; </li>
                                    <li>diving equipment; </li>
                                    <li>amusement apparatus adapted for use with an external       display screen or monitor; </li>
                                    <li>electrical lamps (garlands) for Christmas trees; </li>
                                    <li>fishing nets; </li>
                                    <li>clothing for gymnastics and sports; </li>
                                    <li>confectionery and chocolate decorations for Christmas       trees. </li>
                                </ul>
                            </div>
                        </div>
                        <div class="clear"></div>
                        <button class="readmore">Read More</button>
                        <button style="display: none;" class="less">Less</button>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>

            <div class="middle">
                <div class="listing_option">
                    <div style="border-top: 0px solid rgb(208, 209, 210); padding-top: 5px;" class="picturebox od-eq">
                        <div class="content">
                            <div class="short_discription">
                                <span class="brd_acc88">Classes 29</span>
                                <p>
                                    Meat, fish, poultry and game; meat extracts; preserved, dried and cooked fruits and vegetables; jellies, jams, fruit sauces; eggs, milk and milk products; edible oils and fats....
                                </p>
                            </div>
                            <div class="discription">
                                <span class="brd_acc88">Classes 29</span>
                                <ul>
                                    <li>Meat, fish, poultry and game;<br>
                                    </li>
                                    <li>meat extracts;<br>
                                    </li>
                                    <li>preserved, frozen, dried and cooked fruits and vegetables;<br>
                                    </li>
                                    <li>jellies, jams, compotes;<br>
                                    </li>
                                    <li>eggs, milk and milk products;<br>
                                    </li>
                                    <li>edible oils and fats.<br>
                                    </li>
                                </ul>
                                <p>
                                    <strong>Explanatory Note</strong><br>
                                    Class 29 includes mainly foodstuffs  of animal origin as well as vegetables and other horticultural comestible  products which are prepared for consumption or conservation.<br>
                                    <br>
                                    This Class includes, in particular:
                                </p>

                                <ul type="disc">
                                    <li>milk beverages (milk predominating). </li>
                                </ul>
                                <p>This Class does not include, in  particular:</p>
                                <ul type="disc">
                                    <li>certain foodstuffs of plant origin (consult the       Alphabetical List of Goods); </li>
                                    <li>baby food; </li>
                                    <li>dietetic substances adapted for medical use; </li>
                                    <li>salad dressings; </li>
                                    <li>fertilised eggs for hatching; </li>
                                    <li>foodstuffs for animals; </li>
                                    <li>live animals. </li>
                                </ul>
                            </div>
                        </div>
                        <div class="clear"></div>
                        <button class="readmore">Read More</button>
                        <button style="display: none;" class="less">Less</button>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>

            <div class="middle">
                <div class="listing_option">
                    <div style="border-top: 0px solid rgb(208, 209, 210); padding-top: 5px;" class="picturebox od-eq">
                        <div class="content">
                            <div class="short_discription">
                                <span class="brd_acc88">Classes 30</span>
                                <p>
                                    Coffee, tea, cocoa, sugar, rice, tapioca, sago, artificial coffee; flour and preparations made from cereals, bread, pastry and confectionery, ices; honey, treacle; yeast, baking powder; salt, mustard; vinegar, sauces, (condiments); spices; ice....
                                </p>
                            </div>
                            <div class="discription">
                                <span class="brd_acc88">Classes 30</span>
                                <ul>
                                    <li>Coffee, tea, cocoa, sugar, rice,  tapioca, sago, artificial coffee;<br>
                                    </li>
                                    <li>flour and preparations made from cereals, bread, pastry and confectionery,  ices;<br>
                                    </li>
                                    <li>honey, treacle;<br>
                                    </li>
                                    <li>yeast, baking-powder;<br>
                                    </li>
                                    <li>salt, mustard;<br>
                                    </li>
                                    <li>vinegar, sauces (condiments);<br>
                                    </li>
                                    <li>spices;<br>
                                    </li>
                                    <li>ice.<br>
                                    </li>
                                </ul>
                                <p>
                                    <strong>Explanatory Note</strong><br>
                                    Class 30 includes mainly foodstuffs  of plant origin prepared for consumption or conservation as well as auxiliaries  intended for the improvement of the flavour of food.<br>
                                    <br>
                                    This Class includes, in particular:
                                </p>
                                <ul type="disc">
                                    <li>beverages with coffee, cocoa or chocolate base; </li>
                                    <li>cereals prepared for human consumption (for example,       oat flakes and those made of other cereals). </li>
                                </ul>
                                <p>This Class does not include, in  particular:</p>
                                <ul type="disc">
                                    <li>certain foodstuffs of plant origin (consult the       Alphabetical List of Goods); </li>
                                    <li>salt for preserving other than for foodstuffs; </li>
                                    <li>medicinal teas and dietetic substances adapted for       medical use; </li>
                                    <li>baby food; </li>
                                    <li>raw cereals; </li>
                                    <li>foodstuffs for animals. </li>
                                </ul>
                            </div>
                        </div>
                        <div class="clear"></div>
                        <button class="readmore">Read More</button>
                        <button style="display: none;" class="less">Less</button>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>

            <div class="middle">
                <div class="listing_option">
                    <div style="border-top: 0px solid rgb(208, 209, 210); padding-top: 5px;" class="picturebox od-eq">
                        <div class="content">
                            <div class="short_discription">
                                <span class="brd_acc88">Classes 31</span>
                                <p>
                                    Agricultural, horticultural and forestry products and grains not included in other classes; live animals; fresh fruits and vegetables; seeds, natural plants and flowers; foodstuffs for animals, malt....
                                </p>
                            </div>
                            <div class="discription">
                                <span class="brd_acc88">Classes 31</span>
                                <ul>
                                    <li>Agricultural, horticultural and forestry products and grains not included in other classes;<br>
                                    </li>
                                    <li>live animals;<br>
                                    </li>
                                    <li>fresh fruits and vegetables;<br>
                                    </li>
                                    <li>seeds, natural plants and flowers;<br>
                                    </li>
                                    <li>foodstuffs for animals;<br>
                                    </li>
                                    <li>malt.<br>
                                    </li>
                                </ul>
                                <p>
                                    <strong>Explanatory Note</strong><br>
                                    Class 31 includes mainly land products not having been subjected to any form of preparation for consumption, live animals and plants as well as foodstuffs for animals.<br>
                                    <br>
                                    This Class includes, in particular:
                                </p>
                                <ul type="disc">
                                    <li>raw woods;
                                        <br>
                                    </li>
                                    <li>raw cereals;
                                        <br>
                                    </li>
                                    <li>fertilised eggs for hatching;
                                        <br>
                                    </li>
                                    <li>mollusca and crustacea (live).
                                        <br>
                                    </li>
                                </ul>
                                <p>This Class does not include, in  particular:</p>
                                <ul type="disc">
                                    <li>cultures of micro-organisms and leeches for medical purposes; </li>
                                    <li>semi-worked woods; </li>
                                    <li>artificial fishing bait; </li>
                                    <li>rice; </li>
                                    <li>tobacco; </li>
                                </ul>
                            </div>
                        </div>
                        <div class="clear"></div>
                        <button class="readmore">Read More</button>
                        <button style="display: none;" class="less">Less</button>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>

            <div class="middle">
                <div class="listing_option">
                    <div style="border-top: 0px solid rgb(208, 209, 210); padding-top: 5px;" class="picturebox od-eq">
                        <div class="content">
                            <div class="short_discription">
                                <span class="brd_acc88">Classes 32</span>
                                <p>
                                    Beers, mineral and aerated waters, and other non-alcoholic drinks; fruit drinks and fruit juices; syrups and other preparations for making beverages.....
                                </p>
                            </div>
                            <div class="discription">
                                <span class="brd_acc88">Classes 32</span>
                                <ul>
                                    <li>Beers;</li>
                                    <li>mineral and aerated waters and other non-alcoholic drinks;</li>
                                    <li>fruit drinks and fruit juices;</li>
                                    <li>syrups and other preparations for making beverages.</li>
                                </ul>
                                <p>
                                    <strong>Explanatory Note</strong><br>
                                    Class 32 includes mainly non-alcoholic beverages, as well as beer.<br>
                                    <br>
                                    This Class includes, in particular:
                                </p>
                                <ul type="disc">
                                    <li>De-alcoholised drinks.</li>
                                </ul>
                                <p>This Class does not include, in  particular:</p>
                                <ul type="disc">
                                    <li>beverages for medical purposes ; </li>
                                    <li>milk beverages (milk predominating) ; </li>
                                    <li>beverages with coffee, cocoa or chocolate base; </li>
                                </ul>
                            </div>
                        </div>
                        <div class="clear"></div>
                        <button class="readmore">Read More</button>
                        <button style="display: none;" class="less">Less</button>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>

            <div class="middle">
                <div class="listing_option">
                    <div style="border-top: 0px solid rgb(208, 209, 210); padding-top: 5px;" class="picturebox od-eq">
                        <div class="content">
                            <div class="short_discription">
                                <span class="brd_acc88">Classes 33</span>
                                <p>
                                    Alcoholic beverages(except beers).....
                                </p>
                            </div>
                            <div class="discription">
                                <span class="brd_acc88">Classes 33</span>
                                <ul>
                                    <li>Alcoholic beverages (except beers).</li>
                                </ul>
                                <p>
                                    <strong>Explanatory Note</strong><br>
                                    This Class includes, in particular:
                                </p>
                                <ul type="disc">
                                    <li>medicinal drinks .</li>
                                    <li>de-alcoholised drinks</li>
                                </ul>
                            </div>
                        </div>
                        <div class="clear"></div>
                        <button class="readmore">Read More</button>
                        <button style="display: none;" class="less">Less</button>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>

            <div class="middle">
                <div class="listing_option">
                    <div style="border-top: 0px solid rgb(208, 209, 210); padding-top: 5px;" class="picturebox od-eq">
                        <div class="content">
                            <div class="short_discription">
                                <span class="brd_acc88">Classes 34</span>
                                <p>
                                    Tobacco, smokers' articles, matches ).....
                                </p>
                            </div>
                            <div class="discription">
                                <span class="brd_acc88">Classes 34</span>
                                <ul>
                                    <li>Tobacco;</li>
                                    <li>smokers' articles;</li>
                                    <li>matches. </li>
                                </ul>
                                <p>
                                    <strong>Explanatory Note</strong><br>
                                    This Class includes, in particular:
                                </p>
                                <ul type="disc">
                                    <li>Tobacco substitutes (not for medical purposes). </li>
                                </ul>
                                <p>This Class does not include, in  particular:</p>
                                <ul type="disc">
                                    <li>Cigarettes without tobacco, for medical purposes </li>
                                </ul>
                            </div>
                        </div>
                        <div class="clear"></div>
                        <button class="readmore">Read More</button>
                        <button style="display: none;" class="less">Less</button>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>
            <br>
            <br>

            <p>&nbsp;</p>
            <p></p>
            <h2 style="color: #3488c6;">SERVICES</h2>
            <p></p>

            <div class="middle">
                <div class="listing_option">
                    <div style="border-top: 0px solid rgb(208, 209, 210); padding-top: 5px;" class="picturebox od-eq">
                        <div class="content">
                            <div class="short_discription">
                                <span class="brd_acc88">Classes 35</span>
                                <p>
                                    Advertising, business management, business administration, office functions.....
                                </p>
                            </div>
                            <div class="discription">
                                <span class="brd_acc88">Classes 35</span>
                                <ul>
                                    <li>Advertising;</li>
                                    <li>business management;</li>
                                    <li>business administration;</li>
                                    <li>office functions.</li>
                                </ul>
                                <p>
                                    <strong>Explanatory Note</strong><br>
                                    Class 35 includes mainly services  rendered by persons or organizations principally with the object of:
                                </p>
                                <ol start="1" type="1">
                                    <li>help in the working or management of a commercial       undertaking, or </li>
                                    <li>help in the management of the business affairs or       commercial functions of an industrial or commercial enterprise, as well as services rendered by  advertising establishments primarily undertaking communications to the public,  declarations or announcements by all means of diffusion and concerning all  kinds of goods or services.<br>
                                    </li>
                                </ol>
                                This Class includes, in particular:
          <ul type="disc">
              <li>the bringing together, for the benefit of others, of a       variety of goods (excluding the transport thereof), enabling customers to       conveniently view and purchase those goods; such services may be provided       by retail stores, wholesale outlets, through mail order catalogues or by       means of electronic media, for example, through web sites or television       shopping programmes; </li>
              <li>services consisting of the registration, transcription,       composition, compilation or systematization of written communications and       registrations, and also the compilation of mathematical or statistical       data; </li>
              <li>services of advertising agencies and services such as the       distribution of prospectuses, directly or through the post, or the       distribution of samples. This Class may refer to advertising in connection       with other services, such as those concerning bank loans or advertising by       radio. </li>
          </ul>
                                <p>This Class does not include, in  particular:</p>
                                <ul type="disc">
                                    <li>services such as evaluations and reports of engineers       which do not directly refer to the working or management of affairs in a       commercial or industrial enterprise (consult the Alphabetical List of       Services). </li>
                                </ul>
                            </div>
                        </div>
                        <div class="clear"></div>
                        <button class="readmore">Read More</button>
                        <button style="display: none;" class="less">Less</button>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>

            <div class="middle">
                <div class="listing_option">
                    <div style="border-top: 0px solid rgb(208, 209, 210); padding-top: 5px;" class="picturebox od-eq">
                        <div class="content">
                            <div class="short_discription">
                                <span class="brd_acc88">Classes 36</span>
                                <p>
                                    Insurance, financial affairs; monetary affairs; real estate affairs.....
                                </p>
                            </div>
                            <div class="discription">
                                <span class="brd_acc88">Classes 36</span>
                                <ul>
                                    <li>Insurance;</li>
                                    <li>financial affairs;</li>
                                    <li>monetary affairs;</li>
                                    <li>real estate affairs.
                                    </li>
                                </ul>
                                <p>
                                    <strong>Explanatory Note</strong><br>
                                    Class 36 includes mainly services  rendered in financial and monetary affairs and services rendered in relation to  insurance contracts of all kinds.
                                </p>
                                <p>This Class includes, in particular: </p>
                                <ul type="disc">
                                    <li>services relating to financial or monetary affairs       comprise the following: </li>
                                    <ol start="1" type="1">
                                        <li>services of all the banking establishments, or        institutions connected with them such as exchange brokers or clearing        services; </li>
                                        <li>services of credit institutions other than banks such        as co-operative credit associations, individual financial companies,        lenders, etc.; </li>
                                        <li>services of "investment trusts," of holding        companies; </li>
                                        <li>services of brokers dealing in shares and property; </li>
                                        <li>services connected with monetary affairs vouched for        by trustees; </li>
                                        <li>services rendered in connection with the issue of        travellers' cheques and letters of credit; </li>
                                    </ol>
                                    <li>services of realty administrators of buildings, i.e.,       services of letting or valuation, or financing; </li>
                                    <li>services dealing with insurance such as services       rendered by agents or brokers engaged in insurance, services rendered to       insured, and insurance underwriting services. </li>
                                </ul>
                            </div>
                        </div>
                        <div class="clear"></div>
                        <button class="readmore">Read More</button>
                        <button style="display: none;" class="less">Less</button>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>

            <div class="middle">
                <div class="listing_option">
                    <div style="border-top: 0px solid rgb(208, 209, 210); padding-top: 5px;" class="picturebox od-eq">
                        <div class="content">
                            <div class="short_discription">
                                <span class="brd_acc88">Classes 37</span>
                                <p>
                                    Building construction; repair; installation services......
                                </p>
                            </div>
                            <div class="discription">
                                <span class="brd_acc88">Classes 37</span>
                                <ul>
                                    <li>Building construction;</li>
                                    <li>repair;</li>
                                    <li>installation services. </li>
                                </ul>
                                <p>
                                    <strong>Explanatory Note</strong><br>
                                    Class 37 includes mainly services  rendered by contractors or subcontractors in the construction or making of  permanent buildings, as well as services rendered by persons or organizations  engaged in the restoration of objects to their original condition or in their  preservation without altering their physical or chemical properties.
                                </p>
                                <p>This Class includes, in particular:</p>
                                <ul type="disc">
                                    <li>services relating to the construction of buildings,       roads, bridges, dams or transmission lines and services of undertakings       specializing in the field of construction such as those of painters,       plumbers, heating installers or roofers; </li>
                                    <li>services auxiliary to construction services like       inspections of construction plans; </li>
                                    <li>services of shipbuilding; </li>
                                    <li>services consisting of hiring of tools or building       materials; </li>
                                    <li>repair services, i.e., services which undertake to put any       object into good condition after wear, damage, deterioration or partial       destruction (restoration of an existing building or another object that       has become imperfect and is to be restored to its original condition); </li>
                                    <li>various repair services such as those in the fields of       electricity, furniture, instruments, tools, etc.; </li>
                                    <li>services of maintenance for preserving an object in its       original condition without changing any of its properties (for the       difference between this Class and Class 40 see the Explanatory Note of Class 40; </li>
                                </ul>
                                <p>This Class does not include, in  particular:</p>
                                <ul type="disc">
                                    <li>services consisting of storage of goods such as clothes       or vehicles; </li>
                                    <li>services connected with dyeing of cloth or clothes. </li>
                                </ul>
                            </div>
                        </div>
                        <div class="clear"></div>
                        <button class="readmore">Read More</button>
                        <button style="display: none;" class="less">Less</button>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>

            <div class="middle">
                <div class="listing_option">
                    <div style="border-top: 0px solid rgb(208, 209, 210); padding-top: 5px;" class="picturebox od-eq">
                        <div class="content">
                            <div class="short_discription">
                                <span class="brd_acc88">Classes 38</span>
                                <p>
                                    Telecommunications......
                                </p>
                            </div>
                            <div class="discription">
                                <span class="brd_acc88">Classes 38</span>
                                <ul>
                                    <li>Telecommunications.</li>
                                </ul>
                                <p>
                                    <strong>Explanatory Note</strong><br>
                                    Class 38 includes mainly services  allowing at least one person to communicate with another by a sensory means.  Such services include those which:
                                </p>
                                <ol start="1" type="1">
                                    <li>allow one person to talk to another, </li>
                                    <li>transmit messages from one person to another, and </li>
                                    <li>place a person in oral or visual communication  with another (radio and television).</li>
                                </ol>
                                <p>This Class includes, in particular:</p>
                                <ul type="disc">
                                    <li>services which consist essentially of the diffusion of       radio or television programmes. </li>
                                </ul>
                                <p>This Class does not include, in  particular:</p>
                                <ul>
                                    <li>radio advertising services . </li>
                                </ul>
                            </div>
                        </div>
                        <div class="clear"></div>
                        <button class="readmore">Read More</button>
                        <button style="display: none;" class="less">Less</button>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>

            <div class="middle">
                <div class="listing_option">
                    <div style="border-top: 0px solid rgb(208, 209, 210); padding-top: 5px;" class="picturebox od-eq">
                        <div class="content">
                            <div class="short_discription">
                                <span class="brd_acc88">Classes 39</span>
                                <p>
                                    Transport; packaging and storage of goods; travel arrangement.......
                                </p>
                            </div>
                            <div class="discription">
                                <span class="brd_acc88">Classes 39</span>
                                <ul>
                                    <li>Transport;</li>
                                    <li>packaging and storage of goods;</li>
                                    <li>travel arrangement.</li>
                                </ul>
                                <p>
                                    <strong>Explanatory Note</strong><br>
                                    Class 39 includes mainly services  rendered in transporting people or goods from one place to another (by rail,  road, water, air or pipeline) and services necessarily connected with such  transport, as well as services relating to the storing of goods in a warehouse  or other building for their preservation or guarding.
                                </p>
                                <p>This Class includes, in particular:</p>
                                <ul type="disc">
                                    <li>services rendered by companies exploiting stations,       bridges, rail-road ferries, etc., used by the transporter; </li>
                                    <li>services connected with the hiring of transport       vehicles; </li>
                                    <li>services connected with maritime tugs, unloading, the       functioning of ports and docks and the salvaging of wrecked ships and       their cargoes; </li>
                                    <li>services connected with the functioning of airports; </li>
                                    <li>services connected with the packaging and parcelling of       goods before dispatch; </li>
                                    <li>services consisting of information about journeys or       the transport of goods by brokers and tourist agencies, information       relating to tariffs, timetables and methods of transport; </li>
                                    <li>services relating to the inspection of vehicles  or goods before transport. </li>
                                </ul>
                                <p>This Class does not include, in  particular:</p>
                                <ul type="disc">
                                    <li>services relating to advertising transport undertakings       such as the distribution of prospectuses or advertising on the radio; </li>
                                    <li>services relating to the issuing of travellers' cheques       or letters of credit by brokers or travel agents; </li>
                                    <li>services relating to insurances (commercial, fire or       life) during the transport of persons or goods; </li>
                                    <li>services rendered by the maintenance and repair of       vehicles, nor the maintenance or repair of objects connected with the       transport of persons or goods; </li>
                                    <li>services relating to reservation of rooms in a hotel by       travel agents or brokers. </li>
                                </ul>
                            </div>
                        </div>
                        <div class="clear"></div>
                        <button class="readmore">Read More</button>
                        <button style="display: none;" class="less">Less</button>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>

            <div class="middle">
                <div class="listing_option">
                    <div style="border-top: 0px solid rgb(208, 209, 210); padding-top: 5px;" class="picturebox od-eq">
                        <div class="content">
                            <div class="short_discription">
                                <span class="brd_acc88">Classes 40</span>
                                <p>
                                    Treatment of materials.......
                                </p>
                            </div>
                            <div class="discription">
                                <span class="brd_acc88">Classes 40</span>
                                <ul>
                                    <li>Treatment of materials.</li>
                                </ul>
                                <p>
                                    <br>
                                    <strong>Explanatory Note</strong><br>
                                    Class 40 includes mainly services  not included in other classes, rendered by the mechanical or chemical  processing or transformation of objects or inorganic or organic substances.
                                </p>
                                <p>For the purposes of classification,  the mark is considered a service mark only in cases where processing or  transformation is effected for the account of another person. A mark is  considered a trade mark in all cases where the substance or object is marketed  by the person who processed or transformed it.</p>
                                <p>This Class includes, in particular:</p>
                                <ul type="disc">
                                    <li>services relating to transformation of an object or       substance and any process involving a change in its essential properties       (for example, dyeing a garment); consequently, a maintenance service,       although usually in Class 37, is included in Class 40 if it entails such a change (for example, the chroming of motor vehicle       bumpers); </li>
                                    <li>services of material treatment which may be present       during the production of any substance or object other than a building;       for example, services which involve cutting, shaping, polishing by       abrasion or metal coating. </li>
                                </ul>
                                <p>This Class does not include, in  particular:</p>
                                <ul>
                                    <li>repair services. </li>
                                </ul>
                            </div>
                        </div>
                        <div class="clear"></div>
                        <button class="readmore">Read More</button>
                        <button style="display: none;" class="less">Less</button>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>

            <div class="middle">
                <div class="listing_option">
                    <div style="border-top: 0px solid rgb(208, 209, 210); padding-top: 5px;" class="picturebox od-eq">
                        <div class="content">
                            <div class="short_discription">
                                <span class="brd_acc88">Classes 41</span>
                                <p>
                                    Education; providing of training; entertainment; sporting and cultural activities.....
                                </p>
                            </div>
                            <div class="discription">
                                <span class="brd_acc88">Classes 41</span>
                                <ul>
                                    <li>Education;</li>
                                    <li>providing of training;</li>
                                    <li>entertainment;</li>
                                    <li>sporting and cultural activities.</li>
                                </ul>
                                <p>
                                    <strong>Explanatory Note</strong><br>
                                    Class 41 covers mainly services  rendered by persons or institutions in the development of the mental faculties  of persons or animals, as well as services intended to entertain or to engage  the attention.<br>
                                    This Class includes, in particular:
                                </p>
                                <ul type="disc">
                                    <li>services consisting of all forms of education of       persons or training of animals; </li>
                                    <li>services having the basic aim of the entertainment,       amusement or recreation of people; </li>
                                    <li>presentation of works of visual art or literature to       the public for cultural or educational purposes. </li>
                                </ul>
                            </div>
                        </div>
                        <div class="clear"></div>
                        <button class="readmore">Read More</button>
                        <button style="display: none;" class="less">Less</button>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>

            <div class="middle">
                <div class="listing_option">
                    <div style="border-top: 0px solid rgb(208, 209, 210); padding-top: 5px;" class="picturebox od-eq">
                        <div class="content">
                            <div class="short_discription">
                                <span class="brd_acc88">Classes 42</span>
                                <p>
                                    Scientific and technological services and research and design relating thereto; industrial analysis and research services; design and development of computer hardware and software.....
                                </p>
                            </div>
                            <div class="discription">
                                <span class="brd_acc88">Classes 42</span>
                                <ul>
                                    <li>Scientific and technological  services and research and design relating thereto;</li>
                                    <li>industrial analysis and research services;</li>
                                    <li>design and development of computer hardware and software.</li>
                                </ul>
                                <p>
                                    <strong>Explanatory Note</strong><br>
                                    Class 42 includes mainly services  provided by persons, individually or collectively, in relation to the  theoretical and practical aspects of complex fields of activities; such  services are provided by members of professions such as chemists, physicists,  engineers, computer programmers, etc.
                                </p>
                                <p>This Class includes, in particular:</p>
                                <ul type="disc">
                                    <li>the services of engineers who undertake evaluations,       estimates, research and reports in the scientific and technological       fields; </li>
                                    <li>scientific research services for medical purposes. </li>
                                </ul>
                                <p>This Class does not include, in  particular:</p>
                                <ul type="disc">
                                    <li>business research and evaluations; </li>
                                    <li>word processing and computer file management services; </li>
                                    <li>financial and fiscal evaluations; </li>
                                    <li>mining and oil extraction; </li>
                                    <li>computer (hardware) installation and repair services; </li>
                                    <li>services provided by the members of professions such as       medical doctors, veterinary surgeons, psychoanalysts; </li>
                                    <li>medical treatment services; </li>
                                    <li>garden design; </li>
                                    <li>legal services. </li>
                                </ul>
                            </div>
                        </div>
                        <div class="clear"></div>
                        <button class="readmore">Read More</button>
                        <button style="display: none;" class="less">Less</button>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>

            <div class="middle">
                <div class="listing_option">
                    <div style="border-top: 0px solid rgb(208, 209, 210); padding-top: 5px;" class="picturebox od-eq">
                        <div class="content">
                            <div class="short_discription">
                                <span class="brd_acc88">Classes 43</span>
                                <p>
                                    Services for providing food and drink; temporary accommodation....
                                </p>
                            </div>
                            <div class="discription">
                                <span class="brd_acc88">Classes 43</span>
                                <ul>
                                    <li>Services for providing food and  drink;</li>
                                    <li>temporary accommodation.</li>
                                </ul>
                                <p>
                                    <strong>Explanatory Note</strong><br>
                                    Class 43 includes mainly services  provided by persons or establishments whose aim is to prepare food and drink  for consumption and services provided to obtain bed and board in hotels,  boarding houses or other establishments providing temporary accommodation.
                                </p>
                                <p>This Class includes, in particular:</p>
                                <ul type="disc">
                                    <li>reservation services for travellers' accommodation,       particularly through travel agencies or brokers; </li>
                                    <li>boarding for animals. </li>
                                </ul>
                                <p>This Class does not include, in  particular:</p>
                                <ul type="disc">
                                    <li>rental services for real estate such as houses, flats,       etc., for permanent use; </li>
                                    <li>arranging travel by tourist agencies; </li>
                                    <li>preservation services for food and drink; </li>
                                    <li>discotheque services; </li>
                                    <li>boarding schools; </li>
                                    <li>rest and convalescent homes. </li>
                                </ul>
                            </div>
                        </div>
                        <div class="clear"></div>
                        <button class="readmore">Read More</button>
                        <button style="display: none;" class="less">Less</button>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>

            <div class="middle">
                <div class="listing_option">
                    <div style="border-top: 0px solid rgb(208, 209, 210); padding-top: 5px;" class="picturebox od-eq">
                        <div class="content">
                            <div class="short_discription">
                                <span class="brd_acc88">Classes 44</span>
                                <p>
                                    Medical services, veterinary services, hygienic and beauty care for human beings or animals; agriculture, horticulture and forestry services.....
                                </p>
                            </div>
                            <div class="discription">
                                <span class="brd_acc88">Classes 44</span>
                                <ul>
                                    <li>Medical services;</li>
                                    <li>veterinary services;</li>
                                    <li>hygienic and beauty care for human beings or animals;</li>
                                    <li>agriculture, horticulture and forestry services.</li>
                                </ul>
                                <p>
                                    <strong>Explanatory Note</strong><br>
                                    Class 44 includes mainly medical  care, hygienic and beauty care given by persons or establishments to human  beings and animals; it also includes services relating to the fields of  agriculture, horticulture and forestry.
                                </p>
                                <p>This Class includes, in particular:</p>
                                <ul type="disc">
                                    <li>medical analysis services relating to the treatment of       persons (such as x-ray examinations and taking of blood samples); </li>
                                    <li>artificial insemination services; </li>
                                    <li>pharmacy advice; </li>
                                    <li>animal breeding; </li>
                                    <li>services relating to the growing of plants such as       gardening; </li>
                                    <li>services relating to floral art such as floral       compositions as well as garden design. </li>
                                </ul>
                                <p>This Class does not include, in  particular:</p>
                                <ul type="disc">
                                    <li>vermin exterminating (other than for agriculture,       horticulture and forestry); </li>
                                    <li>installation and repair services for irrigation systems; </li>
                                    <li>ambulance transport; </li>
                                    <li>animal slaughtering services and taxidermy; </li>
                                    <li>timber felling and processing; </li>
                                    <li>animal training services; </li>
                                    <li>health clubs for physical exercise; </li>
                                    <li>scientific research services for medical purposes; </li>
                                    <li>boarding for animals; </li>
                                    <li>retirement homes. </li>
                                </ul>
                            </div>
                        </div>
                        <div class="clear"></div>
                        <button class="readmore">Read More</button>
                        <button style="display: none;" class="less">Less</button>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>

            <div class="middle">
                <div class="listing_option">
                    <div style="border-top: 0px solid rgb(208, 209, 210); padding-top: 5px;" class="picturebox od-eq">
                        <div class="content">
                            <div class="short_discription">
                                <span class="brd_acc88">Classes 45</span>
                                <p>
                                    Legal services; security services for the protection of property and individuals; personal and social services rendered by others to meet the needs of individuals.....
                                </p>
                            </div>
                            <div class="discription">
                                <span class="brd_acc88">Classes 45</span>
                                <ul>
                                    <li>Legal services; security services  for the protection of property and individuals; personal and social services  rendered by others to meet the needs of individuals.</li>
                                </ul>
                                <p>
                                    <strong>Explanatory Note</strong><br>
                                    This Class includes, in particular:
                                </p>
                                <ul type="disc">
                                    <li>services rendered by lawyers to individuals, groups of       individuals, organizations and enterprises; </li>
                                    <li>investigation and surveillance services relating to the       safety of persons and entities; </li>
                                    <li>services provided to individuals in relation with       social events, such as social escort services, matrimonial agencies,       funeral services. </li>
                                </ul>
                                <p>This Class does not include, in particular:</p>
                                <ul type="disc">
                                    <li>professional services giving direct aid in the       operations or functions of a commercial undertaking; </li>
                                    <li>services relating to financial or monetary affairs and       services dealing with insurance; </li>
                                    <li>escorting of travellers; </li>
                                    <li>security transport; </li>
                                    <li>services consisting of all forms of education of       persons; </li>
                                    <li>performances of singers or dancers; </li>
                                    <li>computer services for the protection of software; </li>
                                    <li>services provided by others to give medical, hygienic       or beauty care for human beings or animals; </li>
                                    <li>certain rental services (consult the Alphabetical List       of Services and General Remark (b) relating to the classification of       services</li>
                                </ul>
                            </div>
                        </div>
                        <div class="clear"></div>
                        <button class="readmore">Read More</button>
                        <button style="display: none;" class="less">Less</button>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>

        </div>
        <div class="col-md-12" id="divTrademarkRegFaq" runat="server" visible="false">
            <ul class="Compinninnerpage1 accordiancss">
                <li>

                    <a href="javascript:showonlyone('f');" id="toggle1">What is a Trademark?</a>
                    <div class="newboxes" style="clear: both; display: none;" id="f">
                        <ul id="v-menu1" class="v-menu">
                            <li>
                                <p>
                                    A Trademark is typically a name, word, phrase, logo, symbol, image or a combination of these to distinguish a company's products and services from those of others.  It is also used as a marketing tool for creating awareness and recognition of products or services among customers.
                                </p>
                                <p>
                                    A trademark is the intellectual property of its holder; and ownership of a trademark flows from the business usage of the trademark.
                                </p>
                                <p>
                                    All trademarks cannot be registered; the following conditions must be met to facilitate trademark registration:
                                </p>
                                <ul style="list-style: disc; margin-left: 20px;">
                                    <li>It should be distinctive; and</li>
                                    <li>It should NOT: 
                                        <ul style="list-style: circle; margin-left: 20px;">
                                            <li>Describe the goods or services or any characteristics of them; </li>
                                            <li>Be a name that is customary in the line of trade; </li>
                                            <li>Be an emblem specially protected by the Government of India; </li>
                                            <li>Be offensive; </li>
                                            <li>Be against the law; or </li>
                                            <li>Be deceptive. </li>
                                        </ul>
                                    </li>
                                </ul>
                                <p></p>
                            </li>
                        </ul>
                    </div>
                </li>

                <li>
                    <a href="javascript:showonlyone('f1');" id="toggle2">What is trademark search?</a>
                    <div class="newboxes" style="clear: both; display: none;" id="f1">
                        <ul id="v-menu2" class="v-menu">
                            <li>
                                <p>
                                    Trademark search refers to the verification done by the Trademark Registry to check whether a similar trademark is already registered or an application is filed with the Registry. The search results indicate the possibility of getting the registration of your desired trademark.
                                </p>
                                <p>
                                    Conducting a trademark search before commercial use of your proposed trademark will help you to save the unnecessary cost of branding and avoids the chance of using a trademark that is similar to an existing trademark.
                                </p>
                                <p>
                                    CompaniesInn provides Trademark Search Services and will provide you a report with our findings on the basis of similar marks registered and applications filed with the Registry. 

                                </p>
                            </li>
                        </ul>
                    </div>
                </li>

                <li>
                    <a href="javascript:showonlyone('f2');" id="toggle3">What is the need of trademark registration?</a>
                    <div class="newboxes" style="clear: both; display: none;" id="f2">
                        <ul id="v-menu3" class="v-menu">
                            <li>
                                <p>
                                    Trademark gains its importance by usage. A trademark is not required to be registered for using in the business. It is required to be registered to posses the complete ownership of the mark and protect the same from usage by another person/company.
                                </p>
                                <p>
                                    Only if the trademark is registered, the owner gets the legal rights to take action against a person/entity infringing on their trademark. 

                                </p>
                            </li>
                        </ul>
                    </div>
                </li>



                <li>
                    <a href="javascript:showonlyone('f3');" id="toggle4">What are the benefits of trademark registration?</a>
                    <div class="newboxes" style="clear: both; display: none;" id="f3">
                        <ul id="v-menu4" class="v-menu">
                            <li>
                                <p>
                                    Registering a trademark gives the owner exclusive rights to use the mark for their products and services. 
                                </p>
                                <p>
                                    If the trademark is registered, the owner can use the symbol ®. In the case of trademarks for which a registration application is filed, the symbol ™ can be used.
                                </p>
                                <p>
                                    Using these symbols for unregistered trademarks or in cases where no application for registration is filed, is an offence.

                                </p>
                            </li>
                        </ul>
                    </div>
                </li>


                <li>
                    <a href="javascript:showonlyone('f4');" id="toggle5">What is the difference of Business Name and Trademark?</a>
                    <div class="newboxes" style="clear: both; display: none;" id="f4">
                        <ul id="v-menu5" class="v-menu">
                            <li>
                                <p>
                                    Registering a company or LLP name provides partial protection to your business name from a third party using the same or similar name for their company or LLP. Where such a situation occurs, the affected party can initiate action for seeking relief under the relevant provisions of the Companies Act or the LLP Act. There is no absolute solution under the Companies Act or the LLP Act to protect a Business Name.
                                </p>
                                <p>
                                    Similarly, registering a domain name provides protection against misuse of the name, so long as the registration is valid with registered domain extensions. In both the above cases, the exclusive usage and protection are not guaranteed.
                                </p>
                                <p>
                                    Trademark registration provides the maximum protection for a name or brand, because the trademark holder gets the absolute ownership of such marks for use in particular class/classes of products or services, where the trademark is registered.
                                </p>
                                <p>
                                    In the event that no company and/or domain name is registered before the registration of a trademark, the trademark holder enjoys the unrestricted right of restraining any third party usage of such trademark even as a company, LLP or domain name.

                                </p>
                            </li>
                        </ul>
                    </div>
                </li>



                <li>
                    <a href="javascript:showonlyone('f5');" id="toggle6">What is Trademark Classification?</a>
                    <div class="newboxes" style="clear: both; display: none;" id="f5">
                        <ul id="v-menu6" class="v-menu">
                            <li>
                                <p>
                                    Under trademark law, goods and services are categorised into 45 classes. It is very important to identify the class in which the goods/services fit into and file the application under the relevant class.
                                </p>
                                <p>
                                    If a trademark is used for goods and services under different classes, separate applications are required to be filed under each class to get protection of trademark for respective goods and services.

                                </p>
                            </li>
                        </ul>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</asp:Content>

