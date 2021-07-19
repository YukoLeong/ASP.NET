<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="home.aspx.vb" Inherits="ep.home3" %>

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
			<li><a href="home.aspx"></a></li>
			<li><a href="#"></a></li>
			<li><a href="#"></a></li>
			<li><a href="#"></a></li>
            <li><asp:LinkButton ID="LinkButton1" runat="server">Log Out</asp:LinkButton></li>
		</ul>
       
	</div>

	<div id="sidebar">
		<iframe id="Iframe1" frameborder="no" name="I1" scrolling="no" 
            src="../item/Link.aspx" height="165px">
            </iframe>
	</div>
   
<div id="content">
    <div id="seticon">


<div class="monthebox">
<a href="studentProfile.aspx">
<div id="item1" class="icon"></div>
<div class="text">Student Profile</div>
</a>
</div>

<div class="monthebox">
<a href="Career.aspx">
<div id="item2" class="icon"></div>
<div class="text">
Career Planning</div>
</a>
</div>

<div class="monthebox">
<a href="Learning.aspx">
<div id="item3" class="icon"></div>
<div class="text">Learning Records</div>
</a>
</div>

<div class="monthebox">
<a href="Community.aspx">
<div id="item4" class="icon"></div>
<div class="text">Extracurricular Activities</div>
</a>
</div>

<div class="monthebox">
<a href="studentWorks.aspx">
<div id="item5" class="icon"></div>
<div class="text">Student Works</div>
</a>
</div>

<div class="monthebox">
<a href="messageBoard.aspx">
<div id="item6" class="icon"></div>
<div class="text">Message Board</div>
</a>
</div>

<div class="monthebox">
<a href="StudentAtribute.aspx">
<div id="item7" class="icon"></div>
<div class="text">learning Record Attribute<asp:SqlDataSource ID="SqlDataSource1" 
        runat="server" ConnectionString="<%$ ConnectionStrings:EPConnectionString1 %>" 
        SelectCommand="SELECT [PESS_COD] FROM [student_academic_info] WHERE ([STUDENT_ID] = @STUDENT_ID)">
    <SelectParameters>
        <asp:QueryStringParameter Name="STUDENT_ID" QueryStringField="studentid" />
    </SelectParameters>
    </asp:SqlDataSource>
    </div>
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
