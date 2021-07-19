/*Ajax Init*/


$(document).ajaxStart(function () {
    $.mobile.loading('show');
});

$(document).ajaxStop(function () {
    $.mobile.loading('hide');
});


function acceptOnClick(submitBtn, acceptChk) {

    if (submitBtn.hasClass("ui-disabled") && acceptChk.prop("checked")) {
        submitBtn.removeClass("ui-disabled");
    }
    else {
        submitBtn.addClass("ui-disabled");
    }
}


function renewSelOpt(selectCtrl, jsonUrl) {
    //var selectCtrl = $('#' + selectCtrlId);
    var selectedVal = selectCtrl.val().toString();

    //selectCtrl.find(':selected').remove();
    //selectCtrl.find('option').remove().end();
    //selectCtrl.filter(":selected").remove();
    selectCtrl.empty();
    //selectCtrl.selectmenu('refresh');

    $.getJSON(jsonUrl, function (data) {
        //$.each(data, function (value, text) { selectCtrl.append($('<option>').text(text).val(value)); })

        $.each(data, function (value, text) {
            if (value.toString() == selectedVal) {
                selectCtrl.append('<option value="' + value + '" selected="selected" >' + text + '</option>');
            }
            else {
                selectCtrl.append('<option value="' + value + '">' + text + '</option>');
            }

        });

        selectCtrl.selectmenu('refresh', true);
    });

};

function renewSelOpt2(selectCtrl, jsonUrl) {

    var result = $.ajax({
        url: jsonUrl,
        type: "GET",
        timeout: 2000,
        dataType: "json",
        success: function (json) { renewOpt(json, selectCtrl); },
        error: function () { console.log("ERROR!") },
        async: false
    });

    if (result.responseText.length > 0) {
        return true;
    }
};

function renewOpt(json, selectCtrl) {
    var selCtrl = $(selectCtrl);
    var selectedVal = selCtrl.val().toString();
    selCtrl.empty();

    $.each(json, function (value, text) {
        if (value.toString() == selectedVal) {
            selCtrl.append('<option value="' + value + '" selected="selected" >' + text + '</option>');
        }
        else {
            selCtrl.append('<option value="' + value + '">' + text + '</option>');
        }
    });
}



function formValid(formCtrl, vUrl) {
    //console.log(formCtrl.serialize());
    var result = $.ajax({
        url: vUrl,
        type: "POST",
        timeout: 2000,
        data: formCtrl.serialize(),
        dataType: "json",
        success: function (json) { nextStepHandle(json); },
        error: function () { console.log("ERROR!") },
        async: false
    });

    if (result.responseJSON === undefined || result.responseJSON.isValid === "false") {
        return false;
    }
    else if (result.responseJSON.isValid === "true") {
        return true;
    }
}

function nextStepHandle(json) {
    clearErr();
    if (json.isValid === "false") {
        showErr(json);
    }
}

function showErr(json) {
        
        var isFirst = true;
        var focusItem;

        $.each(json, function (ctrl, err) {
            if (!(ctrl.toString() == "isValid")) {
                $('#' + ctrl + 'Err').html(err).fadeTo("slow", 1);
                if (isFirst) { focusItem = $('#' + ctrl); }
                isFirst = false;
            }
        })

        focusItem.focus();
}

function clearErr() {
    $(".alert-msg").empty().css({ opacity: 0 });
}