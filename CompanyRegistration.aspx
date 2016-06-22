<%@ Page Title="Company Registration" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="CompanyRegistration.aspx.cs" Inherits="CompanyRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <%--<style type="text/css">
        .table > thead > tr > th, .table > tbody > tr > th, .table > tfoot > tr > th, .table > thead > tr > td, .table > tbody > tr > td, .table > tfoot > tr > td
        {
            padding: 8px;
            line-height: 1.42857143;
            vertical-align: top;
            border-top: 0px;
        }

        .Compinninnerpage1
        {
            list-style: none;
            margin: 0px;
            padding: 0px 0px 45px 0px;
            line-height: 27px;
            color: #636363;
            text-align: justify;
        }

        .img-pro
        {
            position: relative;
            left: 0%;
            max-height: 100%;
            background: url('../images/propreitorship.jpg') top center no-repeat;
        }

        .img-back-patnership
        {
            position: relative;
            left: 0%;
            max-height: 100%;
            background: url('../images/partnership.jpg') top center no-repeat;
        }

        .backlimited-one
        {
            position: relative;
            left: 0%;
            max-height: 100%;
            background: url('../images/one-person-company.jpg') top center no-repeat;
        }

        .backlimited
        {
            position: relative;
            left: 0%;
            max-height: 100%;
            background: url('../images/llp-formation.jpg') top center no-repeat;
        }

        .img-back
        {
            position: relative;
            left: 0%;
            max-height: 100%;
            background: url('../images/private-limited.jpg') top center no-repeat;
        }

        .img-back-public
        {
            position: relative;
            left: 0%;
            max-height: 100%;
            background: url('../images/public-limited.jpg') top center no-repeat;
        }
    </style>
    <script type="text/javascript">

        $(document).ready(function ()
        {
            $(".forcenumeric").keypress(isNumberKey);
        });

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

        function Validate()
        {
            if ($("#txtName").val() == "")
            {
                alert("Name required!")
                $("#txtName").focus();
                return false;
            }
            else if ($("#txtMobile").val() == "")
            {
                alert("Mobile no required!")
                $("#txtMobile").focus();
                return false;
            }
            else if ($("#txtEmail").val() == "")
            {
                alert("Email required!")
                $("#txtEmail").focus();
                return false;
            }
            else if($("#txtEmail").val() != "")
            {
                var valid = false;
                valid = IsEmail($("#txtEmail").val());
                if (!valid)
                {
                    alert("Invalid Email");
                    return false;
                }
            }

            else if ($("#txtEmail").val() != "")
            {
                var valid = false;
                valid = IsEmail($("#txtEmail").val());
                if (!valid)
                {
                    alert("Invalid Email");
                    return false;
                }
            }
        }
    </script>--%>
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
        <%--<div class="img-back-patnership" id="ddRegForm" runat="server">
            <div class="container">
                <article class="col-sm-4 col-md-4 bottom-padding" style="float: right; margin: 20px; border-radius: 5px;">
                    <br />
                    <div style="background-color: #2FA2F5; padding: 10px; border-radius: 10px;">
                        <em style="font-size: 24px;">Starting from</em><br />
                        <em style="font-size: 26px;" itemprop="price"><span id="lblPrice" runat="server">Rs.6,000 /- </span><span style="font-size: 16px;">&nbsp;all including taxes</span></em>
                        <asp:Label ID="lblCompanyType" runat="server" Text="0"></asp:Label>
                    </div>
                    <div style="background-color: #EFAD85; padding: 10px; border-radius: 10px;">
                        <div>
                            <asp:TextBox ID="txtName" placeholder="Full Name" runat="server" CssClass="form-control"></asp:TextBox>
                            <br />
                        </div>
                        <div>
                            <asp:TextBox ID="txtMobile" placeholder="Mobile" runat="server" CssClass="form-control forcenumeric" MaxLength="10" ></asp:TextBox>
                            <br />
                        </div>
                        <div>
                            <asp:TextBox ID="txtEmail" runat="server" placeholder="Email" CssClass="form-control"></asp:TextBox>
                            <br />
                        </div>
                        <div style="text-align: center;">
                            <asp:Button ID="btnSubmit" runat="server" Text="Contact Me" class="btn btn-success" OnClick="btnSubmit_Click" />
                            <asp:Button ID="btnGetStarted" runat="server" Text="Get Started" class="btn btn-success" OnClientClick="return Validate();" OnClick="btnSubmit_Click"/>
                        </div>
                        <div style="text-align: center;">
                            <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                </article>
            </div>
        </div>--%>

        <div class="col-md-12" style="text-align: justify;">
            <%--<asp:Panel runat="server" ID="plnProprietorship" Visible="false">
                <table class="table">
                    <tr>
                        <td>
                            <h1>Sole Proprietorship</h1>
                        </td>
                    </tr>
                    <tr>
                        <!-- content -->
                        <td>
                            <div>A sole proprietorship is the oldest and the most common form of   business. It is a one-man organisation where a single individual owns, manages   and controls the business. Its main features are :- </div>
                            <ul type="square">
                                <li>Ease of formation is its most important feature because it is   not required to go through elaborate legal formalities. No agreement is to be   made and registration of the firm is also not essential. However, the owner may   be required to obtain a license specific to the line of business from the local   administration.</li>
                                <br />
                                <li>The capital required by the organisation is supplied wholly by   the owner himself and he depends largely on his own savings and profits of his   business.</li>
                                <br />
                                <li>Owner has a complete control over all the aspects of his   business and it is he who takes all the decisions though he may engage the   services of a few others to carry out the day-to-day activities. </li>
                                <br />
                                <li>Owner alone enjoys the benefits or profits of the business and   he alone bears the losses.</li>
                                <br />
                                <li>The firm has no legal existence separate from its owner.</li>
                                <br />
                                <li>The liability of the proprietor is unlimited i.e. it extends   beyond the capital invested in the firm.</li>
                                <br />
                                <li>Lack of continuity i.e. the existence of a sole proprietorship   business is dependent on the life of the proprietor and illness, death etc. of   the owner brings an end to the business. The continuity of business operation is   therefore uncertain.</li>
                            </ul>
                            <p><strong>Advantages</strong></p>
                            <ul type="square">
                                <li>Ease of formation </li>
                                <br />
                                <li>Maximum incentive for work</li>
                                <br />
                                <li>Secrecy of business </li>
                                <br />
                                <li>Quick decisions and flexibility of operations </li>
                            </ul>
                            <p><strong>Disadvantages</strong></p>
                            <ul type="square">
                                <li>Limited capital </li>
                                <br />
                                <li>Limited managerial ability </li>
                                <br />
                                <li>Limited life </li>
                                <br />
                                <li>Unlimited liability </li>
                            </ul>
                            <p>Hence, this form of organisation is suitable for the businesses   which involve moderate risk, small financial resources, capital requirement is   small and risk involvement is not heavy like automobile repair shops, small   bakery shops, tailoring, etc. It accounts for the largest number of business   concerns in India.</p>
                            <p align="right"><a href="#top" class="txt_10pxbluebld">^ Top</a></p>
                        </td>
                        <!-- end of content -->
                    </tr>
                </table>
            </asp:Panel>

            <asp:Panel runat="server" ID="pnlPrivateLtd" Visible="false">
                <table class="table" style="text-align: justify;">
                    <tr>
                        <td>
                            <h1>Private Limited Company</h1>
                        </td>
                    </tr>
                    <tr>
                        <!-- content -->
                        <td>
                            <div>A private limited company is a voluntary association of not   less than two and not more than fifty members, whose liability is limited, the   transfer of whose shares is limited to its members and who is not allowed to   invite the general public to subscribe to its shares or debentures. Its main   features are :-</div>
                            <ul>
                                <li>It has an independent legal existence. <a href="http://indiacode.nic.in/rspaging.asp?tfnm=195601" target="_blank" class="bluelink11px">The Indian   Companies Act,1956 </a>contains the provisions regarding the legal formalities   for setting up of a private limited company. Registrars of Companies (ROC)   appointed under the Companies Act covering the various States and Union   Territories are vested with the primary duty of registering companies floated in   the respective states and the Union Territories. </li>

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
                        <td>
                            <h1>Partnership Firm</h1>
                        </td>
                    </tr>
                    <tr>
                        <!-- content -->
                        <td>
                            <div align="justify">Partnership is defined as a relation   between two or more persons who have agreed to share the profits of a business   carried on by all of them or any of them acting for all. The owners of a   partnership business are individually known as the "partners" and collectively   as a "firm". Its main features are :-</div>
                            <ul type="square">
                                <li>A partnership is easy to form as no cumbersome legal formalities are involved.   Its registration is also not essential. However, if the firm is not registered,   it will be deprived of certain legal benefits. The Registrar of Firms is   responsible for registering partnership firms.<br>
                                    <br>
                                </li>
                                <li>The minimum number of partners must be two, while the maximum number can be 10   in case of banking business and 20 in all other types of business.
                            <br>
                                    <br>
                                </li>
                                <li>The firm has no separate legal existence of its own i.e., the   firm and the partners are one and the same in the eyes of law.
                            <br>
                                    <br>
                                </li>
                                <li>In the absence of any agreement to the contrary, all partners   have a right to participate in the activities of the business.<br>
                                    <br>
                                </li>
                                <li>Ownership of property usually carries with it the right of   management. Every partner, therefore, has a right to share in the management of   the business firm.<br>
                                    <br>
                                </li>
                                <li>Liability of the partners is unlimited. Legally, the partners   are said to be jointly and severally liable for the liabilities of the firm.   This means that if the assets and property of the firm is insufficient to meet   the debts of the firm, the creditors can recover their loans from the personal   property of the individual partners.<br>
                                    <br>
                                </li>
                                <li>Restrictions are there on  the transfer of interest i.e. none   of the partners can transfer his interest in the firm to any person(except to   the existing partners) without the unanimous consent of all other partners.<br>
                                    <br>
                                </li>
                                <li>The firm has a limited span of life i.e. legally, the firm must be dissolved on the retirement, lunacy, bankruptcy, or death of any partner.<br>
                                    <br>
                                </li>
                            </ul>
                            <p align="justify">A partnership is formed by an agreement, which   may be either written or oral. When the written agreement is duly stamped and   registered, it is known as "Partnership Deed". Ordinarily, the rights, duties   and liabilities of partners are laid down in the deed. But in the case where the   deed does not specify the rights and obligations, the provisions of the <a href="../outerwin.php?id=http://indiacode.nic.in/rspaging.asp?tfnm=193209" target="_blank" class="bluelink11px">THE INDIAN   PARTNERSHIP ACT, 1932 </a>will apply. The deed, generally contains the following   particulars:- </p>
                            <ul type="square">
                                <li>Name of the firm.
                            <br>
                                    <br>
                                </li>
                                <li>Nature of the business to be carried   out.
                            <br>
                                    <br>
                                </li>
                                <li>Names of the partners.<br>
                                    <br>
                                </li>
                                <li>The town and the place where business will be carried   on.<br>
                                    <br>
                                </li>
                                <li>The amount of capital to be contributed by each partner.<br>
                                    <br>
                                </li>
                                <li>Loans and advances by partners and the interest payable on   them.<br>
                                    <br>
                                </li>
                                <li>The amount of drawings by each partner and the rate of interest   allowed thereon.<br>
                                    <br>
                                </li>
                                <li>Duties and powers of each partner.
                            <br>
                                    <br>
                                </li>
                                <li>Any other terms and conditions to run the business.<br>
                                    <br>
                                </li>
                            </ul>
                            <p><strong>Advantages</strong></p>
                            <ul type="square">
                                <li>Ease of formation
                            <br>
                                    <br>
                                </li>
                                <li>Greater capital and credit resources
                            <br>
                                    <br>
                                </li>
                                <li>Better judgement and more managerial abilities
                            <br>
                                    <br>
                                </li>
                            </ul>
                            <p><strong>Disadvantages</strong></p>
                            <ul type="square">
                                <li>Absence of ultimate authority
                            <br>
                                    <br>
                                </li>
                                <li>Liability for the actions of other partners
                            <br>
                                    <br>
                                </li>
                                <li>Limited life
                            <br>
                                    <br>
                                </li>
                                <li>Unlimited liability
                            <br>
                                    <br>
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
                        <td>
                            <h1>Co-operatives</h1>
                        </td>
                    </tr>
                    <tr>
                        <!-- content -->
                        <td>
                            <div align="justify">
                                Co-operative organisation is a society which has as its   objectives the promotion of the interests of its members in accordance with the   principles of cooperation. It is a voluntary association of ten or more members   residing or working in the same locality, who join together on the basis of   equality for the fulfillment of their economic or business interest. The basic   feature which differentiates the co-operatives from other forms of business   ownership is that its primary motive is service to the members rather than   making profits.
                        <p>There are different types of cooperatives like consumer   co-operatives, producer's co-operatives, marketing co-operatives, housing   co-operatives, credit co-operatives, farming co-operatives etc. The aim of all   such co-operatives is to promote the welfare of their members. Its main features   are :- </p>
                            </div>
                            <ul type="square">
                                <li>It is a voluntary organisation as a member is free to leave the   society and withdraw his capital at any time, after giving a notice.<br>
                                    <br>
                                </li>
                                <li>The minimum number of members is 10, but there is no limit to   the maximum number of members. However, the members must be residing or working   in the same locality.<br>
                                    <br>
                                </li>
                                <li>Registration of a co-operative enterprise is compulsory. A   co-operative society may be registered with the Registrar of Co-operatives   Societies.<br>
                                    <br>
                                </li>
                                <li>After registration a co-operative enterprise becomes a body   corporate independent of its members i.e. a separate legal entity.<br>
                                    <br>
                                </li>
                                <li>It is subject to the provisions of the <a href="http://indiacode.nic.in/rspaging.asp?tfnm=191202" target="_blank" class="bluelink11px">Co-operative Societies Act, 1912 </a>or State Co-operative   Societies Acts. It has to submit annual reports and accounts to the Registrar of   Societies.<br>
                                    <br>
                                </li>
                                <li>The liability of every member is limited to the extent of his capital contribution.</li>
                                <li>The shares of co-operative society cannot be transferred but   can be returned to the society in case a member wants to withdraw his   membership.<br>
                                    <br>
                                </li>
                                <li>Being a separate legal entity a co-operative enjoys continuity   of existence which is not affected by death, insolvency, retirement, etc. of the   members.<br>
                                    <br>
                                </li>
                            </ul>
                            <p><strong>Advantages</strong></p>
                            <ul type="square">
                                <li>Greater amount of capital<br>
                                    <br>
                                </li>
                                <li>Reasonable price, good quality or better service<br>
                                    <br>
                                </li>
                                <li>Better conditions of service to employees<br>
                                    <br>
                                </li>
                                <li>Continuity of existence<br>
                                    <br>
                                </li>
                                <li>Limited liability</li>
                            </ul>
                            <p><strong>Disadvantages</strong></p>
                            <ul type="square">
                                <li>Inability to collect sufficient capital<br>
                                    <br>
                                </li>
                                <li>Inability to provide efficient managerial services<br>
                                    <br>
                                </li>
                                <li>Organisational limitation<br>
                                    <br>
                                </li>
                            </ul>
                        </td>
                        <!-- end of content -->
                    </tr>
                </table>
            </asp:Panel>

            <asp:Panel runat="server" ID="pnlPublicLimitedCompany" Visible="false">
                <table class="table">
                    <tr>
                        <td>
                            <h1>Public Limited Company</h1>
                        </td>
                    </tr>
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

            <asp:Panel runat="server" ID="pnlJHFBuisiness" Visible="false">
                <table class="table">
                    <tr>
                        <td>
                            <h1>Joint Hindu Family Business</h1>
                        </td>
                    </tr>
                    <tr>
                        <!-- content -->
                        <td>
                            <div>Joint Hindu Family Business is a distinct type of organisation   which is unique to India. Even within India its existence is restricted to only   certain parts of the country. In this form of business ownership, all members of   a Hindu undivided family do business jointly under the control of the head of   the family who is known as the 'Karta'. The members of the family are known as   'Co-parceners'. Thus, the Joint Hindu Family firm is a business owned by   co-parceners of a Hindu undivided estate. Its main features are :- </div>
                            <ul type="square">
                                <li>It comes into existence by the operation of Hindu law and not   out of contract. The rights and liabilities of co-parceners are determined by   the general rules of the Hindu law.<br>
                                    <br>
                                </li>
                                <li>The membership of this form of business is the result of status   arising from the birth in the family and its legality is not affected by the   minority. Originally, only three successive generations in the male line (   grandfather, father and son) constituted the membership of this organisation. By   the Hindu Succession Act, a female relative of a deceased member or a male   relative of such a female member was made eligible for a share in the interest   of the related member ( called co-parcener) at the time of his death. There is   no legal limit to the maximum number of members.<br>
                                    <br>
                                </li>
                                <li>Registration is unnecessary, but the rights of its members to   sue third parties for claims of debt remains unaffected.</li>
                                <li>It is managed generally by the Karta. He has the authority to   obtain loans against the family property or in other ways. Other members have no   right of management nor to contract loans binding on the joint-family property.<br>
                                    <br>
                                </li>
                                <li>The manager or the Karta has the last word in the formulation   of all policies and in their execution. He has unquestioned authority in the   conduct of the family business.<br>
                                    <br>
                                </li>
                                <li>The Karta has unlimited liability while the liability of the   other members is limited to the value of their individual interests in the joint   family.<br>
                                    <br>
                                </li>
                                <li>The firm enjoys continuity of operations as its existence is not subject to the death or insolvency of a co-parcener or even of the Karta himself. Thus, it has a perpetual life like the public limited company.</li>
                            </ul>
                            <p><strong>Advantages</strong></p>
                            <ul type="square">
                                <li>Ease of formation<br>
                                    <br>
                                </li>
                                <li>Continuity of operations<br>
                                    <br>
                                </li>
                            </ul>
                            <p><strong>Disadvantages</strong></p>
                            <ul type="square">
                                <li>Confined to Joint Hindu families<br>
                                    <br>
                                </li>
                                <li>Relatively limited capital<br>
                                    <br>
                                </li>
                                <li>Limited managerial talents<br>
                                    <br>
                                </li>
                                <li>Unlimited liability of the Karta<br>
                                    <br>
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

            <asp:Panel runat="server" ID="pnlLLP" Visible="false">
                <table class="table">
                    <tr>
                        <td>
                            <h1>Limited Liability Partnership (LLP)</h1>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div>
                                <a href="http://www.llp.gov.in/home_llp.htm" target="_blank" class="bluelink11px">Limited 
                                Liability Partnership (LLP)</a> is a new corporate structure that combines the flexibility of a partnership and the advantages of limited liability of a company at a low compliance cost. In other words, it is an alternative corporate business vehicle that provides the benefits of limited liability of a company, but allows its members the flexibility of organising their internal management on the basis of a mutually arrived agreement, as is the case in a partnership firm.
                                <p>Owing to flexibility in its structure and operation, it would be useful for small and medium enterprises, in general, and for the enterprises in services sector, in particular. Internationally, LLPs are the preferred vehicle of business, particularly for service industry or for activities involving professionals.</p>
                                <p>LLP is governed by the provisions of the <a href="http://www.llp.gov.in/files/LLP_Act_2008_15jan2009.pdf" target="_blank" class="bluelink11px">Limited Liability Partnership Act 2008</a>, the salient features of which are as follows: -</p>
                                <ul>
                                    <li>The LLP shall be a body corporate and a legal entity separate from its partners. Any two or more persons, associated for carrying on a lawful business with a view to profit, may by subscribing their names to an incorporation document and filing the same with the Registrar, form a Limited Liability Partnership.  The LLP will have perpetual succession.</li>
                                    <li>The mutual rights and duties of partners of an LLP inter se and those of the LLP and its partners shall be governed by an agreement between partners or between the LLP and the partners subject to the provisions of the LLP Act 2008 .  The act provides flexibility to devise the agreement as per their choice.
                                        
                                    </li>

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

            <asp:Panel runat="server" ID="pnlOPC" Visible="false">
                    <h1 class="h1colorblue" style="padding-bottom: 10px;margin-top:20px;">One Person Company (OPC)</h1>
                    <p>
                        One Person Company or OPC means a company which has only one person as a member.  OPC has all benefits of a private limited company such as protecting personal assets from business liability, separate legal entity and perpetual succession.  One Person Company (OPC) is a Company registered with ONLY ONE PERSON as its shareholder. An OPC is classified as a private company under Companies Act.
                    </p>
                    <br />
                    <strong>Features and Advantages of OPC</strong>
                    <ul class="Compinninnerpage1">
                        <li>
                            <ol style="list-style: lower-alpha;">
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

                        </li>
                    </ul>
                
            </asp:Panel>--%>

            <asp:Panel runat="server" ID="pnlCompanyReg" Visible="false">
                <ul class="Compinninnerpage1">

                    <li>
                        <h1 class="h1colorblue" style="padding-bottom: 20px;">Company Registration?</h1>
                    </li>

                    <li>

                        <p>
                            The 'Company' form of organisation is the most common incorporated business structure in India. Introduced during the British rule, the 'company' structure was retained even after India gained independence, within a reworked legislative framework.

                        </p>

                        <p>
                            In India, a 'Limited Company' is a business organisation registered under the Companies Act, 2013 for doing business in a particular jurisdiction. It is an association of persons (individuals or body corporate like Companies and LLPs) registered under the Act. It is one of the most accepted business structure in India.

                        </p>
                        <p>
                            The company registration in India is regulated by the Companies Act, 2013 and Rules made there under and is administered by the Ministry of Corporate Affairs (www.mca.gov.in) through offices of the Registrar of Companies (ROC) in each state.

                        </p>

                    </li>
                    <section class="carousel">

                        <div class="reel" style="overflow: visible; transform: translate(0px, 0px);">

                            <article style="width: 100%; margin-top: 20px; text-align: left; margin-bottom: 0px; padding-bottom: 0px;" class="">

                                <h3 class="h3colorblack">What are the Types of Limited Companies?</h3>

                                <p>
                                    The following are the Types of Limited Companies that can be registered in India

                                </p>
                                <ul style="margin-left: 40px; list-style: disc;">

                                    <li>Private Limited Company</li>

                                    <li>One Person Company</li>

                                    <li>Public Limited Company</li>

                                    <li>Section 8 Companies - Non Profit Company</li>

                                    <li>Guarantee Company</li>

                                </ul>

                                <p></p>

                            </article>

                        </div>

                        <span class="forward" style="display: inline;"></span><span class="backward" style="display: inline;"></span>
                    </section>

                    <section class="carousel" style="border-top: #eeeeee solid 1px;">

                        <div class="reel" style="overflow: visible; transform: translate(0px, 0px);">

                            <article style="width: 100%; margin-top: 0px; text-align: left; margin-bottom: 0px; padding-bottom: 0px;" class="">

                                <h3 class="h3colorblack">What is a Private Company?</h3>

                                <p>
                                    A 'Private Company' is a limited company formed with minimum of 2 members and 2 Directors. The maximum number of members in a private company is restricted to 200. The name of the company should end with the words 'Private Limited'. A 'Private Limited' company is the most common incorporated business organisation in India. It is generally called as a 'Private Company'.

                                </p>

                            </article>

                        </div>

                        <span class="forward" style="display: inline;"></span><span class="backward" style="display: inline;"></span>
                    </section>

                    <section class="carousel" style="border-top: #eeeeee solid 1px;">

                        <div class="reel" style="overflow: visible; transform: translate(0px, 0px);">

                            <article style="width: 100%; margin-top: 0px; text-align: left; margin-bottom: 0px; padding-bottom: 0px;" class="loading">

                                <h3 class="h3colorblack">What is a One Person Company?</h3>

                                <p>
                                    One Person Company (OPC) means a company which has only one person as a member. Only an individual who is an Indian citizen and resident in India can incorporate a One Person Company.

                                </p>

                                <p>
                                    One Person Company should have only one person as its member and have a minimum paid-up share capital of One Lakh Rupees and maximum Fifty Lakhs and restricts the right to transfer its shares by its articles. OPC is a private company under Companies Act.

                                </p>

                            </article>

                        </div>

                        <span class="forward" style="display: inline;"></span><span class="backward" style="display: inline;"></span>
                    </section>
                    <section class="carousel" style="border-top: #eeeeee solid 1px;">

                        <div class="reel" style="overflow: visible; transform: translate(0px, 0px);">

                            <article style="width: 100%; margin-top: 0px; text-align: left; margin-bottom: 0px; padding-bottom: 0px;" class="loading">

                                <h3 class="h3colorblack">What is a Public Company?</h3>

                                <p>
                                    As the name reveals, a public limited company has a wider coverage than a private limited company. It is generally called a 'Public Company'. Minimum number of shareholders and directors are 7 and 3 respectively. There is no restriction on maximum number of shareholders.

                                </p>

                                <p>
                                    Generally, companies requiring huge capital investment from a large base of shareholders are opting for registration as a Public Limited Company.

                                </p>

                            </article>

                        </div>

                        <span class="forward" style="display: inline;"></span><span class="backward" style="display: inline;"></span>
                    </section>

                    <section class="carousel" style="border-top: #eeeeee solid 1px;">

                        <div class="reel" style="overflow: visible; transform: translate(0px, 0px);">

                            <article style="width: 100%; margin-top: 0px; text-align: left; margin-bottom: 0px; padding-bottom: 0px;" class="loading">

                                <h3 class="h3colorblack">What is a Section 8 Companies - Non Profit Company?</h3>

                                <p>
                                    A company can be registered with object to promote Commerce, Science, Art, Religion, Charity or other socially useful objects and not to make any profit. So, these companies generally called as Section 8 Company as the registration of such company is subject to the provisions of Section 8 of the Companies Act, 2013. A Section 8 Company shall not pay any dividend to its members but apply its surplus of receipts over payments for promotion of its objects. These companies need not use the words Limited or Private Limited after the name.

                                </p>

                            </article>

                        </div>

                        <span class="forward" style="display: inline;"></span><span class="backward" style="display: inline;"></span>
                    </section>





                    <section class="carousel" style="border-top: #eeeeee solid 1px;">

                        <div class="reel" style="overflow: visible; transform: translate(0px, 0px);">

                            <article style="width: 100%; margin-top: 0px; text-align: left; margin-bottom: 0px; padding-bottom: 0px;" class="loading">

                                <h3 class="h3colorblack">What is a Guarantee Company?</h3>

                                <p>
                                    Guarantee Company is a sub classification of Private or Public Companies. Usually it does not have share capital but instead has members who act as guarantors. The guarantors give an undertaking to contribute a nominal amount (typically very small) in the event of the winding up of the company. This type of company may also have capital and in that case, members are liable to pay the capital amount taken as well as the guarantee amount.

                                </p>

                                <p>
                                    Usually these companies are formed for Clubs and associations wherein members are not looking for profit. 

                                </p>



                            </article>

                        </div>

                        <span class="forward" style="display: inline;"></span><span class="backward" style="display: inline;"></span>
                    </section>
                </ul>
            </asp:Panel>

            <asp:Panel runat="server" ID="pnlRequiremenForPrivateCompanyReg" Visible="false">
                <ul class="Compinninnerpage1">

                    <li>
                        <h1 class="h1colorblue" style="padding-bottom: 20px; font-size: 28px; text-align: left;">Requirements for Private Company Registration</h1>
                    </li>

                    <li>Company Registration start with indentifying the pre-requisites for incorporation and processing required documents for filing with concerned Registrar of Companies. Before starting the process, keep in mind the pre-requisites for company registration as given below:

                        <br>

                        <br>





                        <strong>a. Shareholders (Members)</strong><p style="font-weight: normal; padding-left: 20px;">
                            Minimum Two Persons required. Only Natural or Artificial Persons such as registered Companies or LLPs can become members of Company. A Private Limited Company can have maximum of 200 Members.
                        </p>





                        <section class="carousel" style="border-top: #eeeeee solid 1px;">

                            <div class="reel" style="overflow: visible; transform: translate(0px, 0px);">

                                <article style="width: 100%; margin-top: 20px; text-align: left; margin-bottom: 0px; padding-bottom: 0px;" class="">

                                    <strong>b. Directors</strong><p style="font-weight: normal; padding-left: 20px;">
                                        Minimum Two Directors required. One of the directors must be Resident in India, ie, stayed in India not less than 182 in the previous calendar year. Proposed Directors must have a Director Identification Number (DIN) issued by the Ministry of Corporate Affairs.
                                    </p>

                                </article>

                            </div>

                            <span class="forward" style="display: inline;"></span><span class="backward" style="display: inline;"></span>
                        </section>





                        <section class="carousel" style="border-top: #eeeeee solid 1px;">

                            <div class="reel" style="overflow: visible; transform: translate(0px, 0px);">

                                <article style="width: 100%; margin-top: 20px; text-align: left; margin-bottom: 0px; padding-bottom: 0px;" class="">

                                    <strong>c. Company Name</strong><p style="font-weight: normal; padding-left: 20px;">
                                        The name of a Private Limited Company shall end with words "Private Limited". Company Name has three parts, ie., 'The Name', 'Activity' and words 'Private Limited'. Proposed Company name is required to be approved by the Registrar of Companies

                                    </p>

                                </article>

                            </div>

                            <span class="forward" style="display: inline;"></span><span class="backward" style="display: inline;"></span>
                        </section>







                        <section class="carousel" style="border-top: #eeeeee solid 1px;">

                            <div class="reel" style="overflow: visible; transform: translate(0px, 0px);">

                                <article style="width: 100%; margin-top: 20px; text-align: left; margin-bottom: 0px; padding-bottom: 0px;" class="">

                                    <strong>d.	Registered Office Address</strong><p style="font-weight: normal; padding-left: 20px;">
                                        A temporary address is required at the time of registration of Company. It could be an address including address of any of the Directors. After registration, the company has to file the permanent business address with documentary proof of address, ownership etc. 

                                    </p>

                                </article>

                            </div>

                            <span class="forward" style="display: inline;"></span><span class="backward" style="display: inline;"></span>
                        </section>









                        <section class="carousel" style="border-top: #eeeeee solid 1px;">

                            <div class="reel" style="overflow: visible; transform: translate(0px, 0px);">

                                <article style="width: 100%; margin-top: 20px; text-align: left; margin-bottom: 0px; padding-bottom: 0px;" class="loading">

                                    <strong>e.	Company Objects</strong><p style="font-weight: normal; padding-left: 20px;">
                                        Objects of the Company refer to proposed business activities. Company can have any legal business activities that are legal. It is advisable to identify the main objects of the company in a particular line of business.  The name of the company must be in line with the main objects of the company. If the name of the company is not describing a particular object, then the company can have multifaceted objects. The objects are described under a Clause in Memorandum of Association of the Company.

                                    </p>

                                </article>

                            </div>

                            <span class="forward" style="display: inline;"></span><span class="backward" style="display: inline;"></span>
                        </section>







                        <section class="carousel" style="border-top: #eeeeee solid 1px;">

                            <div class="reel" style="overflow: visible; transform: translate(0px, 0px);">

                                <article style="width: 100%; margin-top: 20px; text-align: left; margin-bottom: 0px; padding-bottom: 0px;" class="loading">

                                    <strong>f.	Digital Signature Certificate (DSC)</strong><p style="font-weight: normal; padding-left: 20px;">
                                        All documents are filed online with Registrar of Companies. Online Filing of documents to be authenticated by using a Digital Signature Certificate of the Director obtained from the Certifying Authority in India. 

                                    </p>

                                </article>

                            </div>

                            <span class="forward" style="display: inline;"></span><span class="backward" style="display: inline;"></span>
                        </section>





                        <section class="carousel" style="border-top: #eeeeee solid 1px;">

                            <div class="reel" style="overflow: visible; transform: translate(0px, 0px);">

                                <article style="width: 100%; margin-top: 20px; text-align: left; margin-bottom: 0px; padding-bottom: 0px;" class="loading">

                                    <strong>g.	Professional Certification</strong><p style="font-weight: normal; padding-left: 20px;">
                                        Services of a Company Secretary, Chartered Account, Cost Accountant is required to make necessary Certifications and declarations for incorporation of a Company.

                                    </p>

                                </article>

                            </div>

                            <span class="forward" style="display: inline;"></span><span class="backward" style="display: inline;"></span>
                        </section>
                    </li>
                </ul>
            </asp:Panel>

            <asp:Panel runat="server" ID="PnlReqForOPCReg" Visible="false">
                <ul class="Compinninnerpage1">

                    <li>
                        <h1 class="h1colorblue" style="padding-bottom: 20px; font-size: 28px; text-align: left;">Requirements of One Person Company (OPC) Registration</h1>
                    </li>
                    <li>Company Registration start with indentifying the pre-requisites for incorporation and processing required documents for filing with concerned Registrar of Companies. Before starting the process, keep in mind the pre-requisites for One Person Company Registration as given below:

                        <br>

                        <br>

                        <strong>a.	Shareholder (Member)</strong><p style="font-weight: normal; padding-left: 20px;">
                            One individual person who is a citizen of India and resident in India only can register One Person Company in India. Companies and LLPs cannot become member of One Person Company. At any time, a One Person Company can have only one Member.
                        </p>

                        <section class="carousel" style="border-top: #eeeeee solid 1px;">

                            <div class="reel" style="overflow: visible; transform: translate(0px, 0px);">

                                <article style="width: 100%; margin-top: 20px; text-align: left; margin-bottom: 0px; padding-bottom: 0px;" class="loading">

                                    <strong>b. Nominee Shareholder (Member)</strong><p style="font-weight: normal; padding-left: 20px;">
                                        Member of an OPC has to nominate another person to become the member of the company in the event of the Member's death or his incapacity to contract. Only an individual who is an Indian citizen and resident in India can become nominee for the sole member of a One Person Company.
                                    </p>

                                </article>

                            </div>

                            <span class="forward" style="display: inline;"></span><span class="backward" style="display: inline;"></span>
                        </section>





                        <section class="carousel" style="border-top: #eeeeee solid 1px;">

                            <div class="reel" style="overflow: visible; transform: translate(0px, 0px);">

                                <article style="width: 100%; margin-top: 20px; text-align: left; margin-bottom: 0px; padding-bottom: 0px;" class="loading">

                                    <strong>c. Directors</strong><p style="font-weight: normal; padding-left: 20px;">
                                        Minimum One Director required. The Director must be a Resident in India, ie, stayed in India not less than 182 in the previous calendar year. OPC can have more than one director. Proposed Director(s) must have a Director Identification Number (DIN) issued by the Ministry of Corporate Affairs.

                                    </p>

                                </article>

                            </div>

                            <span class="forward" style="display: inline;"></span><span class="backward" style="display: inline;"></span>
                        </section>







                        <section class="carousel" style="border-top: #eeeeee solid 1px;">

                            <div class="reel" style="overflow: visible; transform: translate(0px, 0px);">

                                <article style="width: 100%; margin-top: 20px; text-align: left; margin-bottom: 0px; padding-bottom: 0px;" class="loading">

                                    <strong>d.	Company Name</strong><p style="font-weight: normal; padding-left: 20px;">
                                        The name of a One Person Company shall end with words "Private Limited (OPC)". Company Name has three parts, ie., 'The Name', 'Activity' and words 'Private Limited (OPC)'. Proposed Company name is required to be approved by the Registrar of Companies. 

                                    </p>

                                </article>

                            </div>

                            <span class="forward" style="display: inline;"></span><span class="backward" style="display: inline;"></span>
                        </section>









                        <section class="carousel" style="border-top: #eeeeee solid 1px;">

                            <div class="reel" style="overflow: visible; transform: translate(0px, 0px);">

                                <article style="width: 100%; margin-top: 20px; text-align: left; margin-bottom: 0px; padding-bottom: 0px;" class="loading">

                                    <strong>e.	Registered Office Address</strong><p style="font-weight: normal; padding-left: 20px;">
                                        A temporary address is required at the time of registration of Company. It could be an address including address of any of the Directors. After registration, the company has to file the permanent business address with documentary proof of address, ownership etc. 

                                    </p>

                                </article>

                            </div>

                            <span class="forward" style="display: inline;"></span><span class="backward" style="display: inline;"></span>
                        </section>







                        <section class="carousel" style="border-top: #eeeeee solid 1px;">

                            <div class="reel" style="overflow: visible; transform: translate(0px, 0px);">

                                <article style="width: 100%; margin-top: 20px; text-align: left; margin-bottom: 0px; padding-bottom: 0px;" class="loading">

                                    <strong>f.	Company Objects</strong><p style="font-weight: normal; padding-left: 20px;">
                                        Objects of the Company refer to proposed business activities. Company can have any legal business activities that are legal. It is advisable to identify the main objects of the company in a particular line of business.  The name of the company must be in line with the main objects of the company. If the name of the company is not describing a particular object, then the company can have multifaceted objects. The objects are described under a Clause in Memorandum of Association of the Company.

                                    </p>

                                </article>

                            </div>

                            <span class="forward" style="display: inline;"></span><span class="backward" style="display: inline;"></span>
                        </section>





                        <section class="carousel" style="border-top: #eeeeee solid 1px;">

                            <div class="reel" style="overflow: visible; transform: translate(0px, 0px);">

                                <article style="width: 100%; margin-top: 20px; text-align: left; margin-bottom: 0px; padding-bottom: 0px;" class="loading">

                                    <strong>g.	Digital Signature Certificate (DSC)</strong><p style="font-weight: normal; padding-left: 20px;">
                                        All documents are filed online with Registrar of Companies. Online Filing of documents to be authenticated by using a Digital Signature Certificate of the Director obtained from the Certifying Authority in India.

                                    </p>

                                </article>

                            </div>

                            <span class="forward" style="display: inline;"></span><span class="backward" style="display: inline;"></span>
                        </section>





                        <section class="carousel" style="border-top: #eeeeee solid 1px;">

                            <div class="reel" style="overflow: visible; transform: translate(0px, 0px);">

                                <article style="width: 100%; margin-top: 20px; text-align: left; margin-bottom: 0px; padding-bottom: 0px;" class="loading">

                                    <strong>h.	Professional Certification </strong>
                                    <p style="font-weight: normal; padding-left: 20px;">
                                        Services of a Company Secretary, Chartered Account, Cost Accountant is required to make necessary Certifications and declarations for incorporation of a Company. 

                                    </p>

                                </article>

                            </div>

                            <span class="forward" style="display: inline;"></span><span class="backward" style="display: inline;"></span>
                        </section>
                    </li>
                </ul>
            </asp:Panel>

            <asp:Panel runat="server" ID="pnlReqPublicCompanyReg" Visible="false">
                <ul class="Compinninnerpage1">

                    <li>
                        <h1 class="h1colorblue" style="padding-bottom: 20px; font-size: 28px; text-align: left;">Requirements of Public Company Registration</h1>
                    </li>

                    <li>Company Registration start with indentifying the pre-requisites for incorporation and processing required documents for filing with concerned Registrar of Companies. Before starting the process, keep in mind the pre-requisites for public company registration as given below:

                        <br>

                        <br>

                        <strong>a.	Shareholders (Members)</strong><p style="font-weight: normal; padding-left: 20px;">
                            Minimum Seven Persons required. Only Natural or Artificial Persons such as registered Companies or LLPs can become members of Company. In Public Limited Company, there is no restriction on maximum number of Members.
                        </p>

                        <section class="carousel" style="border-top: #eeeeee solid 1px;">

                            <div class="reel" style="overflow: visible; transform: translate(0px, 0px);">

                                <article style="width: 100%; margin-top: 20px; text-align: left; margin-bottom: 0px; padding-bottom: 0px;" class="loading">

                                    <strong>b. Directors </strong>
                                    <p style="font-weight: normal; padding-left: 20px;">
                                        Minimum Three Directors required. One of the directors must be Resident in India, ie, stayed in India not less than 182 in the previous calendar year. Proposed Directors must have a Director Identification Number (DIN) issued by the Ministry of Corporate Affairs.
                                    </p>

                                </article>

                            </div>

                            <span class="forward" style="display: inline;"></span><span class="backward" style="display: inline;"></span>
                        </section>

                        <section class="carousel" style="border-top: #eeeeee solid 1px;">

                            <div class="reel" style="overflow: visible; transform: translate(0px, 0px);">

                                <article style="width: 100%; margin-top: 20px; text-align: left; margin-bottom: 0px; padding-bottom: 0px;" class="loading">

                                    <strong>c. Company Name</strong><p style="font-weight: normal; padding-left: 20px;">
                                        The name of a Public Limited Company shall end with words "Limited". Company Name has three parts, ie., 'The Name', 'Activity' and words 'Limited'. Proposed Company name is required to be approved by the Registrar of Companies.

                                    </p>

                                </article>

                            </div>

                            <span class="forward" style="display: inline;"></span><span class="backward" style="display: inline;"></span>
                        </section>
                        <section class="carousel" style="border-top: #eeeeee solid 1px;">

                            <div class="reel" style="overflow: visible; transform: translate(0px, 0px);">

                                <article style="width: 100%; margin-top: 20px; text-align: left; margin-bottom: 0px; padding-bottom: 0px;" class="loading">

                                    <strong>d.	Registered Office Address</strong><p style="font-weight: normal; padding-left: 20px;">
                                        A temporary address is required at the time of registration of Company. It could be an address including address of any of the Directors. After registration, the company has to file the permanent business address with documentary proof of address, ownership etc. 

                                    </p>

                                </article>

                            </div>

                            <span class="forward" style="display: inline;"></span><span class="backward" style="display: inline;"></span>
                        </section>

                        <section class="carousel" style="border-top: #eeeeee solid 1px;">

                            <div class="reel" style="overflow: visible; transform: translate(0px, 0px);">

                                <article style="width: 100%; margin-top: 20px; text-align: left; margin-bottom: 0px; padding-bottom: 0px;" class="loading">

                                    <strong>e.	Company Objects</strong><p style="font-weight: normal; padding-left: 20px;">
                                        Objects of the Company refer to proposed business activities. Company can have any legal business activities that are legal. It is advisable to identify the main objects of the company in a particular line of business.  The name of the company must be in line with the main objects of the company. If the name of the company is not describing a particular object, then the company can have multifaceted objects. The objects are described under a Clause in Memorandum of Association of the Company.

                                    </p>

                                </article>

                            </div>

                            <span class="forward" style="display: inline;"></span><span class="backward" style="display: inline;"></span>
                        </section>







                        <section class="carousel" style="border-top: #eeeeee solid 1px;">

                            <div class="reel" style="overflow: visible; transform: translate(0px, 0px);">

                                <article style="width: 100%; margin-top: 20px; text-align: left; margin-bottom: 0px; padding-bottom: 0px;" class="loading">

                                    <strong>f.	Digital Signature Certificate (DSC)</strong><p style="font-weight: normal; padding-left: 20px;">
                                        All documents are filed online with Registrar of Companies. Online Filing of documents to be authenticated by using a Digital Signature Certificate of the Director obtained from the Certifying Authority in India. 

                                    </p>

                                </article>

                            </div>

                            <span class="forward" style="display: inline;"></span><span class="backward" style="display: inline;"></span>
                        </section>





                        <section class="carousel" style="border-top: #eeeeee solid 1px;">

                            <div class="reel" style="overflow: visible; transform: translate(0px, 0px);">

                                <article style="width: 100%; margin-top: 20px; text-align: left; margin-bottom: 0px; padding-bottom: 0px;" class="loading">

                                    <strong>g.	Professional Certification </strong>
                                    <p style="font-weight: normal; padding-left: 20px;">
                                        Services of a Company Secretary, Chartered Account, Cost Accountant is required to make necessary Certifications and declarations for incorporation of a Company.  

                                    </p>

                                </article>

                            </div>

                            <span class="forward" style="display: inline;"></span><span class="backward" style="display: inline;"></span>
                        </section>
                    </li>
                </ul>
            </asp:Panel>

            <asp:Panel runat="server" ID="pnlCompanyRegProcess" Visible="false">
                <ul class="Compinninnerpage1">

                    <li>
                        <h1 class="h1colorblue" style="padding-bottom: 20px; font-size: 28px; text-align: left;">Company Registration Process</h1>
                    </li>

                    <li>Company Registration Process can be divided in to 3 stages and the processes involved are as follows:

                        <br>

                        <br>

                        <strong>Stage-I:  Pre-Requisites </strong>

                        <p style="font-weight: normal; padding-left: 20px;">
                        </p>
                        <ol style="margin-left: 30px; list-style: decimal;">

                            <li>Identify Shareholder(s)</li>

                            <li>Identify Director(s)</li>

                            <li>Determine Authorised Capital of the company</li>

                            <li>Decide Objects of the Company</li>

                            <li>Decide proposed Names of the Company</li>

                            <li>Decide the State in which the company is to be registered.</li>

                        </ol>

                        <p></p>





                        <section class="carousel" style="border-top: #eeeeee solid 1px;">

                            <div class="reel" style="overflow: visible; transform: translate(0px, 0px);">

                                <article style="width: 100%; margin-top: 20px; text-align: left; margin-bottom: 0px; padding-bottom: 0px;" class="loading">

                                    <strong>Stage-II: Documentation and Registration</strong>

                                    <p style="font-weight: normal; padding-left: 20px;">
                                    </p>
                                    <ol style="margin-left: 30px; list-style: decimal;">

                                        <li>Obtain Digital Signature Certificate (DSC) for Directors.</li>

                                        <li>Obtain Director Identification Number (DIN) for Directors.</li>

                                        <li>Apply for Company Name.</li>

                                        <li>Execute Company Registration Documents (after name approval).</li>

                                        <li>Submission of Company Registration Documents to the Registrar of Companies (ROC).</li>

                                        <li>Registration and Certificate of Incorporation from ROC.</li>

                                    </ol>

                                    <p></p>

                                </article>

                            </div>

                            <span class="forward" style="display: inline;"></span><span class="backward" style="display: inline;"></span>
                        </section>





                        <section class="carousel" style="border-top: #eeeeee solid 1px;">

                            <div class="reel" style="overflow: visible; transform: translate(0px, 0px);">

                                <article style="width: 100%; margin-top: 20px; text-align: left; margin-bottom: 0px; padding-bottom: 0px;" class="loading">

                                    <strong>Stage-III: Post Registration</strong>

                                    <p style="font-weight: normal; padding-left: 20px;">
                                    </p>
                                    <ol style="margin-left: 30px; list-style: decimal;">

                                        <li>Verification of Registered Office Address</li>

                                        <li>Declaration for Commencement of Business</li>

                                    </ol>

                                    <p></p>

                                </article>

                            </div>

                            <span class="forward" style="display: inline;"></span><span class="backward" style="display: inline;"></span>
                        </section>
                    </li>
                </ul>
            </asp:Panel>

            <asp:Panel runat="server" ID="pnlCompanyNameAvlGuidlines" Visible="false">
                <ul class="Compinninnerpage1">

                    <li>
                        <h1 class="h1colorblue" style="padding-bottom: 20px; font-size: 28px; text-align: left;">Company Name Availability Guidelines</h1>

                    </li>

                    <li>As a first step towards registering a Company, the promoter should get the proposed Company Name approved by the respective Registrar of Companies (ROC). Company name approval and allotment process in India is administered by the Ministry of Corporate Affairs (MCA) as per the Company Name Availability Guidelines issued under Companies Act 2013.

                        <p>
                            The basic concept of name availability is that name proposed for registration shall no identical or resemble to an existing company name. Also the proposed name shall be within the rules framed by government of India from time to time.

                        </p>

                        <p>
                            Once name is allocated, it is available for registration for a period of 60 days from the date of filing of application of name.

                        </p>

                        <p>
                            Point to be noted before selecting the name.

                        </p>



                        <section class="carousel">

                            <div class="reel linksindexblack" style="overflow: visible; transform: translate(0px, 0px);">

                                <article style="width: 100%; margin-top: 0px; text-align: left; margin-bottom: 0px; padding-bottom: 0px;" class="loading">

                                    <p style="font-weight: normal; padding-left: 20px;">
                                    </p>
                                    <ol style="margin-left: 30px; list-style: decimal;">

                                        <li>Check MCA website <a href="http://www.mca.gov.in/">www.mca.gov.in</a> for name availability to see that any company is registered with similar name.</li>

                                        <li>Also see any trademark registered or applicable filed for trademark with proposed name. Use <a href="http://164.100.176.38/tmrpublicsearch/frmmain.aspx">Trademark Public Search</a> link to check whether any trademark registered for the proposed name.</li>

                                        <li>Ensure that Company Name and activity has a relation such as for software development for company name XYZ Software Private Limited.</li>

                                    </ol>

                                    <p></p>

                                </article>

                            </div>

                            <span class="forward" style="display: inline;"></span><span class="backward" style="display: inline;"></span>
                        </section>





                        <section class="carousel" style="border-top: #eeeeee solid 1px;">

                            <div class="reel" style="overflow: visible; transform: translate(0px, 0px);">

                                <article style="width: 100%; margin-top: 0px; text-align: left; margin-bottom: 0px; padding-bottom: 0px;" class="loading">

                                    <h2 class="h3colorblack">FAQ on Name Availability Guidelines</h2>

                                    <h3 class="h3colorblack">What is a Company Name or a Corporate Name?</h3>

                                    <p>
                                        'Company Name' is the name by which a registered Company is being identified. Generally, name of the Company depicts its Trade Name or Brand Name along with its main activities.

                                    </p>

                                </article>

                            </div>

                            <span class="forward" style="display: inline;"></span><span class="backward" style="display: inline;"></span>
                        </section>







                        <section class="carousel" style="border-top: #eeeeee solid 1px;">

                            <div class="reel" style="overflow: visible; transform: translate(0px, 0px);">

                                <article style="width: 100%; margin-top: 0px; text-align: left; margin-bottom: 0px; padding-bottom: 0px;" class="loading">

                                    <h3 class="h3colorblack">How the Company Name should be?</h3>

                                    <p>
                                        In the case of a private limited company, the name shall end with words "Private Limited" or with word "Limited" in case of a public limited company. Company Name has three parts. 'The Name', 'Activity' and words 'Private Limited' or 'Limited' as the case may be. 

                                    </p>

                                    <p>
                                        For Example 'CompaniesInn.com India Private Limited'. Here, 'CompaniesInn' stands as unique name, '.com' refers to online services, 'India' stands as a 'noun' and 'Private Limited' refers to the mandatory requirement of last words for a Private Limited Company. We have registered the name 'CompaniesInn' as a Trademark. Thereafter when converted to a Limited Liability Partnership, we have changed the name as 'CompaniesInn.com LLP'.

                                    </p>

                                </article>

                            </div>

                            <span class="forward" style="display: inline;"></span><span class="backward" style="display: inline;"></span>
                        </section>







                        <section class="carousel" style="border-top: #eeeeee solid 1px;">

                            <div class="reel" style="overflow: visible; transform: translate(0px, 0px);">

                                <article style="width: 100%; margin-top: 0px; text-align: left; margin-bottom: 0px; padding-bottom: 0px;" class="loading">

                                    <h3 class="h3colorblack">How to choose the Company Name?</h3>

                                    <p>

                                        <strong>The Company Name SHOULD</strong><br>
                                        -	Be unique<br>
                                        -	Contain a noun and an activity word that reflects its objectives<br>
                                        -	Be in line with Company Name Guidelines issued by Ministry of Corporate Affairs.<br>
                                    </p>

                                    <p>

                                        <strong>The Company Name SHOULD NOT</strong><br>
                                        -	Be same, similar, identical or resembling to the name of an existing Company or LLP registered. Phonetically similar names also to be avoided.<br>
                                        -	Be similar of a registered trade mark or a trade mark for which an application has already been filed<br>
                                        -	Be Offensive<br>
                                        -	Be Undesirable in the opinion of the Central Government (Undesirability of names explained separately)<br>
                                    </p>

                                </article>

                            </div>

                            <span class="forward" style="display: inline;"></span><span class="backward" style="display: inline;"></span>
                        </section>







                        <section class="carousel" style="border-top: #eeeeee solid 1px;">

                            <div class="reel linksindexblack" style="overflow: visible; transform: translate(0px, 0px);">

                                <article style="width: 100%; margin-top: 0px; text-align: left; margin-bottom: 0px; padding-bottom: 0px;" class="loading">

                                    <h3 class="h3colorblack">How to check Company Name Availability?</h3>

                                    <p>
                                        Possibility of getting a Company Name can be verified by a search at '<a href="http://www.mca.gov.in/DCAPortalWeb/dca/MyMCALogin.do?method=setDefaultProperty&amp;mode=16">Check Company or LLP Name</a>' at MCA website. You can check the name by providing proposed 'Company or LLP Name" and activities.

                                    </p>

                                </article>

                            </div>

                            <span class="forward" style="display: inline;"></span><span class="backward" style="display: inline;"></span>
                        </section>





                        <section class="carousel" style="border-top: #eeeeee solid 1px;">

                            <div class="reel" style="overflow: visible; transform: translate(0px, 0px);">

                                <article style="width: 100%; margin-top: 0px; text-align: left; margin-bottom: 0px; padding-bottom: 0px;" class="loading">

                                    <h3 class="h3colorblack">MCA search Result shows 'No Results Found'. Shall I get the searched Name?</h3>

                                    <p>
                                        The MCA Name Search result will only provide the probability of getting the proposed name. The search result does not guarantee the availability of Company or LLP name as the name approval is finally granted by office of Registrar of Companies (ROC). The ROC office will do more refined search of proposed name and will also check with Trademark Registry as well before grant of a Company or LLP Name.

                                    </p>

                                </article>

                            </div>

                            <span class="forward" style="display: inline;"></span><span class="backward" style="display: inline;"></span>
                        </section>









                        <section class="carousel" style="border-top: #eeeeee solid 1px;">

                            <div class="reel" style="overflow: visible; transform: translate(0px, 0px);">

                                <article style="width: 100%; margin-top: 0px; text-align: left; margin-bottom: 0px; padding-bottom: 0px;" class="loading">

                                    <h3 class="h3colorblack">How to make a Company Name Application?</h3>

                                    <p>
                                        Application for availability of Company Name has to be filed with the Registrar of Companies in Form INC-1. It is preferable to submit the application with multiple names in the order of preference. Company name application must be in line with the Company Name Guidelines. 

                                    </p>

                                </article>

                            </div>

                            <span class="forward" style="display: inline;"></span><span class="backward" style="display: inline;"></span>
                        </section>





                        <section class="carousel" style="border-top: #eeeeee solid 1px;">

                            <div class="reel" style="overflow: visible; transform: translate(0px, 0px);">

                                <article style="width: 100%; margin-top: 0px; text-align: left; margin-bottom: 0px; padding-bottom: 0px;" class="loading">

                                    <h3 class="h3colorblack">How many Names can be applied with one application?</h3>

                                    <p>
                                        Multiple names can be submitted for approval in one application in the order of preference. If the first applied name is not available, ROC will approve the next name. If you are particular about one name, it is preferable to apply with one name only and in case that name is not available apply the next name at the time of resubmission of application. Name application can be resubmitted only once.

                                    </p>

                                </article>

                            </div>

                            <span class="forward" style="display: inline;"></span><span class="backward" style="display: inline;"></span>
                        </section>





                        <section class="carousel" style="border-top: #eeeeee solid 1px;">

                            <div class="reel" style="overflow: visible; transform: translate(0px, 0px);">

                                <article style="width: 100%; margin-top: 0px; text-align: left; margin-bottom: 0px; padding-bottom: 0px;" class="loading">

                                    <h3 class="h3colorblack">How long Company Name is valid for Registration?</h3>

                                    <p>
                                        Once approved, the name will be reserved for 60 days. Company registration documents have to be executed and filed within this time line.

                                    </p>

                                </article>

                            </div>

                            <span class="forward" style="display: inline;"></span><span class="backward" style="display: inline;"></span>
                        </section>





                        <section class="carousel" style="border-top: #eeeeee solid 1px;">

                            <div class="reel" style="overflow: visible; transform: translate(0px, 0px);">

                                <article style="width: 100%; margin-top: 0px; text-align: left; margin-bottom: 0px; padding-bottom: 0px;" class="loading">

                                    <h3 class="h3colorblack">What all facts will be disregarded for determination of Company Names?</h3>

                                    <p>
                                        While determining whether a proposed name is identical with another, the differences on account of the following shall be disregarded - 

                                    </p>

                                    <ol style="margin-left: 30px; list-style: decimal;">

                                        <li>the words like Private, Pvt, Pvt., (P), Limited, Ltd, Ltd., LLP, Limited Liability Partnership;</li>

                                        <li>words appearing at the end of the names – company, and company, co., co, corporation, corp, corpn, corp.;</li>

                                        <li>plural version of any of the words appearing in the name;</li>

                                        <li>type and case of letters, spacing between letters and punctuation marks;</li>

                                        <li>joining words together or separating the words does not make a name distinguishable from a name that uses the similar, separated or joined words;</li>

                                        <li>use of a different tense or number of the same word does not distinguish one name from another;</li>

                                        <li>using different phonetic spellings or spelling variations shall not be considered as distinguishing one name from another. Illustration (For example, P.Q. Industries limited is existing then P and Q Industries or Pee Que Industries or P n Q Industries or P &amp; Q Industries shall not be allowed and similarly if a name contains numeric character like 3, resemblance shall be checked with 'Three' also;)</li>

                                        <li>misspelled words, whether intentionally misspelled or not, do not conflict with the similar, properly spelled words;</li>

                                        <li>the addition of an internet related designation, such as .com, .net, .edu, .gov, .org, .in does not make a name distinguishable from another, even where (.) is written as 'dot';</li>

                                        <li>the addition of words like New, Modern, Nav, Shri, Sri, Shree, Sree, Om, Jai, Sai, The, etc. Does not make a name distinguishable from an existing name and similarly, if it is different from the name of the existing company only to the extent of adding the name of the place, the same shall not be allowed; such names may be allowed only if no objection from the existing company by way of Board resolution is submitted;</li>

                                        <li>different combination of the same words does not make a name distinguishable from an existing name, e.g., if there is a company in existence by the name of "Builders and Contractors Limited", the name "Contractors and Builders Limited" shall not be allowed unless it is change of name of existing company;</li>

                                        <li>if the proposed name is the Hindi or English translation or transliteration of the name of an existing company or limited liability partnership in English or Hindi, as the case may be.</li>

                                    </ol>

                                </article>

                            </div>

                            <span class="forward" style="display: inline;"></span><span class="backward" style="display: inline;"></span>
                        </section>











                        <section class="carousel" style="border-top: #eeeeee solid 1px;">

                            <div class="reel" style="overflow: visible; transform: translate(0px, 0px);">

                                <article style="width: 100%; margin-top: 0px; text-align: left; margin-bottom: 0px; padding-bottom: 0px;" class="loading">

                                    <h3 class="h3colorblack">What is meant by an Undesirable Name?</h3>

                                    <ol style="margin-left: 30px; list-style: decimal;">

                                        <li>A Company name shall be considered undesirable, if -

                                            <ol style="margin-left: 30px; list-style: lower-alpha;">

                                                <li>it attracts the provisions of section 3 of the Emblems and Names (Prevention and Improper Use) Act, 1950 (12 of 1950);</li>

                                                <li>it includes the name of a registered trade mark or a trade mark which is subject of an application for registration, unless the consent of the owner or applicant for registration, of the trade mark, as the case may be, has been obtained and produced by the promoters;</li>

                                                <li>it includes any word or words which are offensive to any section of the people;</li>

                                            </ol>

                                        </li>

                                        <li>The name shall also be considered undesirable, if-

                                            <ol style="margin-left: 30px; list-style: lower-alpha;">

                                                <li>the proposed name is identical with or too nearly resembles the name of a limited liability partnership;</li>

                                                <li>it is not in consonance with the principal objects of the company as set out in the memorandum of association; Provided that every name need not be necessarily indicative of the objects of the company, but when there is some indication of objects in the name, then it shall be in conformity with the objects mentioned in the memorandum;</li>

                                                <li>the company's main business is financing, leasing, chit fund, investments, securities or combination thereof, such name shall not be allowed unless the name is indicative of such related financial activities, viz., Chit Fund or Investment or Loan, etc.; </li>

                                                <li>it resembles closely the popular or abbreviated description of an existing company or limited liability partnership;</li>

                                                <li>the proposed name is identical with or too nearly resembles the name of a company or limited liability partnership incorporated outside India and reserved by such company or limited liability partnership with the Registrar:</li>

                                                <li>Provided that if a foreign company is incorporating its subsidiary company in India, then the original name of the holding company as it is may be allowed with the addition of word India or name of any Indian state or city, if otherwise available;</li>

                                                <li>any part of the proposed name includes the words indicative of a separate type of business constitution or legal person or any connotation thereof e.g. co-operative, sehkari, trust, LLP, partnership, society, proprietor, HUF, firm, Inc., PLC, GmbH, SA, PTE, Sdn, AG etc.;</li>

                                                <li>Explanation.- For the purposes of this sub-clause, it is hereby clarified that the name including phrase 'Electoral Trust' may be allowed for Registration of companies to</li>

                                                <li>be formed under section 8 of the Act, in accordance with the Electoral Trusts Scheme, 2013 notified by the Central Board of Direct Taxes (CBDT):</li>

                                                <li>Provided that name application is accompanied with an affidavit to the effect that the name to be obtained shall be only for the purpose of registration of companies under Electoral Trust Scheme as notified by the Central Board of Direct Taxes;</li>

                                                <li>the proposed name contains the words 'British India';</li>

                                                <li>the proposed name implies association or connection with embassy or consulate or a foreign government;</li>

                                                <li>the proposed name includes or implies association or connection with or patronage of a national hero or any person held in high esteem or important personages who occupied or are occupying important positions in Government;</li>

                                                <li>the proposed name is vague or an abbreviated name such as 'ABC limited' or '23K limited' or 'DJMO' Ltd: abbreviated name based on the name of the promoters will not be allowed. For example:- BMCD Limited representing first alphabet of the name of the promoter like Bharat, Mahesh, Chandan and David:</li>

                                                <li>Provided that existing company may use its abbreviated name as part of the name for formation of a new company as subsidiary or joint venture or associate company but such joint venture or associated company shall not have an abbreviated name only e.g. Delhi Paper Mills Limited can get a joint venture or associated company as DPM Papers Limited and not as DPM Limited:</li>

                                                <li>Provided further that the companies well known in their respective field by abbreviated names are allowed to change their names to abbreviation of their existing name after following the requirements of the Act;</li>

                                                <li>the proposed name is identical to the name of a company dissolved as a result of liquidation proceeding and a period of two years have not elapsed from the date of such dissolution:</li>

                                                <li>Provided that if the proposed name is identical with the name of a company which is struck off in pursuance of action under section 248 of the Act, then the same shall not be allowed before the expiry of twenty years from the publication in the Official Gazette being so struck off;</li>

                                                <li>it is identical with or too nearly resembles the name of a limited liability partnership in liquidation or the name of a limited liability partnership which is struck off up to a period of five years;</li>

                                                <li>the proposed name include words such as 'Insurance', 'Bank', 'Stock Exchange', 'Venture Capital', 'Asset Management', 'Nidhi', 'Mutual fund' etc., unless a declaration is submitted by the applicant that the requirements mandated by the respective regulator, such as IRDA, RBI, SEBI, MCA etc. have been complied with by the applicant;</li>

                                                <li>the proposed name includes the word "State", the same shall be allowed only in case the company is a government company;</li>

                                                <li>the proposed name is containing only the name of a continent, country, state, city such as Asia limited, Germany Limited, Haryana Limited, Mysore Limited;</li>

                                                <li>the name is only a general one, like Cotton Textile Mills Ltd. or Silk Manufacturing Ltd., and not Lakshmi Silk Manufacturing Co. Ltd;</li>

                                                <li>it is intended or likely to produce a misleading impression regarding the scope or scale of its activities which would be beyond the resources at its disposal:</li>

                                                <li>the proposed name includes name of any foreign country or any city in a foreign country, the same shall be allowed if the applicant produces any proof of significance of business relations with such foreign country like Memorandum of Understanding with a company of such country:

