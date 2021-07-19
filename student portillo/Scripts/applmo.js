


function formValid2(vUrl,rUrl) {
    
    $.ajax({
        url: vUrl,
        type: "POST",
        timeout: 2000,
        data: $("#applForm").serialize(),
        dataType: "json",
        success: function (json) { nextStepHandle(json , rUrl); },
        error: function () { console.log("ERROR!") }
    }
    );
   /*console.log($("#idVerifyForm").serialize());
   $.post("ajax/v-applmo-verify.aspx", $("#idVerifyForm").serialize(), function (json) {
        console.log(json.length);
       // showAlert(json);
    }); */
}


function nextStepHandle2(json , url) {
    clearErr();
    
    if (json.isValid === "false") {
        showErr(json);
        return false;    
      }
      else if(json.isValid === "true"){
          location.href = url;
      }
  }



  function allFormValid() {
      var formCtrl = $('#applForm');
      if (!formValid(formCtrl, 'ajax/is-val-applmo-p1.aspx')) {
          $.mobile.changePage("applmo.aspx#applmoPage1");
      }
      else if (!formValid(formCtrl, 'ajax/is-val-applmo-p2.aspx')) {
          $.mobile.changePage("applmo.aspx#applmoPage2");
      }
      else if (!formValid(formCtrl, 'ajax/is-val-applmo-p3.aspx')) {
          $.mobile.changePage("applmo.aspx#applmoPage3");
      }
      else if (!formValid(formCtrl, 'ajax/is-val-applmo-p4.aspx')) {
          $.mobile.changePage("applmo.aspx#applmoPage4");
      }
      else {
          return true;
      }

      return false;
  }







function renewAllSelLang() {
    if (renewSelOpt2('#naciTypeSel', 'ajax/get-naci-type.aspx?lang=' + Lang.currentLang.toString())) {
        if (renewSelOpt2('#secSchoolSel', 'ajax/get-esex-type.aspx?lang=' + Lang.currentLang.toString() + '&etype=1')) {
            if (renewSelOpt2('#univerSel', 'ajax/get-esex-type.aspx?lang=' + Lang.currentLang.toString() + '&etype=2')) {
                if (renewSelOpt2('#otherSchSel', 'ajax/get-esex-type.aspx?lang=' + Lang.currentLang.toString() + '&etype=3')) {

                }
            }
        }
    }
}


function setSelProg(liItem , cursChoice) {
    var dataCursOpt = liItem.attr("data-copt");
    var dataCursCod = liItem.attr("data-ccod");

    $.ajax({
        url: "ajax/prog-opt.aspx",
        type: "POST",
        data: { act: "set", choice: cursChoice, cursCod: dataCursCod, cursOpt: dataCursOpt },
        timeout: 2000,
        dataType: "json",
        success: function (data) { if (data.result === "true") { $.mobile.changePage("applmo.aspx#applmoPage4"); } },
        //success: function (data) { if (data.result === "true") { location.href = "applmo.aspx#applmoPage4"; } },
        error: function () { console.log("ERROR!") }
    }
    );    
}

function getSelProg() {

    $.ajax({
        url: "ajax/prog-opt.aspx",
        type: "POST",
        data: { act: "get" },
        timeout: 2000,
        dataType: "json",
        success: function (json) { if (json.result === "true") { showProgSel(json); } },
        error: function () { console.log("ERROR!") }
    }
    );

}


function showProgSel(json) {
    $('#choice1Ipt').val(json.cursOpt1.toString());
    $('#choice2Ipt').val(json.cursOpt2.toString());
}

function p3RefreshSel() {
    $('#secSchoolSel').selectmenu('refresh', true);
    $('#univerSel').selectmenu('refresh', true);
    $('#otherSchSel').selectmenu('refresh', true);
}

function p1RefreshSel() {
    $('#naciTypeSel').selectmenu('refresh', true);
}

function completeInput() {

    $.ajax({
        url: "ajax/input-complete.aspx",
        type: "POST",
        data: { act: "set" },
        timeout: 2000,
        dataType: "json",
        success: function (json) { if (json.result === "true") { $mobile.changePage("applmo.aspx#applmoPage5"); } },
        error: function () { console.log("ERROR!") }
    }
    );
}

function p5pageShow() {

    var result = $.ajax({ url: "ajax/input-complete.aspx",
        type: "POST",
        data: { act: "get" },
        timeout: 2000,
        dataType: "json",
        success: function (json) { if (json.result !== "true") { $mobile.changePage("applmo.aspx#applmoPage5"); } },
        error: function () { console.log("ERROR!") },
        async: false
    });
}