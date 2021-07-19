<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="home.aspx.vb" Inherits="ep.home5" %>


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
			<li><a href="home.aspx">e-Potfolio</a></li>
			<li><a href="#">Academic</a></li>
			<li><a href="#">Job matching/College Countring</a></li>
			<li><a href="#">System</a></li>
            <li><asp:LinkButton ID="LinkButton1" runat="server">Log Out</asp:LinkButton></li>
		</ul>
	</div>

	<div id="sidebar">
		<iframe id="Iframe1" frameborder="no" name="I1" scrolling="no" src="../item/Link.aspx">
            </iframe>
	</div>

<div id="content">
  <div id="seticon">


<div class="monthebox">
<a href="studentInfo.aspx">
<div id="item1" class="icon"></div>
<div class="text">Student Profile</div>
</a>
</div>

<div class="monthebox">
<a href="CategoryWeight.aspx">
<div id="item8" class="icon"></div>
<div class="text">
Chart Analysis</div>
</a>
</div>


<div class="monthebox">
<a href="messageBoard.aspx">
<div id="item6" class="icon"></div>
<div class="text">Message Board</div>
</a>
</div>
 
	</div>   
	</div>

	<div id="footer">
		<div id="footer-valid">
		
		</div>
	</div>

</div>

    </form>

</body>
</html>
