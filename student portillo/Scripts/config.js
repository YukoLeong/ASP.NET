
		function btnsmallClick() {
				document.getElementById("btn_small").style.backgroundColor = "#1397E8";
				document.getElementById("btn_medium").style.backgroundColor = "#CCC";
			    document.getElementById("btn_big").style.backgroundColor = "#CCC";
	            var objs = document.querySelectorAll(".icon");
	            var txt = document.querySelectorAll(".text");
	            var box = document.querySelectorAll(".monthebox ");
				
				if (document.getElementById("noti")!=null 
				&& document.getElementById("noti").innerHTML  <10) {									
					document.getElementById("noti").style.top="10px";
					document.getElementById("noti").style.right="36px";
					document.getElementById("noti").style.fontSize="9pt";
				}
				else if (document.getElementById("noti")!=null ){
					document.getElementById("noti").style.top="9px";
					document.getElementById("noti").style.right="33px";
					document.getElementById("noti").style.fontSize="9pt";
				}
	            for (var i = 0; i < objs.length; i++) {
	                objs[i].style.width = "85px";
	                objs[i].style.height = "85px";
	            }
	            for (var i = 0; i < txt.length; i++)
	                txt[i].style.fontSize = "8pt";

	            for (var i = 0; i < box.length; i++)
	                box[i].style.margin = "0px";
					
				  displayDelay();
	        }
			
			function btnmedClick() {
				document.getElementById("btn_medium").style.backgroundColor  = "#1397E8";
				document.getElementById("btn_small").style.backgroundColor  = "#CCC";
				document.getElementById("btn_big").style.backgroundColor  = "#CCC";
	            var objs = document.querySelectorAll(".icon");
	            var txt = document.querySelectorAll(".text");
	            var box = document.querySelectorAll(".monthebox ");
				
				if (document.getElementById("noti")!=null
				&& document.getElementById("noti").innerHTML  <10) {									
					document.getElementById("noti").style.top="12px";
					document.getElementById("noti").style.right="26px";
					document.getElementById("noti").style.fontSize="9pt";
				}
				else if(document.getElementById("noti")!=null ){
					document.getElementById("noti").style.top="12px";
					document.getElementById("noti").style.right="22px";
					document.getElementById("noti").style.fontSize="9pt";
				}
	            for (var i = 0; i < objs.length; i++) {
	                objs[i].style.width = "110px";
	                objs[i].style.height = "110px";
	            }

	            for (var i = 0; i < txt.length; i++) 
	                txt[i].style.fontSize = "10pt";

	            for (var i = 0; i < box.length; i++)
	                box[i].style.margin = "6px 0px 0px 0px";
	              displayDelay();
	        }
			
			  function btnbigClick() {
				document.getElementById("btn_big").style.backgroundColor  = "#1397E8";
				document.getElementById("btn_small").style.backgroundColor  = "#CCC";
				document.getElementById("btn_medium").style.backgroundColor  = "#CCC";
				
	            var objs = document.querySelectorAll(".icon");
	            var txt = document.querySelectorAll(".text");
	            var box = document.querySelectorAll(".monthebox ");
				
				if (document.getElementById("noti")!=null 
				&& document.getElementById("noti").innerHTML  <10) {									
					document.getElementById("noti").style.top="14px";
					document.getElementById("noti").style.right="12px";
					document.getElementById("noti").style.fontSize="11pt";
				}
				else if(document.getElementById("noti")!=null ){
					document.getElementById("noti").style.top="14px";
					document.getElementById("noti").style.right="8px";
					document.getElementById("noti").style.fontSize="9pt";
				}
				
	            for (var i = 0; i < objs.length; i++) {
	                objs[i].style.width = "143px";
	                objs[i].style.height = "143px";
	            }
	            for (var i = 0; i < txt.length; i++)
	                txt[i].style.fontSize = "12pt";

	            for (var i = 0; i < box.length; i++)
	                box[i].style.margin = "6px 40px 46px 9px";
					  displayDelay();
	        }
	 function setDefaultIconSize(size){
	        if (size == 'small') {
	            document.getElementById("btn_small").style.backgroundColor = "#1397E8";
	            document.getElementById("btn_medium").style.backgroundColor = "#CCC";
	            document.getElementById("btn_big").style.backgroundColor = "#CCC";
	            var objs = document.querySelectorAll(".icon");
	            var txt = document.querySelectorAll(".text");
	            var box = document.querySelectorAll(".monthebox ");

	            if (document.getElementById("noti") != null
				&& document.getElementById("noti").innerHTML < 10) {
	                document.getElementById("noti").style.top = "10px";
	                document.getElementById("noti").style.right = "36px";
	                document.getElementById("noti").style.fontSize = "9pt";
	            }
	            else if (document.getElementById("noti") != null) {
	                document.getElementById("noti").style.top = "9px";
	                document.getElementById("noti").style.right = "33px";
	                document.getElementById("noti").style.fontSize = "9pt";
	            }
	            for (var i = 0; i < objs.length; i++) {
	                objs[i].style.width = "85px";
	                objs[i].style.height = "85px";
	            }
	            for (var i = 0; i < txt.length; i++)
	                txt[i].style.fontSize = "8pt";

	            for (var i = 0; i < box.length; i++)
	                box[i].style.margin = "6px 0px -34px 0px";

	        }
	        else if (size == 'medium') {
	            document.getElementById("btn_medium").style.backgroundColor = "#1397E8";
	            document.getElementById("btn_small").style.backgroundColor = "#CCC";
	            document.getElementById("btn_big").style.backgroundColor = "#CCC";
	            var objs = document.querySelectorAll(".icon");
	            var txt = document.querySelectorAll(".text");
	            var box = document.querySelectorAll(".monthebox ");

	            if (document.getElementById("noti") != null
				&& document.getElementById("noti").innerHTML < 10) {
	                document.getElementById("noti").style.top = "12px";
	                document.getElementById("noti").style.right = "26px";
	                document.getElementById("noti").style.fontSize = "9pt";
	            }
	            else if (document.getElementById("noti") != null) {
	                document.getElementById("noti").style.top = "12px";
	                document.getElementById("noti").style.right = "22px";
	                document.getElementById("noti").style.fontSize = "9pt";
	            }
	            for (var i = 0; i < objs.length; i++) {
	                objs[i].style.width = "110px";
	                objs[i].style.height = "110px";
	            }

	            for (var i = 0; i < txt.length; i++)
	                txt[i].style.fontSize = "10pt";

	            for (var i = 0; i < box.length; i++)
	                box[i].style.margin = "6px 0px 0px 0px";

	        }
	        else if (size == 'big'|| size=='') {
	            document.getElementById("btn_big").style.backgroundColor = "#1397E8";
	            document.getElementById("btn_small").style.backgroundColor = "#CCC";
	            document.getElementById("btn_medium").style.backgroundColor = "#CCC";

	            var objs = document.querySelectorAll(".icon");
	            var txt = document.querySelectorAll(".text");
	            var box = document.querySelectorAll(".monthebox ");

	            if (document.getElementById("noti") != null
				&& document.getElementById("noti").innerHTML < 10) {
	                document.getElementById("noti").style.top = "14px";
	                document.getElementById("noti").style.right = "12px";
	                document.getElementById("noti").style.fontSize = "11pt";
	            }
	            else if (document.getElementById("noti") != null) {
	                document.getElementById("noti").style.top = "14px";
	                document.getElementById("noti").style.right = "8px";
	                document.getElementById("noti").style.fontSize = "9pt";
	            }

	            for (var i = 0; i < objs.length; i++) {
	                objs[i].style.width = "143px";
	                objs[i].style.height = "143px";
	            }
	            for (var i = 0; i < txt.length; i++)
	                txt[i].style.fontSize = "12pt";

	            for (var i = 0; i < box.length; i++)
	                box[i].style.margin = "6px 40px 46px 9px";
	        }
	    }
	 
	        function loadXMLDoc(url) {
	            var xmlhttp;
	            var txt, x, xx, i;
	            if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
	                xmlhttp = new XMLHttpRequest();
	            }
	            else {// code for IE6, IE5
	                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	            }
	            xmlhttp.onreadystatechange = function () {
	                if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
	                    txt = "<table border='1'  bordercolor='#E6E6E6' width='100%' border='1' align='center' cellpadding='4' cellspacing='1' bgcolor='#FFFFFF'><tr><th>Posting Date</th><th>Subject</th></tr>";
	                    x = xmlhttp.responseXML.documentElement.getElementsByTagName("item");
	                    for (i = 0; i < x.length; i++) {
	                        txt = txt + "<tr>";
	                        xx = x[i].getElementsByTagName("pubDate");
	                        {
	                            try {
	                                txt = txt + "<td>" + xx[0].firstChild.nodeValue + "</td>";
	                            }
	                            catch (er) {
	                                txt = txt + "<td>?</td>";
	                            }
	                        }
	                        xx = x[i].getElementsByTagName("link");
	                        title = x[i].getElementsByTagName("title");
	                        {
	                            try {
	                                txt = txt + "<td><a target='_blank' href='" + xx[0].firstChild.nodeValue + "'>" + title[0].firstChild.nodeValue + "</td>";
	                            }
	                            catch (er) {
	                                txt = txt + "<td>?</td>";
	                            }
	                        }
	                        txt = txt + "</tr>";
	                    }
	                    txt = txt + "</table>";
	                    document.getElementById('newsInfo').innerHTML = txt;
	                }
	            }
	            xmlhttp.open("GET", url, true);
	            xmlhttp.send();
	        }
	     function displayDelay() {
            $(".monthebox").each(function (index) {
                $(this).hide();
                $(this).delay(100 * index).fadeIn(100);
            });
        }