<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SendMail.aspx.cs" Inherits="SendMail" %>

<%@ Register Src="~/Controls/EmailControl.ascx" TagPrefix="uc1" TagName="EmailControl" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form2" runat="server">
        <uc1:EmailControl runat="server" ID="EmailControl" />
    </form>
</body>
</html>

