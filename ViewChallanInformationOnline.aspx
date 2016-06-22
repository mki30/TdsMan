<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="ViewChallanInformationOnline.aspx.cs" Inherits="ViewChallanInformationOnline" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="/js/bootstrap-datepicker.js"></script>
    <link href="/css/datepicker.css" rel="stylesheet" />
    <script type="text/javascript">
        $(document).ready(function ()
        {
            $(".txtDate").datepicker({
                startView: 2,
                orientation: "auto",
                format: 'dd-mm-yyyy'
            });
        });

        function ShowData()
        {
            $("#progressImg").show();
            $.post("/Data.aspx?Action=GetChallanInfo&Data1=https://tin.tin.nsdl.com/oltas/servlet/TanSearch/?appUser=T&Data2=" + tanNo + "&Data3=" + $('#txtChallanFromDate').val() + "&Data4=" + $('#txtChallanToDate').val(), function (data)
            {
                $("table", data).each(function ()
                {
                    if ($("td:first", this).text() == "No")
                    {
                        //$("#divChallanInfo").html("<table id='challanTable'>" + $(this).html() + "</table>");
                        //console.log("<table>" + $(this).html() + "</table>");
                        //$("#divChallanInfo table").addClass("table table-condensed");

                        var str = "<table class='table table-striped table-bordered table-condensed'>";
                        $("<table id='challanTable'>" + $(this).html() + "</table> tr").each(function ()
                        {
                            str += "<tr>";
                            $('tr', this).each(function (thIndex)
                            {
                                var tddata = "";
                                $('td', this).each(function (index)
                                {
                                    if (index < 7)
                                    {
                                        var t = $(this).text().trim()
                                        if (t != "")
                                        {
                                            if (thIndex == 0)
                                                tddata += "<th>" + $(this).text() + "</th>";
                                            else
                                                tddata += "<td>" + $(this).text() + "</td>";
                                        }
                                    }
                                });
                                if (tddata != "")
                                    str += "<tr>" + tddata;
                            });
                            str += "</tr><br/>";
                        });
                        str += "</table>";
                        $("#divChallanInfo").html(str);
                    }
                });

                $("#progressImg").hide();
            });
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>Challan Information Online</h1>
    <div class="form-inline" role="form">
        <%--<div class="form-group">
            <label for="ddCompany">Company</label>
            <asp:DropDownList ID="ddCompany" class="form-control" runat="server" onchange="OnChangeSelect()" OnSelectedIndexChanged="ddCompany_SelectedIndexChanged" AutoPostBack="true">
            </asp:DropDownList>
        </div>--%>
        <div class="form-group">
            <label for="txtChallanFromDate">Challan from date:</label>
            <asp:TextBox ID="txtChallanFromDate" CssClass="form-control txtDate" runat="server"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="txtChallanToDate">Challan to date:</label>
            <asp:TextBox ID="txtChallanToDate" CssClass="form-control txtDate" runat="server"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="showLink"></label>
            <a id="showLink" class="btn btn-info" href="#" onclick="ShowData()">Show</a>&nbsp;&nbsp;<span id="progressImg" style="display: none;"><img src='/Images/progress2.gif' /></span>
        </div>
        <div class="form-group pull-right">
            <asp:Button ID="btnDownloadCSI" runat="server" OnClick="btnDownloadCSI_Click" Text="Download CSI File" CssClass="btn btn-primary" />
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <br />
            <div id="divChallanInfo"></div>
            <div id="divChallanInfo1"></div>
        </div>
    </div>
    <div>
    </div>
</asp:Content>

