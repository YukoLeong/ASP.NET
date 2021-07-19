<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="accountManagement.aspx.vb" Inherits="ep.accountManagement" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 434px;
        }
        .style3
        {
            font-size: x-large;
        }
        .style4
        {
            width: 45px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <strong><span class="style3">User Management<br />
    </span></strong>
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="useraccount" runat="server">
            <table class="style1">
                <tr>
                    <td class="style2">
                        <asp:GridView ID="userGView" runat="server" AllowPaging="True" 
                            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" 
                            DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                                <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" 
                                    SortExpression="ID" />
                                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                                <asp:BoundField DataField="Position" HeaderText="User Group" 
                                    SortExpression="Position" />
                            </Columns>
                            <EditRowStyle BackColor="#2461BF" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EFF3FB" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
                        </asp:GridView>
                    </td>
                    <td class="style4">
                        &nbsp;</td>
                    <td>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:DetailsView ID="UserDilView" runat="server" AllowPaging="True" 
                            AutoGenerateRows="False" CellPadding="4" DataKeyNames="ID" 
                            DataSourceID="SqlDataSource4" ForeColor="#333333" GridLines="None" 
                            Height="50px" Width="363px">
                            <AlternatingRowStyle BackColor="White" />
                            <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                            <EditRowStyle BackColor="#2461BF" />
                            <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                            <Fields>
                                <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" 
                                    SortExpression="ID" />
                                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                                <asp:TemplateField HeaderText="User Group" SortExpression="name">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="DropDownList1" runat="server" 
                                            DataSourceID="SqlDataSource5" DataTextField="name" DataValueField="id" 
                                            SelectedValue='<%# Bind("position") %>'>
                                        </asp:DropDownList>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:DropDownList ID="DropDownList1" runat="server" 
                                            DataSourceID="SqlDataSource5" DataTextField="name" DataValueField="id" 
                                            SelectedValue='<%# Bind("Position") %>'>
                                            <asp:ListItem>Director</asp:ListItem>
                                            <asp:ListItem>ProgrammeCoordinalor</asp:ListItem>
                                            <asp:ListItem>AdminDepartment</asp:ListItem>
                                            <asp:ListItem>SystemAdmin</asp:ListItem>
                                            <asp:ListItem>ClassTeacher</asp:ListItem>
                                        </asp:DropDownList>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Position") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:CommandField ButtonType="Button" ShowDeleteButton="True" 
                                    ShowEditButton="True" ShowInsertButton="True" />
                            </Fields>
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EFF3FB" />
                        </asp:DetailsView>
                        &nbsp;</td>
                </tr>
            </table>
            <br />
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString4 %>" 
                OldValuesParameterFormatString="original_{0}" 
                SelectCommand="SELECT * FROM [useraccount] WHERE ([ID] = @ID)" 
                DeleteCommand="DELETE FROM [useraccount] WHERE [ID] = @original_ID" 
                InsertCommand="INSERT INTO [useraccount] ([ID], [Name], [Position]) VALUES (@ID, @Name, @Position)" 
                
                
                UpdateCommand="UPDATE [useraccount] SET [Name] = @Name, [Position] = @Position WHERE [ID] = @original_ID">
                <DeleteParameters>
                    <asp:Parameter Name="original_ID" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ID" Type="String" />
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Position" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="userGView" Name="ID" 
                        PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Position" Type="String" />
                    <asp:Parameter Name="original_ID" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString4 %>" 
                DeleteCommand="DELETE FROM [useraccount] WHERE [ID] = @ID" 
                InsertCommand="INSERT INTO [useraccount] ([ID], [Name], [Position]) VALUES (@ID, @Name, @Position)" 
                SelectCommand="SELECT * FROM [useraccount] ORDER BY [ID]" 
                
                UpdateCommand="UPDATE [useraccount] SET [Name] = @Name, [Position] = @Position WHERE [ID] = @ID">
                <DeleteParameters>
                    <asp:Parameter Name="ID" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ID" Type="String" />
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Position" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Position" Type="String" />
                    <asp:Parameter Name="ID" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString4 %>" 
                SelectCommand="SELECT * FROM [userGroup]"></asp:SqlDataSource>
        </asp:View>
    </asp:MultiView>
    </form>
</body>
</html>
