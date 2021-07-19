<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="studentWorks.aspx.vb" Inherits="ep.studentWorks" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            font-family: "Berlin Sans FB";
            font-size: xx-large;
        }
        .style2
        {
            font-family: "Berlin Sans FB";
            font-size: x-large;
        }
        </style>
  <link rel="stylesheet" href="../button.css" type="text/css" media="screen" />
</head>
<body background="images/studentWork2.gif">
    <form id="form1" runat="server">
    <div>
    
        <span class="style1">Student Works
         <asp:LinkButton ID="LinkButton1" runat="server" CssClass="blue" 
                  style="margin-left: 212px" Font-Size="Large">Home</asp:LinkButton>
        
        <br />
       
        <br />
        </span><br />
     
    </div>
    <asp:GridView ID="GridViewStudentWorks" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
        DataKeyNames="id" DataSourceID="SqlDataSource1" 
        EmptyDataText="There are no data records to display." ForeColor="#333333" 
        GridLines="None" 
        style="z-index: 1; left: 15px; top: 75px;  " 
        Font-Names="Calibri" Font-Size="Small" PageSize="6" Height="16px" 
        Width="562px">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField SelectText="Detail" ShowSelectButton="True" />
            <asp:BoundField DataField="topic" HeaderText="Topic" SortExpression="topic" />
            <asp:CheckBoxField DataField="makePublic" HeaderText="Public" 
                SortExpression="makePublic" />
            <asp:CheckBoxField DataField="getComment" HeaderText="Comment" 
                SortExpression="getComment" />
            <asp:CheckBoxField DataField="askForComment" HeaderText="Ask for advisory" 
                SortExpression="askForComment" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#0095CD" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#0095CD" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#0095CD" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString1 %>" 
        ProviderName="<%$ ConnectionStrings:EPConnectionString1.ProviderName %>" 
        
        SelectCommand="SELECT * FROM [StudentWorks] WHERE ([pess_cod] = @pess_cod)">
        <SelectParameters>
            <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:FileUpload ID="FileUpload1" runat="server" />
    <br />
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString1 %>" 
        DeleteCommand="DELETE FROM [StudentWorks] WHERE [id] = @id" 
        InsertCommand="INSERT INTO [StudentWorks] ([pess_cod], [topic], [description], [makePublic], [getComment], [askForComment]) VALUES (@pess_cod, @topic, @description, @makePublic, @getComment, @askForComment)" 
        SelectCommand="SELECT * FROM [StudentWorks] WHERE ([id] = @id)" 
        
        
        UpdateCommand="UPDATE [StudentWorks] SET [pess_cod] = @pess_cod, [topic] = @topic, [description] = @description, [makePublic] = @makePublic, [getComment] = @getComment, [askForComment] = @askForComment WHERE [id] = @id">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
                    <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
            <asp:Parameter Name="topic" Type="String" />
            <asp:Parameter Name="description" Type="String" />
            <asp:Parameter Name="makePublic" Type="Boolean" />
            <asp:Parameter Name="getComment" Type="Boolean" />
                    <asp:Parameter Name="askForComment" Type="Boolean" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GridViewStudentWorks" Name="id" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
                    <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
            <asp:Parameter Name="topic" Type="String" />
            <asp:Parameter Name="description" Type="String" />
            <asp:Parameter Name="makePublic" Type="Boolean" />
            <asp:Parameter Name="getComment" Type="Boolean" />
            <asp:Parameter Name="askForComment" Type="Boolean" />
                    <asp:Parameter Name="id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
   <br />
    <asp:Button ID="Button1" runat="server" Text="Upload Picture" CssClass="blue" />
          

    <asp:Label ID="Label1" runat="server" CssClass="style2" ForeColor="Red"></asp:Label>
    <asp:DetailsView ID="DetailsViewStudentWorks" runat="server" AllowPaging="True" 
        AutoGenerateRows="False" CellPadding="4" DataKeyNames="id" 
        DataSourceID="SqlDataSource2" GridLines="None" 
        style="z-index: 1; left: 15px; top: 315px;  " 
        Font-Names="Calibri" Font-Size="Small" Height="77px" Width="560px" 
        ForeColor="#333333">
        <AlternatingRowStyle BackColor="White" />
        <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
        <EditRowStyle BackColor="#0095CD" />
        <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="topic" HeaderText="Topic" SortExpression="topic" />
            <asp:BoundField DataField="description" HeaderText="Description" 
                SortExpression="description" />
            <asp:CheckBoxField DataField="makePublic" HeaderText="Public" 
                SortExpression="makePublic" />
            <asp:CheckBoxField DataField="getComment" HeaderText="Comment" 
                SortExpression="getComment" />
            <asp:CheckBoxField DataField="askForComment" HeaderText="Ask for advisory" 
                SortExpression="askForComment" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                ShowInsertButton="True" />
        </Fields>
        <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <InsertRowStyle BackColor="#0095CD" />
        <PagerStyle BackColor="#0095CD" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
    </asp:DetailsView>
        
        <asp:Image ID="Image2" runat="server" Width="316px" />
    </form>
</body>
</html>
