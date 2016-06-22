$(window).resize(_Resize);
$(document).ready(function ()
{
    _Resize();

    try
    {
        $(".fancybox").fancybox(
            {
                afterClose: function ()
                {
                    location.reload();
                    return;
                }
            });

        $(".fancybox1").fancybox(
        {
            width: '250',
            autoDimension: true,
            afterClose: function ()
            {
                location.reload();
                return;
            }
        });

        $(".fancybox350").fancybox(
            {
                width: '350',
                autoDimension: true,
                afterClose: function ()
                {
                    location.reload();
                    return;
                }
            });

        $(".fancybox400").fancybox(
        {
            width: '400',
            autoDimension: true,
            afterClose: function ()
            {
                location.reload();
                return;
            }
        });

        $(".fancybox450").fancybox(
        {
            width: '450',
            autoDimension: true,
            afterClose: function ()
            {
                location.reload();
                return;
            }
        });

        $(".fancybox500").fancybox(
            {
                width: '500',
                autoDimension: true,
                afterClose: function ()
                {
                    location.reload();
                    return;
                }
            });
        $(".fancybox600").fancybox(
        {
            width: '600',
            autoDimension: true,
            afterClose: function ()
            {
                location.reload();
                return;
            }
        });
    }
    catch (e) { }


    //jQuery(".onlynumber").bind("keydown", function (event)
    //{

    //    if (event.keyCode == 46 || event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 27 || event.keyCode == 13 ||
    //        // Allow: Ctrl+A
    //        (event.keyCode == 65 && event.ctrlKey === true) ||

    //        // Allow: Ctrl+C
    //        (event.keyCode == 67 && event.ctrlKey === true) ||

    //        // Allow: Ctrl+V
    //        (event.keyCode == 86 && event.ctrlKey === true) ||

    //        // Allow: home, end, left, right
    //        (event.keyCode >= 35 && event.keyCode <= 39))
    //    {
    //        // let it happen, don't do anything
    //        return;
    //    } else
    //    {
    //        // Ensure that it is a number and stop the keypress
    //        if (event.shiftKey || (event.keyCode < 48 || event.keyCode > 57) && (event.keyCode < 96 || event.keyCode > 105))
    //        {
    //            event.preventDefault();
    //        }
    //    }
    //});
});

function _Resize()
{
    return;
    var h = $(window).height() - ($(".masthead").height() + $(".divfooter").height()) - 170; // - 295 ;
    $("#divDataArea").css({ 'min-height': h });
}

$(document).ready(function ()
{
    $(".navbar-collapse li").each(function ()  //Activate items in menu
    {
        var _this = this;
        $("a", this).each(function ()
        {
            if (window.location.href.indexOf($(this).attr('href')) > -1)
                $(_this).addClass("active");
        });
    });
    //$("a[href='" + window.location.pathname + "']").parent().closest('li').addClass("active");
});