<%@ Page Title="Sell Business" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="BusinessSell.aspx.cs" Inherits="BusinessSell" %>

<%--<%@ Register Src="~/Controls/PaymentControl.ascx" TagPrefix="uc1" TagName="PaymentControl" %>--%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <%--<script>
        $("#btnSubmit").click(function () {
            debugger;
            $("#btnSubmit").hide();
        });
    </script>--%>
    <script src="/js/bootstrap-datepicker.js"></script>
    <link href="/css/datepicker.css" rel="stylesheet" />
    <script src="js/business-sell.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row-fluid" runat="server" id="divMainForm">
        <h1 class="col-md-8 col-md-offset-2">Sell Business</h1>
        <div class="col-md-8 col-md-offset-2">
            <b style="font-style: oblique">Please note that we never disclose your company details, like company name, address, director detail, auditors details to anybody till the time the transaction is not materialised.</b>
        </div>
        <br />
        <br />
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    Business Details
                    &nbsp;<asp:Label ID="lblID" runat="server" Text="0" Style="display: none;"></asp:Label>
                    <asp:Label ID="lblErrorMsg" runat="server" Text="" CssClass="label label-danger pull-right"></asp:Label>
                </div>
                <div class="panel-body">
                    <table class="table BorderLess">
                        <tr>
                            <td style="width: 23%">Listing Headline<span class="mandatory">*</span>
                            </td>
                            <td colspan="2">
                                <asp:TextBox ID="txtListinHeadline" runat="server" CssClass="form-control" placeholder="Listing Headline"></asp:TextBox>
                            </td>
                        </tr>
                        <tr id="Msg" runat="server" visible="false">
                            <td></td>
                            <td colspan="2">
                                <asp:Label ID="lblMessage" runat="server" Text="" ForeColor="Red"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>General Summary<span class="mandatory">*</span>
                            </td>
                            <td colspan="2">
                                <asp:TextBox ID="txtGeneralSummary" runat="server" TextMode="MultiLine" Height="100" placeholder="Summary" CssClass="form-control" MaxLength="350"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Company Type<span class="mandatory">*</span>
                            </td>
                            <td colspan="2">
                                <asp:DropDownList ID="ddCompanyType" runat="server" CssClass="form-control">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>Related Industry<span class="mandatory">*</span>
                            </td>
                            <td colspan="2">
                                <asp:TextBox ID="txtRelatedIndustry" runat="server" CssClass="form-control" placeholder="Related Industry"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Reg State<span class="mandatory">*</span>
                            </td>
                            <td colspan="2" runat="server">
                                <asp:DropDownList ID="ddState" runat="server" class="form-control">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>City<span class="mandatory">*</span> </td>
                            <td colspan="2">
                                <asp:TextBox ID="txtCity" runat="server" CssClass="form-control forcetextonly" placeholder="City"></asp:TextBox>
                            </td>
                        </tr>
                        <tr id="CINRow" runat="server" visible="false">
                            <td>CIN</td>
                            <td colspan="2">
                                <asp:TextBox ID="txtCin" runat="server" CssClass="form-control" placeholder="CIN" MaxLength="21"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Year of Incorporation<span class="mandatory">*</span> </td>
                            <td colspan="2" runat="server">
                                <asp:DropDownList ID="ddYearOfIncorp" runat="server" CssClass="form-control">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>Paid Up Capital<span class="mandatory">*</span>&nbsp;&nbsp;&nbsp;<img src="Images/rupee.png" /><%--<img src="Images/rupee2.gif" /> --%>
                            </td>
                            <td colspan="2">
                                <asp:TextBox ID="txtCapital" runat="server" CssClass="form-control forcenumeric" placeholder="Paid Up Capital"></asp:TextBox>
                            </td>
                        </tr>

                        <tr>
                            <td>Financial Details<br />
                                ( e.g. 
                                <img src="Images/rupee.png" />
                                1,00,00,000)</td>

                            <td colspan="2">
                                <table class="table">
                                    <tr>
                                        <td>Fin Year<span class="mandatory">*</span> </td>
                                        <td>Turnover<span class="mandatory">*</span>&nbsp;&nbsp;<img src="Images/rupee.png" /><%--<img src="Images/rupee2.gif" /> --%></td>
                                        <td>Net Profit<span class="mandatory">*</span>&nbsp;&nbsp;<img src="Images/rupee.png" /><%--<img src="Images/rupee2.gif" /> --%> </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 150px;">
                                            <asp:DropDownList ID="ddTurnoverYear1" runat="server" CssClass="form-control turnoveryear1">
                                                <asp:ListItem Value="">Select</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtTurnoverAmount1" runat="server" CssClass="form-control forcenumeric" placeholder="Turnover Amount1"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtNetProfit1" runat="server" CssClass="form-control forcenumeric" placeholder="Net Profit1"></asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>
                                            <asp:DropDownList ID="ddTurnoverYear2" runat="server" CssClass="form-control turnoveryear1">
                                                <asp:ListItem Value="">Select</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtTurnoverAmount2" runat="server" CssClass="form-control forcenumeric" placeholder="Turnover Amount2"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtNetProfit2" runat="server" CssClass="form-control forcenumeric" placeholder="Net Profit2"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>

                            </td>

                        </tr>
                        <tr>
                            <td>Assessment Done Upto<span class="mandatory">*</span>
                            </td>
                            <td colspan="2">
                                <asp:DropDownList ID="ddAssessmentDone" runat="server" CssClass="form-control">
                                </asp:DropDownList>
                            </td>
                        </tr>

                        <tr>
                            <td>Balance Sheet<span class="mandatory">*</span> </td>
                            <td style="width: 150px;">
                                <asp:Button ID="btnFile1" data-for="FileUpload1" runat="server" Text="Upload File" class="btn btn-info"/>
                                <div id="divProgress" style="display: none" data-for="FileUpload1" class="divProgress">
                                    <progress id="progressBar" max="100" value="0" data-for="FileUpload1" class="progress"></progress>
                                    <span class="progress-value" id="ProgrssValue" data-for="FileUpload1">10%</span>
                                </div>
                                <div class="none">
                                    <asp:FileUpload ID="FileUpload1" runat="server" accept=".pdf,.jpg" />
                                </div>

                            </td>
                            <td colspan="2">
                                <asp:Label ID="lblDoownloadBS" runat="server" Text="" CssClass="pull-right"></asp:Label>
                            </td>
                        </tr>
                        <tr id="tdModified1" visible="false" runat="server">
                            <td>Modified Balance Sheet</td>
                            <td>
                                <asp:Button ID="btnFile3" data-for="FileUpload3" runat="server" Text="Upload File" class="btn btn-info"/>
                                <div id="div1" style="display: none" data-for="FileUpload3" class="divProgress">
                                    <progress id="progress1" max="100" value="0" data-for="FileUpload3" class="progress"></progress>
                                    <span class="progress-value" id="Span1" data-for="FileUpload3">10%</span>
                                </div>
                                <div class="none">
                                    <asp:FileUpload ID="FileUpload3" runat="server" Text="Modified File Upload" Style="width: 97px;" accept=".pdf,.jpg" />
                                </div>
                            </td>

                            <td>
                                <asp:Label ID="lblModified1" runat="server" Text="" CssClass="pull-right"></asp:Label></td>
                            <td id="BLPreview" runat="server" visible="false"><a href="#" id="aMBLPreview" runat="server" class="fancybox fancybox.iframe">Preview</a></td>

                        </tr>
                        <tr>
                            <td>P/L Account<span class="mandatory">*</span> </td>
                            <td style="width: 150px;">
                                <asp:Button ID="btnFile2" data-for="FileUpload2" runat="server" Text="Upload File" class="btn btn-info"/>
                                <div id="div2" style="display: none" data-for="FileUpload2" class="divProgress">
                                    <progress id="progress2" max="100" value="0" data-for="FileUpload2" class="progress"></progress>
                                    <span class="progress-value" id="Span2" data-for="FileUpload2">10%</span>
                                </div>
                                <div class="none">
                                    <asp:FileUpload ID="FileUpload2" runat="server" accept=".pdf,.jpg" />
                                </div>
                            </td>
                            <td colspan="2">
                                <asp:Label ID="lblDoownloadPL" runat="server" Text="" CssClass="pull-right"></asp:Label>
                            </td>
                        </tr>
                        <tr id="tdModified2" visible="false" runat="server">
                            <td>Modified P/L Account</td>
                            <td>
                                <asp:Button ID="btnFile4" data-for="FileUpload4" runat="server" Text="Upload File" class="btn btn-info"/>
                                <div id="div3" style="display: none" data-for="FileUpload4" class="divProgress">
                                    <progress id="progress3" max="100" value="0" data-for="FileUpload4" class="progress"></progress>
                                    <span class="progress-value" id="Span3" data-for="FileUpload4">10%</span>
                                </div>
                                <div class="none">
                                    <asp:FileUpload ID="FileUpload4" runat="server" Style="width: 97px;" accept=".pdf,.jpg" />
                                </div>
                            </td>
                            <td>
                                <asp:Label ID="lblModified2" runat="server" Text="" CssClass="pull-right"></asp:Label></td>
                            <%--<td><asp:Button ID="btnModifiedPLUpload" runat="server" Text="Upload" CssClass="btn btn-success" OnClick="btnModifiedPLUpload_Click" /></td>--%>
                            <td id="PLPreview" runat="server" visible="false"><a href="#" id="aMPLPreview" runat="server" class="fancybox fancybox.iframe">Preview</a></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td colspan="2">If seller ok to get assessment done till requested assessment year
                        <asp:CheckBox ID="chkOkToAssesment" runat="server" Text="Yes" />
                            </td>
                        </tr>
                        <tr>
                            <td>Net Worth<span class="mandatory">*</span>&nbsp;&nbsp;<img src="Images/rupee.png" /><%--<img src="Images/rupee2.gif" /> --%></td>
                            <td colspan="2">
                                <asp:TextBox ID="txtNetWorth" runat="server" CssClass="form-control forcenumeric" placeholder="Net Worth"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Asking Price<span class="mandatory">*</span>&nbsp;&nbsp;<img src="Images/rupee.png" /><%--<img src="Images/rupee2.gif" /> --%> </td>
                            <td colspan="2">
                                <asp:TextBox ID="txtAskingPrice" runat="server" CssClass="form-control forcenumeric" placeholder="Asking Price"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Email<span class="mandatory">*</span> </td>
                            <td colspan="2">
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Email Id"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Contact No<span class="mandatory">*</span> </td>
                            <td colspan="2">
                                <asp:TextBox ID="txtContact" runat="server" CssClass="form-control forcenumeric" placeholder="Contact No" MaxLength="15"></asp:TextBox>
                            </td>
                        </tr>
                        <tr runat="server" id="serviceFee" visible="false">
                            <td>Service Fee</td>
                            <td colspan="2">
                                <asp:TextBox ID="txtServiceFee" runat="server" CssClass="form-control" placeholder="Service Fee"></asp:TextBox>
                            </td>
                        </tr>
                        <tr runat="server" id="approved" visible="false">
                            <td>Listing Expiry Date </td>
                            <td>
                                <asp:TextBox ID="txtExpiryDate" runat="server" CssClass="form-control"></asp:TextBox>
                            </td>
                            <td>
                                <asp:CheckBox ID="chkApproved" runat="server" Text="Approve" />
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td colspan="2">
                                <%--<input type="button" id="btnSubmit" class="btn btn-success" runat="server" Text="Submit" OnClientClick="return Validate();" OnClick="btnSubmit_Click" />--%>
                                <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-success" OnClick="btnSubmit_Click" OnClientClick="return Validate()" />
                                <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                                <span id="Progress" style="display: none; color: green">Please Wait.............<img id="imgProgress" src="Images/progress2.gif" /></span>
                            </td>

                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div class="row-fluid" runat="server" visible="false" id="divSummary">
        <div class="col-md-6 col-md-offset-3">
            <div class="panel panel-primary">
                <div class="panel-heading">Confirmation</div>
                <div class="panel-body">
                    <p>We thank you for choosing our services.</p>
                    <p>We have successfully listed your company.</p>
                    <p>For furthure information please check your email.</p>
                    <p>
                        In case you have any query kindly call us on
                        <br />
                        <a href='tel:01204322456'>(0120) 432-2456</a><br />
                        <a href='tel:919650606247'>+91 9650606247</a><br />
                        <a href='tel:918826693260'>+91 8826693260</a><br />
                        or write us at
                        <br />
                        <a href='mailto:contact@fincomindia.in'>contact@fincomindia.in</a>.
                    </p>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

