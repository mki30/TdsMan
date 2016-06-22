<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="Incorporate.aspx.cs" Inherits="Incorporate" %>

<%@ Register Src="~/Controls/PaymentControl.ascx" TagPrefix="uc1" TagName="PaymentControl" %>
<%@ Register Src="~/Controls/PayUMoneycontrol.ascx" TagPrefix="uc1" TagName="PayUMoneycontrol" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .table > thead > tr > th, .table > tbody > tr > th, .table > tfoot > tr > th, .table > thead > tr > td, .table > tbody > tr > td, .table > tfoot > tr > td {
            padding: 8px;
            line-height: 1.42857143;
            vertical-align: top;
            border-top: 0px;
        }

        .Compinninnerpage1 {
            list-style: none;
            margin: 0px;
            padding: 0px 0px 45px 0px;
            line-height: 27px;
            color: #636363;
            text-align: justify;
        }

        .img-pro {
            position: relative;
            left: 0%;
            max-height: 100%;
            background: url('../images/propreitorship.jpg') top center no-repeat;
        }

        .img-back-patnership {
            position: relative;
            left: 0%;
            max-height: 100%;
            background: url('../images2/Public%20Ltd..jpg') top center no-repeat;
            /*background: url('../images/partnership.jpg') top center no-repeat;*/
        }

        .backlimited-one {
            position: relative;
            left: 0%;
            max-height: 100%;
            /*background: url('../images/one-person-company.jpg') top center no-repeat;*/
            background: url('../images2/OPC.jpg') top center no-repeat;
        }

        .backlimited {
            position: relative;
            left: 0%;
            max-height: 100%;
            /*background: url('../images/llp-formation.jpg') top center no-repeat;*/
            background: url('../images2/LLP.jpg') top center no-repeat;
        }

        .img-back {
            position: relative;
            left: 0%;
            max-height: 100%;
            /*background: url('../images/private-limited.jpg') top center no-repeat;*/
            background: url('../images2/Pvt.%20Ltd..jpg') top center no-repeat;
        }

        .img-back-public {
            position: relative;
            left: 0%;
            max-height: 100%;
            /*background: url('../images/public-limited.jpg') top center no-repeat;*/
            background: url('../images2/Public%20Ltd..jpg') top center no-repeat;
        }
    </style>
    
    <script type="text/javascript">
        var minDSCnDIN = 2;
        $(document).ready(function () {
            $(".forcenumeric").keypress(isNumberKey);
            $("#ddState,#ddDIN,#ddDSC,#ddInitialCapital").bind('change', CalculatePrice);
            if ($("#lblCompanyType").text() == "5") //in case of public
            {
                minDSCnDIN = 3;
                $("#ddDIN").val(3);
                $("#ddDSC").val(3);
            }
            if ($("#lblCompanyType").text() == "8") //in case OPC
            {
                $("#ddDIN option[value='3'],option[value='4'],option[value='5']").hide();
                $("#ddDSC option[value='3'],option[value='4'],option[value='5']").hide();
                minDSCnDIN = 2;
                $("#ddDIN").val(2);
                $("#ddDSC").val(2);
            }
            //CalculatePrice();
        });

        function showonlyone(thechosenone) {
            $('.newboxes').each(function (index) {
                if ($(this).attr("id") == thechosenone) {
                    $(this).show(100);
                }
                else {
                    $(this).hide(200);
                }
            });
        }
        function Validate() {
            if ($("#txtName").val() == "") {
                alert("Name required!");
                $("#txtName").focus();
                return false;
            }
            if ($("#txtMobile").val() == "") {
                alert("Mobile no required!");
                $("#txtMobile").focus();
                return false;
            }
            if ($("#txtMobile").val() != "") {
                if ($("#txtMobile").val().length < 10) {
                    alert("Please enter valid mobile no!");
                    $("#txtMobile").focus();
                    return false;
                }
            }
            if ($("#txtEmail").val() == "") {
                alert("Email required!");
                $("#txtEmail").focus();
                return false;
            }

            if ($("#txtEmail").val() != "") {
                if (!IsEmail($("#txtEmail").val())) {
                    alert("Invalid Email");
                    return false;
                }
            }
            if ($("#ddState").val() == "") {
                alert("Please select a state!");
                $("#ddState").focus();
                return false;
            }
            if ($("#txtInitialCapital").val() == "") {
                alert("Initial capital is required!");
                $("#txtInitialCapital").focus();
                return false;
            }
        }
        function Format(x) {
            x = x.toString();
            if (x.indexOf('.') > 0) {
                var mianPart = x.split('.')[0];
                var decPart = x.split('.')[1];
            }
            else {
                mianPart = x;
                decPart = "";
            }
            var lastThree = mianPart.substring(mianPart.length - 3);
            var otherNumbers = mianPart.substring(0, mianPart.length - 3);
            if (otherNumbers != '')
                lastThree = ',' + lastThree;
            return otherNumbers.replace(/\B(?=(\d{2})+(?!\d))/g, ",") + lastThree + (decPart == "" ? "" : "." + decPart);
        }

        function CalculatePrice() {
            var mainprice = 14000;
            var dinDiscount = 0;
            var dscDiscount = 0;
            var discount = 0;
            var total = 0;

            if ($("#lblCompanyType").text() == "7") //in case of LLP
            {
                var initialCapital = $("#ddInitialCapital").val();
                if (initialCapital == 100000)
                    mainprice = 6000;
                else if (initialCapital == 500000)
                    mainprice = 8000;
                else if (initialCapital == 1000000)
                    mainprice = 11000;
                else
                    mainprice = 12500;
            }

            if (parseInt($("#ddDIN").val()) != minDSCnDIN)  ////discount per DIN if less than/greater than 2/3.
                dinDiscount = 500 * (parseInt(($("#ddDIN").val())) - minDSCnDIN);
            if (parseInt($("#ddDSC").val()) != minDSCnDIN)   //discount per DSC if less/greater than 2/3. 
                dscDiscount = 650 * (parseInt(($("#ddDSC").val())) - minDSCnDIN);

            if ($("#lblCompanyType").text() == "2") //private-ltd
            {
                if ($("#ddState").val() == "26")
                    mainprice = 22000;
            }
            else if ($("#lblCompanyType").text() == "5") //public-company
            {
                mainprice = 37500;
                if ($("#ddState").val() == "26")
                    mainprice = 51000;
            }
            else if ($("#lblCompanyType").text() == "8") //OPC
                mainprice = 13000;
            total = mainprice + dinDiscount + dscDiscount;
            $("#estimateHead").text("Estimated Price");
            $("#lblPrice").text(Format(total));
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row-fluid" id="divIncorporateForm" runat="server">
        <h1 id="heading" runat="server"></h1>
        <div class="img-back-patnership" id="ddRegForm" runat="server">
            <div class="container">
                <article class="col-sm-4 col-md-4 bottom-padding" style="float: right; margin: 20px; border-radius: 5px;">
                    <br />
                    <div style="background-color: #2FA2F5; padding: 10px; border-radius: 10px;">
                        <em style="font-size: 24px;" id="estimateHead">Starting from</em><br />
                        <em style="font-size: 26px;" itemprop="price" id="estimatedPrice">Rs.<span id="lblPrice" runat="server">6000</span><span style="font-size: 26px;">/-</span><span style="font-size: 16px;" id="lbltax">&nbsp;(12.36% Service tax extra)</span></em>
                        <asp:Label ID="lblCompanyType" runat="server" Text="0" Style="display: none"></asp:Label>
                    </div>
                    <div style="background-color: #EFAD85; padding: 10px; border-radius: 10px;">
                        <table class="table">
                            <tr style="display: none;">
                                <td>ID</td>
                                <td>
                                    <asp:Label ID="lblID" runat="server" Text="0"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 25%;">Full Name</td>
                                <td>
                                    <asp:TextBox ID="txtName" placeholder="Full Name" runat="server" CssClass="form-control"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>Mobile</td>
                                <td>
                                    <asp:TextBox ID="txtMobile" placeholder="Mobile" runat="server" CssClass="form-control forcenumeric" MaxLength="10"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>Email</td>
                                <td>
                                    <asp:TextBox ID="txtEmail" runat="server" placeholder="Email" CssClass="form-control"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>State</td>
                                <td>
                                    <asp:DropDownList ID="ddState" runat="server" CssClass="form-control">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>DIN</td>
                                <td>
                                    <asp:DropDownList ID="ddDIN" runat="server" CssClass="form-control">
                                        <asp:ListItem Value="0">Zero</asp:ListItem>
                                        <asp:ListItem Value="1">One</asp:ListItem>
                                        <asp:ListItem Selected="True" Value="2">Two</asp:ListItem>
                                        <asp:ListItem Value="3">Three</asp:ListItem>
                                        <asp:ListItem Value="4">Four</asp:ListItem>
                                        <asp:ListItem Value="5">Five</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>DSC</td>
                                <td>
                                    <asp:DropDownList ID="ddDSC" runat="server" CssClass="form-control">
                                        <asp:ListItem Value="0">Zero</asp:ListItem>
                                        <asp:ListItem Value="1">One</asp:ListItem>
                                        <asp:ListItem Selected="True" Value="2">Two</asp:ListItem>
                                        <asp:ListItem Value="3">Three</asp:ListItem>
                                        <asp:ListItem Value="4">Four</asp:ListItem>
                                        <asp:ListItem Value="5">Five</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>Capital</td>
                                <td>
                                    <%--<asp:TextBox ID="txtInitialCapital" runat="server" Text="100000" CssClass="form-control"></asp:TextBox>--%>
                                    <asp:DropDownList ID="ddInitialCapital" runat="server" CssClass="form-control">
                                        <asp:ListItem Value="100000">1 LAC</asp:ListItem>
                                        <%--<asp:ListItem Value="500000">1-5 LAC</asp:ListItem>
                                        <asp:ListItem Value="1000000">5-10 LAC</asp:ListItem>
                                        <asp:ListItem Value="1000001">greater than 10 LAC</asp:ListItem>--%>

                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label></td>
                                <td>
                                    <asp:Button ID="btnGetStarted" runat="server" Text="Get Started" class="btn btn-success" OnClientClick="return Validate();" OnClick="btnSubmit_Click" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </article>
            </div>
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
                            <td>Company Type</td>
                            <td id="summaryCompanyType" runat="server"></td>
                        </tr>
                        <tr>
                            <td>State</td>
                            <td id="summaryState" runat="server"></td>
                        </tr>
                        <tr>
                            <td>DIN</td>
                            <td id="summaryDIN" runat="server"></td>
                        </tr>
                        <tr>
                            <td>DSC</td>
                            <td id="summaryDSC" runat="server"></td>
                        </tr>
                        <tr>
                            <td>Capital</td>
                            <td id="summaryCapital" runat="server"></td>
                        </tr>
                        <tr>
                            <td>Payble Amount</td>
                            <td id="summaryPaybleAmmount" runat="server"></td>
                        </tr>
                    </table>
                </div>
                <div>
                    <asp:Button ID="btnProceedToPayment" runat="server" Text="Proceed To Payment" OnClick="btnProceedToPayment_Click" CssClass="btn btn-success center-block" />
                    <br />
                </div>
            </div>
        </div>
        <div class="col-md-6 col-md-offset-3" runat="server" visible="false">
            <uc1:PayUMoneycontrol runat="server" ID="PayUMoneycontrol" />
        </div>
    </div>
    <div class="row-fluid" id="divBasicInfo" runat="server">
        <asp:Panel runat="server" ID="plnProprietorship" Visible="false">
            <table class="table">
                <tr>
                    <!-- content -->
                    <td>
                        <div>A sole proprietorship is the oldest and the most common form of   business. It is a one-man organisation where a single individual owns, manages   and controls the business. Its main features are :- </div>
                        <ul type="square">
                            <li>Ease of formation is its most important feature because it is   not required to go through elaborate legal formalities. No agreement is to be   made and registration of the firm is also not essential. However, the owner may   be required to obtain a license specific to the line of business from the local   administration.</li>
                            <li>The capital required by the organisation is supplied wholly by   the owner himself and he depends largely on his own savings and profits of his   business.</li>
                            <li>Owner has a complete control over all the aspects of his   business and it is he who takes all the decisions though he may engage the   services of a few others to carry out the day-to-day activities. </li>
                            <li>Owner alone enjoys the benefits or profits of the business and   he alone bears the losses.</li>
                            <li>The firm has no legal existence separate from its owner.</li>
                            <li>The liability of the proprietor is unlimited i.e. it extends   beyond the capital invested in the firm.</li>
                            <li>Lack of continuity i.e. the existence of a sole proprietorship   business is dependent on the life of the proprietor and illness, death etc. of   the owner brings an end to the business. The continuity of business operation is   therefore uncertain.</li>
                        </ul>
                        <p><strong>Advantages</strong></p>
                        <ul type="square">
                            <li>Ease of formation </li>
                            <li>Maximum incentive for work</li>
                            <li>Secrecy of business </li>
                            <li>Quick decisions and flexibility of operations </li>
                        </ul>
                        <p><strong>Disadvantages</strong></p>
                        <ul type="square">
                            <li>Limited capital </li>
                            <li>Limited managerial ability </li>
                            <li>Limited life </li>
                            <li>Unlimited liability </li>
                        </ul>
                        <p>Hence, this form of organisation is suitable for the businesses   which involve moderate risk, small financial resources, capital requirement is   small and risk involvement is not heavy like automobile repair shops, small   bakery shops, tailoring, etc. It accounts for the largest number of business   concerns in India.</p>
                        <p align="right"><a href="#top" class="txt_10pxbluebld">^ Top</a></p>
                    </td>
                    <!-- end of content -->
                </tr>
            </table>
        </asp:Panel>

        <asp:Panel runat="server" ID="pnlPrivateLtd" Visible="false" CssClass="text-justify">
            <table class="table" style="text-align: justify;">
                <tr>
                    <!-- content -->
                    <td>
                        <div>A private limited company is a voluntary association of not   less than two and not more than fifty members, whose liability is limited, the   transfer of whose shares is limited to its members and who is not allowed to   invite the general public to subscribe to its shares or debentures. Its main   features are :-</div>
                        <ul>
                            <li>It has an independent legal existence. <a href="http://www.mca.gov.in/Ministry/pdf/CompaniesAct2013.pdf" target="_blank" class="bluelink11px">The Indian Companies Act,2013 </a>contains the provisions regarding the legal formalities   for setting up of a private limited company. Registrars of Companies (ROC)   appointed under the Companies Act covering the various States and Union   Territories are vested with the primary duty of registering companies floated in   the respective states and the Union Territories. </li>

                            <li>It is relatively less cumbersome to organise and operate it as   it has been exempted from many regulations and restrictions to which a public   limited company is subjected to. Some of them are :-
                                 <ul>
                                     <li>it need not file a prospectus with the Registrar.</li>
                                     <li>it need not obtain the Certificate for Commencement of business.</li>
                                     <li>it need not hold the statutory general meeting nor need it file the statutory   report.</li>
                                     <li>restrictions placed on the directors of the public limited company do not apply   to its directors.                                                                             
                                     </li>
                                 </ul>
                            </li>
                            <li>The liability of its members is limited. </li>
                            <li>The shares allotted to it's members are also not freely   transferable between them. These companies are not allowed to invite public to   subscribe to its shares and debentures. </li>
                            <li>It enjoys continuity of existence i.e. it continues to exist   even if all its members die or desert it.</li>
                        </ul>
                        <p>Hence, a private company is preferred by those who wish to take   the advantage of limited liability but at the same time desire to keep control   over the business within a limited circle and maintain the privacy of their   business.</p>
                        <p><strong>Advantages</strong></p>
                        <ul>
                            <li>Continuity of existence </li>
                            <li>Limited liability </li>
                            <li>Less legal restrictions </li>
                        </ul>
                        <p><strong>Disadvantages</strong></p>
                        <ul>
                            <li>Shares are not freely transferable </li>
                            <li>Not allowed to invite public to subscribe to its shares </li>
                            <li>Scope for promotional frauds </li>
                            <li>Undemocratic control </li>
                        </ul>
                    </td>
                    <!-- end of content -->
                </tr>
            </table>
        </asp:Panel>

        <asp:Panel runat="server" ID="pnlPartnershipFirm" Visible="false">
            <table class="table">
                <tr>
                    <!-- content -->
                    <td>
                        <div class="text-justify">Partnership is defined as a relation   between two or more persons who have agreed to share the profits of a business   carried on by all of them or any of them acting for all. The owners of a   partnership business are individually known as the "partners" and collectively   as a "firm". Its main features are :-</div>
                        <ul type="square">
                            <li>A partnership is easy to form as no cumbersome legal formalities are involved.   Its registration is also not essential. However, if the firm is not registered,   it will be deprived of certain legal benefits. The Registrar of Firms is   responsible for registering partnership firms.<br />
                                <br />
                            </li>
                            <li>The minimum number of partners must be two, while the maximum number can be 10   in case of banking business and 20 in all other types of business.
                            <br />
                                <br />
                            </li>
                            <li>The firm has no separate legal existence of its own i.e., the   firm and the partners are one and the same in the eyes of law.
                            <br />
                                <br />
                            </li>
                            <li>In the absence of any agreement to the contrary, all partners   have a right to participate in the activities of the business.<br />
                                <br />
                            </li>
                            <li>Ownership of property usually carries with it the right of   management. Every partner, therefore, has a right to share in the management of   the business firm.<br />
                                <br />
                            </li>
                            <li>Liability of the partners is unlimited. Legally, the partners   are said to be jointly and severally liable for the liabilities of the firm.   This means that if the assets and property of the firm is insufficient to meet   the debts of the firm, the creditors can recover their loans from the personal   property of the individual partners.<br />
                                <br />
                            </li>
                            <li>Restrictions are there on  the transfer of interest i.e. none   of the partners can transfer his interest in the firm to any person(except to   the existing partners) without the unanimous consent of all other partners.<br />
                                <br />
                            </li>
                            <li>The firm has a limited span of life i.e. legally, the firm must be dissolved on the retirement, lunacy, bankruptcy, or death of any partner.<br />
                                <br />
                            </li>
                        </ul>
                        <p align="justify">A partnership is formed by an agreement, which   may be either written or oral. When the written agreement is duly stamped and   registered, it is known as "Partnership Deed". Ordinarily, the rights, duties   and liabilities of partners are laid down in the deed. But in the case where the   deed does not specify the rights and obligations, the provisions of the <a href="../outerwin.php?id=http://indiacode.nic.in/rspaging.asp?tfnm=193209" target="_blank" class="bluelink11px">THE INDIAN   PARTNERSHIP ACT, 1932 </a>will apply. The deed, generally contains the following   particulars:- </p>
                        <ul type="square">
                            <li>Name of the firm.
                            <br />
                                <br />
                            </li>
                            <li>Nature of the business to be carried   out.
                            <br />
                                <br />
                            </li>
                            <li>Names of the partners.<br />
                                <br />
                            </li>
                            <li>The town and the place where business will be carried   on.<br />
                                <br />
                            </li>
                            <li>The amount of capital to be contributed by each partner.<br />
                                <br />
                            </li>
                            <li>Loans and advances by partners and the interest payable on   them.<br />
                                <br />
                            </li>
                            <li>The amount of drawings by each partner and the rate of interest   allowed thereon.<br />
                                <br />
                            </li>
                            <li>Duties and powers of each partner.
                            <br />
                                <br />
                            </li>
                            <li>Any other terms and conditions to run the business.<br />
                                <br />
                            </li>
                        </ul>
                        <p><strong>Advantages</strong></p>
                        <ul type="square">
                            <li>Ease of formation
                            <br />
                                <br />
                            </li>
                            <li>Greater capital and credit resources
                            <br />
                                <br />
                            </li>
                            <li>Better judgement and more managerial abilities
                            <br />
                                <br />
                            </li>
                        </ul>
                        <p><strong>Disadvantages</strong></p>
                        <ul type="square">
                            <li>Absence of ultimate authority
                            <br />
                                <br />
                            </li>
                            <li>Liability for the actions of other partners
                            <br />
                                <br />
                            </li>
                            <li>Limited life
                            <br />
                                <br />
                            </li>
                            <li>Unlimited liability
                            <br />
                                <br />
                            </li>
                        </ul>
                        <p align="justify">Partnership is an appropriate form of ownership for   medium sized business involving limited capital. This may include small scale   industries, wholesale and retail trade; small service concerns like transport   agencies, real estate brokers; professional firms like charted accountants,   doctors' clinic, attorney or law firms etc.</p>
                    </td>
                    <!-- end of content -->
                </tr>
            </table>
        </asp:Panel>

        <asp:Panel runat="server" ID="pnlCoOperative" Visible="false">
            <table class="ta">
                <tr>
                    <!-- content -->
                    <td>
                        <div align="justify">
                            Co-operative organisation is a society which has as its   objectives the promotion of the interests of its members in accordance with the   principles of cooperation. It is a voluntary association of ten or more members   residing or working in the same locality, who join together on the basis of   equality for the fulfillment of their economic or business interest. The basic   feature which differentiates the co-operatives from other forms of business   ownership is that its primary motive is service to the members rather than   making profits.
                        <p>There are different types of cooperatives like consumer   co-operatives, producer's co-operatives, marketing co-operatives, housing   co-operatives, credit co-operatives, farming co-operatives etc. The aim of all   such co-operatives is to promote the welfare of their members. Its main features   are :- </p>
                        </div>
                        <ul type="square">
                            <li>It is a voluntary organisation as a member is free to leave the   society and withdraw his capital at any time, after giving a notice.<br />
                                <br />
                            </li>
                            <li>The minimum number of members is 10, but there is no limit to   the maximum number of members. However, the members must be residing or working   in the same locality.<br />
                                <br />
                            </li>
                            <li>Registration of a co-operative enterprise is compulsory. A   co-operative society may be registered with the Registrar of Co-operatives   Societies.<br />
                                <br />
                            </li>
                            <li>After registration a co-operative enterprise becomes a body   corporate independent of its members i.e. a separate legal entity.<br />
                                <br />
                            </li>
                            <li>It is subject to the provisions of the <a href="http://indiacode.nic.in/rspaging.asp?tfnm=191202" target="_blank" class="bluelink11px">Co-operative Societies Act, 1912 </a>or State Co-operative   Societies Acts. It has to submit annual reports and accounts to the Registrar of   Societies.<br />
                                <br />
                            </li>
                            <li>The liability of every member is limited to the extent of his capital contribution.</li>
                            <li>The shares of co-operative society cannot be transferred but   can be returned to the society in case a member wants to withdraw his   membership.<br />
                                <br />
                            </li>
                            <li>Being a separate legal entity a co-operative enjoys continuity   of existence which is not affected by death, insolvency, retirement, etc. of the   members.<br />
                                <br />
                            </li>
                        </ul>
                        <p><strong>Advantages</strong></p>
                        <ul type="square">
                            <li>Greater amount of capital<br />
                                <br />
                            </li>
                            <li>Reasonable price, good quality or better service<br />
                                <br />
                            </li>
                            <li>Better conditions of service to employees<br />
                                <br />
                            </li>
                            <li>Continuity of existence<br />
                                <br />
                            </li>
                            <li>Limited liability</li>
                        </ul>
                        <p><strong>Disadvantages</strong></p>
                        <ul type="square">
                            <li>Inability to collect sufficient capital<br />
                                <br />
                            </li>
                            <li>Inability to provide efficient managerial services<br />
                                <br />
                            </li>
                            <li>Organisational limitation<br />
                                <br />
                            </li>
                        </ul>
                    </td>
                    <!-- end of content -->
                </tr>
            </table>
        </asp:Panel>

        <asp:Panel runat="server" ID="pnlPublicLimitedCompany" Visible="false" CssClass="text-justify">
            <table class="table">
                <tr>
                    <!-- content -->
                    <td>
                        <div>A public limited company is a voluntary association of members which is   incorporated and, therefore has a separate legal existence and the liability of   whose members is limited. Its main features are :-</div>
                        <ul>
                            <li>The company has a separate legal existence apart from its members who compose   it.</li>

                            <li>Its formation, working and its winding up, in fact, all its activities are   strictly governed by laws, rules and regulations. <a href="http://indiacode.nic.in/rspaging.asp?tfnm=195601" target="_blank" class="bluelink11px">The Indian   Companies Act, 1956</a> contains the provisions regarding the legal formalities   for setting up of a public limited company. Registrars of Companies (ROC)   appointed under the Companies Act covering the various States and Union   Territories are vested with the primary duty of registering companies floated in   the respective states and the Union Territories. </li>

                            <li>A company must have a minimum of seven members but there is no limit as regards   the maximum number.</li>

                            <li>The company collects its capital by the sale of its shares and those who buy the   shares are called the members. The amount so collected is called the share   capital.</li>

                            <li>The shares of a company are freely transferable and that too without the prior   consent of other shareholders or without subsequent notice to the company. </li>

                            <li>The liability of a member of a company is limited to the face value of the   shares he owns. Once he has paid the whole of the face value, he has no   obligation to contribute anything to pay off the creditors of the company. </li>

                            <li>The shareholders of a company do not have the right to participate in the   day-to-day management of the business of a company. This ensures separation of   ownership from management. The power of decision making in a company is vested   in the Board of Directors, and all policy decisions are taken at the Board level   by the majority rule. This ensures a unity of direction in management. </li>

                            <li>As a company is an independent legal person, its existence is not affected by   the death, retirement or insolvency of any of its shareholders.</li>
                        </ul>
                        <p><strong>Advantages</strong></p>
                        <ul>
                            <li>Continuity of existence </li>

                            <li>Larger amount of capital </li>

                            <li>Unity of direction </li>

                            <li>Efficient management </li>

                            <li>Limited liability </li>
                        </ul>
                        <p><strong>Disadvantages</strong></p>
                        <ul>
                            <li>Scope for promotional frauds </li>

                            <li>Undemocratic control </li>

                            <li>Scope for directors for personal profit </li>

                            <li>Subjected to strict regulations </li>
                        </ul>
                    </td>
                    <!-- end of content -->
                </tr>
            </table>
        </asp:Panel>

        <asp:Panel runat="server" ID="pnlJHFBuisiness" Visible="false" CssClass="text-justify">
            <table class="table">
                <tr>
                    <!-- content -->
                    <td>
                        <div>Joint Hindu Family Business is a distinct type of organisation   which is unique to India. Even within India its existence is restricted to only   certain parts of the country. In this form of business ownership, all members of   a Hindu undivided family do business jointly under the control of the head of   the family who is known as the 'Karta'. The members of the family are known as   'Co-parceners'. Thus, the Joint Hindu Family firm is a business owned by   co-parceners of a Hindu undivided estate. Its main features are :- </div>
                        <ul type="square">
                            <li>It comes into existence by the operation of Hindu law and not   out of contract. The rights and liabilities of co-parceners are determined by   the general rules of the Hindu law.<br />
                                <br />
                            </li>
                            <li>The membership of this form of business is the result of status   arising from the birth in the family and its legality is not affected by the   minority. Originally, only three successive generations in the male line (   grandfather, father and son) constituted the membership of this organisation. By   the Hindu Succession Act, a female relative of a deceased member or a male   relative of such a female member was made eligible for a share in the interest   of the related member ( called co-parcener) at the time of his death. There is   no legal limit to the maximum number of members.<br />
                                <br />
                            </li>
                            <li>Registration is unnecessary, but the rights of its members to   sue third parties for claims of debt remains unaffected.</li>
                            <li>It is managed generally by the Karta. He has the authority to   obtain loans against the family property or in other ways. Other members have no   right of management nor to contract loans binding on the joint-family property.<br />
                                <br />
                            </li>
                            <li>The manager or the Karta has the last word in the formulation   of all policies and in their execution. He has unquestioned authority in the   conduct of the family business.<br />
                                <br />
                            </li>
                            <li>The Karta has unlimited liability while the liability of the   other members is limited to the value of their individual interests in the joint   family.<br />
                                <br />
                            </li>
                            <li>The firm enjoys continuity of operations as its existence is not subject to the death or insolvency of a co-parcener or even of the Karta himself. Thus, it has a perpetual life like the public limited company.</li>
                        </ul>
                        <p><strong>Advantages</strong></p>
                        <ul type="square">
                            <li>Ease of formation<br />
                                <br />
                            </li>
                            <li>Continuity of operations<br />
                                <br />
                            </li>
                        </ul>
                        <p><strong>Disadvantages</strong></p>
                        <ul type="square">
                            <li>Confined to Joint Hindu families<br />
                                <br />
                            </li>
                            <li>Relatively limited capital<br />
                                <br />
                            </li>
                            <li>Limited managerial talents<br />
                                <br />
                            </li>
                            <li>Unlimited liability of the Karta<br />
                                <br />
                            </li>
                        </ul>
                        <p align="right">
                            <a href="#top" class="txt_10pxbluebld">^ Top</a>

                        </p>
                    </td>
                    <!-- end of content -->
                </tr>
            </table>
        </asp:Panel>

        <asp:Panel runat="server" ID="pnlLLP" Visible="false" CssClass="text-justify">
            <table class="table">
                <tr>
                    <td>
                        <div>
                            <a href="http://www.llp.gov.in/home_llp.htm" target="_blank" class="bluelink11px">Limited 
                                Liability Partnership (LLP)</a> is a new corporate structure that combines the flexibility of a partnership and the advantages of limited liability of a company at a low compliance cost. In other words, it is an alternative corporate business vehicle that provides the benefits of limited liability of a company, but allows its members the flexibility of organising their internal management on the basis of a mutually arrived agreement, as is the case in a partnership firm.
                                <p>Owing to flexibility in its structure and operation, it would be useful for small and medium enterprises, in general, and for the enterprises in services sector, in particular. Internationally, LLPs are the preferred vehicle of business, particularly for service industry or for activities involving professionals.</p>
                            <p>LLP is governed by the provisions of the <a href="http://www.llp.gov.in/files/LLP_Act_2008_15jan2009.pdf" target="_blank" class="bluelink11px">Limited Liability Partnership Act 2008</a>, the salient features of which are as follows: -</p>
                            <ul>
                                <li>The LLP shall be a body corporate and a legal entity separate from its partners. Any two or more persons, associated for carrying on a lawful business with a view to profit, may by subscribing their names to an incorporation document and filing the same with the Registrar, form a Limited Liability Partnership.  The LLP will have perpetual succession.</li>
                                <li>The mutual rights and duties of partners of an LLP inter se and those of the LLP and its partners shall be governed by an agreement between partners or between the LLP and the partners subject to the provisions of the LLP Act 2008 .  The act provides flexibility to devise the agreement as per their choice.                                </li>
                                <li>The LLP will be a separate legal entity, liable to the full extent of its assets, with the liability of the partners being limited to their agreed contribution in the LLP which may be of tangible or intangible nature or both tangible and intangible in nature. No partner would be liable on account of the independent or un-authorized actions of other partners or their misconduct. The liabilities of the LLP and partners who are found to have acted with intent to defraud creditors or for any fraudulent purpose shall be unlimited for all or any of the debts or other liabilities of the LLP.                                        
                                </li>
                                <li>Every LLP shall have at least two partners and shall also have at least two individuals as Designated Partners, of whom at least one shall be resident in India. The duties and obligations of Designated Partners shall be as provided in the law.                                        
                                </li>
                                <li>The LLP shall be under an obligation to maintain annual accounts reflecting true and fair view of its state of affairs.  A statement of accounts and solvency shall be filed by every LLP with the Registrar every year.  The accounts of LLPs shall also be audited, subject to any class of LLPs being exempted from this requirement by the Central Government.                                        
                                </li>
                                <li>The Central Government has powers to investigate the affairs of an LLP, if required, by appointment of competent Inspector for the purpose.                                        
                                </li>
                                <li>The compromise or arrangement including merger and amalgamation of LLPs shall be in accordance with the provisions of the LLP Act 2008.                                        
                                </li>
                                <li>A firm, private company or an unlisted public company is allowed to be converted into LLP in accordance with the provisions of the Act. Upon such conversion, on and from the date of certificate of registration issued by the Registrar in this regard, the effects of the conversion shall be such as are specified in the LLP Act. On and from the date of registration specified in the certificate of registration, all tangible (moveable or immoveable) and intangible property vested in the firm or the company, all assets, interests, rights, privileges, liabilities, obligations relating to the firm or the company, and the whole of the undertaking of the firm or the company,  shall be transferred to and shall vest in the LLP without further assurance, act or deed and the firm or the company,  shall be deemed to be dissolved and removed from the records of the Registrar of Firms or Registrar of Companies, as the case may be.                                        
                                </li>
                                <li>The winding up of the LLP may be either voluntary or by the Tribunal to be established under the Companies Act, 1956. Till the Tribunal is established, the power in this regard has been given to the High Court.                                        
                                </li>
                                <li>The LLP Act 2008 confers powers on the Central Government to apply provisions of the Companies Act, 1956 as appropriate, by notification with such changes or modifications as deemed necessary.  However, such notifications shall be laid in draft before each House of Parliament for a total period of 30 days and shall be subject to any modification as may be approved by both Houses.                                        
                                </li>
                                <li>The Indian Partnership Act, 1932 shall not be applicable to Limited Liability Partnerships.                                        
                                </li>
                            </ul>
                        </div>

                    </td>
                    <!-- end of content -->
                </tr>
            </table>
        </asp:Panel>

        <asp:Panel runat="server" ID="pnlOPC" Visible="false" CssClass="text-justify">
            <br />
            <p>
                One Person Company or OPC means a company which has only one person as a member.  OPC has all benefits of a private limited company such as protecting personal assets from business liability, separate legal entity and perpetual succession.  One Person Company (OPC) is a Company registered with ONLY ONE PERSON as its shareholder. An OPC is classified as a private company under Companies Act.
            </p>
            <strong>Features and Advantages of OPC</strong>
            <ol>
                <li>Only a natural person who is Resident in India and Citizen of India can become member of One Person Company.</li>
                <li>An individual can register ONLY 1 One Person Company.</li>
                <li>Only One shareholder is allowed in a One Person Company.</li>
                <li>A one person company cannot add more shareholder or investors to the Company.</li>
                <li>A one person company should have a minimum paid-up share capital of One Lakh Rupees and maximum of Fifty Lakhs.</li>
                <li>A One Person Company is required to get converted itself into a public company or a private company when the paid up share capital of a One Person Company exceeds INR 50 lakhs.</li>
                <li>Maximum turnover a One Person Company can make is Two Crore Rupees.</li>
                <li>A One Person Company is required to get convert itself into a public company or a private company in when its average annual turnover exceeds Two Crore Rupees during the period of immediately preceding three consecutive financial years.</li>
                <li>OPC should have at least one Director. In case the articles of the company doesn't state otherwise, the Subscriber / Sole shareholder shall be deemed to be its first director until another is appointed by the member. A One Person Company can have more than one Director.</li>
                <li>The following persons are not eligible to register an OPC in India.
                        <ol style="list-style: lower-roman; margin-left: 20px;">
                            <li>Minor – A minor cannot even hold beneficial interest in OPC.</li>
                            <li>Foreign National.</li>
                            <li>Overseas Citizen of India.</li>
                            <li>Non Resident Indian.</li>
                            <li>Company/LLP/Body Corporate.</li>
                        </ol>
                </li>
            </ol>
        </asp:Panel>
    </div>
    <div class="row-fluid" runat="server" visible="false" id="divPayment">
        <div class="col-md-8 col-md-offset-2">
            <uc1:PaymentControl runat="server" ID="PaymentControl" />
        </div>
    </div>
    <div id="Div1" class="row-fluid" runat="server">
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
    <div id="Div2" class="row-fluid" runat="server">
        <div class="col-md-8 col-md-offset-2">
            <asp:Label ID="lblPaymtMsg" runat="server" Text=""></asp:Label>
        </div>
    </div>
</asp:Content>

