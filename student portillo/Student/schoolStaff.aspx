<%@ Page Language="C#" AutoEventWireup="true" CodeFile="schoolStaff.aspx.cs" ClientTarget="uplevel" Inherits="schoolStaff" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Macao Polytechnic Institute</title>
<link rel="stylesheet" href="../style.css" type="text/css" media="screen" />
<script type="text/javascript" src="../verify.js"></script>

</head>

<body>

    <form id="form1" runat="server">

<div id="wrapper">

	<div id="header">
	 <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Larger">Student Detail View</asp:Label>
	</div>
    
	<div id="menu">
		<ul>
			
					
			<li><a href="#"></a></li>
		
          
			<li>
              <asp:LinkButton ID="ePortfolio" runat="server" onclick="ePortfolio_Click">e-Portfolio</asp:LinkButton>
            </li>
            	<li>
                    <asp:LinkButton ID="AcademicNavigator" runat="server" onclick="AcademicNavigator_Click">Academic Navigator</asp:LinkButton>
                
                
                </li>
            <li><asp:LinkButton ID="Close" runat="server" onclick="Close_Click" 
                    ForeColor="Gray">Close</asp:LinkButton></li>
		</ul>
       
	</div>
<!--
	<div id="sidebar">
		<iframe id="Iframe1" frameborder="no" name="I1" scrolling="no" 
            src="../item/Link.aspx" height="165px">
            </iframe>
	</div>
   -->
       <div id='content'>
       <div id='seticon'>
    
           <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
               <asp:View ID="View1" runat="server">
               
                   <asp:Literal ID="Literal5" runat="server"></asp:Literal>
                   <asp:Literal ID="Literal3" runat="server"></asp:Literal>
                   <asp:Literal ID="Literal9" runat="server"></asp:Literal>
               </asp:View>
               <asp:View ID="View2" runat="server">
        <asp:Literal ID="Literal1" runat="server"></asp:Literal>
        <asp:Literal ID="Literal4" runat="server"></asp:Literal>
        <asp:Literal ID="Literal10" runat="server"></asp:Literal>
        <asp:Literal ID="Literal11" runat="server"></asp:Literal>
        <asp:Literal ID="Literal6" runat="server"></asp:Literal>
        <asp:Literal ID="Literal7" runat="server"></asp:Literal>
        <asp:Literal ID="Literal8" runat="server"></asp:Literal>
        <asp:Literal ID="Literal12" runat="server"></asp:Literal>
        <asp:Literal ID="Literal13" runat="server"></asp:Literal>
        <asp:Literal ID="Literal14" runat="server"></asp:Literal>
        <asp:Literal ID="Literal15" runat="server"></asp:Literal>
        <asp:Literal ID="Literal16" runat="server"></asp:Literal>
        <asp:Literal ID="Literal17" runat="server"></asp:Literal>
        <asp:Literal ID="Literal2" runat="server"></asp:Literal>
        <asp:Literal ID="Literal18" runat="server"></asp:Literal>
        <asp:Literal ID="Literal19" runat="server"></asp:Literal>   
  
               </asp:View>
           </asp:MultiView>
 
       
       
   </div>
   </div>
     
	<div>
		<div>
		 <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                SelectCommand="SELECT * FROM [userGroup] WHERE ([id] = @id)">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="" Name="id" SessionField="position" 
                        Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>

             <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                
                SelectCommand="SELECT COUNT( *) as new FROM [AdvisoryRemark] WHERE (([status] = @status) AND ([ALUN_NUMERO] = @ALUN_NUMERO)AND ([ALUN_NUMERO_SEQ] = @ALUN_NUMERO_SEQ) )">
                <SelectParameters>
                    <asp:Parameter DefaultValue="Unread" Name="status" Type="String" />
                    <asp:SessionParameter Name="ALUN_NUMERO" SessionField="ALUN_NUMERO" 
                        DefaultValue="" />
                    <asp:SessionParameter Name="ALUN_NUMERO_SEQ" SessionField="ALUN_NUMERO_SEQ" />
                </SelectParameters>
            </asp:SqlDataSource>
			
		</div>
	</div>



</div>

    </form>

</body>
</html>