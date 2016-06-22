var ID = "";
var Uploading = false;
$(document).ready(function () {
    $('#ddTurnoverYear1').change(function () {
        $('#lblNetProfitYr1').text((($(this).find(":selected").text())));
    });
    $('#ddTurnoverYear2').change(function () {
        $('#lblNetProfitYr2').text((($(this).find(":selected").text())));
    });
    $(".forcenumeric").keypress(isNumberKey);
    $(".forcetextonly").keypress(isAlphabet);

    $("#txtExpiryDate").datepicker({
        startView: 2,
        orientation: "auto",
        format: 'dd-M-yyyy'
    });

    $('#txtExpiryDate').datepicker().on('changeDate', function (ev) {
        $('.datepicker').hide();
    });

    LoadFromLocalStorage();
    $("input").on("blur", function ()   //Save form data in local storage
    {
        if ($("#lblID").html() == "0")
            $(":file").change(function (e) {
              
                Uploading = true;
                var ext = this.value.match(/\.(.+)$/)[1];
                switch (ext) {
                    case 'jpg':
                    case 'bmp':
                    case 'png':
                    case 'tif':
                    case 'pdf':
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

                        xhr.open("POST", "/data.aspx?ACTION=SaveFile&Data1=" + e.currentTarget.id + "&Data2=" + ID);
                        xhr.onreadystatechange = function () {
                            if (xhr.readyState == 4) {
                                if (xhr.status == 200) {
                                    var data = xhr.responseText;
                                    $("input[type='submit'][data-for='" + fileUploadID + "']").show();
                                    $("input[type='submit'][data-for='" + fileUploadID + "']").val(data);
                                    $("div[data-for='" + fileUploadID + "']").hide();
                                }

                            }
                        };
                        xhr.send(fd);
                        this.value = '';
                        Uploading = false;
                        break;
                    default:
                        alert('not allowed');
                        this.value = '';
                }
            });
        $(":file").change(function (e) {
            debugger;
            Uploading = true;
            var ext = this.value.match(/\.(.+)$/)[1];
            switch (ext) {
                case 'jpg':
                case 'pdf':
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

                    xhr.open("POST", "/data.aspx?ACTION=SaveFileSB&Data1=" + e.currentTarget.id + "&Data2=" + ID);
                    xhr.onreadystatechange = function () {
                        if (xhr.readyState == 4) {
                            if (xhr.status == 200) {
                                var data = xhr.responseText;
                                $("input[type='submit'][data-for='" + fileUploadID + "']").show();
                                $("input[type='submit'][data-for='" + fileUploadID + "']").val(data);
                                $("input[type='submit'][data-for='" + fileUploadID + "']").removeClass("btn-info");
                                $("input[type='submit'][data-for='" + fileUploadID + "']").addClass("btn-success");
                                $("div[data-for='" + fileUploadID + "']").hide();
                            }

                        }
                    };
                    xhr.send(fd);
                    this.value = '';
                    Uploading = false;
                    break;
                default:
                    alert('not allowed');
                    this.value = '';
            }
        });

        SaveToLocal();
    });
});

function LoadFromLocalStorage() {
    var FormData = JSON.parse(window.localStorage.getItem("SBForm"));  //Load form values from local storage
    for (var a in FormData) {
        $("#" + a).val(FormData[a]);
    }
}

function ClearLocalStorage() {
    localStorage.removeItem("SBForm");
}

function SaveToLocal() {
    window.localStorage.setItem("SBForm", JSON.stringify($("#form1").serializeObject()));
}


var balanceSheet = false, plAccount = false;
$(function () {
    $("input:file").change(function () {
        var fileName = $(this).prop("id");
        switch (fileName) {
            case 'FileUpload1':
                balanceSheet = true;
                break;
            case 'FileUpload2':
                plAccount = true;
                break;
        }
    });
});
function NotValid() {
    $("#btnSubmit").show();
    $("#Progress").css('display', 'none');

}

