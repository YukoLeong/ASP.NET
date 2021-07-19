<%@ Page Language="VB" AutoEventWireup="false" CodeFile="invaild.aspx.vb" Inherits="Admin_invaild" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
       <link rel="stylesheet" href="../button.css" type="text/css" media="screen" />

    <style type="text/css">
    .style1 {font-family: Arial, Helvetica, sans-serif}
</style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <div style="text-align:center;margin-top:0px;padding-bottom:12px">
               <asp:ImageButton ID="ImageButton2" runat="server" onmouseover="this.src='../images/homeblue_hover.png'" onmouseout="this.src='../images/homeblue.png'" ImageUrl="~/images/homeblue.png" CausesValidation="False" Height="55px" Width="150px"/>
    </div>

        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="View1" runat="server">
              <p align="center" class="style1">Gift exchange time is from&nbsp;<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>&nbsp;to&nbsp;<asp:Label ID="Label2" runat="server" Text="Label"></asp:Label><br />
              <p align="center" class="style1 style6 style24">禮物兌換時間:&nbsp;<asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>&nbsp;to&nbsp;<asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>。<br /></p>
   
            </asp:View>
            <asp:View ID="View2" runat="server">
             <p align="center" class="style1">Gift exchange time is not available now. <br />
             <p align="center" class="style1 style6 style24">禮物兌換時間暫時未能提供。<br /></p>
  
            </asp:View>
           
        </asp:MultiView>
                <asp:SqlDataSource ID="AccessTime" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
        SelectCommand="SELECT * FROM [giftAccessTime]"></asp:SqlDataSource>
 </div>
    </form>
</body>
</html>
