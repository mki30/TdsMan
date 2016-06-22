<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BuyBusinessFilter.ascx.cs" Inherits="Controls_BuyBusinessFilter" %>
<script src="../js/Cookie.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
    });

    function SaveInCookie(obj, id) {
        var SelectedArray = [];

        if ($.cookie("SelectedCompanies") != null)
            if (($.cookie("SelectedCompanies").length > 0))
                SelectedArray = $.cookie("SelectedCompanies").split(',');

        for (var i = 0; i < SelectedArray.length; i++) {
            if (SelectedArray[i] == id) {
                SelectedArray.splice(i, 1);
                break;
            }
        }
        if ($(obj).prop("checked")) {
            if (SelectedArray.length >= 3) {
                alert("Maximum 3 companies can be selected for information request");
                $(obj).prop("checked", false);
            }
            else
                SelectedArray.push(id);
        }
        var str = SelectedArray.join(',');
        console.log(str);
        $.cookie("SelectedCompanies", str);
        setTimeout('__doPostBack(\'ctl00$ContentPlaceHolder1$BuyBusinessFilter$ddStateFilter\',\'\')', 0);
    }

</script>
<div id="sellbusiness" visible="true" runat="server">
    <table style="width: 100%">
        <tr>
            <td>
                <span class="label label-primary">Company Type</span>
                <asp:DropDownList ID="ddCompanyTypeFilter" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddCompanyTypeFilter_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
            </td>
            <td>
                <span class="label label-primary">ROC</span>
                <asp:DropDownList ID="ddStateFilter" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddStateFilter_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
            </td>
            <td>
                <span class="label label-primary">Incorporation</span>
                <asp:DropDownList ID="ddIncorpYear" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddIncorpYear_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
            </td>
            <td>
                <span class="label label-primary">Capital</span>
                <asp:DropDownList ID="ddCapital" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddCompanyTypeFilter_SelectedIndexChanged" AutoPostBack="true">
                </asp:DropDownList>
            </td>

            <td>
                <span class="label label-primary">Turnover</span>
                <asp:DropDownList ID="ddTurnover" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddCompanyTypeFilter_SelectedIndexChanged" AutoPostBack="true">
                </asp:DropDownList>
            </td>
            <td>
                <span class="label label-primary">Asking Price</span>
                <asp:DropDownList ID="ddAskingPrice" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddCompanyTypeFilter_SelectedIndexChanged" AutoPostBack="true">
                </asp:DropDownList>
            </td>
            <td>
                <span class="label label-primary">Profit</span>
                <asp:DropDownList ID="ddNetProfit" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddCompanyTypeFilter_SelectedIndexChanged" AutoPostBack="true">
                </asp:DropDownList>
            </td>
        </tr>
    </table>

    <div class="row" id="AdminChks" runat="server" visible="false">
    <%--    <div class="col-md-12">
            <asp:CheckBox ID="chkApproved" runat="server" Text="Approved" AutoPostBack="true" OnCheckedChanged="chkApproved_CheckedChanged" Checked="true" />
            <asp:CheckBox ID="ChkExpired" runat="server" Text="Expired" AutoPostBack="true" OnCheckedChanged="ChkExpired_CheckedChanged" />
        </div>--%>
    </div>

    <asp:Label ID="lblReport" runat="server" ></asp:Label>
</div>
