<%@ Page Language="VB" AutoEventWireup="false" CodeFile="SeminarMark.aspx.vb" Inherits="SeminarMark" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    
       <style type="text/css">
            .stylefont
        {
            font-family: "Berlin Sans FB";
            font-size: xx-large;
        }
tr.row
{
    background-color:#fff;
}
tr.row td
{ 
}

tr.row:hover td, 
tr.row.over td
{ 
    background-color: #eee;
}
          .style9
        {
            font-family: "Berlin Sans FB";
            font-size: x-large;
            
        }

        #ImageButton2{
            width:14%;
        }


           .blue
           {}


        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
         <asp:Panel ID="Panel1" runat="server" Height="320px" Width="240px">
    <span class="style9">Upload PDA Data</span><br /><br />
                <asp:FileUpload ID="FileUpload1" runat="server" /><br /><br />
                <asp:Button ID="upload" runat="server" CssClass="blue" Text="Upload" 
                 Height="26px" /><br />
        <asp:Label ID="filefail" runat="server"  ForeColor="Red"></asp:Label>
             <asp:HyperLink ID="detail" runat="server" ForeColor="Blue" Target="_blank" 
                 Visible="False">[detail]</asp:HyperLink>
             <asp:SqlDataSource ID="file" runat="server" 
                 ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                 SelectCommand="SELECT * FROM [SeminarProcess]"></asp:SqlDataSource>
             <asp:SqlDataSource ID="attribute" runat="server" 
                 ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                 SelectCommand="SELECT [id] FROM [Learning_Records_Experience]"></asp:SqlDataSource>
            </asp:Panel>
         
    </div>
    </form>
</body>
</html>
