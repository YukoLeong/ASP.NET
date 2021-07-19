<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="homepage.aspx.vb" Inherits="ep.homepage2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Macao Polytechnic Institute</title>
<link rel="stylesheet" href="../style.css" type="text/css" media="screen" />


</head>

<body>

    <form id="form1" runat="server">

<div id="wrapper">

	<div id="header">
	 
	    
	 
	</div>
    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Larger"></asp:Label>
	<div id="menu">
        
		<ul>
			<li><a href="homepage.aspx">Home</a></li>
			<li><a href="home.aspx">e-potfolio</a></li>
			<li><a href="#">Academic</a></li>
			<li><a href="#">Job matching/College Countring</a></li>
			<li><a href="#">System</a></li>
            <li><asp:LinkButton ID="LinkButton1" runat="server">Log Out</asp:LinkButton></li> 
		</ul>
	</div>

	<div id="sidebar">
		<iframe id="Iframe1" frameborder="no" name="I1" scrolling="no" 
            src="../item/Link.aspx" height="165px">
            </iframe>
	</div>

<div id="content">
    
    	<p style="font-size: large; font-weight: bolder">Welcome to Macao Polytechnic Institute!</p>

   <div id="seticon">
 
 &nbsp;</div>   
	</div>

	<div id="footer">
		<div id="footer-valid">
			
		</div>
	    
	</div>

</div>

    </form>

</body>
</html>
