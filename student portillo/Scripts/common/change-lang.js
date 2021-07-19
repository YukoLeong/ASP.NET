

var Lang = {
currentLang: "zh-tw"
}

/*function loadXml(xmlPath) {
    $.ajax({
        url: xmlPath,
        type: "GET",
        timeout: 1000,
        dataType: "xml",
        success: function (xml) { changeControlLang(xml); },
        error: function () { return false; }
    }
    )
}*/


function loadXml(xmlPath) {
$.ajax({
url: xmlPath,
type: "GET",
timeout: 1000,
dataType: "json",
success: function (json) { changeControlLang(json); },
error: function () { console.log('FAIL') }
}
)
}


function changePageLang(buttonId, lang) {

    var button = $(buttonId);
    button.addClass("ui-disabled");

    if (lang == "en") {
        lang = "zh-tw";
    }
    else if (lang == "zh-tw") {
        lang = "en";
    }

    loadXml("ajax/change-lang.aspx?lang=" + lang);

    $(buttonId).removeClass("ui-disabled");
    return lang;
}

/*function changePageLang(buttonId, lang) {

    var button = $(buttonId);
    button.addClass("ui-disabled");

    $(buttonId).addClass("ui-disabled");

    if (lang == "en") {
        lang = "zh-tw";
    }
    else if (lang == "zh-tw"){
        lang = "en";
    }

    loadXml("ajax/change-lang.aspx?lang=" + lang);
    //loadXml("resources/common." + lang + ".xml");
    loadXml("ajax/change-lang.aspx?lang=" + lang + "&com=Y");

    $(buttonId).removeClass("ui-disabled");
    return lang;
}*/

/*function changeControlLang(xmlFile) {
    

    $(xmlFile).find('entry').each(function () {
        var id = $(this).attr('id');
        var db = $(this).attr('db');
        var content = $(this).text();

        if (db == "true") {
            getUserParam(content, $('[data-xid=' + id + ']'));
        }
        else {
            $('[data-cxid=' + id + ']').html(content);
            $('[data-xid=' + id + ']').html(content);            
        }
    }
    )
}*/

function changeControlLang(json) {
    $.each(json, function (xid, label) {
        //$('[data-cxid=' + xid + ']').html(label);
        $('[data-xid=' + xid + ']').html(label); 
    })        
}

function getUserParam(content, control) {
    $.ajax({
        url: "ajax/get-user-param.aspx",
        type: "POST",
        data: "userParam="+content,
        timeout: 1000,
        dataType: "text",
        success: function (text) { control.html(text) },
        error: function () { return ""; }
    }
    )
}




