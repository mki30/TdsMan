<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="ViewReturnStatusOnline.aspx.cs" Inherits="ViewReturnStatusOnline" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        function ShowData()
        {
            $("#progressImg").show();
            $.post("/Data.aspx?Action=GetPageDetail&Data1=https://onlineservices.tin.egov-nsdl.com/TIN/UnAuthorizedView.do?ID=1068688145&Data2=" + tanNo + "&Data3=" + $('#txtTokenNo').val(), function (data)
            {
                data = data.toString();
                if (data.indexOf("Provisional receipt number is not  valid.Please enter the valid value") > 0)
                {
                    alert("Provisional receipt number is not  valid.Please enter the valid value!");
                }
                else
                {
                    data = data.substr(data.indexOf("<table"), data.length);
                    $("td table", data).each(function (indx)
                    {
                        if (indx == 0)
                        {
                            $("#divDedDetail").html("<table>" + $(this).html() + "</table>");
                            $("#divDedDetail table").addClass("table table-bordered table-striped");
                        }

                        if (indx == 1)
                        {
                            console.log($(this).html());
                            $("#divStatementDetail").html("<table>" + $(this).html() + "</table>");
                            $("#divStatementDetail table").addClass("table table-bordered table-striped");
                        }
                        if (indx == 2)
                        {
                            $("#divFile").html("<table id='statement'>" + $(this).html() + "</table>");
                            $("#divFile table").addClass("table table-bordered table-striped");
                            $("#statement tr:first-child").css("font-weight", "bold");
                        }
                    });
                }
                $("#progressImg").hide();
            });
        }
    </script>
    <style type="text/css">
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>Online Return Status</h1>
    <div class="row">
        <%--<div class="col-md-4">
            <asp:DropDownList ID="ddCompany" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddCompany_SelectedIndexChanged" class="form-control">
            </asp:DropDownList>
        </div>--%>
        <div class="col-md-4">
            <asp:TextBox ID="txtTokenNo" runat="server" class="form-control" placeholder="Token Number"></asp:TextBox>
        </div>
        <div class="col-md-4"><a class="btn btn-info" href="#" onclick="ShowData()">Show</a>&nbsp;&nbsp;<span id="progressImg" style="display: none;"><img src='/Images/progress2.gif' /></span></div>
    </div>
    <br />
    <div class="row">
        <div class="col-md-6">
            <div id="divDedDetail"></div>
        </div>
        <div class="col-md-6">
            <div id="divStatementDetail"></div>
        </div>
        <div class="col-md-12">
            <br />
            <div id="divFile"></div>
        </div>
    </div>
</asp:Content>

