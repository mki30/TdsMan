<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Calculator.aspx.cs" Inherits="Calculator" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="js/jquery-1.9.1.min.js"></script>
    <link href="jquery.calculator.package-2.0.1/jquery.calculator.alt.css" rel="stylesheet" />
    <script src="jquery.calculator.package-2.0.1/jquery.plugin.min.js"></script>
    <script src="jquery.calculator.package-2.0.1/jquery.calculator.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function ()
        {
            $("#divCalculator").calculator();
        });
    </script>
    <style type="text/css">
        body
        {
            margin: 0px;
        }

        .calculator-result
        {
            clear: both;
            /* margin: 2px; */
            padding: 0px 2px;
            text-align: right;
            background-color: #FDFDFD;
            border: 1px solid #e2e2e2;
            -moz-border-radius: 4px;
            -webkit-border-radius: 4px;
            border-radius: 4px;
            font-size: 110%;
        }
        .calculator-inline
        {
            position: relative;
            border: 1px solid #FFF2F2;
            -moz-border-radius: 4px;
            -webkit-border-radius: 4px;
            border-radius: 4px;
            background-color: #FDFCFC;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="divCalculator">
        </div>
    </form>
</body>
</html>
