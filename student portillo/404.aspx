<%@ Page Language="C#" AutoEventWireup="true" CodeFile="404.aspx.cs" Inherits="_404" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Page Not Found</title>
     <link rel="stylesheet" href="style.css" type="text/css" media="screen" />
	 <meta charset="utf-8" />
</head>
<body>
    <form id="form1" runat="server">
       <div id="wrapper">
            <div id="headerStd">
			
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/logo_transp_v2003.gif"
                    Style="margin-top: 45px; margin-left: 0px;" OnClick="ImageButton1_Click" />
                <div style="padding-top: 114px;">
                    &nbsp;&nbsp; 
                </div>
            </div>


              <div id="content">
					<h2>Page not found.</h2>
					<p>The page you requested could not be found.</p>
					<ul>
					<li><a href="home.aspx">Return to Home Page</a></li>
					</ul>
					<br/> 
					<br/>
					
					<h2>找不到網頁。</h2>
					<p>您請求的頁面無法找到。</p>
					<ul>
					<li><a href="home.aspx">返回首頁</a></li>
					</ul>
                  </div>
				  </div>
		<div id="footer-home">
            <div id="footer-valid">
                Copyright &copy;
                <script type="text/javascript">
                    var dt = new Date();
                    document.write(dt.getFullYear());
                </script>
                Macao Polytechnic Institute. All Rights Reserved.    
            </div>
        </div>
    </form>
</body>
</html>
