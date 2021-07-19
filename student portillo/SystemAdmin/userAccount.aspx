<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="userAccount.aspx.vb" Inherits="ep.userAccount" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
       
            .style1
        {
            font-family: "Berlin Sans FB";
            font-size: xx-large;
        }
         .style8
        {
            width: 100%;
        }
    </style>
<link rel="stylesheet" href="../button.css" type="text/css" media="screen" />
</head>
<body background="../images/background.gif">
    <form id="form1" runat="server">
    <div>
     <span class="style1">User Account and seminar Management</span>
        <asp:LinkButton ID="LinkButton2" runat="server" CssClass="blue" 
                  style="margin-left: 100px" Font-Size="Large">Home</asp:LinkButton>
    <br />
        <br />
        <table class="style8">
            <tr>
                <td>
                    <asp:Button ID="Button2" runat="server" Text="Director Management" 
                        CssClass="blue" />
                </td>
                <td>
                    <asp:Button ID="Button3" runat="server" Text="Programme Management" 
                        CssClass="blue" />
                </td>
                <td>
                    <asp:Button ID="Button4" runat="server" Text="Admin Management" 
                        CssClass="blue" />
                </td>
                <td>
                    <asp:Button ID="Button5" runat="server" Text="Year Tutor Management" 
                        CssClass="blue" />
                </td>
                <td>
                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="blue" Width="150px">Seminar Management</asp:LinkButton>
                </td>
                <td>
                    <asp:LinkButton ID="LinkButton3" runat="server" CssClass="blue" Width="200px">Add Seminar By Data Collector</asp:LinkButton>
                </td>
            </tr>
        </table>

        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
        <br />
            </asp:View>
               <asp:View ID="View2" runat="server">
                <asp:Label ID="Label3" runat="server" Text="Director Management:" Font-Bold="True" 
                    Font-Size="Larger"></asp:Label>
        <br />
                   <asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
                       AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                       DataKeyNames="directorid" DataSourceID="SqlDataSource3" ForeColor="#333333" 
                       GridLines="None">
                       <AlternatingRowStyle BackColor="White" />
                       <Columns>
                           <asp:CommandField ShowSelectButton="True" />
                           <asp:BoundField DataField="director_account" HeaderText="director_account" 
                               SortExpression="director_account" />
                           <asp:BoundField DataField="director_password" HeaderText="director_password" 
                               SortExpression="director_password" />
                           <asp:BoundField DataField="department_name" HeaderText="department_name" 
                               SortExpression="department_name" />
                           <asp:BoundField DataField="update_time" HeaderText="update_time" 
                               SortExpression="update_time" />
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
                   <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                       ConnectionString="<%$ ConnectionStrings:EPConnectionString4 %>" 
                       SelectCommand="SELECT * FROM [director_info]"></asp:SqlDataSource>
                   <asp:DetailsView ID="DetailsView2" runat="server" AllowPaging="True" 
                       AutoGenerateRows="False" CellPadding="4" DataKeyNames="directorid" 
                       DataSourceID="SqlDataSource4" ForeColor="#333333" GridLines="None" 
                       Height="50px" Width="125px">
                       <AlternatingRowStyle BackColor="White" />
                       <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                       <EditRowStyle BackColor="#0095CD" />
                       <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                       <Fields>
                           
                           <asp:BoundField DataField="director_account" HeaderText="director_account" 
                               SortExpression="director_account" />
                           <asp:TemplateField HeaderText="director_password" 
                               SortExpression="director_password">
                               <EditItemTemplate>
                                   <asp:TextBox ID="TextBox1" runat="server" 
                                       Text='<%# Bind("director_password") %>'></asp:TextBox>
                               </EditItemTemplate>
                               <InsertItemTemplate>
                                   <asp:TextBox ID="TextBox1" runat="server" 
                                       Text='<%# Bind("director_password") %>'></asp:TextBox>
                               </InsertItemTemplate>
                               <ItemTemplate>
                                   <asp:Label ID="Label1" runat="server" Text='<%# Bind("director_password") %>'></asp:Label>
                               </ItemTemplate>
                           </asp:TemplateField>
                           <asp:TemplateField HeaderText="department_name" 
                               SortExpression="department_name">
                               <EditItemTemplate>
                                   <asp:Label ID="Label15" runat="server" Text='<%# Bind("department_name") %>'></asp:Label>
                               </EditItemTemplate>
                               <InsertItemTemplate>
                                   <asp:DropDownList ID="DropDownList10" runat="server" 
                                       SelectedValue='<%# Bind("department_name") %>'>
                                       <asp:ListItem>SCHOOL OF PUBLIC ADMINISTRATION</asp:ListItem>
                                       <asp:ListItem>SCHOOL OF LANGUAGES AND TRANSLATION</asp:ListItem>
                                       <asp:ListItem>SCHOOL OF BUSINESS</asp:ListItem>
                                       <asp:ListItem>SCHOOL OF PHYSICAL EDUCATION AND SPORTS</asp:ListItem>
                                       <asp:ListItem>SCHOOL OF HEALTH SCIENCES</asp:ListItem>
                                       <asp:ListItem>SCHOOL OF ARTS</asp:ListItem>
                                   </asp:DropDownList>
                               </InsertItemTemplate>
                               <ItemTemplate>
                                   <asp:Label ID="Label2" runat="server" Text='<%# Bind("department_name") %>'></asp:Label>
                               </ItemTemplate>
                           </asp:TemplateField>
                           <asp:TemplateField HeaderText="update_time" SortExpression="update_time">
                               <EditItemTemplate>
                                   <asp:Label ID="Label9" runat="server" Text='<%# Bind("update_time") %>'></asp:Label>
                               </EditItemTemplate>
                               <InsertItemTemplate>
                                   <asp:Label ID="Label10" runat="server" Text='<%# Bind("update_time") %>'></asp:Label>
                               </InsertItemTemplate>
                               <ItemTemplate>
                                   <asp:Label ID="Label3" runat="server" Text='<%# Bind("update_time") %>'></asp:Label>
                               </ItemTemplate>
                           </asp:TemplateField>
                           <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                               ShowInsertButton="True" />
                       </Fields>
                       <FooterStyle BackColor="#0095CD" Font-Bold="True" ForeColor="White" />
                       <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                       <InsertRowStyle BackColor="#0095CD" />
                       <PagerStyle BackColor="#0095CD" ForeColor="White" HorizontalAlign="Center" />
                       <RowStyle BackColor="#EFF3FB" />
                   </asp:DetailsView>
                   <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                       ConnectionString="<%$ ConnectionStrings:EPConnectionString4 %>" 
                       
                       DeleteCommand="
