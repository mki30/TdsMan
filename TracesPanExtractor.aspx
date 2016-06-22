<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="TracesPanExtractor.aspx.cs" Inherits="TracesPanExtractor" ClientIDMode="Static" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $(document).ready(function ()
        {
            $("#loginbutton").fancybox({
                'titleShow': true,
                'transitionIn': 'elastic',
                'transitionOut': 'elastic',
            });
        });
        function StartPanValidation()
        {
            $('#panTable tr').each(function ()
            {
                var row = this;
                var panNo = $('td:first-child', this).text();
                if (panNo != "")
                {
                    $.post("Data.aspx?Action=TracePanValidation&Data1=" + panNo, function (data)
                    {
                        $('td:nth-child(3)', row).text(data);
                        if (data == "Not Available")
                            $('td:nth-child(4)', row).css("background-color", "orange");
                        else
                            $('td:nth-child(4)', row).css("background-color", "green");
                    });
                }
            });
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>PAN Name Extractor</h1>
    <table class="table table-bordered">
        <tr>
            <td></td>
            <td>
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="0">Regular Return</asp:ListItem>
                    <asp:ListItem Value="1">Correction Return</asp:ListItem>
                </asp:RadioButtonList></td>
            <td></td>
        </tr>
        <tr>
            <td>Financial Year:
                <asp:DropDownList ID="ddFinancialYear" runat="server" OnSelectedIndexChanged="getRecords" AutoPostBack="true"></asp:DropDownList></td>
            <td>Form: 
                <asp:DropDownList ID="ddForm" runat="server" OnSelectedIndexChanged="getRecords" AutoPostBack="true">
                    <asp:ListItem Value="24Q">24Q</asp:ListItem>
                    <asp:ListItem Value="26Q">26Q</asp:ListItem>
                    <asp:ListItem Value="27Q">27Q</asp:ListItem>
                    <asp:ListItem Value="27EQ">27EQ</asp:ListItem>
                </asp:DropDownList>

            </td>
            <td>Quarter: 
                <asp:DropDownList ID="ddQuarter" runat="server" OnSelectedIndexChanged="getRecords" AutoPostBack="true">
                    <asp:ListItem Value="Q1">Q1</asp:ListItem>
                    <asp:ListItem Value="Q2">Q2</asp:ListItem>
                    <asp:ListItem Value="Q3">Q3</asp:ListItem>
                    <asp:ListItem Value="Q4">Q4</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
    </table>

    <asp:Label ID="lblTbl" runat="server" Text=""></asp:Label>

    <div>
        <div id="logindiv" style="width: 900px; height: 200px; overflow: hidden;">
            <table class="table table-bordered" id="loginTable">
                <tr>
                    <td colspan="3" style="font-weight: bold;">Step1: Enter User Details</td>
                </tr>
                <tr>
                    <td>TAN:
                <asp:TextBox ID="txtTan" runat="server" ></asp:TextBox></td>
                    <td>User Id:
                <asp:TextBox ID="txtUserId" runat="server"></asp:TextBox></td>
                    <td>Password:
                <asp:TextBox ID="txtPass" runat="server" ></asp:TextBox></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Image ID="imgCaptcha" runat="server" />&nbsp;&nbsp;<asp:LinkButton ID="lnkRefreshBurtton" runat="server" OnClick="lnkRefreshBurtton_Click"><span class="glyphicon glyphicon-refresh"></span></asp:LinkButton></td>
                    <td></td>
                </tr>
                <tr>
                    <td>Enter text as in above image</td>
                    <td>
                        <asp:TextBox ID="txtCapchaText" runat="server"></asp:TextBox></td>
                    <td>
                        <asp:Button ID="btnRequest" runat="server" Text="Request" OnClick="btnRequest_Click" class="btn btn-success pull-right" ClientIDMode="Static" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label></td>
                    <td></td>
                </tr>
                <tr>
                    <asp:Label ID="lblRequestList" runat="server" Text=""></asp:Label>
                    <asp:Button ID="btnDownloadReq" runat="server" Text="Button" Style="display: none;" />
                </tr>
            </table>
        </div>
    </div>
</asp:Content>