function Validate() {
    $("#btnSubmit").css('display', 'none');

    $("#Progress").css('display', 'block');
    if ($("#txtListinHeadline").val() == "") {
        $("#txtListinHeadline").focus();
        alert("Headline is mandatory!");
        NotValid();
        return false;
    }
    if ($("#txtGeneralSummary").val() == "") {
        alert("General summary is mandatory!");
        $("#txtGeneralSummary").focus();
        NotValid();
        return false;
    }
    if ($("#ddCompanyType").val() == "") {
        alert("Please select a company type!");
        $("#ddCompanyType").focus();
        NotValid();
        return false;
    }
    if ($("#ddState").val() == "") {
        alert("Please select a registration state!");
        $("#ddState").focus();
        NotValid();
        return false;
    }
    if ($("#txtCity").val() == "") {
        alert("City is mandatory!");
        $("#txtCity").focus();
        NotValid();
        return false;
    }
    //if ($("#txtCin").val() == "")
    //{
    //    alert("CIN is mandatory");
    //    $("#txtCin").focus();
    //    return false;
    //}
    if ($("#txtCapital").val() == "") {
        alert("Paid up capital is mandatory!");
        $("#txtCapital").focus();
        NotValid();
        return false;
    }
    if ($("#ddTurnoverYear1").val() == "") {
        alert("Please select last turnover year1!");
        $("#ddTurnoverYear1").focus();
        NotValid();
        return false;
    }
    if ($("#txtTurnoverAmount1").val() == "") {
        alert("Turnover amount1 is mandatory!");
        $("#txtTurnoverAmount1").focus();
        NotValid();
        return false;
    }
    if ($("#txtNetProfit1").val() == "") {
        alert("Net profit1 is mandatory!");
        $("#txtNetProfit1").focus();
        NotValid();
        return false;
    }
    if ($("#ddTurnoverYear2").val() == "") {
        alert("Please select last turnover year2!");
        $("#ddTurnoverYear2").focus();
        NotValid();
        return false;
    }
    if ($("#txtTurnoverAmount2").val() == "") {
        alert("Turnover amount2 is mandatory!");
        $("#txtTurnoverAmount2").focus();
        NotValid();
        return false;
    }

    if ($("#txtNetProfit2").val() == "") {
        alert("Net profit2 is mandatory!");
        $("#txtNetProfit2").focus();
        NotValid();
        return false;
    }

    if (balanceSheet == false) {
        if ($("#lblID").text() == "0") {
            alert("Please choose balance sheet to upload!");
            $("#FileUpload1").focus();
            NotValid();
            return false;
        }
    }

    if (plAccount == false) {
        if ($("#lblID").text() == "0") {
            alert("Please choose p/l account sheet to upload!");
            $("#FileUpload2").focus();
            NotValid();
            return false;
        }
    }

    if ($("#txtNetWorth").val() == "") {
        alert("Net Worth is mandatory!");
        $("#txtNetWorth").focus();
        NotValid();
        return false;
    }

    if ($("#txtAskingPrice").val() == "") {
        alert("Asking price is mandatory!");
        $("#txtAskingPrice").focus();
        NotValid();
        return false;
    }

    if ($("#txtEmail").val() == "") {
        alert("Email id is mandatory!");
        $("#txtEmail").focus();
        NotValid();
        return false;
    }
    if ($("#txtEmail").val() != "") {
        if (!IsEmail($("#txtEmail").val())) {
            alert("Please enter valid email!")
            return false;
            $("#txtEmail").focus();
            NotValid();
        }
    }
    if ($("#txtContact").val() == "") {
        alert("Contact no is mandatory!");
        $("#txtContact").focus();
        NotValid();
        return false;
    }
    if ($("#txtContact").val() != "") {
        if ($("#txtContact").val().length < 5) {
            alert("Please enter valid contact no!");
            $("#txtContact").focus();
            NotValid();
            return false;
        }
    }
    if (Uploading == true)
        alert("Please wait .........");
}