<%@ Page Language="C#" AutoEventWireup="true" CodeFile="error.aspx.cs" Inherits="error" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Error Page</title>
    <link rel="stylesheet" href="style.css" type="text/css" media="screen" />	
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
					<h2>Sorry, An Error Has Occurred.</h2> 
					<p>An Unexpected error occurred on our website.</p>
					<ul>
					<li><a href="home.aspx">Return to Home Page</a></li>
					</ul>
					<br/>
					<h2>對不起，發生了錯誤。</h2>
					<p>在我們的網站發生了一個意外的錯誤。</p>
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
