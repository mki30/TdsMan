<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="PanVerification.aspx.cs" Inherits="PanVerification" %>

<%@ Register Src="~/Controls/PayUMoneycontrol.ascx" TagPrefix="uc1" TagName="PayUMoneycontrol" %>
<%--<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div id="parallax-slider-550a348141dfd" class="parallax-slider" style="height: 600px; margin-left: -16px; margin-right: -16px; margin-top: 50px;">
        <img src="images2/Verify%20PAN.jpg"  class="col-lg-12"/>
    </div>
</asp:Content>--%>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="js/jquery-1.9.1.min.js"></script>
    <script src="js/common.js"></script>
    <script type="text/javascript">

        var Index = 0;
        var SinglePan = [];
        var PanList = [];
        var paid = 0;
        $(document).ready(function () {
            $('#txtPan').keyup(function () {
                $(this).val($(this).val().toUpperCase());
            });
            if (PanList.length > 1)
                ShowTable();
            console.log(PanList);
            $("#FileUpload1").change(function (e) {
                debugger;
                //Uploading = true;
                var ext = this.value.match(/\.(.+)$/)[1];
                switch (ext) {
                    case 'csv':
                        var fd = new FormData();
                        var fileUploadID = e.currentTarget.id;
                        var file = document.getElementById(fileUploadID).files[0];
                        fd.append("file", file);
                        var xhr = new XMLHttpRequest();

                        $("input[type='submit'][data-for='" + fileUploadID + "']").hide();
                        $("div[data-for='" + fileUploadID + "']").show();
                        xhr.upload.onprogress = function (resp) {
                            if (resp.lengthComputable) {
                                var ss = (resp.loaded / resp.total) * 100;
                                $("progress[data-for='" + fileUploadID + "']").show();
                                $("progress[data-for='" + fileUploadID + "']").val(ss);
                                $("span[data-for='" + fileUploadID + "']").html((Math.ceil(ss) + '%'));
                            }
                        };

                        xhr.open("POST", "/data.aspx?ACTION=SavePANs");
                        xhr.onreadystatechange = function ()
                        {
                            if (xhr.readyState == 4) {
                                if (xhr.status == 200)
                                {
                                    debugger;
                                    var data = xhr.responseText;

                                    var f = data.split('^');
                                    var flnm = f[0];

                                    PanList = JSON.parse(f[1]);
                                    console.log(PanList);
                                    $("input[type='submit'][data-for='" + fileUploadID + "']").show();
                                    $("input[type='submit'][data-for='" + fileUploadID + "']").val(flnm);
                                    $("input[type='submit'][data-for='" + fileUploadID + "']").removeClass("btn-info");
                                    $("input[type='submit'][data-for='" + fileUploadID + "']").addClass("btn-success");
                                    $("div[data-for='" + fileUploadID + "']").hide();
                                }

                            }
                        };
                        xhr.send(fd);
                        this.value = '';
                        $("#divVerify").show();
                        //Uploading = false;
                        break;
                    default:
                        alert('not allowed');
                        this.value = '';
                }
            });
            
         
        });

        function Validate() {
            if ($("#txtPAN").val() == "") {
                $("#txtPAN").focus();
                alert("Please enter a PAN!");
                return false;
            }
            if ($("#txtCapchaText").val() == "") {
                alert("Plese fill capcha!");
                $("#txtCapchaText").focus();
                return false;
            }
        }

        function ShowTable() {
            console.log(PanList);
            var str = "<table class='table table-condensed'><th>#<th>PAN<th>Surname<th>Middle Name<th>First Name<th>Area Code<th>AO Type<th>Range Code<th>AO Number<th>Jurisdiction<th>Building Name";
            $.each(PanList, function (index, obj) {
                str += "<tr><td>" + (index + 1) + "<td>" + obj.Number + "<td>" + obj.Surname + "<td>" + obj.MiddleName + "<td>" + obj.FirstName + "<td>" + obj.AreaCode + "<td>" + obj.AOType + "<td>" + obj.RangeCode + "<td>" + obj.AONumber + "<td>" + obj.Jurisdiction + "<td>" + obj.BuildingName;
            });
            str += "</table>";
            $("#divData").html(str);
        }

        function VerifySinglePan() {
            ShowTable();
            PanList.length = 0;
            SinglePan.Number = $("#txtPAN").val();
            PanList.push(SinglePan);
            $("#divData").html("loading...");
            VerifyAll();
        }
        function Wait() {
            $("#btnPay").css('display', 'none');
            $("#divWait").css('display', 'block');
        }
        function VerifyAll() {

            var Price = PanList.length > 50 ? (PanList.length > 100 ? (PanList.length > 500 ? "Rs 500" : "Rs 250") : "Rs 100") : "Rs 100";
            //if(!Validate()) return;
            if (Index + 1 > 50 && paid == 0) {
                alert("50 PAN's sucessfully verified free." + "Now you have to pay " + Price + "to continue..");
                $("#div2").css('display', 'block');
                $("#txtAmount").val(Price.replace("Rs ", ""));
            }
            else {
                if (Index < PanList.length) {
                    //get details of the PNR
                    $("#divStatus").html(" Getting details of " + PanList[Index].Number + ", " + (Index + 1) + "/" + PanList.length);
                    $.ajax({
                        url: "/verifypan.aspx?pan=" + PanList[Index].Number + "&captcha=" + $("#txtCapchaText").val(), cache: false, success:
                        function (Data) {
                            var obj = JSON.parse(Data);
                            PanList[Index].Surname = obj.Surname;
                            PanList[Index].MiddleName = obj.MiddleName;
                            PanList[Index].FirstName = obj.FirstName;
                            PanList[Index].AreaCode = obj.AreaCode;
                            PanList[Index].AOType = obj.AOType;
                            PanList[Index].RangeCode = obj.RangeCode;
                            PanList[Index].AONumber = obj.AONumber;
                            PanList[Index].Jurisdiction = obj.Jurisdiction;
                            PanList[Index].BuildingName = obj.BuildingName;
                            PanList[Index].Error = obj.Error;
                            ShowTable();
                            Index++;
                            setTimeout("VerifyAll()", 1);
                        }
                    });
                }
            }

        }
        
    </script>
    <style>
        .col-lg-12 {
            height: 500px;
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%--<div style="display: none">
        
            <asp:Literal ID="ltSinglePan" runat="server"></asp:Literal>
        
    </div>--%>
    <div class="row" style="display: none">
        <uc1:PayUMoneycontrol runat="server" ID="PayUMoneycontrol" />
    </div>
    <div class="row">
        <div class="col-md-8 col-md-offset-3">
            <h1>Pan Verification</h1>
        </div>
    </div>

    <%--<div class="col-md-8 col-md-offset-2">
        <div class="panel panel-info">
            <asp:Literal ID="ltText" runat="server" />
        </div>
    </div>--%>
    <div class="row" runat="server" id="divPanel">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-primary">
                <div class="panel-heading" id="PanelHeading" runat="server">Verify Single PAN Free</div>
                <div class="panel-body">
                    <table class="table BorderLess" style="width: 100%">
                        <tr visible="false" runat="server" id="divUpload">
                            <td style="width: 200px;">Upload</td>
                            <td>
                                <asp:Button ID="btnFile1" data-for="FileUpload1" runat="server" Text="Upload File" class="btn btn-info"/>
                                <div id="divProgress" style="display: none" data-for="FileUpload1" class="divProgress">
                                    <progress id="progressBar" max="100" value="0" class="progress" data-for="FileUpload1"></progress>
                                    <span class="progress-value" id="ProgressValue" data-for="FileUpload1">10%</span>
                                </div>
                                <div class="none">
                                    <asp:FileUpload ID="FileUpload1" runat="server" />
                                </div>
                            </td>
                            <%--<td>
                                <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" />
                            </td>--%>
                        </tr>
                        <tr runat="server" id="divPAN">
                            <td style="width: 200px;">Pan</td>
                            <td>
                                <asp:TextBox ID="txtPAN" runat="server" CssStyle="text-transform: uppercase;" CssClass="form-control" Width="150"></asp:TextBox></td>
                            <td></td>
                        </tr>
                        <tr runat="server" id="divText">
                            <td></td>
                            <td>
                                <asp:Image ID="imgCaptcha" runat="server" />&nbsp;&nbsp;<asp:LinkButton ID="lnkRefreshBurtton" runat="server" OnClick="lnkRefreshBurtton_Click"><span class="glyphicon glyphicon-refresh"></span></asp:LinkButton>
                            </td>
                        </tr>
                        <tr runat="server" id="divText2">
                            <td>Enter the no as above</td>
                            <td>
                                <asp:TextBox ID="txtCapchaText" runat="server" CssClass="form-control"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td runat="server" id="divVerify" style="display:none">
                                <input id="btnVerifyPan" type="button" value="Verify All" onclick='VerifyAll()' class="btn btn-info pull-right" style="margin-top: 0px;" /></td>

                            <td runat="server" id="divVerify2">
                                <input type="button" id="btnGetData" value="Verify" onclick="return VerifySinglePan()" /><%--OnClientClick="return Validate()"--%>
                                <asp:Label ID="lblMsg" runat="server" Text="" ForeColor="Red"></asp:Label>
                            </td>

                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <div class="col-md-8 col-md-offset-2" id="PriceList" runat="server">
            <div class="panel panel-info">
                <table class="table table-bordered table-condensed">
                    <tr>
                        <td colspan="2">Free Upto 50 PANs</td>
                    </tr>
                    <tr>
                        <td>50-100</td>
                        <td>Rs.100</td>

                    </tr>
                    <tr>
                        <td>100-500</td>
                        <td>Rs.250</td>
                    </tr>
                    <tr>
                        <td>500-1000</td>
                        <td>Rs.500</td>
                    </tr>

                </table>
            </div>
        </div>

        <%--<div class="col-md-6">
                <div class="panel panel-primary">
                    <div class="panel-heading">Verify Multiple PAN</div>
                    <div class="panel-body">
                        
                        <table class="table BorderLess" style="width: 100%">
                            <tr>
                                <td style="width: 200px;">Upload</td>
                                <td>
                                    <asp:FileUpload ID="FileUpload1" runat="server" />
                                </td>
                                <td>
                                    <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" />
                                </td>
                            </tr>
                        </table>
                        <table>
                            <tr>
                                <td></td>
                                <td>
                                    <asp:Image ID="Image1" runat="server" />&nbsp;&nbsp;<asp:LinkButton ID="LinkButton1" runat="server" OnClick="lnkRefreshBurtton_Click"><span class="glyphicon glyphicon-refresh"></span></asp:LinkButton>
                                </td>
                            </tr>
                            <tr>
                                <td>Enter the no as above</td>
                                <td colspan="2">
                                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
                                </td>
                                <td>
                                    <input id="btnVerifyPan" type="button" value="Verify All" onclick='VerifyAll()' class="btn btn-info pull-right" style="margin-top:0px;"/></td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>--%>
        <%-- <div class="row">
            <div class="col-md-12">
                <div class="panel panel-primary">
                    <div class="panel-heading">Verify by upload file</div>
                    <div class="panel-body">
                        <table class="table BorderLess" style="width: 100%">
                            <tr>
                                <td style="width: 200px;">Upload</td>
                                <td>
                                    <asp:FileUpload ID="FileUpload1" runat="server" />
                                </td>
                                <td>
                                    <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>--%>
    </div>
    <div class="row" runat="server" id="div2" style="display: none;">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-primary">
                <div class="panel-heading" id="Div3" runat="server">Payment</div>
                <div class="panel-body">
                    <table>
                        <tr id="divPrice" runat="server">
                            <%--<td>You have to Pay </td>--%>
                            <td colspan="2" style="color: green; font-style: oblique; font-size: medium">Please enter the following details </td>
                        </tr>
                        <tr>
                            <td colspan="2">First Name</td>
                            <td>
                                <asp:TextBox ID="txtName" runat="server" class="form-control" /></td>
                        </tr>
                        <tr>
                            <td colspan="2">EmailID</td>
                            <td>
                                <asp:TextBox ID="txtEmailId" runat="server" class="form-control" /></td>
                        </tr>
                        <tr>
                            <td colspan="2">Amount</td>
                            <td>
                                <asp:TextBox ID="txtAmount" runat="server" class="form-control" /></td>
                        </tr>
                        <tr>
                            <td colspan="2">Mobile</td>
                            <td>
                                <asp:TextBox ID="txtMobile" runat="server" class="form-control" /></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td id="divWait" style="display: none">Please Wait.....<img src="Images/progress2.gif" /></td>
                            <td runat="server" id="divPay" colspan="2">
                                <asp:Button ID="btnPay" runat="server" Text="Pay Now" OnClick="btnPay_Click" class="btn btn-info" OnClientClick="Wait()" /></td>

                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td id="Price" runat="server" colspan="2" style="color: green; font-style: oblique">Click to continue...</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="form-group">
            <%--<div class="col-md-4 col-md-offset-2">
                <a href="/pan-verification-single" class="btn btn-info">Single PAN</a>

            </div>--%>
            <div class="col-md-4 col-md-offset-2">
                <a href="/pan-verification-multiple" class="btn btn-info" id="aPan" runat="server">Multiple PAN</a>

            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6" id="divStatus"></div>
        <div class="col-md-6" id="div1">
        </div>
        <div class="col-md-12" id="divData" runat="server">
        </div>
    </div>
</asp:Content>

