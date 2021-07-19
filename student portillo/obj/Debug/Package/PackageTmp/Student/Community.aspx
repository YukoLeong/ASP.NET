<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Community.aspx.vb" Inherits="ep.Community" %>

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
    </style>
    <link rel="stylesheet" href="../button.css" type="text/css" media="screen" />
</head>
<body background="images/church.gif">
    <form id="form1" runat="server">
    <div>
    
        <span class="style1">Extracurricular Activities
          <asp:LinkButton ID="LinkButton1" runat="server" CssClass="blue" 
                  style="margin-left: 232px" Font-Size="Large">Home</asp:LinkButton>
        <br />
      
        <br />
        </span>
    
    </div>
    <asp:GridView ID="GridViewComm" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
        DataKeyNames="id" DataSourceID="SqlDataSource1" 
        EmptyDataText="There are no data records to display." ForeColor="#333333" 
        GridLines="None" PageSize="6" 
        style="z-index: 1; left: 15px; top: 75px; width: 565px;" 
        Font-Names="Calibri" Font-Size="Small">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" SelectText="Detail" />
            <asp:BoundField DataField="actName" HeaderText="Activity Name" 
                SortExpression="actName" />
            <asp:BoundField DataField="actType" HeaderText="Activity_Type" 
                SortExpression="actType" />
            <asp:BoundField DataField="orgName" HeaderText="Organization Name" 
                SortExpression="orgName" />
            <asp:BoundField DataField="position" HeaderText="Title" 
                SortExpression="position" />
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
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString1 %>" 
        ProviderName="<%$ ConnectionStrings:EPConnectionString1.ProviderName %>" 
        SelectCommand="SELECT * FROM [CommAct] WHERE ([pess_cod] = @pess_cod)">
        <SelectParameters>
            <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:DetailsView ID="DetailsViewComm" runat="server" AllowPaging="True" 
        AutoGenerateRows="False" CellPadding="4" DataKeyNames="id" 
        DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" 
        style="z-index: 1; left: 15px; top: 314px;  height: 207px; width: 566px" 
        Font-Names="Calibri" Font-Size="Small">
        <AlternatingRowStyle BackColor="White" />
        <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
        <EditRowStyle BackColor="#0095CD" />
        <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="actName" HeaderText="Activity Name" 
                SortExpression="actName" />
            <asp:BoundField DataField="orgName" HeaderText="Organization Name" 
                SortExpression="orgName" />
            <asp:BoundField DataField="startDate" HeaderText="Date" 
                SortExpression="startDate" DataFormatString="{0:d}" />
            <asp:BoundField DataField="position" HeaderText="Position" 
                SortExpression="position" />
            <asp:BoundField DataField="description" HeaderText="Description" 
                SortExpression="description" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                ShowInsertButton="True" />
        </Fields>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <InsertRowStyle BackColor="#0095CD" />
        <PagerStyle BackColor="#0095CD" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString1 %>" 
        DeleteCommand="DELETE FROM [CommAct] WHERE [id] = @id" 
        InsertCommand="INSERT INTO [CommAct] ([pess_cod], [actName], [actType], [orgName], [startDate], [position], [description]) VALUES (@pess_cod, @actName, @actType, @orgName, @startDate, @position, @description)" 
        SelectCommand="SELECT * FROM [CommAct] WHERE ([id] = @id)" 
        
        UpdateCommand="UPDATE [CommAct] SET [pess_cod] = @pess_cod, [actName] = @actName, [actType] = @actType, [orgName] = @orgName, [startDate] = @startDate, [position] = @position, [description] = @description WHERE [id] = @id">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
                    <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
            <asp:Parameter Name="actName" Type="String" />
            <asp:Parameter Name="actType" Type="String" />
            <asp:Parameter Name="orgName" Type="String" />
            <asp:Parameter DbType="Date" Name="startDate" />
            <asp:Parameter Name="position" Type="String" />
            <asp:Parameter Name="description" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GridViewComm" Name="id" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
                    <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
            <asp:Parameter Name="actName" Type="String" />
            <asp:Parameter Name="actType" Type="String" />
            <asp:Parameter Name="orgName" Type="String" />
            <asp:Parameter DbType="Date" Name="startDate" />
            <asp:Parameter Name="position" Type="String" />
            <asp:Parameter Name="description" Type="String" />
            <asp:Parameter Name="id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </form>
</body>
</html>
