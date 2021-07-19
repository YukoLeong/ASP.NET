<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AcademicRecord.aspx.vb" Inherits="Student_AcademicRecord" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <style type="text/css">
        .style1
        {
            font-family: "Berlin Sans FB";
            font-size: x-large;
        }
      #wrapper
        {            
            margin-left: auto;
            margin-top:-8px;
            margin-right: auto;
            background-color:White;
            border-left:solid gray 1px;
            border-right:solid gray 1px;
	    width: 90%;
        
        }
		#content
        {          
            min-height:980px;            
            margin-left: 5px;
            margin-right: 5px;
        }
        #ImageButton2{
            width:150px;
            height:55px;
        }
        </style>

</head>
<body background="../images/bg-blue.jpg">
    <form id="form1" runat="server">
    <div>
       <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                SelectCommand="SELECT * FROM [userGroup] WHERE ([id] = @id)">
                <SelectParameters>
                    <asp:SessionParameter Name="id" SessionField="Role_Type" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
    <div id="wrapper">
 <div id="content">
      <asp:Label ID="Label1" runat="server" Text="<%$ Resources:Resource, sip_academic_results %>" style="color:black;font-size:xx-large;font-family: 'Berlin Sans FB';"></asp:Label>
     <div style="text-align:center;margin-top:-25px;padding-bottom:12px">
               <asp:ImageButton ID="btn_home" runat="server" onmouseover="this.src='../images/homeblue_hover.png'" onmouseout="this.src='../images/homeblue.png'" 
			   ImageUrl="~/images/homeblue.png" CausesValidation="false" onclick="btn_home_Click"  Height="55px" Width="150px"/>
	</div>
       <div align="center">
             <iframe id="I1" frameborder="no"  src="http://172.26.122.66/siweb/grade.asp"  style="width:900px;min-height:1280px;overflow: auto;padding-bottom:30px;" />
			 </div>
            <br />
    <br />
    </div>
     </div>
  
    </div>
    </form>
</body>
</html>
