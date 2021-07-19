<%@ Page Language="VB" AutoEventWireup="false" CodeFile="UserManagement.aspx.vb" Inherits="SystemAdmin_UserManagement" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 75%;
            height: 650px;
            margin-bottom: 0px;
        }
        .style2
        {
            width: 788px;
        }
        .style3
        {
            font-size: x-large;
        }
        .style5
        {
            width: 788px;
            height: 360px;
        }
    </style>
         <link rel="stylesheet" href="../button.css" type="text/css" media="screen" />
     <link rel="stylesheet" href="../button1.css" type="text/css" media="screen" />
</head>
<body>
    <form id="form1" runat="server">
    <strong><span class="style3">User Management&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button1" runat="server" Text="Home" CssClass="blue" />
    <br />
    </span></strong>
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="useraccount" runat="server">
            <table class="style1">
                <tr>
                    <td class="style2">
                        <asp:GridView ID="userGView" runat="server" AllowPaging="True" 
                            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" 
                            DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" 
                            Height="248px" Width="1262px">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" />
                                <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" 
                                    SortExpression="ID" />
                                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                                <asp:BoundField DataField="Position" HeaderText="Position" 
                                    SortExpression="Position" />
                                <asp:BoundField DataField="School" HeaderText="School" 
                                    SortExpression="School" />
                                <asp:BoundField DataField="Programme" HeaderText="Programme" 
                                    SortExpression="Programme" />
                                <asp:BoundField DataField="Tutor_Year" HeaderText="Tutor_Year" 
                                    SortExpression="Tutor_Year" />
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
                </tr>
                <tr>
                    <td class="style5">
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
                                <asp:BoundField DataField="Password" HeaderText="Password" 
                                    SortExpression="Password" />
                                <asp:TemplateField HeaderText="Position" SortExpression="Position">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="DropDownList1" runat="server" 
                                            DataSourceID="SqlDataSource5" DataTextField="name" DataValueField="id" 
                                            SelectedValue='<%# Bind("Position") %>'>
                                        </asp:DropDownList>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Position") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Position") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="School" SortExpression="School">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" 
                                            DataSourceID="SqlDataSource7" DataTextField="SCHOOL_EN" 
                                            DataValueField="SCHOOL_EN" onprerender="DropDownList2_PreRender" 
                                            SelectedValue='<%# Bind("School") %>'>
                                        </asp:DropDownList>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("School") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("School") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Programme" SortExpression="Programme">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="DropDownList3" runat="server" 
                                            DataSourceID="SqlDataSource6" DataTextField="PROGRAM_COMPOSITE_EN" 
                                            DataValueField="PROGRAM_COMPOSITE_EN">
                                        </asp:DropDownList>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Programme") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Programme") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Tutor_Year" SortExpression="Tutor_Year">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="DropDownList4" runat="server" 
                                            SelectedValue='<%# Bind("Tutor_Year") %>'>
                                            <asp:ListItem Value="1">1</asp:ListItem>
                                            <asp:ListItem Value="2">2</asp:ListItem>
                                            <asp:ListItem Value="3">3</asp:ListItem>
                                            <asp:ListItem Value="4">4</asp:ListItem>
                                            <asp:ListItem>Not define</asp:ListItem>
                                        </asp:DropDownList>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Tutor_Year") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Tutor_Year") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" 
                                    ShowInsertButton="True" />
                            </Fields>
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EFF3FB" />
                        </asp:DetailsView>
                    </td>
                </tr>
            </table>
            <br />
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                OldValuesParameterFormatString="original_{0}" 
                SelectCommand="SELECT * FROM [useraccount] WHERE ([ID] = @ID)" 
                DeleteCommand="DELETE FROM [useraccount] WHERE [ID] = @original_ID" 
                InsertCommand="INSERT INTO [useraccount] ([ID], [Name], [Position]) VALUES (@ID, @Name, @Position)" 
                
                
                
                UpdateCommand="UPDATE [useraccount] SET [Name] = @Name,[Password]=@Password, [Position] = @Position,[School]=@School,[Programme]=@Programme,[Tutor_Year]=@Tutor_Year WHERE [ID] = @original_ID">
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
                    <asp:Parameter Name="Password" />
                    <asp:Parameter Name="Position" Type="String" />
                    <asp:Parameter Name="School" />
                    <asp:Parameter Name="Programme" />
                    <asp:Parameter Name="Tutor_Year" />
                    <asp:Parameter Name="original_ID" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
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
                ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                SelectCommand="SELECT * FROM [userGroup]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                SelectCommand="SELECT distinct [PROGRAM_COMPOSITE_EN] FROM [student_academic_info] where school_en=@school">
                <SelectParameters>
                    <asp:Parameter DefaultValue="CType(Me.UserDilView.FindControl(&quot;DropDownList2&quot;), DropDownList).SelectedValue" 
                        Name="school" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource7" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                SelectCommand="SELECT [SCHOOL_EN] FROM [school_info]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                SelectCommand="SELECT * FROM [userGroup] WHERE ([id] = @id)">
                <SelectParameters>
                    <asp:SessionParameter Name="id" SessionField="Role_Type" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </asp:View>
    </asp:MultiView>
    </form>
</body>
</html>
