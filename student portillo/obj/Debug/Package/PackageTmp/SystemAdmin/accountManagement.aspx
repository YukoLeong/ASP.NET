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
            width: 188px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
       
        <asp:Button ID="Button1" runat="server" Text="user account" Width="172px" /><br />
        <asp:Button ID="Button2" runat="server" Text="seminar registration" /><br />
        <asp:Button ID="Button3" runat="server" Text="Study Record" Width="172px" />
    
        <br />
    
    </div>
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
                                <asp:BoundField DataField="Position" HeaderText="Position" 
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
                    <td>
                        <asp:DetailsView ID="UserDilView" runat="server" AllowPaging="True" 
                            AutoGenerateRows="False" CellPadding="4" DataKeyNames="ID" 
                            DataSourceID="SqlDataSource4" ForeColor="#333333" GridLines="None" 
                            Height="50px" Width="147px">
                            <AlternatingRowStyle BackColor="White" />
                            <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                            <EditRowStyle BackColor="#2461BF" />
                            <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                            <Fields>
                                <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" 
                                    SortExpression="ID" />
                                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                                <asp:TemplateField HeaderText="Position" SortExpression="Position">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="DropDownList1" runat="server" 
                                            SelectedValue='<%# Bind("Position") %>'>
                                            <asp:ListItem>Director</asp:ListItem>
                                            <asp:ListItem>ProgrammeCoordinalor</asp:ListItem>
                                            <asp:ListItem>AdminDepartment</asp:ListItem>
                                            <asp:ListItem>SystemAdmin</asp:ListItem>
                                            <asp:ListItem>ClassTeacher</asp:ListItem>
                                        </asp:DropDownList>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:DropDownList ID="DropDownList1" runat="server" 
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
                    </td>
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
        </asp:View>
        <asp:View ID="seminarregistration" runat="server">
            <asp:GridView ID="SeminarGView" runat="server" AutoGenerateColumns="False" 
                CellPadding="4" DataSourceID="SeminarGVSource" ForeColor="#333333" 
                GridLines="None" DataKeyNames="seminarID" Width="1481px">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" ButtonType="Button" />
                    <asp:BoundField DataField="seminarID" HeaderText="seminarID" 
                        SortExpression="seminarID" ReadOnly="True" />
                    <asp:TemplateField HeaderText="seminar_Name" SortExpression="seminar_Name">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("seminar_Name") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Font-Size="10pt" 
                                Text='<%# Bind("seminar_Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Lecturer" HeaderText="Lecturer" 
                        SortExpression="Lecturer" />
                    <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                    <asp:TemplateField HeaderText="synopsis" SortExpression="synopsis">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("synopsis") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Font-Size="9pt" Height="50px" 
                                ReadOnly="True" Text='<%# Eval("synopsis") %>' TextMode="MultiLine" 
                                Width="159px"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CheckBoxField DataField="Professional" HeaderText="Professional" 
                        SortExpression="Professional" />
                    <asp:CheckBoxField DataField="Leadership" HeaderText="Leadership" 
                        SortExpression="Leadership" />
                    <asp:CheckBoxField DataField="Comm_unication" HeaderText="Comm_unication" 
                        SortExpression="Comm_unication" />
                    <asp:CheckBoxField DataField="compre_hension" HeaderText="compre_hension" 
                        SortExpression="compre_hension" />
                    <asp:CheckBoxField DataField="Expression" HeaderText="Expression" 
                        SortExpression="Expression" />
                    <asp:CheckBoxField DataField="Initiative" HeaderText="Initiative" 
                        SortExpression="Initiative" />
                    <asp:CheckBoxField DataField="Self_Enhancement" HeaderText="Self_Enhancement" 
                        SortExpression="Self_Enhancement" />
                    <asp:CheckBoxField DataField="Civil_Responsibility" 
                        HeaderText="Civil_Responsibility" SortExpression="Civil_Responsibility" />
                    <asp:CheckBoxField DataField="Language" HeaderText="Language" 
                        SortExpression="Language" />
                    <asp:CheckBoxField DataField="IT_Application" HeaderText="IT_Application" 
                        SortExpression="IT_Application" />
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
            <asp:DetailsView ID="DetailsView5" runat="server" AutoGenerateRows="False" 
                CellPadding="4" DataKeyNames="seminarID" DataSourceID="seminarDilSource" 
                ForeColor="#333333" GridLines="None" Height="50px" Width="125px">
                <AlternatingRowStyle BackColor="White" />
                <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                <EditRowStyle BackColor="#2461BF" />
                <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                <Fields>
                    <asp:CommandField ButtonType="Button" ShowDeleteButton="True" 
                        ShowEditButton="True" ShowInsertButton="True" />
                    <asp:BoundField DataField="seminarID" HeaderText="seminarID" ReadOnly="True" 
                        SortExpression="seminarID" />
                    <asp:BoundField DataField="seminar_Name" HeaderText="seminar_Name" 
                        SortExpression="seminar_Name" />
                    <asp:BoundField DataField="Lecturer" HeaderText="Lecturer" 
                        SortExpression="Lecturer" />
                    <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                    <asp:TemplateField HeaderText="synopsis" SortExpression="synopsis">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Height="110px" 
                                Text='<%# Bind("synopsis") %>' TextMode="MultiLine" Width="1415px"></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Height="110px" 
                                Text='<%# Bind("synopsis") %>' TextMode="MultiLine" Width="1415px"></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Height="110px" 
                                Text='<%# Bind("synopsis") %>' TextMode="MultiLine" Width="1415px"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CheckBoxField DataField="Professional" HeaderText="Professional" 
                        SortExpression="Professional" />
                    <asp:CheckBoxField DataField="Leadership" HeaderText="Leadership" 
                        SortExpression="Leadership" />
                    <asp:CheckBoxField DataField="Comm_unication" HeaderText="Comm_unication" 
                        SortExpression="Comm_unication" />
                    <asp:CheckBoxField DataField="compre_hension" HeaderText="compre_hension" 
                        SortExpression="compre_hension" />
                    <asp:CheckBoxField DataField="Expression" HeaderText="Expression" 
                        SortExpression="Expression" />
                    <asp:CheckBoxField DataField="Initiative" HeaderText="Initiative" 
                        SortExpression="Initiative" />
                    <asp:CheckBoxField DataField="Self_Enhancement" HeaderText="Self_Enhancement" 
                        SortExpression="Self_Enhancement" />
                    <asp:CheckBoxField DataField="Civil_Responsibility" 
                        HeaderText="Civil_Responsibility" SortExpression="Civil_Responsibility" />
                    <asp:CheckBoxField DataField="Language" HeaderText="Language" 
                        SortExpression="Language" />
                    <asp:CheckBoxField DataField="IT_Application" HeaderText="IT_Application" 
                        SortExpression="IT_Application" />
                </Fields>
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
            </asp:DetailsView>
            <asp:SqlDataSource ID="SeminarGVSource" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString4 %>" 
                DeleteCommand="DELETE FROM [Allseminar] WHERE [seminarID] = @seminarID" 
                InsertCommand="INSERT INTO [Allseminar] ([seminarID], [seminar Name], [Lecturer], [Date], [synopsis], [Professional], [Leadership], [Comm unication], [compre hension], [Expression], [Initiative], [Self Enhancement], [Civil Responsibility], [Language], [IT Application]) VALUES (@seminarID, @seminar_Name, @Lecturer, @Date, @synopsis, @Professional, @Leadership, @Comm_unication, @compre_hension, @Expression, @Initiative, @Self_Enhancement, @Civil_Responsibility, @Language, @IT_Application)" 
                SelectCommand="SELECT [seminarID], [seminar Name] AS seminar_Name, [Lecturer], [Date], [synopsis], [Professional], [Leadership], [Comm unication] AS Comm_unication, [compre hension] AS compre_hension, [Expression], [Initiative], [Self Enhancement] AS Self_Enhancement, [Civil Responsibility] AS Civil_Responsibility, [Language], [IT Application] AS IT_Application FROM [Allseminar]" 
                
                
                
                UpdateCommand="UPDATE [Allseminar] SET [seminar Name] = @seminar_Name, [Lecturer] = @Lecturer, [Date] = @Date, [synopsis] = @synopsis, [Professional] = @Professional, [Leadership] = @Leadership, [Comm unication] = @Comm_unication, [compre hension] = @compre_hension, [Expression] = @Expression, [Initiative] = @Initiative, [Self Enhancement] = @Self_Enhancement, [Civil Responsibility] = @Civil_Responsibility, [Language] = @Language, [IT Application] = @IT_Application WHERE [seminarID] = @seminarID">
                <DeleteParameters>
                    <asp:Parameter Name="seminarID" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="seminarID" Type="String" />
                    <asp:Parameter Name="seminar_Name" Type="String" />
                    <asp:Parameter Name="Lecturer" Type="String" />
                    <asp:Parameter Name="Date" Type="String" />
                    <asp:Parameter Name="synopsis" Type="String" />
                    <asp:Parameter Name="Professional" Type="Boolean" />
                    <asp:Parameter Name="Leadership" Type="Boolean" />
                    <asp:Parameter Name="Comm_unication" Type="Boolean" />
                    <asp:Parameter Name="compre_hension" Type="Boolean" />
                    <asp:Parameter Name="Expression" Type="Boolean" />
                    <asp:Parameter Name="Initiative" Type="Boolean" />
                    <asp:Parameter Name="Self_Enhancement" Type="Boolean" />
                    <asp:Parameter Name="Civil_Responsibility" Type="Boolean" />
                    <asp:Parameter Name="Language" Type="Boolean" />
                    <asp:Parameter Name="IT_Application" Type="Boolean" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="seminar_Name" Type="String" />
                    <asp:Parameter Name="Lecturer" Type="String" />
                    <asp:Parameter Name="Date" Type="String" />
                    <asp:Parameter Name="synopsis" Type="String" />
                    <asp:Parameter Name="Professional" Type="Boolean" />
                    <asp:Parameter Name="Leadership" Type="Boolean" />
                    <asp:Parameter Name="Comm_unication" Type="Boolean" />
                    <asp:Parameter Name="compre_hension" Type="Boolean" />
                    <asp:Parameter Name="Expression" Type="Boolean" />
                    <asp:Parameter Name="Initiative" Type="Boolean" />
                    <asp:Parameter Name="Self_Enhancement" Type="Boolean" />
                    <asp:Parameter Name="Civil_Responsibility" Type="Boolean" />
                    <asp:Parameter Name="Language" Type="Boolean" />
                    <asp:Parameter Name="IT_Application" Type="Boolean" />
                    <asp:Parameter Name="seminarID" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="seminarDilSource" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString4 %>" 
                DeleteCommand="DELETE FROM [Allseminar] WHERE [seminarID] = @seminarID" 
                InsertCommand="INSERT INTO [Allseminar] ([seminarID], [seminar Name], [Lecturer], [Date], [synopsis], [Professional], [Leadership], [Comm unication], [compre hension], [Expression], [Initiative], [Self Enhancement], [Civil Responsibility], [Language], [IT Application]) VALUES (@seminarID, @seminar_Name, @Lecturer, @Date, @synopsis, @Professional, @Leadership, @Comm_unication, @compre_hension, @Expression, @Initiative, @Self_Enhancement, @Civil_Responsibility, @Language, @IT_Application)" 
                SelectCommand="SELECT [seminarID], [seminar Name] AS seminar_Name, [Lecturer], [Date], [synopsis], [Professional], [Leadership], [Comm unication] AS Comm_unication, [compre hension] AS compre_hension, [Expression], [Initiative], [Self Enhancement] AS Self_Enhancement, [Civil Responsibility] AS Civil_Responsibility, [Language], [IT Application] AS IT_Application FROM [Allseminar] WHERE ([seminarID] = @seminarID)" 
                
                UpdateCommand="UPDATE [Allseminar] SET [seminar Name] = @seminar_Name, [Lecturer] = @Lecturer, [Date] = @Date, [synopsis] = @synopsis, [Professional] = @Professional, [Leadership] = @Leadership, [Comm unication] = @Comm_unication, [compre hension] = @compre_hension, [Expression] = @Expression, [Initiative] = @Initiative, [Self Enhancement] = @Self_Enhancement, [Civil Responsibility] = @Civil_Responsibility, [Language] = @Language, [IT Application] = @IT_Application WHERE [seminarID] = @seminarID">
                <DeleteParameters>
                    <asp:Parameter Name="seminarID" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="seminarID" Type="String" />
                    <asp:Parameter Name="seminar_Name" Type="String" />
                    <asp:Parameter Name="Lecturer" Type="String" />
                    <asp:Parameter Name="Date" Type="String" />
                    <asp:Parameter Name="synopsis" Type="String" />
                    <asp:Parameter Name="Professional" Type="Boolean" />
                    <asp:Parameter Name="Leadership" Type="Boolean" />
                    <asp:Parameter Name="Comm_unication" Type="Boolean" />
                    <asp:Parameter Name="compre_hension" Type="Boolean" />
                    <asp:Parameter Name="Expression" Type="Boolean" />
                    <asp:Parameter Name="Initiative" Type="Boolean" />
                    <asp:Parameter Name="Self_Enhancement" Type="Boolean" />
                    <asp:Parameter Name="Civil_Responsibility" Type="Boolean" />
                    <asp:Parameter Name="Language" Type="Boolean" />
                    <asp:Parameter Name="IT_Application" Type="Boolean" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="SeminarGView" Name="seminarID" 
                        PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="seminar_Name" Type="String" />
                    <asp:Parameter Name="Lecturer" Type="String" />
                    <asp:Parameter Name="Date" Type="String" />
                    <asp:Parameter Name="synopsis" Type="String" />
                    <asp:Parameter Name="Professional" Type="Boolean" />
                    <asp:Parameter Name="Leadership" Type="Boolean" />
                    <asp:Parameter Name="Comm_unication" Type="Boolean" />
                    <asp:Parameter Name="compre_hension" Type="Boolean" />
                    <asp:Parameter Name="Expression" Type="Boolean" />
                    <asp:Parameter Name="Initiative" Type="Boolean" />
                    <asp:Parameter Name="Self_Enhancement" Type="Boolean" />
                    <asp:Parameter Name="Civil_Responsibility" Type="Boolean" />
                    <asp:Parameter Name="Language" Type="Boolean" />
                    <asp:Parameter Name="IT_Application" Type="Boolean" />
                    <asp:Parameter Name="seminarID" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
        </asp:View>
        <asp:View ID="attributeandstudyrecord" runat="server">
            <asp:GridView ID="attributGView" runat="server" CellPadding="4" ForeColor="#333333" 
                GridLines="None" AutoGenerateColumns="False" DataKeyNames="Id" 
                DataSourceID="attributGVSource">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                    <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" 
                        SortExpression="Id" />
                    <asp:BoundField DataField="SchoolName" HeaderText="SchoolName" 
                        SortExpression="SchoolName" />
                    <asp:BoundField DataField="CourseName" HeaderText="CourseName" 
                        SortExpression="CourseName" />
                    <asp:BoundField DataField="ActivityName" HeaderText="ActivityName" 
                        SortExpression="ActivityName" />
                    <asp:CheckBoxField DataField="Professional" HeaderText="Professional" 
                        SortExpression="Professional" />
                    <asp:CheckBoxField DataField="Leadership" HeaderText="Leadership" 
                        SortExpression="Leadership" />
                    <asp:CheckBoxField DataField="Comm_unication" HeaderText="Comm_unication" 
                        SortExpression="Comm_unication" />
                    <asp:CheckBoxField DataField="compre_hension" HeaderText="compre_hension" 
                        SortExpression="compre_hension" />
                    <asp:CheckBoxField DataField="Expression" HeaderText="Expression" 
                        SortExpression="Expression" />
                    <asp:CheckBoxField DataField="Initiative" HeaderText="Initiative" 
                        SortExpression="Initiative" />
                    <asp:CheckBoxField DataField="Self_Enhancement" HeaderText="Self_Enhancement" 
                        SortExpression="Self_Enhancement" />
                    <asp:CheckBoxField DataField="Civil_Responsibility" 
                        HeaderText="Civil_Responsibility" SortExpression="Civil_Responsibility" />
                    <asp:CheckBoxField DataField="Language" HeaderText="Language" 
                        SortExpression="Language" />
                    <asp:CheckBoxField DataField="IT_Application" HeaderText="IT_Application" 
                        SortExpression="IT_Application" />
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
            <asp:DetailsView ID="attributeDilView" runat="server" AutoGenerateRows="False" 
                CellPadding="4" DataKeyNames="Id" DataSourceID="attributeDilSource" 
                ForeColor="#333333" GridLines="None" Height="50px" Width="213px">
                <AlternatingRowStyle BackColor="White" />
                <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                <EditRowStyle BackColor="#2461BF" />
                <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                <Fields>
                    <asp:CommandField ButtonType="Button" ShowDeleteButton="True" 
                        ShowEditButton="True" ShowInsertButton="True" />
                    <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" 
                        SortExpression="Id" />
                    <asp:BoundField DataField="SchoolName" HeaderText="SchoolName" 
                        SortExpression="SchoolName" />
                    <asp:BoundField DataField="CourseName" HeaderText="CourseName" 
                        SortExpression="CourseName" />
                    <asp:BoundField DataField="ActivityName" HeaderText="ActivityName" 
                        SortExpression="ActivityName" />
                    <asp:CheckBoxField DataField="Professional" HeaderText="Professional" 
                        SortExpression="Professional" />
                    <asp:CheckBoxField DataField="Leadership" HeaderText="Leadership" 
                        SortExpression="Leadership" />
                    <asp:CheckBoxField DataField="Comm_unication" HeaderText="Comm_unication" 
                        SortExpression="Comm_unication" />
                    <asp:CheckBoxField DataField="compre_hension" HeaderText="compre_hension" 
                        SortExpression="compre_hension" />
                    <asp:CheckBoxField DataField="Language" HeaderText="Language" 
                        SortExpression="Language" />
                    <asp:CheckBoxField DataField="Civil_Responsibility" 
                        HeaderText="Civil_Responsibility" SortExpression="Civil_Responsibility" />
                    <asp:CheckBoxField DataField="Self_Enhancement" HeaderText="Self_Enhancement" 
                        SortExpression="Self_Enhancement" />
                    <asp:CheckBoxField DataField="Initiative" HeaderText="Initiative" 
                        SortExpression="Initiative" />
                    <asp:CheckBoxField DataField="Expression" HeaderText="Expression" 
                        SortExpression="Expression" />
                    <asp:CheckBoxField DataField="IT_Application" HeaderText="IT_Application" 
                        SortExpression="IT_Application" />
                </Fields>
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
            </asp:DetailsView>
            <asp:SqlDataSource ID="attributGVSource" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString4 %>" 
                DeleteCommand="DELETE FROM [attributAndmatrix] WHERE [Id] = @Id" 
                InsertCommand="INSERT INTO [attributAndmatrix] ([Id], [SchoolName], [CourseName], [ActivityName], [Professional], [Leadership], [Comm unication], [compre hension], [Expression], [Initiative], [Self Enhancement], [Civil Responsibility], [Language], [IT Application]) VALUES (@Id, @SchoolName, @CourseName, @ActivityName, @Professional, @Leadership, @Comm_unication, @compre_hension, @Expression, @Initiative, @Self_Enhancement, @Civil_Responsibility, @Language, @IT_Application)" 
                SelectCommand="SELECT [Id], [SchoolName], [CourseName], [ActivityName], [Professional], [Leadership], [Comm unication] AS Comm_unication, [compre hension] AS compre_hension, [Expression], [Initiative], [Self Enhancement] AS Self_Enhancement, [Civil Responsibility] AS Civil_Responsibility, [Language], [IT Application] AS IT_Application FROM [attributAndmatrix]" 
                
                UpdateCommand="UPDATE [attributAndmatrix] SET [SchoolName] = @SchoolName, [CourseName] = @CourseName, [ActivityName] = @ActivityName, [Professional] = @Professional, [Leadership] = @Leadership, [Comm unication] = @Comm_unication, [compre hension] = @compre_hension, [Expression] = @Expression, [Initiative] = @Initiative, [Self Enhancement] = @Self_Enhancement, [Civil Responsibility] = @Civil_Responsibility, [Language] = @Language, [IT Application] = @IT_Application WHERE [Id] = @Id">
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Id" Type="String" />
                    <asp:Parameter Name="SchoolName" Type="String" />
                    <asp:Parameter Name="CourseName" Type="String" />
                    <asp:Parameter Name="ActivityName" Type="String" />
                    <asp:Parameter Name="Professional" Type="Boolean" />
                    <asp:Parameter Name="Leadership" Type="Boolean" />
                    <asp:Parameter Name="Comm_unication" Type="Boolean" />
                    <asp:Parameter Name="compre_hension" Type="Boolean" />
                    <asp:Parameter Name="Expression" Type="Boolean" />
                    <asp:Parameter Name="Initiative" Type="Boolean" />
                    <asp:Parameter Name="Self_Enhancement" Type="Boolean" />
                    <asp:Parameter Name="Civil_Responsibility" Type="Boolean" />
                    <asp:Parameter Name="Language" Type="Boolean" />
                    <asp:Parameter Name="IT_Application" Type="Boolean" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="SchoolName" Type="String" />
                    <asp:Parameter Name="CourseName" Type="String" />
                    <asp:Parameter Name="ActivityName" Type="String" />
                    <asp:Parameter Name="Professional" Type="Boolean" />
                    <asp:Parameter Name="Leadership" Type="Boolean" />
                    <asp:Parameter Name="Comm_unication" Type="Boolean" />
                    <asp:Parameter Name="compre_hension" Type="Boolean" />
                    <asp:Parameter Name="Expression" Type="Boolean" />
                    <asp:Parameter Name="Initiative" Type="Boolean" />
                    <asp:Parameter Name="Self_Enhancement" Type="Boolean" />
                    <asp:Parameter Name="Civil_Responsibility" Type="Boolean" />
                    <asp:Parameter Name="Language" Type="Boolean" />
                    <asp:Parameter Name="IT_Application" Type="Boolean" />
                    <asp:Parameter Name="Id" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </asp:View>
    </asp:MultiView>
            <asp:SqlDataSource ID="attributeDilSource" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString4 %>" 
                DeleteCommand="DELETE FROM [attributAndmatrix] WHERE [Id] = @Id" 
                InsertCommand="INSERT INTO [attributAndmatrix] ([Id], [SchoolName], [CourseName], [ActivityName], [Professional], [Leadership], [Comm unication], [compre hension], [IT Application], [Language], [Civil Responsibility], [Self Enhancement], [Initiative], [Expression]) VALUES (@Id, @SchoolName, @CourseName, @ActivityName, @Professional, @Leadership, @Comm_unication, @compre_hension, @IT_Application, @Language, @Civil_Responsibility, @Self_Enhancement, @Initiative, @Expression)" 
                SelectCommand="SELECT [Id], [SchoolName], [CourseName], [ActivityName], [Professional], [Leadership], [Comm unication] AS Comm_unication, [compre hension] AS compre_hension, [IT Application] AS IT_Application, [Language], [Civil Responsibility] AS Civil_Responsibility, [Self Enhancement] AS Self_Enhancement, [Initiative], [Expression] FROM [attributAndmatrix] WHERE ([Id] = @Id)" 
                
                
        UpdateCommand="UPDATE [attributAndmatrix] SET [SchoolName] = @SchoolName, [CourseName] = @CourseName, [ActivityName] = @ActivityName, [Professional] = @Professional, [Leadership] = @Leadership, [Comm unication] = @Comm_unication, [compre hension] = @compre_hension, [IT Application] = @IT_Application, [Language] = @Language, [Civil Responsibility] = @Civil_Responsibility, [Self Enhancement] = @Self_Enhancement, [Initiative] = @Initiative, [Expression] = @Expression WHERE [Id] = @Id">
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Id" Type="String" />
                    <asp:Parameter Name="SchoolName" Type="String" />