delete from directorStud
where director_password in
(select director_password from director_info where directorid=@directorid )

DELETE FROM [director_info] WHERE [directorid] = @directorid
	
	
	
	
	" InsertCommand="INSERT INTO [director_info] ([director_account], [director_password], [department_name],[update_time]) VALUES (@director_account, @director_password, @department_name,CONVERT(VARCHAR(24),GETDATE(),121))
insert into directorStud(studentid,studentname,department_name,pess_cod,programme_name,director_password)
select directorData.studentid,directorData.studentname,directorData.department_name,directorData.pess_cod,directorData.programme_name,director_info.director_password 
from directorData,director_info
where directorData.department_name=director_info.department_name" 
                       SelectCommand="SELECT * FROM [director_info] WHERE ([directorid] = @directorid)" 
                       
                       
                       
                       UpdateCommand="update directorStud
set director_password=@director_password
where director_password in
(select director_password from director_info where directorid=@directorid )

UPDATE [director_info] SET [director_account] = @director_account, [director_password] = @director_password, [department_name] = @department_name, [update_time]=CONVERT(VARCHAR(24),GETDATE(),121) WHERE [directorid] = @directorid">
                       <DeleteParameters>
                          
                           <asp:Parameter Name="directorid" Type="Int32" />
                       </DeleteParameters>
                       <InsertParameters>
                           <asp:Parameter Name="director_account" Type="String" />
                           <asp:Parameter Name="director_password" Type="String" />
                           <asp:Parameter Name="department_name" Type="String" />
                       </InsertParameters>
                       <SelectParameters>
                           <asp:ControlParameter ControlID="GridView2" Name="directorid" 
                               PropertyName="SelectedValue" Type="Int32" />
                       </SelectParameters>
                       <UpdateParameters>
                           <asp:Parameter Name="director_password" Type="String" />
                        
                           <asp:Parameter Name="director_account" Type="String" />
                           <asp:Parameter Name="department_name" Type="String" />
                           <asp:Parameter Name="directorid" Type="Int32" />
                       </UpdateParameters>
                   </asp:SqlDataSource>
                   <asp:SqlDataSource ID="SqlDataSource17" runat="server" 
                       ConnectionString="<%$ ConnectionStrings:EPConnectionString4 %>" 
                       SelectCommand="SELECT * FROM [director_info]"></asp:SqlDataSource>
                   <asp:SqlDataSource ID="SqlDataSource12" runat="server" 
                       ConnectionString="<%$ ConnectionStrings:EPConnectionString4 %>" 
                       SelectCommand="SELECT [director_password] FROM [director_info]">
                   </asp:SqlDataSource>
        </asp:View>
         <asp:View ID="View3" runat="server">
                         <asp:Label ID="Label4" runat="server" Text="Programme Management:" Font-Bold="True" 
                    Font-Size="Larger"></asp:Label>
        <br />
             <asp:GridView ID="GridView3" runat="server" AllowPaging="True" 
                 AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                 DataKeyNames="programmerid" DataSourceID="SqlDataSource5" ForeColor="#333333" 
                 GridLines="None">
                 <AlternatingRowStyle BackColor="White" />
                 <Columns>
                     <asp:CommandField ShowSelectButton="True" />
                     <asp:BoundField DataField="programme_account" HeaderText="programme_account" 
                         SortExpression="programme_account" />
                     <asp:BoundField DataField="coordinator_password" HeaderText="coordinator_password" 
                         SortExpression="coordinator_password" />
                     <asp:BoundField DataField="programme_name" HeaderText="programme_name" 
                         SortExpression="programme_name" />
                     <asp:BoundField DataField="update_time" HeaderText="update_time" 
                         SortExpression="update_time" />
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
             <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
                 ConnectionString="<%$ ConnectionStrings:EPConnectionString4 %>" 
                 SelectCommand="SELECT * FROM [programme_info]"></asp:SqlDataSource>
             <asp:DetailsView ID="DetailsView3" runat="server" AllowPaging="True" 
                 AutoGenerateRows="False" CellPadding="4" DataKeyNames="programmerid" 
                 DataSourceID="SqlDataSource6" ForeColor="#333333" GridLines="None" 
                 Height="50px" Width="125px">
                 <AlternatingRowStyle BackColor="White" />
                 <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                 <EditRowStyle BackColor="#0095CD" />
                 <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                 <Fields>

                     <asp:BoundField DataField="programme_account" HeaderText="programme_account" 
                         SortExpression="programme_account" />
                     <asp:TemplateField HeaderText="coordinator_password" 
                         SortExpression="coordinator_password">
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox1" runat="server" 
                                 Text='<%# Bind("coordinator_password") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <InsertItemTemplate>
                             <asp:TextBox ID="TextBox1" runat="server" 
                                 Text='<%# Bind("coordinator_password") %>'></asp:TextBox>
                         </InsertItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label1" runat="server" 
                                 Text='<%# Bind("coordinator_password") %>'></asp:Label>
                         </ItemTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="programme_name" SortExpression="programme_name">
                         <EditItemTemplate>
                             <asp:Label ID="Label16" runat="server" Text='<%# Bind("programme_name") %>'></asp:Label>
                         </EditItemTemplate>
                         <InsertItemTemplate>
                             <asp:DropDownList ID="DropDownList12" runat="server" 
                                 DataSourceID="SqlDataSource11" 
                                 SelectedValue='<%# Bind("programme_name") %>' DataTextField="programme_name" 
                                 DataValueField="programme_name">
                             </asp:DropDownList>
                         </InsertItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label2" runat="server" Text='<%# Bind("programme_name") %>'></asp:Label>
                         </ItemTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="update_time" SortExpression="update_time">
                         <EditItemTemplate>
                             <asp:Label ID="Label11" runat="server" Text='<%# Bind("update_time") %>'></asp:Label>
                         </EditItemTemplate>
                         <InsertItemTemplate>
                             <asp:Label ID="Label12" runat="server" Text='<%# Bind("update_time") %>'></asp:Label>
                         </InsertItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label3" runat="server" Text='<%# Bind("update_time") %>'></asp:Label>
                         </ItemTemplate>
                     </asp:TemplateField>
                     <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                         ShowInsertButton="True" />
                 </Fields>
                 <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                 <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                 <InsertRowStyle BackColor="#0095CD" />
                 <PagerStyle BackColor="#0095CD" ForeColor="White" HorizontalAlign="Center" />
                 <RowStyle BackColor="#EFF3FB" />
             </asp:DetailsView>
             <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
                 ConnectionString="<%$ ConnectionStrings:EPConnectionString4 %>" 
                 
                 
                 DeleteCommand="delete from programmeStud
