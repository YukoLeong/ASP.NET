<%@ Page Language="VB" AutoEventWireup="false" CodeFile="VenueTable.aspx.vb" Inherits="VenueTable" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
            height: 58px;
        }
		   #ImageButton2{
            width:150px;
            height:55px
        }
    </style>
     <link rel="stylesheet" href="../button.css" type="text/css" media="screen" />
</head>
 
<body>
    <form id="form1" runat="server">
    <div>
	  <div style="padding-bottom:0px;" align="center">
               <asp:ImageButton ID="ImageButton2" runat="server" onmouseover="this.src='../images/homeblue_hover.png'" onmouseout="this.src='../images/homeblue.png'" ImageUrl="~/images/homeblue.png" /> 
                </div>
    
<h2 align="center">學院場地使用時間表<br />
  Campus Venue Usage Timetable<br />

    <table class="style1">
        <tr>
            <td>
                <asp:Button ID="ChnBtn" runat="server" CssClass="blue" Text="中文版本" style="width: 138px;"/>
         
                <asp:Button ID="EngBtn" runat="server" Text="English Version" CssClass="blue" />
            </td>
        </tr>
    </table>

</h2>
<hr>
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
				<div align="center">
				<iframe ID="I1" frameborder="no"  src="https://webapps.ipm.edu.mo/rms/public/ResourceQuery_P.asp?lang=ch" height="1024px" width="1280px"></iframe>
				</div>
            </asp:View>
            <asp:View ID="View2" runat="server">
			<div align="center">
             <iframe ID="I2" frameborder="no" src="https://webapps.ipm.edu.mo/rms/public/ResourceQuery_P.asp?lang=eng" height="1024px" width="1280px"></iframe>
			 </div>
            </asp:View>
        </asp:MultiView>
    </div>
    </form>
</body>
</html>
