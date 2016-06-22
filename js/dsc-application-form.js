var courierDocuments = false;
var showFromLocal = false;
var PinExists = false;
var Uploading = false;
var phyver = "";
var ID = "";
$(document).ready(function () {
    $("#divPopMsg").css({ 'top': 200, 'left': $(window).width() / 2 - 200, 'opacity': 1 });
    SetPhysicalVerificationOnLoad();
    SetValueOnLoad();
    if (courierDocuments == true)
        $(".pickup_address").hide();
    ShowDiv();
    ShowPrices();
    $(".forcenumeric").keypress(isNumberKey);
    $(".forcealphabet").keypress(isAlphabet);
    $('#pannos').keyup(function () {
        $(this).val($(this).val().toUpperCase());
    });
    
    $("#postalcodes").blur(function () {
        validatePin($("#postalcodes").val());
        SetPhysicalVerification();
    });

    $("#pickuppostal").blur(function () {

        validatePin($("#pickuppostal").val());
        GetAddress();
    });

    $("#ddUserType").change(function () {
        if ($(this).val() == "0") {
            $(".individual").show();
            $(".rowOrganization").hide();
        }
        else {
            $(".rowOrganization").show();
            $(".individual").hide();
        }
    });

    $("#ddCertificateType").change(function () {
        if ($(this).val() == "1") //In case of Encryption
        {
            $("#ddUsbToken").val("1");
            $("#rowUsbToken").hide();
        }
        else {
            $("#ddUsbToken").val("0");
            $("#rowUsbToken").show();
        }
    });

    $("#txtDOB").datepicker({
        startView: 2,
        orientation: "auto",
        format: 'dd-M-yyyy'
    });

    $('#txtDOB').datepicker().on('changeDate', function (ev) {
        $('.datepicker').hide();
    });

    ShowPrices();
    $(".calculatePrice").change(function () {
        ShowPrices();
    });

    checkSub();
    $('#physicalverification').change(function () {
        if ($(this).val() == "1") {
            $("#pickNote").show();
            $("#CourierNote").hide();
            $("#pickPin").hide();
            $("#pickAddress").hide();
        }
        if ($(this).val() == "2") {
            $("#pickPin").show();
            $("#CourierNote").hide();
            $("#pickNote").hide();
            GetAddressOnUserClick();
        }
        else if ($(this).val() == "3") {
            $("#CourierNote").show();
            $("#pickPin").hide();
            $("#pickNote").hide();
            $("#pickAddress").hide();
        }

        // checkSub();
    });
    //$('#physicalverification').change(function () {
    //    if ($(this).val() == "0") {
    //        $("#CourierNote").hide();
    //        $(".pickup_address").show();
    //    }
    //    else {
    //        $("#CourierNote").show();
    //        $(".pickup_address").hide();
    //    }
    //    checkSub();
    //});
    $("#sameasabove").change(function () {
        if ($(this).val() == "0")
            $(".sub-addres").hide();
        else
            $(".sub-addres").show();
    });

    if (showFromLocal) {
        LoadFromLocalStorage();
        $("input").on("blur", function ()   //Save form data in local storage
        {
            if ($("#lblID").html() == "0")
                SaveToLocal();
        });
        ShowDiv();
    }
    
    $(":file").change(function (e) {
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

                xhr.open("POST", "/data.aspx?ACTION=SaveFile&Data1=" + e.currentTarget.id + "&Data2="+ID);
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

});
function SetValueOnLoad() {
    if (phyver == undefined) return;
    if (phyver == "1") {
        $("#physicalverification").val(1);
            $("#pickNote").show();
            $("#CourierNote").hide();
            $("#pickPin").hide();
            $("#pickAddress").hide();
        }
    if (phyver == "2") {
        $("#physicalverification").val(2);
        $("#pickPin").show();
        $("#CourierNote").hide();
        $("#pickNote").hide();
        GetAddressOnUserClick();
    }
    else if (phyver == "3") {
        $("#physicalverification").val(3);
        $("#CourierNote").show();
        $("#pickPin").hide();
        $("#pickNote").hide();
    }

}
function updateProgress(evt) {
    alert()
    if (evt.lengthComputable) {  //evt.loaded the bytes browser receive
        //evt.total the total bytes seted by the header
        //
        var percentComplete = (evt.loaded / evt.total) * 100;
        console.log(percentComplete);
        $('#btnFile1').val(percentComplete);
    }
}

function SetPhysicalVerification() {

    $("#physicalverification").find("option").remove();
    //$("#physicalverification").append("<option value='" + "0" + "'>Select</option>");
    if (PinExists) {
        $("#physicalverification").append("<option value='" + "1" + "'>Pickup at door step</option>");
        $("#aPinCheck").html("<i class='fa fa-check'></i>")
        $("#physicalverification").val(1);
        $("#pickNote").show();
        $("#CourierNote").hide();
    }
    $("#physicalverification").append("<option value='" + "2" + "'>Pickup at other address</option>");
    $("#physicalverification").append("<option value='" + "3" + "'>Courier Documents to Us</option>");
    if (!PinExists) {
        //$("#aPinCheck").html("<i class='fa fa-close'></i>")
        $("#physicalverification").val(3);
        $("#CourierNote").show();
        $("#pickNote").hide();
    }
    PinExists = false;
}
function SetPhysicalVerificationOnLoad() {
    
    $("#physicalverification").find("option").remove();
    $("#physicalverification").append("<option value='" + "1" + "'>Pickup at door step</option>");
    $("#physicalverification").append("<option value='" + "2" + "'>Pickup at other address</option>");
    $("#physicalverification").append("<option value='" + "3" + "'>Courier Documents to Us</option>");

}

function GetAddress() {

    if (PinExists) {
        $("#pickAddress").show();
        $("#CourierNote").hide();
        $("#aAddCheck").html("<i class='fa fa-check'></i>");
        PinExists = false;
    }
    else {
        //$("#physicalverification").val(3);
        $("#CourierNote").show();
        $("#pickAddress").hide();
        $("#aAddCheck").text("Pickup service not available in this city");
        //$("#aAddCheck").html("<i class='fa fa-close'></i>")
    }
}
function validatePin(pin) {

    $.ajax({
        url: "/Data.aspx?Action=GetDetailbyPin&Data1=" + pin, cache: false, async: false, success:
        function (Data) {

            console.log(Data);
            if (Data.length > 2) { PinExists = true; }

        }
    });
}
function GetPhysicalVerificationOnUserClick() {
    validatePin($("#postalcodes").val());
    SetPhysicalVerification();
    return false;
}
function GetAddressOnUserClick() {
    validatePin($("#pickuppostal").val());
    GetAddress();
    return false;
}
function ShowDiv() {
    if ($("#ddUserType").val() == 0) {
        $(".rowOrganization").hide();
        $(".individual").show();
    }
    if ($("#ddUserType").val() == 1) {
        $(".rowOrganization").show();
        $(".individual").hide();

    }
}
function ShowMsg(msg) {
    alert(msg);
}

function closeMsgBox() {
    $("#divPopMsg").hide();
}

function LoadFromLocalStorage() {
    debugger;
    SetPhysicalVerificationOnLoad();
    var FormData = JSON.parse(window.localStorage.getItem("DSCForm"));  //Load form values from local storage
    for (var a in FormData) {
        $("#" + a).val(FormData[a]);
    }
    validatePin($("#postalcodes").val());
    if (PinExists)
        $("#aPinCheck").html("<i class='fa fa-check'></i>")
    SetValue();
}

function SetValue() {
   
    if ($("#physicalverification").val() == "1") {
        $("#pickNote").show();
        $("#CourierNote").hide();
        $("#pickPin").hide();
        $("#pickAddress").hide();
    }
    if ($("#physicalverification").val() == "2") {
        $("#pickPin").show();
        $("#CourierNote").hide();
        $("#pickNote").hide();
        GetAddressOnUserClick();
    }
    else if ($("#physicalverification").val() == "3") {
        $("#CourierNote").show();
        $("#pickPin").hide();
        $("#pickNote").hide();
    }
}

function ClearLocalStorage() {
    localStorage.removeItem("DSCForm");
}

function SaveToLocal() {

    window.localStorage.setItem("DSCForm", JSON.stringify($("#form1").serializeObject()));
}

function ClearForm() {
    ClearLocalStorage();
    resetFields();
}

function resetFields() {
    $(':input').each(function () {
        var type = this.type;
        var tag = this.tagName.toLowerCase(); // normalize case
        // to reset the value attr of text inputs,
        // password inputs, fileUpload and textareas
        if (type == 'text' || type == 'password' || tag == 'textarea' || type == 'file')
            $(this).val('');
            // checkboxes and radios need to have their checked state cleared                
        else if (type == 'checkbox' || type == 'radio')
            this.checked = false;
            // select elements need to have their 'selectedIndex' property set to -1
            // (this works for both single and multiple select elements)
        else if (tag == 'select')
            this.selectedIndex = 0;
    });
}


$.fn.serializeObject = function () {
    var o = {};
    $("input[type=text],select,textarea", this).each(function () {
        var id = $(this).attr("id");
        var val = $.trim($(this).val())
        o[id] = val;
    });
    return o;
};

function checkSub() {
    if ($('#physicalverification').val() == "0")
        $("#CourierNote").hide();
    if ($("#sameasabove").val() == "0")
        $(".sub-addres").hide();
}

function ShowPrices() {
    $.ajax({
        url: "/Data.aspx?Action=GetPricing&Data1=" + $("#usagetypeapp").val() + "&Data2=" + $("#lblClassType").text()
            + "&Data3=" + $("#ddUserType").val() + "&Data4=" + $("#ddCertificateType").val()
            + "&Data5=" + $("#ddCertificateValidity").val() + "&Data6=" + $("#ddUsbToken").val(), cache: false, success:
        function (Data) {
            var jsonData = Data.replace('~', '');
            var obj = $.parseJSON(jsonData);
            var VAT = parseFloat((obj.SalePrice * (obj.Vat) / 100).toFixed(2));
            var table = "<table class='table'><tr style='font-weight:bold;'><td>Certificate Cost<td>Rs " + obj.SalePrice +
                "<tr><td>Token Price<td>Rs " + obj.TokenPrice +
                //"<tr><td>Service Tax<td>" + VAT.toFixed(2) + " (@"+obj.Vat+"%)"+
                "<tr style='font-weight:bold;'><td>Total<td>Rs " + (obj.SalePrice + obj.TokenPrice) +
                "<tr><td>Service Tax<td>" + obj.Vat + "% extra" +
                "</table>";
            $("#hidCertificateCost").val(obj.SalePrice);
            $("#hidTokenPrice").val(obj.TokenPrice);
            $("#hidServiceTax").val(obj.Vat);
            $("#hidTotalCost").val(obj.SalePrice + obj.TokenPrice);
            $("#lblPriceTable").html(table);

            //alert($("#hidCertificateCost").val()+","+$("#hidTokenPrice").val()+","+$("#hidServiceTax").val());
        }
    });
}
var idinput = false, addInpit = false, appformInput = false;

$(function () {
    $("input:file").change(function () {
        var fileName = $(this).prop("id");
        switch (fileName) {
            case 'FileUpload1':
                idinput = true;
                break;
            case 'FileUpload2':
                addInpit = true;
                break;
            case 'FileUpload3':
                appformInput = true;
                break;
            case 'FileUpload5':
                addInpit = true;
                break;
        }
    });
});

function SaveIncompleteDSC() {
    var str = $("#divMainForm  input, #divMainForm select, #divMainForm textarea").serialize();
    $.post("/Data.aspx?Action=SaveIncomleteDscData&Data1=" + $("#lblID").text(), str.replace(/ctl00%24ContentPlaceHolder1%24/g, ''), function (data) {
        if (data != "")
            $("#lblID").text(data);

    });
}
function NotValid() {
    $("#btnSubmit").show();
    $("#Progress").css('display', 'none');

}

function Validate() {
    $("#btnSubmit").css('display', 'none');

    $("#Progress").css('display', 'block');

    //SaveIncompleteDSC();
    if ($("#givenname").val() == "") {
        $("#givenname").focus();
        alert("Name is mandatory!");
        NotValid();
        return false;
    }
    if ($("#orgnames").val() == "") {
        if ($("#orgnames").is(":visible")) {
            alert("Organization name is mandatory!");
            $("#orgnames").focus();
            NotValid();
            return false;
        }
    }
    if ($("#dptmt").val() == "") {
        if ($("#dptmt").is(":visible")) {
            alert("Department name is mandatory!");
            $("#dptmt").focus();
            NotValid();
            return false;
        }
    }
    if ($("#ddGender").val() == "") {
        alert("Gender is mandatory!");
        $("#ddGender").focus();
        NotValid();
        return false;
    }
    if ($("#txtDOB").val() == "") {
        alert("Date of birth is mandatory!");
        $("#txtDOB").focus();
        NotValid();
        return false;
    }
    if ($("#address").val() == "") {
        alert("Address is mandatory!");
        $("#address").focus();
        NotValid();
        return false;
    }
    if ($("#postalcodes").val() == "") {
        alert("Postal code is mandatory!");
        $("#postalcodes").focus();
        NotValid();
        return false;
    }
    if ($("#district").val() == "") {
        alert("District is mandatory!");
        $("#district").focus();
        NotValid();
        return false;
    }
    if ($("#state").val() == "") {
        alert("Please select a state!");
        $("#state").focus();
        NotValid();
        return false;
    }
    if ($("#pannos").val() == "") {
        alert("Please enter PAN!");
        $("#pannos").focus();
        NotValid();
        return false;
    }
    if ($("#pannos").val() != "") {
        if (fnValidatePAN($("#pannos")) == false) {
            alert("Invalid PAN");
            NotValid();
            return false;
        }
    }
    if ($("#mobilenumber").val() == "") {
        alert("Mobile no is mandatory!");
        $("#mobilenumber").focus();
        NotValid();
        return false;
    }
    if ($("#mobilenumber").val() != "") {
        if ($("#mobilenumber").val().length < 10) {
            alert("Please enter valid mobile no!");
            $("#mobilenumber").focus();
            NotValid();
            return false;
        }
    }

    if ($("#emailid").val() == "") {
        alert("Email id is mandatory!");
        $("#emailid").focus();
        NotValid();
        return false;
    }
    if ($("#emailid").val() != "") {
        if (!IsEmail($("#emailid").val())) {
            alert("Please enter valid email!")
            NotValid();
            return false;
            $("#emailid").focus();
        }
    }
    if ($("#identificationdocs").val() == "") {
        alert("Identification document is mandatory!");
        $("#identificationdocs").focus();
        NotValid();
        return false;
    }
    if ($("#iddocnumber").val() == "") {
        if ($("#identificationdocs").val() != "") {
            alert("Please fill id document no!");
            $("#iddocnumber").focus();
            NotValid();
            return false;
        }
    }
    if (idinput == false) {
        if ($("#lblID").text() == "0") {
            alert("Please choose an id document to upload!");
            $("#FileUpload1").focus();
            NotValid();
            return false;
        }
    }
    if ($("#ddUserType").val() == 0) {
        if ($("#addrsproofdocs").val() == "") {
            alert("Address proof document is mandatory!");
            $("#addrsproofdocs").focus();
            NotValid();
            return false;
        }
    }
    if (addInpit == false) {
        if ($("#lblID").text() == "0") {
            if ($("ddUserType").val() == 0) {
                alert("Please choose address proof document to upload!");
                $("#FileUpload2").focus();
            } else {
                alert("Please choose certificate of organisation to upload!");
                $("#FileUpload5").focus();
            }
            NotValid();
            return false;
        }
    }
    //if (appformInput == false)
    //{
    //    if ($("#lblID").text() == "0")
    //    {
    //        alert("Please choose application form to upload!");
    //        $("#FileUpload3").focus();
    //        return false;
    //    }
    //}
    if ($("#physicalverification").val() == "0") {
        if ($("#pickupcities").val() == "") {
            alert("please select pickup city !");
            $("#pickupcities").focus();
            NotValid();
            return false;
        }
    }

    if ($("#sameasabove").val() == "1") //if pickup addres is different
    {
        if ($("#pickupaddress").val() == "") {
            alert("Please fill pickup address!");
            $("#pickupaddress").focus();
            NotValid();
            return false;
        }
        if ($("#pickupcity").val() == "") {
            alert("Please fill pickup city!");
            $("#pickupcity").focus();
            NotValid();
            return false;
        }
        if ($("#pickuppostal").val() == "") {
            alert("Please fill pickup address postal code!");
            $("#pickuppostal").focus();
            NotValid();
            return false;
        }
    }
    if (Uploading == true)
        alert("Please wait .........");
    //ClearForm();
}