where coordinator_password in
(select coordinator_password from programme_info where programmerid=@programmerid )

DELETE FROM [programme_info] WHERE [programmerid] = @programmerid
	
	
	
	" InsertCommand="INSERT INTO [programme_info] ([programme_account], [coordinator_password], [programme_name],[update_time]) VALUES (@programme_account, @coordinator_password, @programme_name,CONVERT(VARCHAR(24),GETDATE(),121))
insert into programmeStud(studentid,studentname,pess_cod,programme_name,coordinator_password)
select 
programmeData.studentid,programmeData.studentname,programmeData.pess_cod,programmeData.programme_name,programme_info.coordinator_password
from programmeData,programme_info
where programmeData.programme_name=programme_info.programme_name 
" 
                 SelectCommand="SELECT * FROM [programme_info] WHERE ([programmerid] = @programmerid)" 
                 
                 
                 
                             
                             
                             UpdateCommand="update programmeStud
set coordinator_password=@coordinator_password
where coordinator_password in
(select coordinator_password from programme_info where programmerid=@programmerid )

UPDATE [programme_info] SET [programme_account] = @programme_account, [coordinator_password] = @coordinator_password, [programme_name] = @programme_name,[update_time]=CONVERT(VARCHAR(24),GETDATE(),121) WHERE [programmerid] = @programmerid">
                 <DeleteParameters>
                     <asp:Parameter Name="programmerid" Type="Int32" />
                 </DeleteParameters>
                 <InsertParameters>
                     <asp:Parameter Name="programme_account" Type="String" />
                     <asp:Parameter Name="coordinator_password" Type="String" />
                     <asp:Parameter Name="programme_name" Type="String" />
                 </InsertParameters>
                 <SelectParameters>
                     <asp:ControlParameter ControlID="GridView3" Name="programmerid" 
                         PropertyName="SelectedValue" Type="Int32" />
                 </SelectParameters>
                 <UpdateParameters>
                     <asp:Parameter Name="coordinator_password" Type="String" />
                     <asp:Parameter Name="programmerid" Type="Int32" />
                     <asp:Parameter Name="programme_account" Type="String" />
                     <asp:Parameter Name="programme_name" Type="String" />
                  
                 </UpdateParameters>
             </asp:SqlDataSource>
                         <asp:SqlDataSource ID="SqlDataSource13" runat="server" 
                             ConnectionString="<%$ ConnectionStrings:EPConnectionString4 %>" 
                             SelectCommand="SELECT [coordinator_password] FROM [programme_info]">
                         </asp:SqlDataSource>
                         <asp:SqlDataSource ID="SqlDataSource18" runat="server" 
                             ConnectionString="<%$ ConnectionStrings:EPConnectionString4 %>" 
                             SelectCommand="SELECT * FROM [programme_info]"></asp:SqlDataSource>
             <asp:SqlDataSource ID="SqlDataSource11" runat="server" 
                 ConnectionString="<%$ ConnectionStrings:EPConnectionString4 %>" 
                 SelectCommand="SELECT distinct [programme_name] FROM [programmeData]">
             </asp:SqlDataSource>
    </asp:View>
    <asp:View ID="View4" runat="server">
                       <asp:Label ID="Label5" runat="server" Text="Admin Management:" Font-Bold="True" 
                    Font-Size="Larger"></asp:Label>
        <br />
        <asp:GridView ID="GridView4" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                           DataSourceID="SqlDataSource7" ForeColor="#333333" 
            GridLines="None" DataKeyNames="adminId">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="admin_account" HeaderText="admin_account" 
                    SortExpression="admin_account" />
                <asp:BoundField DataField="admin_password" HeaderText="admin_password" 
                    SortExpression="admin_password" />
                <asp:BoundField DataField="update_time" HeaderText="update_time" 
                    SortExpression="update_time" ReadOnly="True" />
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
        <asp:SqlDataSource ID="SqlDataSource7" runat="server" 
            ConnectionString="<%$ ConnectionStrings:EPConnectionString1 %>" 
            
                           SelectCommand="SELECT [admin_account], [adminId], [admin_password], [update_time] FROM [admin_info]"></asp:SqlDataSource>
        <asp:DetailsView ID="DetailsView4" runat="server" AllowPaging="True" 
            AutoGenerateRows="False" CellPadding="4" DataKeyNames="adminId" 
            DataSourceID="SqlDataSource8" ForeColor="#333333" GridLines="None" 
            Height="50px" Width="125px">
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
            <EditRowStyle BackColor="#0095CD" />
            <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="admin_account" HeaderText="admin_account" 
                    SortExpression="admin_account" />
                <asp:TemplateField HeaderText="admin_password" SortExpression="admin_password">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("admin_password") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("admin_password") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("admin_password") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="update_time" SortExpression="update_time" >
                    <EditItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("update_time") %>'></asp:Label>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("update_time") %>'></asp:Label>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("update_time") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                    ShowInsertButton="True" />
            </Fields>
            <FooterStyle BackColor="#0095CD" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <InsertRowStyle BackColor="#0095CD" />
            <PagerStyle BackColor="#0095CD" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
        </asp:DetailsView>
                       <asp:SqlDataSource ID="SqlDataSource14" runat="server" 
                           ConnectionString="<%$ ConnectionStrings:EPConnectionString4 %>" 
                           SelectCommand="SELECT [admin_password] FROM [admin_info]">
                       </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource8" runat="server" 
            ConnectionString="<%$ ConnectionStrings:EPConnectionString1 %>" 
            DeleteCommand="DELETE FROM [admin_info] WHERE [adminId] = @adminId" 
            InsertCommand="INSERT INTO [admin_info] ([admin_account], [admin_password], [update_time]) VALUES (@admin_account, @admin_password, CONVERT(VARCHAR(24),GETDATE(),121))" 
            SelectCommand="SELECT * FROM [admin_info] WHERE ([adminId] = @adminId)" 
            
                           
                           
                           UpdateCommand="UPDATE [admin_info] SET [admin_account] = @admin_account, [admin_password] = @admin_password, [update_time] = CONVERT(VARCHAR(24),GETDATE(),121) WHERE [adminId] = @adminId">
            <DeleteParameters>
                <asp:Parameter Name="adminId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="admin_account" Type="String" />
                <asp:Parameter Name="admin_password" Type="String" />
              
           
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView4" Name="adminId" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="admin_account" Type="String" />
                <asp:Parameter Name="admin_password" Type="String" />
               
              
                <asp:Parameter Name="adminId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
                       <asp:SqlDataSource ID="SqlDataSource16" runat="server" 
                           ConnectionString="<%$ ConnectionStrings:EPConnectionString4 %>" 
                           SelectCommand="SELECT * FROM [admin_info]"></asp:SqlDataSource>
        </asp:View>
          <asp:View ID="View5" runat="server">
                          <asp:Label ID="Label6" runat="server" Text="Year Tutor Management:" Font-Bold="True" 
                    Font-Size="Larger"></asp:Label>
        <br />
              <asp:GridView ID="GridView5" runat="server" AllowPaging="True" 
                  AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                  DataKeyNames="tutorid" DataSourceID="SqlDataSource9" ForeColor="#333333" 
                  GridLines="None">
                  <AlternatingRowStyle BackColor="White" />
                  <Columns>
                      <asp:CommandField ShowSelectButton="True" />
                      <asp:BoundField DataField="tutor_account" HeaderText="tutor_account" 
                          SortExpression="tutor_account" />
                      <asp:BoundField DataField="tutor_password" HeaderText="tutor_password" 
                          SortExpression="tutor_password" />
                      <asp:BoundField DataField="tutor_year" HeaderText="tutor_year" 
                          SortExpression="tutor_year" />
                      <asp:BoundField DataField="update_time" HeaderText="update_time" 
                          SortExpression="update_time" />
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
              <asp:SqlDataSource ID="SqlDataSource9" runat="server" 
                  ConnectionString="<%$ ConnectionStrings:EPConnectionString4 %>" 
                  SelectCommand="SELECT * FROM [tutor_info]"></asp:SqlDataSource>
              <asp:DetailsView ID="DetailsView5" runat="server" AllowPaging="True" 
                  AutoGenerateRows="False" CellPadding="4" DataKeyNames="tutorid" 
                  DataSourceID="SqlDataSource10" ForeColor="#333333" GridLines="None" 
                  Height="50px" Width="125px">
                  <AlternatingRowStyle BackColor="White" />
                  <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                  <EditRowStyle BackColor="#0095CD" />
                  <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                  <Fields>
                      <asp:BoundField DataField="tutor_account" HeaderText="tutor_account" 
                          SortExpression="tutor_account" />
                      <asp:TemplateField HeaderText="tutor_password" SortExpression="tutor_password">
                          <EditItemTemplate>
                              <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("tutor_password") %>'></asp:TextBox>
                          </EditItemTemplate>
                          <InsertItemTemplate>
                              <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("tutor_password") %>'></asp:TextBox>
                          </InsertItemTemplate>
                          <ItemTemplate>
                              <asp:Label ID="Label1" runat="server" Text='<%# Bind("tutor_password") %>'></asp:Label>
                          </ItemTemplate>
                      </asp:TemplateField>
                      <asp:TemplateField HeaderText="tutor_year" SortExpression="tutor_year">
                          <EditItemTemplate>
                              <asp:Label ID="Label17" runat="server" Text='<%# Bind("tutor_year") %>'></asp:Label>
                          </EditItemTemplate>
                          <InsertItemTemplate>
                              <asp:DropDownList ID="DropDownList14" runat="server" 
                                  SelectedValue='<%# Bind("tutor_year") %>'>
                                  <asp:ListItem>1</asp:ListItem>
                                  <asp:ListItem>2</asp:ListItem>
                                  <asp:ListItem>3</asp:ListItem>
                                  <asp:ListItem>4</asp:ListItem>
                              </asp:DropDownList>
                          </InsertItemTemplate>
                          <ItemTemplate>
                              <asp:Label ID="Label2" runat="server" Text='<%# Bind("tutor_year") %>'></asp:Label>
                          </ItemTemplate>
                      </asp:TemplateField>
                      <asp:TemplateField HeaderText="update_time" SortExpression="update_time">
                          <EditItemTemplate>
                              <asp:Label ID="Label13" runat="server" Text='<%# Bind("update_time") %>'></asp:Label>
                          </EditItemTemplate>
                          <InsertItemTemplate>
                              <asp:Label ID="Label14" runat="server" Text='<%# Bind("update_time") %>'></asp:Label>
                          </InsertItemTemplate>
                          <ItemTemplate>
                              <asp:Label ID="Label3" runat="server" Text='<%# Bind("update_time") %>'></asp:Label>
                          </ItemTemplate>
                      </asp:TemplateField>
                      <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                          ShowInsertButton="True" />
                  </Fields>
                  <FooterStyle BackColor="#0095CD" Font-Bold="True" ForeColor="White" />
                  <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                  <InsertRowStyle BackColor="#0095CD" />
                  <PagerStyle BackColor="#0095CD" ForeColor="White" HorizontalAlign="Center" />
                  <RowStyle BackColor="#EFF3FB" />
              </asp:DetailsView>
                          <asp:SqlDataSource ID="SqlDataSource15" runat="server" 
                              ConnectionString="<%$ ConnectionStrings:EPConnectionString4 %>" 
                              SelectCommand="SELECT [tutor_password] FROM [tutor_info]">
                          </asp:SqlDataSource>
                          <asp:SqlDataSource ID="SqlDataSource19" runat="server" 
                              ConnectionString="<%$ ConnectionStrings:EPConnectionString4 %>" 
                              SelectCommand="SELECT * FROM [tutor_info]"></asp:SqlDataSource>
              <asp:SqlDataSource ID="SqlDataSource10" runat="server" 
                  ConnectionString="<%$ ConnectionStrings:EPConnectionString4 %>" 
                  DeleteCommand="delete from tutorStud
