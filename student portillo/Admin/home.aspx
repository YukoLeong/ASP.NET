<%@ Page Language="C#" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="Student_home" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Macao Polytechnic Institute</title>
<link rel="stylesheet" href="../style.css" type="text/css" media="screen" />
<!-- <script type="text/javascript" src="../verify.js"></script> -->

</head>

<body>

    <form id="form1" runat="server">

<div id="wrapper">

	<div id="headerStaff">
	  <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/logo_transp_v2003.gif"
	 style="margin-top: 58px;margin-left: 5px;"  OnClick="ImageButton1_Click" />
	</div>
    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Larger"></asp:Label>
	<div id="menu">
		<ul>
			
			<li><a href="#"></a></li>
			<li><a href="#"></a></li>
			<li><a href="#"></a></li>
            <li><asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">Log Out</asp:LinkButton></li>
		</ul>
       
	</div>

	
   
       <div id='content'>
       <div id='seticon'>
        <asp:Literal ID="Literal1" runat="server"></asp:Literal>
        <asp:Literal ID="Literal2" runat="server"></asp:Literal>
        <asp:Literal ID="Literal3" runat="server"></asp:Literal>
        <asp:Literal ID="Literal4" runat="server"></asp:Literal>
        <asp:Literal ID="Literal5" runat="server"></asp:Literal>
        <asp:Literal ID="Literal6" runat="server"></asp:Literal>
        <asp:Literal ID="Literal7" runat="server"></asp:Literal>
        <asp:Literal ID="Literal8" runat="server"></asp:Literal>
        <asp:Literal ID="Literal9" runat="server"></asp:Literal>
        <asp:Literal ID="Literal10" runat="server"></asp:Literal>
        <asp:Literal ID="Literal11" runat="server"></asp:Literal>
        <asp:Literal ID="Literal19" runat="server"></asp:Literal>     
        <asp:Literal ID="Literal12" runat="server"></asp:Literal>
        <asp:Literal ID="Literal13" runat="server"></asp:Literal>
        <asp:Literal ID="Literal14" runat="server"></asp:Literal>
        <asp:Literal ID="Literal15" runat="server"></asp:Literal>
        <asp:Literal ID="Literal16" runat="server"></asp:Literal>
        <asp:Literal ID="Literal17" runat="server"></asp:Literal>
        <asp:Literal ID="Literal18" runat="server"></asp:Literal>
        <asp:Literal ID="Literal37" runat="server"></asp:Literal>
        <asp:Literal ID="Literal35" runat="server"></asp:Literal>

         <asp:Literal ID="Literal20" runat="server"></asp:Literal>
        <asp:Literal ID="Literal21" runat="server"></asp:Literal>
        <asp:Literal ID="Literal22" runat="server"></asp:Literal>
        <asp:Literal ID="Literal23" runat="server"></asp:Literal>

        <asp:Literal ID="Literal24" runat="server"></asp:Literal>
        <asp:Literal ID="Literal224" runat="server"></asp:Literal>
          
        <asp:Literal ID="Literal25" runat="server"></asp:Literal>
        <asp:Literal ID="Literal124" runat="server"></asp:Literal>
        <asp:Literal ID="Literal125" runat="server"></asp:Literal>
        <asp:Literal ID="Literal126" runat="server"></asp:Literal>
   </div>
   </div>
     
	<div>
		<div>
		 <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                SelectCommand="SELECT * FROM [userGroup] WHERE ([id] = @id)">
                <SelectParameters>
                    <asp:SessionParameter Name="id" SessionField="Role_Type" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
			
		</div>
	</div>



</div>

    </form>

</body>
</html>