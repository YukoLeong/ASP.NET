<%@ Page Language="C#" AutoEventWireup="true" CodeFile="settings.aspx.cs" Inherits="Student_settings" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Settings</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta charset="utf-8" />
    <script src="Scripts/jquery-1.11.2.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="Scripts/json2.min.js"></script>
    <link rel="stylesheet" href="../button.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="styles/jquery-ui.css" />
    <link rel="stylesheet" href="../style.css" type="text/css" media="screen" />
    <script src="Scripts/jquery-ui.js"></script>
    <script>
        onload = function () {
			
            $("#tabs").tabs();

            var objs = document.querySelectorAll(".object");
            for (var i = 0; i < objs.length; i++) {
                objs[i].draggable = true;
                objs[i].ondragstart = function (e) {
                    e.dataTransfer.setData("text", this.id);
                }
            }
            var panels = document.querySelectorAll(".container");
            for (var i = 0; i < panels.length; i++) {
                panels[i].ondragover = function (e) {
                    e.preventDefault();
                    e.dataTransfer.dropEffect = "copy";
                }

                panels[i].ondrop = function (e) {
                    var data = e.dataTransfer.getData("text");
                    var ele = document.getElementById(data);
                    this.appendChild(ele);

                    var pess_cod = document.getElementById("pess_cod").innerHTML;
                    // var elms = document.getElementById("panel_myfav").getElementsByTagName("*");

                    var elms = document.getElementById("panel_myfav").getElementsByClassName("monthebox");
                    var array = new Array();         
                    var j = 0;

                    if (pess_cod != "") {
                        cleanSettings(pess_cod);

                        if (elms.length > 0) {

                            //for (var i = 0; i < elms.length; i++) {
                            //    if (elms[i].id != null && elms[i].id.toString() != "") {
                            //        var imgName = new Object();
                            //        imgName["imgName"] = elms[i].id.toString();
                            //        imgName["pess_cod"] = pess_cod;

                            //        array[j] = imgName;
                            //        j++;
                            //    }
                            //}

                            for (var i = 0; i < elms.length; i++) {
                                if (elms[i].id != null && elms[i].id.toString() != "") {
                                    var imgName = new Object();
                                    imgName["imgName"] = elms[i].id.toString();
                                    imgName["pess_cod"] = pess_cod;

                                    array[j] = imgName;
                                    j++;
                                }
                            }

                            if (array.length > 0) {
                                console.log(array);
                                $.ajax({
                                    type: "POST",
                                    url: "WebService.asmx/saveCustomSettings",
                                    cache: false,
                                    //contentType: "application/json;charset=utf-8",                        
                                    data: { 'data': JSON.stringify(array) },
                                    dataType: "json",
                                    success: function (response) {
                                        alert(response.d);
                                    },
                                    failure: function (response) {
                                        alert(response.d);
                                    }

                                });
                            }
                            //alert('Success');


                        }
                    }
                    return false;
					
					
                }
            }

            function cleanSettings(pess_cod) {
                $.ajax({
                    type: "POST",
                    url: "WebService.asmx/cleanSettings",
                    //contentType: "application/json charset=utf-8",
                    dataType: "json",
                    data: { 'pess_cod': pess_cod },
                    success: function (response) {
                        alert(response.d);
                    },
                    failure: function (response) {
                        alert(response.d);
                    }

                });
            }
			

            $("#btn_save").click(function () {
                /*
                  var pess_cod = document.getElementById("pess_cod").innerHTML;
                    // var elms = document.getElementById("panel_myfav").getElementsByTagName("*");

                    var elms = document.getElementById("panel_myfav").getElementsByClassName("monthebox");
                    var array = new Array();         
                    var j = 0;

                    if (pess_cod != "") {
                        cleanSettings(pess_cod);

                        if (elms.length > 0) {

                            //for (var i = 0; i < elms.length; i++) {
                            //    if (elms[i].id != null && elms[i].id.toString() != "") {
                            //        var imgName = new Object();
                            //        imgName["imgName"] = elms[i].id.toString();
                            //        imgName["pess_cod"] = pess_cod;

                            //        array[j] = imgName;
                            //        j++;
                            //    }
                            //}

                            for (var i = 0; i < elms.length; i++) {
                                if (elms[i].id != null && elms[i].id.toString() != "") {
                                    var imgName = new Object();
                                    imgName["imgName"] = elms[i].id.toString();
                                    imgName["pess_cod"] = pess_cod;

                                    array[j] = imgName;
                                    j++;
                                }
                            }

                            if (array.length > 0) {
                                console.log(array);
                                $.ajax({
                                    type: "POST",
                                    url: "WebService.asmx/saveCustomSettings",
                                    cache: false,
                                    //contentType: "application/json;charset=utf-8",                        
                                    data: { 'data': JSON.stringify(array) },
                                    dataType: "json",
                                    success: function (response) {
                                        alert(response.d);
                                    },
                                    failure: function (response) {
                                        alert(response.d);
                                    }

                                });
                            }
                            alert('Success');


                        }
                    }
                    return false;
                    */

                var pess_cod = document.getElementById("pess_cod").innerHTML;
                var RB1 = document.getElementById("<%=RadioButtonList1.ClientID%>");
                var radio = RB1.getElementsByTagName("input");
                var label = RB1.getElementsByTagName("label");

                for (var i = 0; i < radio.length; i++) 
                    if (radio[i].checked) 
                        var size = radio[i].value;             

               
                $.ajax({
                    type: "POST",
                    url: "WebService.asmx/saveFavIconSize",
                    //contentType: "application/json charset=utf-8",
                    dataType: "json",
                    data: { 'pess_cod': pess_cod, 'size':size },
                    success: function (response) {
                        alert(response.d);
                    },
                    failure: function (response) {
                        alert(response.d);
                    }

                });

                //alert('Data has been saved successfully!');
				
			   window.location.replace('home.aspx');
			   return false;
            });

        }
    </script>
    <style>
        #wrapper1 {
            width: 80%;
            height: 100%;
            margin: 0 auto;
            background-color: White;
            border-left: solid #CCC 1px;
            border-right: solid #CCC 1px;
			overflow:auto;
        }

        #content1 {
            margin-left: 5px;
            margin-right: 5px;
            float: left;
            width: 99%;
        }

        #panel1 .monthebox {
            float: left;
            margin: 6px 25px 46px 9px;
        }

        #panel2 .monthebox {
            float: left;
            margin: 6px 25px 46px 9px;
        }

        #panel3 .monthebox {
            float: left;
            margin: 6px 25px 46px 9px;
        }

        #panel4 .monthebox {
            float: left;
            margin: 6px 25px 46px 9px;
        }

        #panel5 .monthebox {
            float: left;
            margin: 6px 25px 46px 9px;
        }

        #panel6 .monthebox {
            float: left;
            margin: 6px 25px 46px 9px;
        }

        #panel_myfav .monthebox {
            float: left;
            margin: 6px 25px 46px 9px;
        }

        #panel_myfav {
            background: pink;
            height: 100%;
			min-height:400px;
            border: solid red 2px;
            padding: 3px 3px 3px 3px;
            border-radius: 5px;
			-moz-border-radius: 5px;
			-webkit-border-radius: 5px;
            margin-left: 10px;
            margin-right: 10px;
            overflow: auto;
        }

        #panel1 {
            background: lightblue;
            border: solid darkblue 2px;
            border-radius: 5px;
			-moz-border-radius: 5px;
			-webkit-border-radius: 5px;
            padding: 3px 3px 3px 3px;
            min-height: 250px;
            overflow: auto;
        }

        #panel2 {
            background: lightblue;
            border: solid darkblue 2px;
            border-radius: 5px;
			-moz-border-radius: 5px;
			-webkit-border-radius: 5px;
            padding: 3px 3px 3px 3px;
            min-height: 250px;
            overflow: auto;
        }

        #panel3 {
            background: lightblue;
            border: solid darkblue 2px;
            border-radius: 5px;
			-moz-border-radius: 5px;
			-webkit-border-radius: 5px;
            padding: 3px 3px 3px 3px;
            min-height: 250px;
            overflow: auto;
        }

        #panel4 {
            background: lightblue;
            border: solid darkblue 2px;
            border-radius: 5px;
			-moz-border-radius: 5px;
			-webkit-border-radius: 5px;
            padding: 3px 3px 3px 3px;
            min-height: 250px;
            overflow: auto;
        }

        #panel5 {
            background: lightblue;
            border: solid darkblue 2px;
            border-radius: 5px;
			-moz-border-radius: 5px;
			-webkit-border-radius: 5px;
            padding: 3px 3px 3px 3px;
            min-height: 250px;
            overflow: auto;
        }

        #panel6 {
            background: lightblue;
            border: solid darkblue 2px;
            border-radius: 5px;
            padding: 3px 3px 3px 3px;
            min-height: 250px;
            overflow: auto;
        }

        div img {
            margin: 10px 5px 5px 10px;
        }

        .object {
            cursor: move;
        }
		h2 {
			margin: 10px 0px 5px 20px;
			color: #FCC20B;
			
		}
         .radiobuttonlist {  
              border: solid green 3px;
			  border-radius: 5px;
			  -moz-border-radius: 5px;
			  -webkit-border-radius: 5px;
			  background-color: lightyellow;
        }  
        .radiobuttonlist td{             
            height:50px;  
            vertical-align:bottom;  
        }  
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="wrapper1">
            <div id="content1">
                <asp:Label ID="pess_cod" runat="server" Text="" Style="display: none;"></asp:Label> 
				<div style="font-size:10pt;padding-left:5px;">
				<p>請拖放喜愛的項目由上面的面板到我的最愛面板, 它將會自動地儲存！</p>   
                <p>Please drag and drop favorite items from top panel to bottom panel and it will be saved automatically ! </p>
				</div>
  <div style="text-align:center;margin-top:-80px;padding-bottom:12px">
           		
               	    <asp:ImageButton ID="btn_home" runat="server" onmouseover="this.src='../images/homeblue_hover.png'" onmouseout="this.src='../images/homeblue.png'" 
			   ImageUrl="~/images/homeblue.png" CausesValidation="false" onclick="btn_home_Click" style="width:125px;"/> 
	</div>		
			            <br />	
                <div id="tabs">
                    <ul>
                        <li><a href="#tabs-1"><asp:Label ID="lb_class" runat="server" Text="<%$ Resources:Resource, sip_class %>"></asp:Label></a></li>
                      <!--   <li><a href="#tabs-2">Student Record</a></li> -->
                        <li><a href="#tabs-3"><asp:Label ID="Label1" runat="server" Text="<%$ Resources:Resource, sip_finance %>"></asp:Label></a></li>
                        <li><a href="#tabs-4"><asp:Label ID="Label2" runat="server" Text="<%$ Resources:Resource, sip_eServices %>"></asp:Label></a></li>
                        <li><a href="#tabs-5"><asp:Label ID="Label3" runat="server" Text="<%$ Resources:Resource, sip_ePortfolio %>"></asp:Label></a></li>
                        <li><a href="#tabs-6"><asp:Label ID="Label4" runat="server" Text="<%$ Resources:Resource, sip_acac_nav %>"></asp:Label></a></li>

                    </ul>
                    <div id="tabs-1">
                        <div id="panel1" class="container">
                            <asp:Literal ID="items_p1" runat="server" />
                        </div>
                    </div>
                   <!--  <div id="tabs-2">
                        <div id="panel2" class="container">
                            <asp:Literal ID="items_p2" runat="server" />
                        </div>
                    </div> -->
                    <div id="tabs-3">
                        <div id="panel3" class="container">
                            <asp:Literal ID="items_p3" runat="server" />
                        </div>
                    </div>
                    <div id="tabs-4">
                        <div id="panel4" class="container">
                            <asp:Literal ID="items_p4" runat="server" />
                        </div>
                    </div>
                    <div id="tabs-5">
                        <div id="panel5" class="container">
                            <asp:Literal ID="items_p5" runat="server" />
                        </div>
                    </div>
                    <div id="tabs-6">
                        <div id="panel6" class="container">
                            <asp:Literal ID="items_p6" runat="server" />
                        </div>
                    </div>


                </div>


                <br />
                <br />
                <h2>My favourites 我的最愛</h2>
                <div id="panel_myfav" class="container">
                    <asp:Literal ID="items_panel_fav" runat="server" />
                </div>
                <br />
                <div style="margin-left: 20px;">
                 
                    <br />
                    <p>請選擇項目圖示的預設大小 !</p>
                    <p>Please select the default icon size of the  items !</p>
                    
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal"    CssClass="radiobuttonlist" >
                        <asp:ListItem Value="small">Small 細<img src="../images/cv2.png" style="width:85px;height:85px;" alt="small"/></asp:ListItem> 
                        <asp:ListItem Value="medium">Medium 中<img src="../images/cv2.png"  style="width:110px;height:110px;" alt="med"/></asp:ListItem> 
                        <asp:ListItem Value="big" Selected="True">Big 大<img src="../images/cv2.png" style="width:143px;height:143px;" alt="big"/></asp:ListItem> 
                    </asp:RadioButtonList>

                    <br/>
                    <asp:Button ID="btn_save" runat="server" Text="<%$ Resources:Resource, sip_sp_submit %>" Width="100px" CssClass="blue"  />
                    <asp:Button ID="btn_back" runat="server" Text="<%$ Resources:Resource, sip_back %>" Width="100px" OnClick="btn_back_Click" CssClass="blue" Style="display: none;"/>
                    
                </div>
				<div style="font-size:10pt;padding-left:20px;">
				<p>此功能建議使用 Firefox 31、Chrome 31 瀏覽器，如需使用 IE 瀏覽器，請使用 IE9 以上版本。</p>
				<p>This function is recommended Firefox 31、Chrome 31 browser, if you are using IE browser, please use IE 9 or above.</p>
				</div>
            </div>

        </div>
    </form>
</body>
</html>