<asp:Parameter Name="CourseName" Type="String"></asp:Parameter>
<asp:Parameter Name="ActivityName" Type="String"></asp:Parameter>
                    <asp:Parameter Name="Professional" Type="Boolean" />
                    <asp:Parameter Name="Leadership" Type="Boolean" />
                    <asp:Parameter Name="Comm_unication" Type="Boolean" />
                    <asp:Parameter Name="compre_hension" Type="Boolean" />
                    <asp:Parameter Name="IT_Application" Type="Boolean" />
                    <asp:Parameter Name="Language" Type="Boolean" />
                    <asp:Parameter Name="Civil_Responsibility" Type="Boolean" />
                    <asp:Parameter Name="Self_Enhancement" Type="Boolean" />
                    <asp:Parameter Name="Initiative" Type="Boolean" />
                    <asp:Parameter Name="Expression" Type="Boolean" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="attributGView" Name="Id" 
                        PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="SchoolName" Type="String" />
                    <asp:Parameter Name="CourseName" Type="String" />
<asp:Parameter Name="ActivityName" Type="String"></asp:Parameter>
                    <asp:Parameter Name="Professional" Type="Boolean" />
                    <asp:Parameter Name="Leadership" Type="Boolean" />
                    <asp:Parameter Name="Comm_unication" Type="Boolean" />
                    <asp:Parameter Name="compre_hension" Type="Boolean" />
                    <asp:Parameter Name="IT_Application" Type="Boolean" />
                    <asp:Parameter Name="Language" Type="Boolean" />
                    <asp:Parameter Name="Civil_Responsibility" Type="Boolean" />
                    <asp:Parameter Name="Self_Enhancement" Type="Boolean" />
                    <asp:Parameter Name="Initiative" Type="Boolean" />
                    <asp:Parameter Name="Expression" Type="Boolean" />
                    <asp:Parameter Name="Id" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
    </form>
</body>
</html>
