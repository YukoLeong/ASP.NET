<%@ Page Language="VB" AutoEventWireup="false" CodeFile="RoleAccount.aspx.vb" Inherits="SystemAdmin_RoleAccount" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 129px;
        }
        .style3
        {
            width: 198px;
        }
        .style4
        {
            height: 21px;
        }
        .style5
        {
            height: 20px;
        }
        .style6
        {
            height: 21px;
            width: 112px;
        }
        .style7
        {
            width: 112px;
        }
        .style8
        {
            height: 20px;
            width: 112px;
        }
         #wrapper
        {
            width: 1100px;
            margin-left: auto;
            margin-top:-5px;
            margin-right: auto;
            background-color:White;
            border-left:solid black 1px;
            border-right:solid black 1px;
        
        }
        #content
        {
             
            min-height:950px;
            margin-left: 5px;
            margin-right: 5px;
        }
    </style>
      <link rel="stylesheet" href="../button.css" type="text/css" media="screen" />
     <link rel="stylesheet" href="../teachGrid.css" type="text/css" media="screen" />
     <link rel="stylesheet" href="../button.css" type="text/css" media="screen" />
</head>
<body background="../images/bg-blue.jpg">
   

 <script type="text/javascript">
     function ConfirmMessage() {
         var selectedvalue = confirm("Are you sure you want to delete it?");
         if (selectedvalue) {
             document.getElementById('<%=message.ClientID %>').value = "Yes";
         } else {
             document.getElementById('<%=message.ClientID %>').value = "No";
         }
     }
    </script>
    <form id="form1" runat="server">

     <div id="wrapper">
    <div  id="content" >
 

     <br />
        <br />
     <div align="center">

 
              <asp:LinkButton ID="LinkButton3" runat="server" CssClass="blue" 
                  Font-Size="Large">Home</asp:LinkButton>
              
       </div>

    <div> 
     <br />
        <br />
         <table class="style1">
                <tr>
                    <td class="style3">
                        <asp:Button ID="Button1" runat="server" Text="Role Account" CssClass="blue" />
                    </td>
                    <td>
                        <asp:Button ID="Button3" runat="server" Text="System Admin Account" 
                            CssClass="blue" />
                    </td>
                </tr>
            </table>
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">
           
            <br />
            <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Size="X-Large" 
                Text="Role Account:"></asp:Label>
                <br />
        <br />
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False" 
                DataKeyNames="uid" DataSourceID="SqlDataSource1" 
                EmptyDataText="there is no data" GridLines="Horizontal" 
                CssClass="GridViewStyle">
                <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                                CommandName="Update" Text="Update"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                CommandName="Edit" Text="Edit"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                CommandName="Delete" OnClientClick="ConfirmMessage();" Text="Delete"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="uid" HeaderText="Net ID" ReadOnly="True" 
                        SortExpression="uid">
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Position" SortExpression="position">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList3" runat="server" 
                                SelectedValue='<%# Bind("position") %>'>
                                <asp:ListItem>Not define</asp:ListItem>
                                <asp:ListItem Value="operator">operator</asp:ListItem>
                                <asp:ListItem Value="tutor">tutor</asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("position") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Tutor Year" SortExpression="tutor_year">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList4" runat="server" 
                                SelectedValue='<%# Bind("tutor_year") %>'>
                                <asp:ListItem>Not define</asp:ListItem>
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("tutor_year") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                </Columns>
                <HeaderStyle CssClass="GridViewHeaderStyle" />
                <PagerStyle HorizontalAlign="Center" />
                <RowStyle CssClass="GridViewRowStyle" />
            </asp:GridView>
            <br />
            <asp:Label ID="Label6" runat="server" Text="Add Role Account:" Font-Bold="True" 
                Font-Size="X-Large"></asp:Label>
            <br />
                 <br />
                <table class="style1">
                    <tr>
                        <td class="style2">
                            <asp:Label ID="Label1" runat="server" Text="Net ID:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
						
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="Label2" runat="server" Text="Position:"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
                                <asp:ListItem>Not define</asp:ListItem>
                                <asp:ListItem Value="operator">Operator</asp:ListItem>
                                <asp:ListItem Value="tutor">Year Tutor</asp:ListItem>
                                <asp:ListItem Value="schooladmin">School Admin</asp:ListItem>
                                <asp:ListItem Value="manager">Manager</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="Label3" runat="server" Text="Tutor Year:"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownList2" runat="server">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            &nbsp;</td>
                        <td>
                            <asp:Button ID="Button2" runat="server" Text="Submit" CssClass="blue" />
                        </td>
                    </tr>
                </table>
            
        </asp:View>
            <asp:View ID="View2" runat="server">
            <br />
                <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="X-Large" 
                    Text="System Admin Account:"></asp:Label>
                <br />
        <br />
            <asp:GridView ID="GridView2" runat="server" GridLines="Horizontal" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="uid" 
                    DataSourceID="SqlDataSource2" CssClass="GridViewStyle">
                     <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                     <Columns>
                         <asp:TemplateField ShowHeader="False">
                             <ItemTemplate>
                                 <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                     CommandName="Delete" OnClientClick = "ConfirmMessage();" Text="Delete"></asp:LinkButton>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:BoundField DataField="uid" HeaderText="Account ID:" ReadOnly="True" 
                             SortExpression="uid" >
                         <HeaderStyle HorizontalAlign="Left" />
                         </asp:BoundField>
                         <asp:BoundField DataField="position" HeaderText="Position" 
                             SortExpression="position" ReadOnly="True" >
                         <HeaderStyle HorizontalAlign="Left" />
                         </asp:BoundField>
                     </Columns>
                     <HeaderStyle CssClass="GridViewHeaderStyle" />
                     <PagerStyle HorizontalAlign="Center" />
                     <RowStyle CssClass="GridViewRowStyle" />
                </asp:GridView>
                <br />
                     
                <asp:Label ID="Label7" runat="server" Text="Add System Admin Account:" 
                    Font-Bold="True" Font-Size="X-Large"></asp:Label>
                <br />
                 
                 <br />
             <table class="style1">
                        <tr>
                            <td class="style6">
                                <asp:Label ID="Label4" runat="server" Text="Account ID:"></asp:Label>
                            </td>
                            <td class="style4">
                                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style7">
                                <asp:Label ID="Label5" runat="server" Text="Password:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style8">
                                &nbsp;</td>
                            <td class="style5">
                                <asp:Button ID="Button4" runat="server" Text="Submit" CssClass="blue" />
                            </td>
                        </tr>
                       
                       
                    </table>
            </asp:View>
            
             
    </asp:MultiView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
            DeleteCommand="DELETE FROM [RoleAccount] WHERE [uid] = @uid" 
            InsertCommand="INSERT INTO [RoleAccount] ([uid], [position], [tutor_year]) VALUES (@uid, @position, @tutor_year)" 
            SelectCommand="SELECT * FROM [RoleAccount]" 
            
            UpdateCommand="UPDATE [RoleAccount] SET [position] = @position, [tutor_year] = @tutor_year WHERE [uid] = @uid">
            <DeleteParameters>
                <asp:Parameter Name="uid" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="uid" Type="String" />
                <asp:Parameter Name="position" Type="String" />
                <asp:Parameter Name="tutor_year" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="position" Type="String" />
                <asp:Parameter Name="tutor_year" Type="String" />
                <asp:Parameter Name="uid" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        
    
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
            DeleteCommand="DELETE FROM [SystemAdmin] WHERE [uid] = @uid" 
            InsertCommand="INSERT INTO [SystemAdmin] ([uid], [password], [position]) VALUES (@uid, @password, @position)" 
            SelectCommand="SELECT * FROM [SystemAdmin]" 
            UpdateCommand="UPDATE [SystemAdmin] SET [password] = @password, [position] = @position WHERE [uid] = @uid">
            <DeleteParameters>
                <asp:Parameter Name="uid" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="uid" Type="String" />
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="position" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="position" Type="String" />
                <asp:Parameter Name="uid" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:hiddenfield ID="message" runat="server"></asp:hiddenfield>
    
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
            SelectCommand="SELECT distinct[uid] FROM [Staff_Info]"></asp:SqlDataSource>
        
        <asp:SqlDataSource ID="SqlDataSource6" runat="server"></asp:SqlDataSource>
        
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
            ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
            SelectCommand="SELECT distinct [uid], [COD] FROM [Staff_Info] WHERE ([cat_type] = @cat_type)">
            <SelectParameters>
                <asp:Parameter DefaultValue="basi" Name="cat_type" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        
      <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                SelectCommand="SELECT * FROM [userGroup] WHERE ([id] = @id)">
                <SelectParameters>
                    <asp:SessionParameter Name="id" SessionField="Role_Type" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
    </div>
       </div>
   </div>
  
    </form>
</body>
</html>
