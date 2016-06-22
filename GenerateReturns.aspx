<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GenerateReturns.aspx.cs" Inherits="GenerateReturns" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="js/jquery-1.9.1.min.js"></script>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script src="bootstrap/js/bootstrap.min.js"></script>

    <script type="text/javascript">

        function GenerateReturn(Step)
        {
            $("#divStatusLog").html("");
            var prog = "...<img src='/images/progress2.gif' />";
            var txt = "";
            var Action = "";
            switch (Step)
            {
                case 0: txt = "Creating return text file"; Action = "CreateReturnTextFile"; break;
                case 1: txt = "Downloading CSI File"; Action = "DownloadCSIFile"; break;
                case 2: txt = "Creating FVU file"; Action = "CreateFVUFile"; break;
            }

            $.ajax({
                url: "/Data.aspx?Action=" + Action + "&Data1=" + ReturnID, cache: false, success: function (data)
                {
                    if (data == "OK")
                    {
                        if (Step == 2)
                        {
                            //alert("FUV file genereated");
                            $("#divStatus").html("");
                            $("#divStatusLog").html("<span class='glyphicon glyphicon-ok'></span>&nbsp;FVU file generated !");
                            //$(".download").show();
                        }
                        else
                        {
                            setTimeout("GenerateReturn(" + (Step + 1) + ")", 1000);
                        }
                    }
                    else
                        alert(data);
                },
                error: function (e)
                {
                    alert(e);
                }
            });

            $("#divStatus").html(txt + prog);
            $("#divStatusLog").append("<div>" + (Step + 1) + ". " + txt + "</div>");
            return false;
        }
    </script>
</head>
<body style="height: 400px; margin: 5px;">
    <div class="panel panel-info">
        <div class="panel-heading">
            <h3 class="panel-title"><span id="lblPanelHead" runat="server">Generate Return</span></h3>
        </div>
        <div class="panel-body">
    <form id="form1" runat="server">
        <div class="row">
            <div class="col-md-12">
                <h1>Generate Returns</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <p class="">TDS filing involves following steps</p>
                <p>1. Generation of text file.</p>
                <p>2. Creation of FVU file using the text file.</p>
                <p>3. Printing of form 27A</p>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <a class="btn btn-success" onclick="return GenerateReturn(0)">Generate Return</a>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div id="divStatus"></div>
                <br />
                <div id="divStatusLog">
                </div>
                <br />
                <asp:Button ID="btnDownloadFVUFile" class="btn btn-info" runat="server" Text="Download FVU file" OnClick="btnDownloadFVUFile_Click" style="display:none"/>
                <asp:Button ID="btnDownloadPDF" class="btn btn-info" runat="server" Text="Download PDF file" OnClick="btnDownloadPDF_Click" style="display:none"/>
                <asp:Button ID="btnShowErrors" class="btn btn-info" runat="server" Text="Show Errors" OnClick="btnShowErrors_Click" style="display:none"/>
                <asp:Button ID="btnFUVStatementReport" class="btn btn-info" runat="server" Text="FUV Statement Report" OnClick="btnFUVStatementReport_Click" style="display:none"/>
                <div id="divError" runat="server"></div>
            </div>
        </div>
    </form>
            </div>
        </div>
</body>
</html>
