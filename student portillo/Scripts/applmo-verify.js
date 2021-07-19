
/*function formValid() {

    $.ajax({
        url: "ajax/is-val-applmo-verify.aspx",
        type: "POST",
        timeout: 1000,
        data: $("#idVerifyForm").serialize(),
        dataType: "json",
        success: function (json) { sumbitHandle(json); },
        //success: function (json) { console.log(json); },
        error: function () { console.log("ERROR!") }
    }
    );

}


function sumbitHandle(json) {
    clearErr();

    if (json.isValid === "false") {
        showErr(json);
      }
      else if(json.isValid === "true"){
            $("#idVerifyForm").submit();
      }
  }*/