Provided that the name combining the name of a foreign country with the use of India like India Japan or Japan India shall be allowed if, there is a government to government participation or patronage and no company shall be incorporated using the name of an enemy country. Explanation.- For the purposes of this clause, enemy country means so declared by the Central Government from time to time.

                                                </li>

                                            </ol>

                                        </li>

                                    </ol>

                                </article>

                            </div>

                            <span class="forward" style="display: inline;"></span><span class="backward" style="display: inline;"></span>
                        </section>







                        <section class="carousel" style="border-top: #eeeeee solid 1px;">

                            <div class="reel" style="overflow: visible; transform: translate(0px, 0px);">

                                <article style="width: 100%; margin-top: 0px; text-align: left; margin-bottom: 0px; padding-bottom: 0px;" class="loading">

                                    <h3 class="h3colorblack">What are the conditions for the use name of relatives for a Company Name?</h3>

                                    <p>
                                        In case the key word used in the name proposed is the name of a person other than the name(s) of the promoters or their close blood relatives, No objection from such other person(s) shall be attached with the application for name. In case the name includes the name of relatives, the proof of relation shall be attached and it shall be mandatory to furnish the significance and proof thereof for use of coined words made out of the name of the promoters or their relatives.

                                    </p>

                                </article>

                            </div>

                            <span class="forward" style="display: inline;"></span><span class="backward" style="display: inline;"></span>
                        </section>







                        <section class="carousel" style="border-top: #eeeeee solid 1px;">

                            <div class="reel" style="overflow: visible; transform: translate(0px, 0px);">

                                <article style="width: 100%; margin-top: 0px; text-align: left; margin-bottom: 0px; padding-bottom: 0px;" class="loading">

                                    <h3 class="h3colorblack">What are the conditions for use existing Sole proprietor or Partnership name as Company Name?</h3>

                                    <p>
                                        The applicant shall provide a declaration to state whether they are using or have been using in the last five years , the name applied for incorporation of company or LLP in any other business constitution like Sole proprietor or Partnership or any other incorporated or unincorporated entity and if, yes details thereof and No Objection Certificate from other partners and associates for use of such name by the proposed Company or LLP, as the case may be, and also a declaration as to whether such other business shall be taken over by the proposed company or LLP or not .

                                    </p>

                                </article>

                            </div>

                            <span class="forward" style="display: inline;"></span><span class="backward" style="display: inline;"></span>
                        </section>







                        <section class="carousel" style="border-top: #eeeeee solid 1px;">

                            <div class="reel" style="overflow: visible; transform: translate(0px, 0px);">

                                <article style="width: 100%; margin-top: 0px; text-align: left; margin-bottom: 0px; padding-bottom: 0px;" class="loading">

                                    <h3 class="h3colorblack">What are words that cannot be used Company Name?</h3>

                                    <p>
                                        The following words and combinations thereof shall not be used in the name of a company in English or any of the languages without previous approval of the Central Government -

                                    </p>

                                    <ol style="margin-left: 30px; list-style: lower-alpha;">

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

                                        <li>the use of word Scheme with the name of Government (s) , State , India, Bharat or any government authority or in any manner resembling with the schemes launched by Central, state or local Governments and authorities; and<br>
                                            za) Bureau



                                        </li>

                                    </ol>

                                </article>

                            </div>

                            <span class="forward" style="display: inline;"></span><span class="backward" style="display: inline;"></span>
                        </section>
                    </li>
                </ul>
            </asp:Panel>

            <asp:Panel runat="server" ID="pnlCommencementOfBusenessByCompany" Visible="false">
                <ul class="Compinninnerpage1">

                    <li>
                        <h1 class="h1colorblue" style="padding-bottom: 20px; font-size: 28px; text-align: left;">Commencement of Business by a Company</h1>
                    </li>

                    <li>

                        <p>
                            A company can commence business ONLY AFTER filing a declaration with the registration with Registrar of Companies (ROC) stating that every subscriber to the memorandum has paid the value of the shares agreed to be taken by him and the paid-up share capital of the company is not less than less than One Lakh Rupees or Five Lakh Rupees as the case may be for Private and Public Companies respectively.

                        </p>

                        <p>
                            All companies (including a Small Company and OPC) shall not start any business or exercise any borrowing powers without filing the declaration with registrar within 180 (One Hundred and eighty) days from the date of incorporation as stated above. The contents of this declaration shall be also be verified by a Company Secretary or a Chartered Accountant or a Cost Accountant in practice: 

                        </p>
                        <p>
                            In case the declaration (Form INC 21) has not been filed by the company with the Registrar within 180 days of the date of incorporation of the company, the Registrar may initiate action for the removal of the name of the company from the register assuming that the company is not carrying on any business or operations.

                        </p>

                    </li>





                    <section class="carousel">

                        <div class="reel" style="overflow: visible; transform: translate(0px, 0px);">

                            <article style="width: 100%; margin-top: 0px; text-align: left; margin-bottom: 0px; padding-bottom: 0px;" class="loading">

                                <p>
                                    In order to file the required declaration, the company shall comply the following requirements after registration;

                                </p>

                                <p>
                                </p>
                                <ul style="margin-left: 40px; list-style: decimal;">

                                    <li>To file the Registered Office verification with Registrar of Companies within 30 days of its registration.</li>

                                    <li>Every subscriber to the memorandum has to pay the value of the shares agreed to be taken by him and the paid-up share capital of the company is not less than less than One Lakh Rupees or Five Lakh Rupees as the case may be for Private and Public Companies respectively.</li>

                                </ul>

                                <p></p>

                                <p>
                                    The Subscribers are bound to bring the amount of shares subscribed by him to the company before filing required declaration. To record the remittance of share subscription amount, the company has to open a bank account and all the subscribers should bring entire subscription money to this account before filing the declaration.

                                </p>

                            </article>

                        </div>

                        <span class="forward" style="display: inline;"></span><span class="backward" style="display: inline;"></span>
                    </section>

                </ul>
            </asp:Panel>

            <asp:Panel runat="server" ID="pnlDocumentsCompanyReg" Visible="false">
                <ul class="Compinninnerpage1">

                    <li>
                        <h1 class="h1colorblue" style="padding-bottom: 20px; font-size: 28px; text-align: left;">Documents Required for Company Registration</h1>

                    </li>

                    <li>

                        <strong>1.	DIRECTORS  (Who does not have a DIN)</strong>

                        <ol style="margin-left: 30px; list-style: lower-alpha">

                            <li style="font-weight: bold;">Identity Proof: 

                                <ol style="list-style: lower-roman; font-weight: normal;">

                                    <li>Indian Nationals – Copy of PAN Card (Self certified) </li>

                                    <li>Non Indian Nationals – Copy of Passport (Self Certified and notarized)</li>

                                </ol>

                            </li>







                            <li style="font-weight: bold;">Address Proof:

                                <ol style="list-style: lower-roman; font-weight: normal;">

                                    <li>Permanent Address Proof: Copy of Passport or Driving License or Aadhaar Card or) or Voter Identity Card or Telephone Bill or Electricity Bill or Bank Statement (Not older than 2 months)</li>

                                    <li>Present Address Proof : Telephone Bill or Electricity Bill or Bank Statement (Not older than 2 months)</li>

                                </ol>

                            </li>

                        </ol>



                    </li>





                    <section class="carousel">

                        <div class="reel" style="overflow: visible; transform: translate(0px, 0px);">

                            <article style="width: 100%; margin-top: 20px; text-align: left; margin-bottom: 0px; padding-bottom: 0px;" class="loading">

                                <strong>2.	 SHAREHOLDERS (If the Shareholder is not a proposed Director)</strong>

                                <ol style="margin-left: 30px; list-style: lower-alpha">

                                    <li style="font-weight: bold;">Identity Proof: 

                                        <ol style="list-style: lower-roman; font-weight: normal;">

                                            <li>Indian Nationals – Copy of PAN Card, Passport or Driving License or  Aadhaar Card or Voter Identity Card. (Self certified) </li>

                                            <li>Non Indian Nationals – Copy of Passport (Self Certified and notarized)</li>

                                        </ol>

                                    </li>



                                    <li style="font-weight: bold;">Address Proof:

                                        <ol style="list-style: lower-roman; font-weight: normal;">

                                            <li>Permanent Address Proof: Copy of Passport or Driving License or Aadhaar Card or) or Voter Identity Card or Telephone Bill or Electricity Bill or Bank Statement (Not older than 2 months)</li>

                                            <li>Present Address Proof : Telephone Bill or Electricity Bill or Bank Statement (Not older than 2 months)</li>

                                        </ol>

                                    </li>



                                    <li style="font-weight: bold;">Passport Size Photos - 6 Nos.

                                    </li>

                                </ol>

                                <p style="margin-left: 16px; margin-top: 20px;">

                                    <strong>Notes: </strong>

                                </p>
                                <ol style="list-style: lower-alpha; margin-left: 32px; font-weight: normal;">

                                    <li>All the Copies of documents must be self attested by the applicant</li>

                                    <li>In case of non-Indian Nationals, the documents are required to be notarized from the home country.</li>

                                    <li>The Telephone Bill / Mobile Bill/Electricity Bill / Bank Account Statement must be in the name of applicant and should not be older than 2 months.</li>

                                    <li>In case of documents that are in languages other than English, it should be translated to English with the help of a professional translator, carrying his details (name, signature, address, and seal) If the proposed director has a valid Director Identification Number and if he or she is a proposed shareholder, the address in MCA records and should match with present address proof.</li>

                                </ol>

                                <p></p>

                            </article>

                        </div>

                        <span class="forward" style="display: inline;"></span><span class="backward" style="display: inline;"></span>
                    </section>

                    <section class="carousel">

                        <div class="reel" style="overflow: visible; transform: translate(0px, 0px);">

                            <article style="width: 100%; margin-top: 20px; text-align: left; margin-bottom: 0px; padding-bottom: 0px;" class="loading">

                                <strong>3. Registered Office Address (Required after Incorporation)</strong>

                                <p style="margin-left: 16px;">The following documents are required to file return of verification of registered office with Registrar of Companies within 30 days of registration.</p>

                                <ol style="margin-left: 30px; list-style: lower-alpha">

                                    <li style="font-weight: bold;">If the Registered office is owned by the company:

                                        <ol style="list-style: lower-roman; font-weight: normal;">

                                            <li>Copy of ownership document</li>

                                            <li>Copy of utility bill such as telephone bill or gas bill or electricity bill.</li>

                                        </ol>

                                    </li>



                                    <li style="font-weight: bold;">If the Registered office is rented by the company:

                                        <ol style="list-style: lower-roman; font-weight: normal;">

                                            <li>Notarized copy of Rent Agreement </li>

                                            <li>Copy of rent paid receipt </li>

                                            <li>Copy of utility bill such as telephone bill or gas bill or electricity bill.</li>

                                        </ol>

                                    </li>



                                    <li style="font-weight: bold;">If the Registered office is owned by any other person:

                                        <ol style="list-style: lower-roman; font-weight: normal;">

                                            <li>No-Objection letter from the owner </li>

                                            <li>Copy of utility bill such as telephone bill or gas bill or electricity bill.</li>

                                        </ol>

                                    </li>

                                </ol>



                                <p style="margin-left: 16px; margin-top: 20px;">
                                </p>
                                <h3>"Well begun is HALF Done!"</h3>
                                Aristotle

                                <p></p>

                                <p>
                                </p>
                                <h3>"Organize all required documents to avoid delay in Incorporation Process"</h3>
                                CompaniesInn

                                <p></p>

                            </article>

                        </div>

                        <span class="forward" style="display: inline;"></span><span class="backward" style="display: inline;"></span>
                    </section>

                </ul>
            </asp:Panel>

            <asp:Panel runat="server" ID="pnlCompanyRegFAQ" Visible="false">
                <ul class="Compinninnerpage1 accordiancss">
                    <li>
                        <h1 class="h1colorblue" style="padding-bottom: 20px;">Company Registration FAQ</h1>
                    </li>
                    <li>

                        <a href="javascript:showonlyone('f');" id="toggle1">Who is a Shareholder?</a>
                        <div class="newboxes" style="clear: both; display: none;" id="f">
                            <ul id="v-menu1" class="v-menu">
                                <li>
                                    <p>
                                        Shareholder(s) or Member(s) are the persons who invest capital and holds shares in a company. Members are the ultimate owners of the company.
                                    </p>
                                </li>
                            </ul>
                        </div>
                    </li>

                    <li>
                        <a href="javascript:showonlyone('f1');" id="toggle2">How many Shareholder(s) and Director(s) are required for registering a company?</a>
                        <div class="newboxes" style="clear: both; display: none;" id="f1">
                            <ul id="v-menu2" class="v-menu">
                                <li>Number of Shareholder / Directors required for registering a Limited company varies depends on the type of the company, which are;
                                    <ul style="list-style: disc; margin-left: 20px;">
                                        <li>One Person Company – Only 1 (One) shareholder and 1 (One) or more Directors and 1 (One) Nominee Shareholder;</li>
                                        <li>Private Limited Company - Minimum of 2 (Two) Shareholders and 2 (Two) Directors;</li>
                                        <li>Public Limited Company - Minimum of 7 (Seven) Shareholders and 3 (Three) Directors.</li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </li>

                    <li>
                        <a href="javascript:showonlyone('f2');" id="toggle3">Who can become a Shareholder in a company?</a>
                        <div class="newboxes" style="clear: both; display: none;" id="f2">
                            <ul id="v-menu3" class="v-menu">
                                <li>
                                    <p>
                                        In case of One Person Company, only an individual who is an Indian citizen and resident in India can become the shareholder. In case of Private Limited Company and Public Limited Company, shareholders could be Individuals, Companies or LLPs, but only individuals can become directors of the company. 
                                    </p>
                                </li>
                            </ul>
                        </div>
                    </li>



                    <li>
                        <a href="javascript:showonlyone('f3');" id="toggle4">Who is a Nominee Share holder in a One Person Company?</a>
                        <div class="newboxes" style="clear: both; display: none;" id="f3">
                            <ul id="v-menu4" class="v-menu">
                                <li>
                                    <p>
                                        Nominee shareholder is a person nominated by the member of an OPC to become the member of the company in the event of the Member's death or his incapacity to contract. Initially the subscriber to the memorandum shall nominate another person as his/her nominee and the nomination can be changed at any time by the Member. Only an individual who is an Indian citizen and resident in India can become nominee for the sole member of a One Person Company.
                                    </p>
                                </li>
                            </ul>
                        </div>
                    </li>


                    <li>
                        <a href="javascript:showonlyone('f4');" id="toggle5">Who is a Director?</a>
                        <div class="newboxes" style="clear: both; display: none;" id="f4">
                            <ul id="v-menu5" class="v-menu">
                                <li>
                                    <p>
                                        Directors of company are responsible for company management and legal compliance under various laws.
                                    </p>
                                </li>
                            </ul>
                        </div>
                    </li>



                    <li>
                        <a href="javascript:showonlyone('f5');" id="toggle6">Who can become a Director in a company?</a>
                        <div class="newboxes" style="clear: both; display: none;" id="f5">
                            <ul id="v-menu6" class="v-menu">
                                <li>
                                    <p>
                                        Only an individual can be appointed as a director of a company. A director need not be a shareholder of the company and shareholders need not necessarily be the directors also.
                                    </p>
                                </li>
                            </ul>
                        </div>
                    </li>



                    <li>
                        <a href="javascript:showonlyone('f6');" id="toggle7">What is Authorised Capital?</a>
                        <div class="newboxes" style="clear: both; display: none;" id="f6">
                            <ul id="v-menu7" class="v-menu">
                                <li>
                                    <p>
                                        Authorised Capital or Registered Capital of a company is the upper limit of capital that a company can issue shares and collect money from shareholders. 
                                    </p>
                                </li>
                            </ul>
                        </div>
                    </li>



                    <li>
                        <a href="javascript:showonlyone('f7');" id="toggle8">What is the minimum Authorised Capital for registering a Company?</a>
                        <div class="newboxes" style="clear: both; display: none;" id="f7">
                            <ul id="v-menu8" class="v-menu">
                                <li>
                                    <p>
                                        Minimum Authorised Capital for registering an OPC and Private Limited Company is Rs.1,00,000 ad public limited company is Rs.5,00,000. 
                                    </p>
                                </li>
                            </ul>
                        </div>
                    </li>


                    <li>
                        <a href="javascript:showonlyone('f8');" id="toggle9">Can authorised capital be increased?</a>
                        <div class="newboxes" style="clear: both; display: none;" id="f8">
                            <ul id="v-menu9" class="v-menu">
                                <li>
                                    <p>
                                        Authorised Capital can be enhanced at any time by passing a resolution at a meeting of shareholders. Authorised capital can be any amount above the minimum limit. The fee payable to ROC will be calculated on the basis of Authorised Capital.
                                    </p>
                                </li>
                            </ul>
                        </div>
                    </li>


                    <li>
                        <a href="javascript:showonlyone('f9');" id="toggle10">What is Subscribed Capital?</a>
                        <div class="newboxes" style="clear: both; display: none;" id="f9">
                            <ul id="v-menu10" class="v-menu">
                                <li>
                                    <p>
                                        Subscribed Capital refers to the total amount of share capital agreed to be brought in by the shareholders to the company. 
                                    </p>
                                </li>
                            </ul>
                        </div>
                    </li>



                    <li>
                        <a href="javascript:showonlyone('f10');" id="toggle11">When the Subscribed capital has to be brought in to the Company?</a>
                        <div class="newboxes" style="clear: both; display: none;" id="f10">
                            <ul id="v-menu11" class="v-menu">
                                <li>
                                    <p>
                                        For commencing the business by a Limited Company, the subscribers to Memorandum have to bring the agreed amount of capital to the company's account and the Company has to file a declaration to the Registrar of Companies. Only after filing the referred declaration, the company can start doing business. So the subscribers to MOA have to bring the entire amount of subscribed shares capital immediately after Incorporation. The maximum time available to bring the capital is 180 days from the date of registration of company.
                                    </p>
                                </li>
                            </ul>
                        </div>
                    </li>

                    <li>
                        <a href="javascript:showonlyone('f11');" id="toggle12">What happens if the subscribed capital is not brought in within specified time?</a>
                        <div class="newboxes" style="clear: both; display: none;" id="f11">
                            <ul id="v-menu12" class="v-menu">
                                <li>
                                    <p>
                                        If the subscribers are not brought the money within the specified time, the registrar can issue notice for closure of the company.
                                    </p>
                                </li>
                            </ul>
                        </div>
                    </li>


                    <li>
                        <a href="javascript:showonlyone('f12');" id="toggle13">What is Paid Up Capital?</a>
                        <div class="newboxes" style="clear: both; display: none;" id="f12">
                            <ul id="v-menu13" class="v-menu">
                                <li>
                                    <p>
                                        Paid up capital of a company refers to the amount of capital actually brought in by the shareholders to the company. 
                                    </p>
                                </li>
                            </ul>
                        </div>
                    </li>


                    <li>
                        <a href="javascript:showonlyone('f13');" id="toggle14">How the money can bring into the company?</a>
                        <div class="newboxes" style="clear: both; display: none;" id="f13">
                            <ul id="v-menu14" class="v-menu">
                                <li>
                                    <p>
                                        The subscribed capital can be brought into the company in any accountable mode. The best practice is to open the bank account for the company and bring the money to company's account from the personal account of each subscriber by way of cheque or bank transfer.
                                    </p>
                                </li>
                            </ul>
                        </div>
                    </li>



                    <li>
                        <a href="javascript:showonlyone('f14');" id="toggle15">What is meant by Objects of the Company?</a>
                        <div class="newboxes" style="clear: both; display: none;" id="f14">
                            <ul id="v-menu15" class="v-menu">
                                <li>
                                    <p>
                                        Objects are the proposed business of the company. The objects can be any business that is legal. It is advisable to identify the main objects of the company in a particular line of business. The name of the company must be in line with the main objects of the company. If the name of the company is not describing a particular object, then the company can have multifaceted objects. The objects are described under a Clause in Memorandum of Association of the Company.
                                    </p>
                                </li>
                            </ul>
                        </div>
                    </li>


                    <li>
                        <a href="javascript:showonlyone('f15');" id="toggle16">Whether the objects of the company can be changes later?</a>
                        <div class="newboxes" style="clear: both; display: none;" id="f15">
                            <ul id="v-menu16" class="v-menu">
                                <li>
                                    <p>
                                        A company can change its objects by passing a resolution at the Shareholders meeting. 
                                    </p>
                                </li>
                            </ul>
                        </div>
                    </li>




                    <li>
                        <a href="javascript:showonlyone('f16');" id="toggle17">How to decide the Name of the Company?</a>
                        <div class="newboxes" style="clear: both; display: none;" id="f16">
                            <ul id="v-menu17" class="v-menu">
                                <li>
                                    <p>
                                        A company must have a unique Name. The approval of Company Names is subject to Company Name Guidelines issued by MCA. The name of the company should end with the words 'Private Limited (OPC)' or 'Private Limited' or 'Limited' as the case may be. The name of a company should not be identical with or nearly resembling with the name of a company in existence and such a name is already approved by the Registrar of Companies or The name of a Limited Liability Partnership (LLP) in existence or a name already approved by Registrar of LLPs; or A registered trade mark or a trade mark for which an application is filed under the Trade Marks Act, 1999. 
                                    </p>
                                </li>
                            </ul>
                        </div>
                    </li>



                    <li>
                        <a href="javascript:showonlyone('f17');" id="toggle18">How to decide the State in which the company is to be registered?</a>
                        <div class="newboxes" style="clear: both; display: none;" id="f17">
                            <ul id="v-menu18" class="v-menu">
                                <li>
                                    <p>
                                        The jurisdiction of the ROC will depend on the state in which the registered office is situated. Place of registration depends on the convenience to the promoters.  
                                    </p>
                                </li>
                            </ul>
                        </div>
                    </li>


                    <li>
                        <a href="javascript:showonlyone('f18');" id="toggle19">What is Registered Office of the Company?</a>
                        <div class="newboxes" style="clear: both; display: none;" id="f18">
                            <ul id="v-menu19" class="v-menu">
                                <li>
                                    <p>
                                        The Registered office address is the official communication address of the Company. The Registrar of Companies shall send all the correspondence relating to the company to the registered office address. 
                                    </p>
                                </li>
                            </ul>
                        </div>
                    </li>



                    <li>
                        <a href="javascript:showonlyone('f19');" id="toggle20">When the company must have a registered office?</a>
                        <div class="newboxes" style="clear: both; display: none;" id="f19">
                            <ul id="v-menu20" class="v-menu">
                                <li>
                                    <p>
                                        At the time of Registration, a Temporary Address can be given as the company's registered office. From the 15th day of registration, company should have a permanent address as registered office receiving and acknowledging all communications and notices. Within 30 days of registration, the company has to file a return of verification of registered office with proof of registered office address with Registrar of Companies.
                                    </p>
                                </li>
                            </ul>
                        </div>
                    </li>



                    <li>
                        <a href="javascript:showonlyone('f20');" id="toggle21">Whether registered office can be changed from one place to another?</a>
                        <div class="newboxes" style="clear: both; display: none;" id="f20">
                            <ul id="v-menu21" class="v-menu">
                                <li>
                                    <p>
                                        The registered office can be changes from one place to another place within the city, or within the sate or state to state subject to compliance of requirements under Companies Act
                                    </p>
                                </li>
                            </ul>
                        </div>
                    </li>



                    <li>
                        <a href="javascript:showonlyone('f21');" id="toggle22">Whether Administrative Office can be same or different from Registered Office?</a>
                        <div class="newboxes" style="clear: both; display: none;" id="f21">
                            <ul id="v-menu22" class="v-menu">
                                <li>
                                    <p>
                                        Administrative Office refers to a place where general Administration of company happens. Administrative Office can be same or different from Registered Office.
                                    </p>
                                </li>
                            </ul>
                        </div>
                    </li>



                    <li>
                        <a href="javascript:showonlyone('f22');" id="toggle23">What is a Digital Signature Certificate (DSC)?</a>
                        <div class="newboxes" style="clear: both; display: none;" id="f22">
                            <ul id="v-menu23" class="v-menu">
                                <li>
                                    <p>
                                        DSC is a legally recognised method of signing documents electronically. A digital signature is a type of asymmetric cryptography used to simulate the security properties of a handwritten signature on paper. Digital signature schemes normally give two algorithms, one for signing that involves the user's secret or private key, and one for verifying signatures that involves the user's public key. The output of the signature process is called digital signature. Digital signature certificates are used by programs on the Internet and local machines to confirm the identity of a third party. Digital signatures have often confused with scanned copies of a physical written signature, which do not have any legal backing for authentication of electronic documents.
                                    </p>
                                </li>
                            </ul>
                        </div>
                    </li>



                    <li>
                        <a href="javascript:showonlyone('f23');" id="toggle24">What is use of Digital Signature Certificate (DSC) in Company Registration?</a>
                        <div class="newboxes" style="clear: both; display: none;" id="f23">
                            <ul id="v-menu24" class="v-menu">
                                <li>
                                    <p>
                                        All the applications, Documents and Returns filed to the Registrar of Companies (ROC) are submitted online through www.mca.gov.in. These forms need to be authenticated by a Digital Signature Certificate (DSC) issued by the Certifying Authority in India. 
                                    </p>
                                </li>
                            </ul>
                        </div>
                    </li>



                    <li>
                        <a href="javascript:showonlyone('f24');" id="toggle25">How to get a Digital Signature Certificate (DSC)?</a>
                        <div class="newboxes" style="clear: both; display: none;" id="f24">
                            <ul id="v-menu25" class="v-menu">
                                <li>
                                    <p>
                                        In India, Digital Signature Certificate (DSC) is issued by Certifying Authorities appointed under Information Technology Act 2000. NCode Solutions, e-Mudhra and Safescrypt are the Certifying Authorities issuing DSC for MCA use. An application along with Identity and address documents are required to be Certifying Authorities for issue of Digital Signature Certificate.
                                    </p>
                                </li>
                            </ul>
                        </div>
                    </li>




                    <li>
                        <a href="javascript:showonlyone('f25');" id="toggle26">What is a Director Identification Number (DIN)?</a>
                        <div class="newboxes" style="clear: both; display: none;" id="f25">
                            <ul id="v-menu26" class="v-menu">
                                <li>
                                    <p>
                                        Director Identification Number (DIN) is a unique identification number allotted by the Ministry of Corporate Affairs to the Directors of Companies. To become a Director of a Company, the incumbent director must have DIN. 
                                    </p>
                                </li>
                            </ul>
                        </div>
                    </li>


                    <li>
                        <a href="javascript:showonlyone('f26');" id="toggle27">Director Identification Number (DIN) for Company and LLP are same?</a>
                        <div class="newboxes" style="clear: both; display: none;" id="f26">
                            <ul id="v-menu27" class="v-menu">
                                <li>
                                    <p>
                                        Yes. DIN being an identification number issued by Ministry of Corporate Affairs, the same is used for Directors of Company and Designated Partners of LLP. 
                                    </p>
                                </li>
                            </ul>
                        </div>
                    </li>



                    <li>
                        <a href="javascript:showonlyone('f27');" id="toggle28">How to obtain a Director Identification Number (DIN)?</a>
                        <div class="newboxes" style="clear: both; display: none;" id="f27">
                            <ul id="v-menu28" class="v-menu">
                                <li>
                                    <p>
                                        A DIN can be obtained by filing an online application with a copy of identity and address proofs using the Digital Signature Certificate (DSC) of applicant and certified by a Company Secretary / Chartered Accountant / Cost Accountant in Practice. To read more about DIN, See Director Identification Number (DIN). 
                                    </p>
                                </li>
                            </ul>
                        </div>
                    </li>


                    <li>
                        <a href="javascript:showonlyone('f28');" id="toggle29">How to check the availability of Company Name?</a>
                        <div class="newboxes" style="clear: both; display: none;" id="f28">
                            <ul id="v-menu29" class="v-menu">
                                <li>
                                    <p>
                                        The availability of Company Name can be verified at www.mca.gov.in. If there is no similar names registered already, the may be available for registration. The search results do not provide any guarantee that the searched name will be available for registration as the company name has to be approved by office of ROC. 
                                    </p>
                                </li>
                            </ul>
                        </div>
                    </li>



                    <li>
                        <a href="javascript:showonlyone('f29');" id="toggle30">How to make Company Name Application?</a>
                        <div class="newboxes" style="clear: both; display: none;" id="f29">
                            <ul id="v-menu30" class="v-menu">
                                <li>
                                    <p>
                                        The application for Company Name has to be filed for getting the company name approval from the ROC. It is preferable to submit the application with multiple names in the order of preference. Company name application must be in line with the Company Name Guidelines.
                                    </p>
                                </li>
                            </ul>
                        </div>
                    </li>



                    <li>
                        <a href="javascript:showonlyone('f30');" id="toggle31">How many Names can be applied with one application?</a>
                        <div class="newboxes" style="clear: both; display: none;" id="f30">
                            <ul id="v-menu31" class="v-menu">
                                <li>
                                    <p>
                                        Multiple names can be submitted for approval in one application in the order of preference. If the first applied name is not available, ROC will approve the next name. If you are particular about one name, it is preferable to apply with one name only and in case that name is not available apply the next name. Name application can be resubmitted only once.
                                    </p>
                                </li>
                            </ul>
                        </div>
                    </li>



                    <li>
                        <a href="javascript:showonlyone('f31');" id="toggle32">How long Company Name is valid for Registration?</a>
                        <div class="newboxes" style="clear: both; display: none;" id="f31">
                            <ul id="v-menu32" class="v-menu">
                                <li>
                                    <p>
                                        Once approved by the office of ROC, Company Name shall be available for 60 days. Company registration documents have to be executed and filed within this time line. 
                                    </p>
                                </li>
                            </ul>
                        </div>
                    </li>


                    <li>
                        <a href="javascript:showonlyone('f32');" id="toggle33">Can I reserve a Company Name?</a>
                        <div class="newboxes" style="clear: both; display: none;" id="f32">
                            <ul id="v-menu33" class="v-menu">
                                <li>
                                    <p>
                                        There is no option to reserve a Company Name. The Company Name shall be available for 60 days from the date of approval. After the expiry of 60 days, a fresh application has to be filed for availing the name for registration. 
                                    </p>
                                </li>
                            </ul>
                        </div>
                    </li>



                    <li>
                        <a href="javascript:showonlyone('f33');" id="toggle34">I have a trademark. Can I get the same Name for My Company?</a>
                        <div class="newboxes" style="clear: both; display: none;" id="f33">
                            <ul id="v-menu34" class="v-menu">
                                <li>
                                    <p>
                                        If the trademark is registered, it gives you the right to get the same name. In case your Trademark application is under process at Trade Mark Registry, your application gets priority for approval as long as there is no similar Company or LLP registered at Ministry of Corporate Affairs.
                                    </p>
                                </li>
                            </ul>
                        </div>
                    </li>



                    <li>
                        <a href="javascript:showonlyone('f34');" id="toggle35">What is the Guidelines for Company Name Approval?</a>
                        <div class="newboxes" style="clear: both; display: none;" id="f34">
                            <ul id="v-menu35" class="v-menu">
                                <li>
                                    <p>
                                        Company name approval is subject to Rule 8 of Companies (Incorporation) Rules, 2014. Read detailed Guidelines for Company Name Approval.
                                    </p>
                                </li>
                            </ul>
                        </div>
                    </li>



                    <li>
                        <a href="javascript:showonlyone('f35');" id="toggle36">How to Execute the Company registration documents?</a>
                        <div class="newboxes" style="clear: both; display: none;" id="f35">
                            <ul id="v-menu36" class="v-menu">
                                <li>
                                    <p>
                                        After the company name is approved, the company incorporation documents such as Memorandum of Association (MOA) and Articles of Association (AOA) have to be executed by the promoters in the prescribed format. MOA and AOA have to be signed by the subscribers and have to write their details such as Name, Father's Name, Residential Address, Occupation and the Number of Shares they agree to subscribe in their own handwriting. The signatures of the subscribers have to be witnessed by a person with his/her Name, Father's Name, Residential Address and Occupation.
                                    </p>
                                </li>
                            </ul>
                        </div>
                    </li>



                    <li>
                        <a href="javascript:showonlyone('f36');" id="toggle37">Shall I have to write in my own handwriting and Sign?</a>
                        <div class="newboxes" style="clear: both; display: none;" id="f36">
                            <ul id="v-menu37" class="v-menu">
                                <li>
                                    <p>
                                        Yes. All the subscribers to MOA and AOA have to write their details in their own handwriting and sign the same.
                                    </p>
                                </li>
                            </ul>
                        </div>
                    </li>



                    <li>
                        <a href="javascript:showonlyone('f37');" id="toggle38">How to Submit Company Registration documents to the Registrar of Companies (ROC)?</a>
                        <div class="newboxes" style="clear: both; display: none;" id="f37">
                            <ul id="v-menu38" class="v-menu">
                                <li>
                                    <p>
                                        Duly executed MOA and AOA has to be submitted to the ROC of the respective state for the company registration through online applications along with Company Registration Fee. Along with MOA and AOA, details of directors are also required to be filed with the ROC.
                                    </p>
                                </li>
                            </ul>
                        </div>
                    </li>



                    <li>
                        <a href="javascript:showonlyone('f38');" id="toggle39">Whether the originally signed MOA and AOA has to be submitted to ROC?</a>
                        <div class="newboxes" style="clear: both; display: none;" id="f38">
                            <ul id="v-menu39" class="v-menu">
                                <li>
                                    <p>
                                        No. The originally executed MOA and AOA are not required to be filed with the ROC. The same has to be preserved by the promoters as permanent records. 
                                    </p>
                                </li>
                            </ul>
                        </div>
                    </li>



                    <li>
                        <a href="javascript:showonlyone('f39');" id="toggle40">Who issues Certificate of Incorporation?</a>
                        <div class="newboxes" style="clear: both; display: none;" id="f39">
                            <ul id="v-menu40" class="v-menu">
                                <li>
                                    <p>
                                        The ROC will register the company after due verification of MOA, AOA and other details and will issue the Certificate of Incorporation (COI). ROC will also allocate a Corporate Identification Number (CIN) to the company so registered.
                                    </p>
                                </li>
                            </ul>
                        </div>
                    </li>


                    <li>
                        <a href="javascript:showonlyone('f40');" id="toggle41">How the ROC issues Certificate of Incorporation?</a>
                        <div class="newboxes" style="clear: both; display: none;" id="f40">
                            <ul id="v-menu41" class="v-menu">
                                <li>
                                    <p>
                                        The Certificate of Incorporation is issued by the ROC in Electronic Format signed with the digital signature certificate. No physical certificate will be issued by the office of ROC.
                                    </p>
                                </li>
                            </ul>
                        </div>
                    </li>


                    <li>
                        <a href="javascript:showonlyone('f41');" id="toggle42">What is Corporate Identification Number (CIN)?</a>
                        <div class="newboxes" style="clear: both; display: none;" id="f41">
                            <ul id="v-menu42" class="v-menu">
                                <li>
                                    <p>
                                        Corporate Identification Number (CIN) is the number allotted to a company registered in India by the Ministry of Corporate Affairs, Government of India. CIN is a 21-digit number that contains information such as status, whether listed or unlisted, NIC code of business activity, state of registration, year of registration, whether private or public and the sequential registration number in the respective state (for example, U74110KA2008PTC046914).
                                    </p>
                                </li>
                            </ul>
                        </div>
                    </li>



                    <li>
                        <a href="javascript:showonlyone('f42');" id="toggle43">When Registered Office Address has to be established?</a>
                        <div class="newboxes" style="clear: both; display: none;" id="f42">
                            <ul id="v-menu43" class="v-menu">
                                <li>
                                    <p>
                                        From the 15th day of registration, company should have a permanent address as registered office receiving and acknowledging all communications and notices. 
                                    </p>
                                </li>
                            </ul>
                        </div>
                    </li>



                    <li>
                        <a href="javascript:showonlyone('f43');" id="toggle44">When the verification of Registered Office Address has to be filed?</a>
                        <div class="newboxes" style="clear: both; display: none;" id="f43">
                            <ul id="v-menu44" class="v-menu">
                                <li>
                                    <p>
                                        Within 30 days of registration, the company has to file a return of verification of registered office with proof of registered office address with Registrar of Companies. 
                                    </p>
                                </li>
                            </ul>
                        </div>
                    </li>



                    <li>
                        <a href="javascript:showonlyone('f44');" id="toggle45">How to file the verification of Registered Office Address?</a>
                        <div class="newboxes" style="clear: both; display: none;" id="f44">
                            <ul id="v-menu45" class="v-menu">
                                <li>
                                    <p>
                                        The verification of registered office has to be filed with the Registrar of Companies along with: 1.      Notarized copy of Rent / Lease Agreement in the name of company and Rent paid receipt not older than one month; AND 2.      NOC from owner along with proof of ownership like Tax Paid Receipt / Electricity Bill / Sale Deed; AND 3.      Any utility bill not older than two months like telephone, gas, electricity, etc. in name of the Owner with complete address of the premises . 
                                    </p>
                                </li>
                            </ul>
                        </div>
                    </li>



                    <li>
                        <a href="javascript:showonlyone('f45');" id="toggle46">When can the Company commence its Business?</a>
                        <div class="newboxes" style="clear: both; display: none;" id="f45">
                            <ul id="v-menu46" class="v-menu">
                                <li>
                                    <p>
                                        A company can commence its business or borrow any money ONLY AFTER filing a declaration to Registrar of Companies confirming the following: 1.      The promoters (subscribers to MOA) brought in their agreed share capital to the Company and 2.      The company has filed the verification of registered office.
                                    </p>
                                </li>
                            </ul>
                        </div>
                    </li>



                    <li>
                        <a href="javascript:showonlyone('f46');" id="toggle47">What are the Conditions for filing Declaration for commencement of Business?</a>
                        <div class="newboxes" style="clear: both; display: none;" id="f46">
                            <ul id="v-menu47" class="v-menu">
                                <li>
                                    <p>
                                        Before filing the Declaration for commencement of Business, the Company should that the subscribers to MOA have brought in their agreed share capital to the Company and the company has filed the verification of registered office in prescribed format to ROC.
                                    </p>
                                </li>
                            </ul>
                        </div>
                    </li>



                    <li>
                        <a href="javascript:showonlyone('f47');" id="toggle48">What is the timeline for filing Declaration for commencement of Business?</a>
                        <div class="newboxes" style="clear: both; display: none;" id="f47">
                            <ul id="v-menu48" class="v-menu">
                                <li>
                                    <p>
                                        Declaration for commencement of Business has to be filed with the Registrar of Companies within 180 days from the date of registration of the company. 
                                    </p>
                                </li>
                            </ul>
                        </div>
                    </li>



                    <li>
                        <a href="javascript:showonlyone('f48');" id="toggle49">What happens if the declaration is not filed in time?</a>
                        <div class="newboxes" style="clear: both; display: none;" id="f48">
                            <ul id="v-menu49" class="v-menu">
                                <li>
                                    <p>
                                        In case the declaration has not been filed by the company with the Registrar within 180 days from the date of incorporation of the company, the Registrar may initiate action for the removal of the name of the company from the register assuming that the company is not carrying on any business or operations.
                                    </p>
                                </li>
                            </ul>
                        </div>
                    </li>












                </ul>
            </asp:Panel>

            <asp:Panel runat="server" ID="pnlLlpNameAvl" Visible="false">
                <ul class="Compinninnerpage1">

                    <li>
                        <h1 class="h1colorblue" style="padding-bottom: 20px;">Company-LLP Name Availability</h1>


                    </li>

                    <li class="linksindexblack">

                        <p>As a first step towards registering a  Company or LLP, the promoter should get the proposed Company Name approved by  the respective Registrar of Companies (ROC). Company  name approval and allotment process in India is administered by the Ministry of  Corporate Affairs (MCA) as per the Company Name Availability Guidelines issued  under Companies Act 2013 and LLP Name Availability Guidelines issued under LLP  Act 2008.</p>

                        <p>The basic concept of name availability is that name proposed for  registration shall no identical or resemble to an existing Company or LLP name.  Also the proposed name shall be within the rules framed by government of India  from time to time.</p>

                        <p>Point to be noted before selecting the name.</p>

                        <ol style="list-style: decimal; margin-left: 20px;">

                            <li>Check MCA website <a href="http://www.mca.gov.in">www.mca.gov.in</a> for name availability to see that any company is registered with  similar name.</li>

                            <li>Also see any trademark registered or applicable filed for  trademark with proposed name. Use <a href="http://164.100.176.38/tmrpublicsearch/frmmain.aspx">Trademark  Public Search</a> link to check whether any trademark registered for the  proposed name.</li>

                            <li>Ensure that Company Name and activity has a relation such as for  software development for company name XYZ Software Private Limited.</li>

                        </ol>

                    </li>
                </ul>

            </asp:Panel>

            <asp:Panel runat="server" ID="pnlCompanyName" Visible="false">
                <ul class="Compinninnerpage1">

                    <li>
                        <h1 class="h1colorblue" style="padding-bottom: 20px;">Company Name</h1>


                    </li>

                    <li class="linksindexblack">

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

                        <ul style="list-style: disc; margin-left: 20px;">

                            <li>Be unique</li>

                            <li>Contain a noun and an activity word that reflects its objectives</li>

                            <li>Be in line with Company Name Guidelines issued by Ministry of Corporate Affairs.</li>

                        </ul>
                        <strong>The Company Name SHOULD NOT</strong>
                        <ul style="list-style: disc; margin-left: 20px;">

                            <li>Be same, similar, identical or resembling to the name of an existing Company or LLP registered. Phonetically similar names also to be avoided.</li>

                            <li>Be similar of a registered trade mark or a trade mark for which an application has already been filed</li>

                            <li>Be Offensive</li>

                            <li>Be Undesirable in the opinion of the Central Government (Undesirability of names explained separately</li>
                        </ul>
                    </li>
                </ul>
            </asp:Panel>

            <asp:Panel runat="server" ID="pnlCompanyNameAvl" Visible="false">
                <ul class="Compinninnerpage1">

                    <li>
                        <h1 class="h1colorblue" style="padding-bottom: 20px;">Company Name Availability</h1>


                    </li>

                    <li class="linksindexblack">

                        <p>
                            Company Name approval and allotment process in India is administered by the Ministry of Corporate Affairs (MCA) as per the Company Name Availability Guidelines issued under Companies Act 2013.

                        </p>

                        <p>
                            As per the Company Name Availability Guidelines;



                        </p>



                        <strong>The name of a Company SHOULD</strong>

                        <ul style="list-style: disc; margin-left: 20px;">

                            <li>Be unique</li>

                            <li>Contain a noun and an activity word that reflects its objectives</li>

                            <li>Be in line with Company Name Guidelines issued by Ministry of Corporate Affairs.</li>

                        </ul>



                        <strong>The Company Name SHOULD NOT</strong>

                        <ul style="list-style: disc; margin-left: 20px;">

                            <li>Be same, similar, identical or resembling to the name of an existing Company or LLP registered. Phonetically similar names also to be avoided.</li>

                            <li>Be similar of a registered trade mark or a trade mark for which an application has already been filed</li>

                            <li>Be Offensive</li>

                            <li>Be Undesirable in the opinion of the Central Government (Undesirability of names explained separately</li>

                        </ul>





                        <br>



                        <p>While determining whether a proposed name is identical with another, the  differences on account of the following shall be disregarded;</p>

                        <ol style="list-style: lower-alpha; margin-left: 20px;">

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

                    </li>

                </ul>
            </asp:Panel>

            <asp:Panel runat="server" ID="pnlUndesirableNames" Visible="false">
                <ul class="Compinninnerpage1">

                    <li>
                        <h1 class="h1colorblue" style="padding-bottom: 20px;">Company Name - Undesirable Names</h1>

                    </li>

                    <li class="linksindexblack">

                        <p>
                            The name shall be considered undesirable, if;

                        </p>
                        <ul style="list-style: decimal; margin-left: 30px;">

                            <li>It Contravenes the provisions of the Emblems and Names (Prevention and Improper Use) Act, 1950;</li>

                            <li>It includes the name of a registered trade mark or a trade mark which is subject of an application for registration, unless the consent of the owner or applicant for registration, of the trade mark, as the case may be, has been obtained and produced by the promoters;</li>

                            <li>It includes any word or words which are offensive to any section of the people;</li>

                        </ul>

                        <p></p>





                        <br>



                        <p>The  name shall also be considered undesirable, if-</p>

                        <ol style="list-style: lower-alpha; margin-left: 30px;">

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

                    </li>
                </ul>
            </asp:Panel>

            <asp:Panel runat="server" ID="pnlCompanyNameBusinessNameEtc" Visible="false">
                <ul class="Compinninnerpage1">
                    <li>
                        <h1 class="h1colorblue" style="padding-bottom: 20px; font-size: 28px; text-align: left;">Company Name, Business Name, Trademark, Brand Name, Logo and Domain Name</h1>
                    </li>

                    <li class="linksindexblack">
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
                    </li>
                </ul>
            </asp:Panel>

            <asp:Panel runat="server" ID="pnlCompanyNameFaq" Visible="false">
                <ul class="Compinninnerpage1">

                    <li>
                        <h1 class="h1colorblue" style="padding-bottom: 20px; font-size: 28px; text-align: left;">Company Names - Facts to be disregarded</h1>

                        <hr class="hrcolor" style="padding-bottom: 20px;">
                    </li>

                    <li class="linksindexblack">

                        <p>
                            While  determining whether a proposed name is identical with another, the differences  on account of the following shall be disregarded -
                        </p>

                        <ol style="list-style: lower-alpha; margin-left: 30px;">

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



                    </li>
                </ul>
            </asp:Panel>

            <asp:Panel runat="server" ID="pnlLlpName" Visible="false">
                <ul class="Compinninnerpage1">

                    <li>
                        <h1 class="h1colorblue" style="padding-bottom: 20px; font-size: 28px; text-align: left;">Limited Liability Partnership (LLP) Name</h1>


                    </li>

                    <li class="linksindexblack">

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

                        <ul style="list-style: disc; margin-left: 30px;">

                            <li>Be unique</li>

                            <li>Contain a noun and an activity word that reflects its objectives</li>

                            <li>Be in line with Company Name Guidelines issued by Ministry of Corporate Affairs.</li>

                        </ul>



                        <strong>The Company Name SHOULD NOT</strong>

                        <ul style="list-style: disc; margin-left: 30px;">

                            <li>Be same, similar, identical or resembling to the name of an existing Company or LLP registered. Phonetically similar names also to be avoided.</li>

                            <li>Be similar of a registered trade mark or a trade mark for which an application has already been filed</li>

                            <li>Be Offensive</li>

                            <li>Be Undesirable in the opinion of the Central Government (Undesirability of names explained separately</li>

                        </ul>



                    </li>

                </ul>
            </asp:Panel>

            <asp:Panel runat="server" ID="pnlLlpNameGuidlines" Visible="false">
                <ul class="Compinninnerpage1">

                    <li>
                        <h1 class="h1colorblue" style="padding-bottom: 20px; font-size: 28px; text-align: left;">LLP Name Guidelines</h1>


                    </li>

                    <li class="linksindexblack">

                        <p>
                            LLP name approval and  allotment process in India is admistered by the Ministry of Corporate Affairs  (MCA) as per the Limited Liability Partnership Rules 2009.
                        </p>

                        <p>A name shall not be  allotted to an LLP if;</p>

                        <ol style="margin-left: 30px; list-style: lower-alpha;">

                            <li>It includes any word or words which are offensive to any section of       the people; </li>

                            <li>the proposed name is the exact Hindi or English translation of the       name of an existing limited liability partnership in English or Hindi, as       the case may be; </li>

                            <li>the proposed name has a close phonetic resemblance to the name of a       LLP in existence, for example, J.K. LLP., Jay Kay LLP; </li>

                            <li>it includes the word Co-operative, Sahakari or the equivalent of       word 'co- operative' in the regional languages of the country; </li>

                            <li>it connotes the participation or patronage of the Central or State       Government, unless circumstances justify to, e.g., a name may be deemed       undesirable in certain context if it includes any of the words such as       National, Union, Central, Federal, Republic, President, Rashtrapati, etc; </li>

                            <li>the proposed name contains the words 'British India'; </li>

                            <li>the proposed name implies association or connection with any       Embassy or Consulate or of a foreign government which suggests connection       with local authorities such as Municipal, Panchayat, Zila Parishad or any       other body connected with the Union or State Government; </li>

                            <li>the proposed name is vague like D.I.M.O. Limited liability       partnership or I.V.N.R. Limited liability partnership or S.S.R.P Limited       liability partnership;\ </li>

                            <li>it is different from the name or names of the existing limited       liability partnership only to the extent of having the name of a place       within brackets before the word ‘limited liability partnership’, for       example, Indian Press (Delhi) LLP should not be allowed in view of the       existence of the LLP named Indian Press LLP; </li>

                            <li>it includes name of registered Trade mark, unless the consent of       the owner of the trade mark has been produced; </li>

                            <li>the proposed name is identical with or too nearly resembles the       name of a firm or LLP or company incorporated outside India and reserved       by such firm, LLP or company with the registrar in accordance with these       rules; </li>

                            <li>it is identical with or too nearly resembles the name of the       limited liability partnership or a company in liquidation or it is       identical with or too nearly resembles names of the LLP or a company which       is struck off, up to the period of 5 years; </li>

                            <li>it includes words like 'Bank', 'Insurance' and 'Banking', ‘Venture       capital’ or ‘mutual fund’ or such similar names without the approval of       the regulatory authority; </li>

                            <li>it is intended or likely to produce a misleading impression       regarding the scope or scale of its activities which would be beyond the       resources at its disposal; </li>

                            <li>the proposed name includes words like French, British, German etc.,       unless the partners satisfy that there is some form of collaboration and       connection with the foreigners of that particular country or place, the       name of which is incorporated in the name; </li>

                            <li>the proposed name of limited liability partnership includes the       words company secretary, chartered accountant, advocates or such similar       words as indicative of a profession, as part of the proposed name, the       same shall be allowed only after obtaining approval from the Council       governing such profession or such authority as may be nominated by the       Central Government, in this behalf. </li>

                        </ol>

                        <p>
                            <strong>Reservation of Name by  Foreign LLP</strong><br>
                            A foreign LLP or a foreign  company can reserve its existing name (by which it is registered in the country  of incorporation) for registering&nbsp;an LLP in India. Such reservation can be  made initially for three years and can be renewed on a fresh application.
                        </p>

                        <p>&nbsp;</p>

                    </li>
                </ul>
            </asp:Panel>

            <asp:Panel runat="server" ID="pnlTrademarkAndCompany" Visible="false">
                <ul class="Compinninnerpage1">

                    <li>
                        <h1 class="h1colorblue" style="padding-bottom: 20px; font-size: 28px; text-align: left;">Trade Mark and Company - LLP Name</h1>


                    </li>

                    <li class="linksindexblack">

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
                    </li>
                </ul>
            </asp:Panel>

            <asp:Panel runat="server" ID="PanelCompanyNameAvlFaq" Visible="false">
                <ul class="Compinninnerpage1 accordiancss">
                    <li>
                        <h1 class="h1colorblue" style="padding-bottom: 20px; font-size: 28px; text-align: left;">FAQ- Company Name Availability</h1>

                    </li>
                    <li>

                        <a href="javascript:showonlyone('f');" id="A1">How  to Check Company Name Availability</a>
                        <div class="newboxes" style="clear: both; display: none;" id="Div1">
                            <ul id="Ul1" class="v-menu">
                                <li>
                                    <p>Possibility  of getting a Company Name can be checked by a search at <a href="http://www.mca.gov.in/DCAPortalWeb/dca/MyMCALogin.do?method=setDefaultProperty&amp;mode=16">‘Check Company or LLP Name’</a> at MCA website. You can check the name by providing  proposed ‘Company or LLP Name” and activities.</p>
                                </li>
                            </ul>
                        </div>
                    </li>


                    <li>

                        <a href="javascript:showonlyone('f1');" id="A2">MCA  search Result shows ‘No Results Found’. Shall I get the searched Name?</a>
                        <div class="newboxes" style="clear: both; display: none;" id="Div2">
                            <ul id="Ul2" class="v-menu">
                                <li>
                                    <p>The MCA  Name Search result will only provide the probability of getting the proposed  name. The search result does not guarantee the availability of Company or LLP  name as the name approval is finally granted by office of Registrar of  Companies (ROC). The ROC office will do more refined search of proposed name  and will also check with Trademark Registry as well before grant of a Company  or LLP Name.</p>
                                </li>
                            </ul>
                        </div>
                    </li>


                    <li>
                        <a href="javascript:showonlyone('f2');" id="A3">How  to make a Company Name Application?</a>
                        <div class="newboxes" style="clear: both; display: none;" id="Div3">
                            <ul id="Ul3" class="v-menu">
                                <li>
                                    <p>Application  for availability of Company Name has to be filed with the Registrar of  Companies in Form INC-1. It is preferable to submit the application with  multiple names in the order of preference. Company name application must be in  line with the&nbsp;Company Name Guidelines.</p>
                                </li>
                            </ul>
                        </div>
                    </li>


                    <li>
                        <a href="javascript:showonlyone('f3');" id="A4">How many Names can be applied with one application?</a>
                        <div class="newboxes" style="clear: both; display: none;" id="Div4">
                            <ul id="Ul4" class="v-menu">
                                <li>
                                    <p>Multiple  names can be submitted for approval in one application in the order of  preference. If the first applied name is not available, ROC will approve the  next name. If you are particular about one name, it is preferable to apply with  one name only and in case that name is not available apply the next name at the  time of resubmission of application. Name application can be resubmitted only  once.</p>
                                </li>
                            </ul>
                        </div>
                    </li>


                    <li>
                        <a href="javascript:showonlyone('f4');" id="A5">How long Company Name is valid for Registration?</a>
                        <div class="newboxes" style="clear: both; display: none;" id="Div5">
                            <ul id="Ul5" class="v-menu">
                                <li>
                                    <p>Once  approved, the name will be reserved for 60 days from the date of application.  Company registration documents have to be executed and filed within this time  line.</p>
                                </li>
                            </ul>
                        </div>
                    </li>


                    <li>
                        <a href="javascript:showonlyone('f5');" id="A6">What are the conditions for the use name of relatives  for a Company Name?</a>
                        <div class="newboxes" style="clear: both; display: none;" id="Div6">
                            <ul id="Ul6" class="v-menu">
                                <li>
                                    <p>In case the key word used in the name proposed is the name of a  person other than the name(s) of the promoters or their close blood relatives,  No objection from such other person(s) shall be attached with the application  for name. In case the name includes the name of relatives, the proof of  relation shall be attached and it shall be mandatory to furnish the  significance and proof thereof for use of coined words made out of the name of  the promoters or their relatives.</p>
                                </li>
                            </ul>
                        </div>
                    </li>


                    <li>
                        <a href="javascript:showonlyone('f6');" id="A7">What are the conditions for use existing Sole  proprietor or Partnership name as Company Name?</a>
                        <div class="newboxes" style="clear: both; display: none;" id="Div7">
                            <ul id="Ul7" class="v-menu">
                                <li>
                                    <p>The applicant shall provide a declaration to state whether they  are using or have been using in the last five years , the name applied for  incorporation of company or LLP in any other business constitution like Sole  proprietor or Partnership or any other incorporated or unincorporated entity  and if, yes details thereof and No Objection Certificate from other partners  and associates for use of such name by the proposed Company or LLP, as the case  may be, and also a declaration as to whether such other business shall be taken  over by the proposed company or LLP or not .</p>
                                </li>
                            </ul>
                        </div>
                    </li>


                    <li>
                        <a href="javascript:showonlyone('f7');" id="A8">What are words that cannot be used Company Name?</a>
                        <div class="newboxes" style="clear: both; display: none;" id="Div8">
                            <ul id="Ul8" class="v-menu">
                                <li>
                                    <p>The following words and combinations thereof shall not be used in  the name of a company in English or any of the languages without previous  approval of the Central Government -</p>
                                    <ol style="list-style: lower-alpha; margin-left: 30px;">
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
                    <li class="linksindexblack">
                        <br />
                        <strong></strong>
                        <p></p>
                        <br />
                        <br />
                        <strong></strong>
                        <p></p>
                        <p><strong></strong></p>
                        <p><strong></strong></p>
                        <p><strong></strong></p>
                    </li>
                </ul>
            </asp:Panel>
        </div>
    </div>
</asp:Content>