where tutor_password in
(select tutor_password from tutor_info where tutorid=@tutorid )

DELETE FROM [tutor_info] WHERE [tutorid] = @tutorid
	


" InsertCommand="INSERT INTO [tutor_info] ([tutor_account], [tutor_password], [tutor_year],[update_time]) VALUES (@tutor_account, @tutor_password, @tutor_year,CONVERT(VARCHAR(24),GETDATE(),121))
insert into tutorStud(studentid,studentname,pess_cod,tutor_password,qualified_year)
select 
tutorData.studentid,tutorData.studentname,tutorData.pess_cod,tutor_info.tutor_password,tutorData.qualified_year
from tutorData,tutor_info
where tutorData.qualified_year=@tutor_year
" 
                  SelectCommand="SELECT * FROM [tutor_info] WHERE ([tutorid] = @tutorid)" 
                  
                              
                              
                              UpdateCommand="update tutorStud
set tutor_password=@tutor_password
where tutor_password in
(select tutor_password from tutor_info where tutorid=@tutorid )

UPDATE [tutor_info] SET [tutor_account] = @tutor_account, [tutor_password] = @tutor_password, [tutor_year] = @tutor_year,[update_time]= CONVERT(VARCHAR(24),GETDATE(),121) WHERE [tutorid] = @tutorid">
                  <DeleteParameters>
                      <asp:Parameter Name="tutorid" Type="Int32" />
                  </DeleteParameters>
                  <InsertParameters>
                      <asp:Parameter Name="tutor_account" Type="String" />
                      <asp:Parameter Name="tutor_password" Type="String" />
                      <asp:Parameter Name="tutor_year" Type="String" />
                  </InsertParameters>
                  <SelectParameters>
                      <asp:ControlParameter ControlID="GridView5" Name="tutorid" 
                          PropertyName="SelectedValue" Type="Int32" />
                  </SelectParameters>
                  <UpdateParameters>
                      <asp:Parameter Name="tutor_password" Type="String" />
                      <asp:Parameter Name="tutorid" Type="Int32" />
                      <asp:Parameter Name="tutor_account" Type="String" />
                      <asp:Parameter Name="tutor_year" Type="String" />
                  </UpdateParameters>
              </asp:SqlDataSource>
    </asp:View>
        </asp:MultiView>
        
     
    </div>
   
    </form>
  
</body>
</html>
