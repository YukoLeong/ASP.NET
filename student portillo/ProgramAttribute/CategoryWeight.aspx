<%@ Page Language="VB" AutoEventWireup="false" CodeFile="CategoryWeight.aspx.vb" Inherits="CategoryWeight" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link rel="stylesheet" href="../button.css" type="text/css" media="screen" />
    <style type="text/css">
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
        .style2
        {
            width: 545px;
        }
        .style3
        {
            width: 143px;
        }
        .style6
        {
            width: 348px;
        }
        .style8
        {
            width: 224px;
        }
         #ImageButton2{
            width:13%;
        }

    </style>
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
    <link rel="stylesheet" href="../button.css" type="text/css" media="screen" />
     <link rel="stylesheet" href="../teachGrid.css" type="text/css" media="screen" />
</head>
<body background="../images/bg-blue.jpg">
     <form id="form1" runat="server">
    <div id="wrapper">
    <div  id="content" >
  

     <br />
        <br />

   
      
         
   
      <label style="color:black;font-size:xx-large;font-family:Times New Roman, Times, serif;">Program Attributes</label>
    
<%--   <asp:LinkButton ID="LinkButton1" runat="server" CssClass="blue" 
                  style="margin-left: 212px" Font-Size="Large" 
            CausesValidation="False">Home</asp:LinkButton>--%>
        <div style="text-align:center;margin-top:-41px;padding-bottom:12px;width:1060px">
               <asp:ImageButton ID="ImageButton2" runat="server" onmouseover="this.src='../images/homeblue_hover.png'" onmouseout="this.src='../images/homeblue.png'" ImageUrl="~/images/homeblue.png" OnClick="ImageButton2_Click" CausesValidation="False" /> 
    </div>
    <p>
        
        &nbsp;</p>
    <p>
        <asp:Button ID="Button1" runat="server" Text="Add Program Attribute" 
            CssClass="blue" CausesValidation="False" />
    <br />
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">

             <asp:GridView ID="GridViewCategory" runat="server" AllowPaging="True" AutoGenerateColumns="False" 
                DataKeyNames="programme,school" 
                EmptyDataText="There are no data records to display." 
                GridLines="Horizontal" PageSize="5" Font-Names="Calibri" Font-Size="Small" 
            Width="100%" CssClass="GridViewStyle">
                <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" SelectText="View" >
                    <ItemStyle ForeColor="#0095CD" />
                    </asp:CommandField>
                    <asp:BoundField DataField="programme" HeaderText="Program" 
                        SortExpression="programme" >
                    <HeaderStyle Width="10%" />
                    </asp:BoundField>
                    <asp:BoundField DataField="school" HeaderText="School" 
                        SortExpression="school" >
                    <HeaderStyle Width="10%" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Professional_Competence" 
                        HeaderText="Professional Competence" 
                        SortExpression="Professional_Competence" >
                    <HeaderStyle Width="10%" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Leadership" HeaderText="Leadership" 
                        SortExpression="Leadership" >
                    <HeaderStyle Width="10%" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Communication" HeaderText="Communication" 
                        SortExpression="Communication" >
                    <HeaderStyle Width="10%" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Creativity" HeaderText="Creativity" 
                        SortExpression="Creativity" >
                    <HeaderStyle Width="10%" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Initiative" HeaderText="Initiative" 
                        SortExpression="Initiative" >
                    <HeaderStyle Width="10%" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Self_Development" HeaderText="Self Development" 
                        SortExpression="Self_Development" >
                    <HeaderStyle Width="10%" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Social_Responsibility" 
                        HeaderText="Social Responsibility" SortExpression="Social_Responsibility" >
                    <HeaderStyle Width="10%" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Language" HeaderText="Language" 
                        SortExpression="Language" >
                    <HeaderStyle Width="10%" />
                    </asp:BoundField>
                    <asp:BoundField DataField="IT_Application" HeaderText="IT Application" 
                        SortExpression="IT_Application" >
                    <HeaderStyle Width="10%" />
                    </asp:BoundField>
                </Columns>
                <HeaderStyle CssClass="GridViewHeaderStyle" />
                <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" 
                    ForeColor="Black" />
                <RowStyle HorizontalAlign="Center" CssClass="GridViewRowStyle" />
            </asp:GridView>
        </asp:View>
        <asp:View ID="View2" runat="server">

            <asp:Panel ID="Panel1" runat="server" BackColor="#DEE8F5">
                <table class="style2">
                    <tr>
                        <td class="style8">
                            Program:</td>
                        <td>
                            <asp:DropDownList ID="DropDownList1" runat="server">
                            </asp:DropDownList>
                        </td>
                    </tr>
              
                    <tr>
                        <td class="style8">
                            Professional Competence:</td>
                        <td>
                            <asp:TextBox ID="TextBox14" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" 
                                ControlToValidate="TextBox14" 
                                ErrorMessage="Professional Competence can not be empty">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator19" 
                                runat="server" ControlToValidate="TextBox14" 
                                ErrorMessage="Professional Competence must be a positive number" 
                                ValidationExpression="^[0-9]\d*$">*</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style8">
                            Leadership:</td>
                        <td class="style6">
                            <asp:TextBox ID="TextBox15" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" 
                                ControlToValidate="TextBox15" ErrorMessage="Leadership can not be empty">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator20" 
                                runat="server" ControlToValidate="TextBox15" 
                                ErrorMessage="Leadership must be a positive number" 
                                ValidationExpression="^[0-9]\d*$">*</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style8">
                            Communication:</td>
                        <td>
                            <asp:TextBox ID="TextBox16" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator27" runat="server" 
                                ControlToValidate="TextBox16" ErrorMessage="Communication can not be empty">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator21" 
                                runat="server" ControlToValidate="TextBox16" 
                                ErrorMessage="Communication must be a positive number" 
                                ValidationExpression="^[0-9]\d*$">*</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style8">
                            Creativity:</td>
                        <td>
                            <asp:TextBox ID="TextBox17" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" 
                                ControlToValidate="TextBox17" ErrorMessage="Creativity can not be empty">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator22" 
                                runat="server" ControlToValidate="TextBox17" 
                                ErrorMessage="Creativity must be a positive number" 
                                ValidationExpression="^[0-9]\d*$">*</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style8">
                            Initiative:</td>
                        <td>
                            <asp:TextBox ID="TextBox18" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator29" runat="server" 
                                ControlToValidate="TextBox18" ErrorMessage="Initiative can not be empty">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator23" 
                                runat="server" ControlToValidate="TextBox18" 
                                ErrorMessage="Initiative must be a positive number" 
                                ValidationExpression="^[0-9]\d*$">*</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style8">
                            Self Development:</td>
                        <td>
                            <asp:TextBox ID="TextBox19" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator30" runat="server" 
                                ControlToValidate="TextBox19" ErrorMessage="Self Development can not be empty">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator24" 
                                runat="server" ControlToValidate="TextBox19" 
                                ErrorMessage="Self Development must be a positive number" 
                                ValidationExpression="^[0-9]\d*$">*</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style8">
                            Social Responsibility:</td>
                        <td>
                            <asp:TextBox ID="TextBox20" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator31" runat="server" 
                                ControlToValidate="TextBox20" 
                                ErrorMessage="Social Responsibility can not be empty">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator25" 
                                runat="server" ControlToValidate="TextBox20" 
                                ErrorMessage="Social Responsibility must be a positive number" 
                                ValidationExpression="^[0-9]\d*$">*</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style8">
                            Language:</td>
                        <td>
                            <asp:TextBox ID="TextBox21" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator32" runat="server" 
                                ControlToValidate="TextBox21" ErrorMessage="Language can not be empty">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator26" 
                                runat="server" ControlToValidate="TextBox21" 
                                ErrorMessage="Language must be a positive number" 
                                ValidationExpression="^[0-9]\d*$">*</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style8">
                            IT Application:</td>
                        <td>
                            <asp:TextBox ID="TextBox22" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator33" runat="server" 
                                ControlToValidate="TextBox22" ErrorMessage="IT Application can not be empty">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator27" 
                                runat="server" ControlToValidate="TextBox22" 
                                ErrorMessage="IT Application must be a positive number" 
                                ValidationExpression="^[0-9]\d*$">*</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style8">
                            &nbsp;</td>
                        <td>
                            <asp:Button ID="Button2" runat="server" CssClass="blue" Text="Confirm" />
                            <asp:Button ID="Button3" runat="server" CssClass="blue" Text="Cancel" 
                                CausesValidation="False" />
                        </td>
                    </tr>
                </table>
                <br />
             <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
            </asp:Panel>
            

        </asp:View>
        </asp:MultiView>
   
    </p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
            OldValuesParameterFormatString="original_{0}" 
            
        
        SelectCommand="SELECT * FROM [CategoryWeight] WHERE (([school] = @school) AND ([program_name] = @program_name)) ORDER BY [programme]">
            <SelectParameters>
                <asp:SessionParameter Name="school" SessionField="School_code" Type="String" />
                <asp:SessionParameter Name="program_name" SessionField="Programme" 
                    Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
            DeleteCommand="DELETE FROM [CategoryWeight] WHERE [programme] = @programme" 
            InsertCommand="INSERT INTO [CategoryWeight] ([programme], [school], [Professional_Competence], [Leadership], [Communication], [Creativity], [Initiative], [Self_Development], [Social_Responsibility], [Language], [IT_Application], [program_name]) VALUES (@programme, @school, @Professional_Competence, @Leadership, @Communication, @Creativity, @Initiative, @Self_Development, @Social_Responsibility, @Language, @IT_Application, @program_name)" 
            SelectCommand="SELECT * FROM [CategoryWeight] WHERE ([programme] = @programme)" 
            
        
        UpdateCommand="UPDATE [CategoryWeight] SET [school] = @school, [Professional_Competence] = @Professional_Competence, [Leadership] = @Leadership, [Communication] = @Communication, [Creativity] = @Creativity, [Initiative] = @Initiative, [Self_Development] = @Self_Development, [Social_Responsibility] = @Social_Responsibility, [Language] = @Language, [IT_Application] = @IT_Application, [program_name] = @program_name WHERE [programme] = @programme">
            <DeleteParameters>
                <asp:Parameter Name="programme" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="programme" Type="String" />
                <asp:Parameter Name="school" Type="String" />
                <asp:Parameter Name="Professional_Competence" Type="Double" />
                <asp:Parameter Name="Leadership" Type="Double" />
                <asp:Parameter Name="Communication" Type="Double" />
                <asp:Parameter Name="Creativity" Type="Double" />
                <asp:Parameter Name="Initiative" Type="Double" />
                <asp:Parameter Name="Self_Development" Type="Double" />
                <asp:Parameter Name="Social_Responsibility" Type="Double" />
                <asp:Parameter Name="Language" Type="Double" />
                <asp:Parameter Name="IT_Application" Type="Double" />
                <asp:SessionParameter Name="program_name" SessionField="Programme" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridViewCategory" Name="programme" 
                    PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="school" Type="String" />
                <asp:Parameter Name="Professional_Competence" Type="Double" />
                <asp:Parameter Name="Leadership" Type="Double" />
                <asp:Parameter Name="Communication" Type="Double" />
                <asp:Parameter Name="Creativity" Type="Double" />
                <asp:Parameter Name="Initiative" Type="Double" />
                <asp:Parameter Name="Self_Development" Type="Double" />
                <asp:Parameter Name="Social_Responsibility" Type="Double" />
                <asp:Parameter Name="Language" Type="Double" />
                <asp:Parameter Name="IT_Application" Type="Double" />
                 <asp:SessionParameter Name="program_name" SessionField="Programme"  Type="String" />
                <asp:Parameter Name="programme" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
        SelectCommand="SELECT * FROM [CategoryWeight]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
        SelectCommand="SELECT * FROM [CategoryWeight] WHERE ([programme] = @programme)">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridViewCategory" Name="programme" 
                PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:HiddenField ID="HiddenField2" runat="server" />
    <asp:HiddenField ID="HiddenField3" runat="server" />
    <br />
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                SelectCommand="SELECT * FROM [userGroup] WHERE ([id] = @id)">
                <SelectParameters>
                    <asp:SessionParameter Name="id" SessionField="Role_Type" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        <asp:HiddenField ID="HiddenField1" runat="server" />
        <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
        
        SelectCommand="SELECT * FROM [program_info] WHERE ([PROGRAM_EN] = @PROGRAM_EN)">
            <SelectParameters>
                <asp:SessionParameter Name="PROGRAM_EN" SessionField="Programme" 
                    Type="String" />
            </SelectParameters>
    </asp:SqlDataSource>
        <table class="style2">
            <tr>
                <td class="style3">
                    <asp:MultiView ID="MultiView2" runat="server">
                        <asp:View ID="View3" runat="server">
                        <asp:DetailsView ID="DetailsViewCategory" runat="server" AutoGenerateRows="False" 
                        DataKeyNames="programme" GridLines="Horizontal" 
        Height="243px" Width="343px" CssClass="GridViewStyle">
        <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle2" />
        <Fields>
            <asp:TemplateField HeaderText="Program" SortExpression="programme">
                <EditItemTemplate>
                    <asp:Label ID="Label12" runat="server" Text='<%# Bind("programme") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("programme") %>' 
                        Width="100px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                        ControlToValidate="TextBox3" ErrorMessage="*"></asp:RequiredFieldValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("programme") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="School" SortExpression="school">
                <EditItemTemplate>
                    <asp:Label ID="Label13" runat="server" Text='<%# Bind("school") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("school") %>' 
                        Width="100px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                        ControlToValidate="TextBox2" ErrorMessage="*"></asp:RequiredFieldValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("school") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Professional Competence" 
                SortExpression="Professional_Competence">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" 
                        Text='<%# Bind("Professional_Competence") %>' Width="65px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="TextBox1" 
                        ErrorMessage="Professional Competence can not be empty">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                        ControlToValidate="TextBox1" ErrorMessage="Professional Competence must be a positive number" 
                        ValidationExpression="^[0-9]\d*$">*</asp:RegularExpressionValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" 
                        Text='<%# Bind("Professional_Competence") %>' Width="65px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
                        ControlToValidate="TextBox1" ErrorMessage="*"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator10" 
                        runat="server" ControlToValidate="TextBox1" ErrorMessage="Error Value" 
                        ValidationExpression="^[0-9]\d*$"></asp:RegularExpressionValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" 
                        Text='<%# Bind("Professional_Competence") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Leadership" SortExpression="Leadership">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Leadership") %>' 
                        Width="65px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="TextBox4" ErrorMessage="Leadership can not be empty">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                        ControlToValidate="TextBox4" ErrorMessage="Leadership must be a positive number" 
                        ValidationExpression="^[0-9]\d*$">*</asp:RegularExpressionValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Leadership") %>' 
                        Width="65px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" 
                        ControlToValidate="TextBox4" ErrorMessage="*"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator11" 
                        runat="server" ControlToValidate="TextBox4" ErrorMessage="Error Value" 
                        ValidationExpression="^[0-9]\d*$"></asp:RegularExpressionValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Leadership") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Communication" SortExpression="Communication">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Communication") %>' 
                        Width="65px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="TextBox5" ErrorMessage="Communication can not be empty">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="TextBox5" ErrorMessage="Communication must be a positive number" 
                        ValidationExpression="^[0-9]\d*$">*</asp:RegularExpressionValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Communication") %>' 
                        Width="65px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" 
                        ControlToValidate="TextBox5" ErrorMessage="*"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator12" 
                        runat="server" ControlToValidate="TextBox5" ErrorMessage="Error Value" 
                        ValidationExpression="^[0-9]\d*$"></asp:RegularExpressionValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Communication") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Creativity" SortExpression="Creativity">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Creativity") %>' 
                        Width="65px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ControlToValidate="TextBox6" ErrorMessage="Creativity can not be empty">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                        ControlToValidate="TextBox6" ErrorMessage="Creativity must be a positive number" 
                        ValidationExpression="^[0-9]\d*$">*</asp:RegularExpressionValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Creativity") %>' 
                        Width="65px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" 
                        ControlToValidate="TextBox6" ErrorMessage="*"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator13" 
                        runat="server" ControlToValidate="TextBox6" ErrorMessage="Error Value" 
                        ValidationExpression="^[0-9]\d*$"></asp:RegularExpressionValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Creativity") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Initiative" SortExpression="Initiative">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Initiative") %>' 
                        Width="65px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                        ControlToValidate="TextBox7" ErrorMessage="Initiative can not be empty">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
                        ControlToValidate="TextBox7" ErrorMessage="Initiative must be a positive number" 
                        ValidationExpression="^[0-9]\d*$">*</asp:RegularExpressionValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Initiative") %>' 
                        Width="65px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" 
                        ControlToValidate="TextBox7" ErrorMessage="*"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator14" 
                        runat="server" ControlToValidate="TextBox7" ErrorMessage="Error Value" 
                        ValidationExpression="^[0-9]\d*$"></asp:RegularExpressionValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("Initiative") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Self Development" 
                SortExpression="Self_Development">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox8" runat="server" 
                        Text='<%# Bind("Self_Development") %>' Width="65px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                        ControlToValidate="TextBox8" 
                        ErrorMessage="Self Development can not be empty">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" 
                        ControlToValidate="TextBox8" ErrorMessage="Self Development must be a positive number" 
                        ValidationExpression="^[0-9]\d*$">*</asp:RegularExpressionValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox8" runat="server" 
                        Text='<%# Bind("Self_Development") %>' Width="65px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" 
                        ControlToValidate="TextBox8" ErrorMessage="*"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator15" 
                        runat="server" ControlToValidate="TextBox8" ErrorMessage="Error Value" 
                        ValidationExpression="^[0-9]\d*$"></asp:RegularExpressionValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("Self_Development") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Social Responsibility" 
                SortExpression="Social_Responsibility">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox9" runat="server" 
                        Text='<%# Bind("Social_Responsibility") %>' Width="65px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                        ControlToValidate="TextBox9" 
                        ErrorMessage="Social Responsibility can not be empty">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" 
                        ControlToValidate="TextBox9" ErrorMessage="Social Responsibility must be a positive number" 
                        ValidationExpression="^[0-9]\d*$">*</asp:RegularExpressionValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox9" runat="server" 
                        Text='<%# Bind("Social_Responsibility") %>' Width="65px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" 
                        ControlToValidate="TextBox9" ErrorMessage="*"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator16" 
                        runat="server" ControlToValidate="TextBox9" ErrorMessage="Error Value" 
                        ValidationExpression="^[0-9]\d*$"></asp:RegularExpressionValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label9" runat="server" 
                        Text='<%# Bind("Social_Responsibility") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Language" SortExpression="Language">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("Language") %>' 
                        Width="65px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                        ControlToValidate="TextBox10" ErrorMessage="Language can not be empty">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" 
                        ControlToValidate="TextBox10" ErrorMessage="Language must be a positive number" 
                        ValidationExpression="^[0-9]\d*$">*</asp:RegularExpressionValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("Language") %>' 
                        Width="65px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" 
                        ControlToValidate="TextBox10" ErrorMessage="*"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator17" 
                        runat="server" ControlToValidate="TextBox10" ErrorMessage="Error Value" 
                        ValidationExpression="^[0-9]\d*$"></asp:RegularExpressionValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("Language") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="IT Application" SortExpression="IT_Application">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("IT_Application") %>' 
                        Width="65px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                        ControlToValidate="TextBox11" 
                        ErrorMessage="IT Application can not be empty">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" 
                        ControlToValidate="TextBox11" ErrorMessage="IT Application must be a positive number" 
                        ValidationExpression="^[0-9]\d*$">*</asp:RegularExpressionValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("IT_Application") %>' 
                        Width="65px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" 
                        ControlToValidate="TextBox11" ErrorMessage="*"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator18" 
                        runat="server" ControlToValidate="TextBox11" ErrorMessage="Error Value" 
                        ValidationExpression="^[0-9]\d*$"></asp:RegularExpressionValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label11" runat="server" Text='<%# Bind("IT_Application") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                        CommandName="Update" Text="Update" ForeColor="#0095CD"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                        CommandName="Cancel" Text="Cancel" ForeColor="#0095CD"></asp:LinkButton>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                        CommandName="Insert" Text="Insert" ForeColor="#0095CD"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                        CommandName="Cancel" Text="Cancel" ForeColor="#0095CD"></asp:LinkButton>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                        CommandName="Edit" Text="Edit" ForeColor="#0095CD"></asp:LinkButton>
                    &nbsp;&nbsp;<asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" 
                        CommandName="Delete" OnClientClick="ConfirmMessage();" Text="Delete" 
                        ForeColor="#0095CD"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Fields>
        <RowStyle CssClass="GridViewRowStyle2" />
    </asp:DetailsView>
    <br />
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" />

                        </asp:View>

                        <asp:View ID="View4" runat="server">


                      <asp:DetailsView ID="DetailsViewCategoryView" runat="server" AutoGenerateRows="False" 
                        DataKeyNames="programme" GridLines="Horizontal" 
        Height="243px" Width="343px" CssClass="GridViewStyle">
        <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle2" />
        <Fields>
            <asp:TemplateField HeaderText="Program" SortExpression="programme">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("programme") %>' 
                        Width="100px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="TextBox3" ErrorMessage="*"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("programme") %>' 
                        Width="100px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                        ControlToValidate="TextBox3" ErrorMessage="*"></asp:RequiredFieldValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("programme") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="School" SortExpression="school">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("school") %>' 
                        Width="100px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="TextBox2" ErrorMessage="*"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("school") %>' 
                        Width="100px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                        ControlToValidate="TextBox2" ErrorMessage="*"></asp:RequiredFieldValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("school") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Professional Competence" 
                SortExpression="Professional_Competence">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" 
                        Text='<%# Bind("Professional_Competence") %>' Width="65px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="TextBox1" ErrorMessage="*"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                        ControlToValidate="TextBox1" ErrorMessage="Error Value" 
                        ValidationExpression="^[0-9]\d*$"></asp:RegularExpressionValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" 
                        Text='<%# Bind("Professional_Competence") %>' Width="65px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
                        ControlToValidate="TextBox1" ErrorMessage="*"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator10" 
                        runat="server" ControlToValidate="TextBox1" ErrorMessage="Error Value" 
                        ValidationExpression="^[0-9]\d*$"></asp:RegularExpressionValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" 
                        Text='<%# Bind("Professional_Competence") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Leadership" SortExpression="Leadership">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Leadership") %>' 
                        Width="65px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="TextBox4" ErrorMessage="*"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                        ControlToValidate="TextBox4" ErrorMessage="Error Value" 
                        ValidationExpression="^[0-9]\d*$"></asp:RegularExpressionValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Leadership") %>' 
                        Width="65px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" 
                        ControlToValidate="TextBox4" ErrorMessage="*"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator11" 
                        runat="server" ControlToValidate="TextBox4" ErrorMessage="Error Value" 
                        ValidationExpression="^[0-9]\d*$"></asp:RegularExpressionValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Leadership") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Communication" SortExpression="Communication">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Communication") %>' 
                        Width="65px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="TextBox5" ErrorMessage="*"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="TextBox5" ErrorMessage="Error Value" 
                        ValidationExpression="^[0-9]\d*$"></asp:RegularExpressionValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Communication") %>' 
                        Width="65px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" 
                        ControlToValidate="TextBox5" ErrorMessage="*"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator12" 
                        runat="server" ControlToValidate="TextBox5" ErrorMessage="Error Value" 
                        ValidationExpression="^[0-9]\d*$"></asp:RegularExpressionValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Communication") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Creativity" SortExpression="Creativity">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Creativity") %>' 
                        Width="65px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ControlToValidate="TextBox6" ErrorMessage="*"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                        ControlToValidate="TextBox6" ErrorMessage="Error Value" 
                        ValidationExpression="^[0-9]\d*$"></asp:RegularExpressionValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Creativity") %>' 
                        Width="65px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" 
                        ControlToValidate="TextBox6" ErrorMessage="*"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator13" 
                        runat="server" ControlToValidate="TextBox6" ErrorMessage="Error Value" 
                        ValidationExpression="^[0-9]\d*$"></asp:RegularExpressionValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Creativity") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Initiative" SortExpression="Initiative">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Initiative") %>' 
                        Width="65px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                        ControlToValidate="TextBox7" ErrorMessage="*"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
                        ControlToValidate="TextBox7" ErrorMessage="Error Value" 
                        ValidationExpression="^[0-9]\d*$"></asp:RegularExpressionValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Initiative") %>' 
                        Width="65px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" 
                        ControlToValidate="TextBox7" ErrorMessage="*"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator14" 
                        runat="server" ControlToValidate="TextBox7" ErrorMessage="Error Value" 
                        ValidationExpression="^[0-9]\d*$"></asp:RegularExpressionValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("Initiative") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Self Development" 
                SortExpression="Self_Development">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox8" runat="server" 
                        Text='<%# Bind("Self_Development") %>' Width="65px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                        ControlToValidate="TextBox8" ErrorMessage="*"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" 
                        ControlToValidate="TextBox8" ErrorMessage="Error Value" 
                        ValidationExpression="^[0-9]\d*$"></asp:RegularExpressionValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox8" runat="server" 
                        Text='<%# Bind("Self_Development") %>' Width="65px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" 
                        ControlToValidate="TextBox8" ErrorMessage="*"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator15" 
                        runat="server" ControlToValidate="TextBox8" ErrorMessage="Error Value" 
                        ValidationExpression="^[0-9]\d*$"></asp:RegularExpressionValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("Self_Development") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Social Responsibility" 
                SortExpression="Social_Responsibility">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox9" runat="server" 
                        Text='<%# Bind("Social_Responsibility") %>' Width="65px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                        ControlToValidate="TextBox9" ErrorMessage="*"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" 
                        ControlToValidate="TextBox9" ErrorMessage="Error Value" 
                        ValidationExpression="^[0-9]\d*$"></asp:RegularExpressionValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox9" runat="server" 
                        Text='<%# Bind("Social_Responsibility") %>' Width="65px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" 
                        ControlToValidate="TextBox9" ErrorMessage="*"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator16" 
                        runat="server" ControlToValidate="TextBox9" ErrorMessage="Error Value" 
                        ValidationExpression="^[0-9]\d*$"></asp:RegularExpressionValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label9" runat="server" 
                        Text='<%# Bind("Social_Responsibility") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Language" SortExpression="Language">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("Language") %>' 
                        Width="65px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                        ControlToValidate="TextBox10" ErrorMessage="*"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" 
                        ControlToValidate="TextBox10" ErrorMessage="Error Value" 
                        ValidationExpression="^[0-9]\d*$"></asp:RegularExpressionValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("Language") %>' 
                        Width="65px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" 
                        ControlToValidate="TextBox10" ErrorMessage="*"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator17" 
                        runat="server" ControlToValidate="TextBox10" ErrorMessage="Error Value" 
                        ValidationExpression="^[0-9]\d*$"></asp:RegularExpressionValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("Language") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="IT Application" SortExpression="IT_Application">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("IT_Application") %>' 
                        Width="65px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                        ControlToValidate="TextBox11" ErrorMessage="*"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" 
                        ControlToValidate="TextBox11" ErrorMessage="Error Value" 
                        ValidationExpression="^[0-9]\d*$"></asp:RegularExpressionValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("IT_Application") %>' 
                        Width="65px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" 
                        ControlToValidate="TextBox11" ErrorMessage="*"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator18" 
                        runat="server" ControlToValidate="TextBox11" ErrorMessage="Error Value" 
                        ValidationExpression="^[0-9]\d*$"></asp:RegularExpressionValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label11" runat="server" Text='<%# Bind("IT_Application") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Fields>
        <RowStyle CssClass="GridViewRowStyle2" />
    </asp:DetailsView>


                        </asp:View>
                    </asp:MultiView>
    
                </td>
                <td>
    
                    <asp:Chart ID="ProgrammeAttrPie" runat="server" Height="324px" Width="478px">
                        <Series>
                            <asp:Series ChartType="Pie" 
                                Font="Microsoft Sans Serif, 8.25pt, style=Bold, Italic" 
                                LabelForeColor="Transparent" Legend="Legend1" Name="Series1">
                            </asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                            </asp:ChartArea>
                        </ChartAreas>
                        <Legends>
                            <asp:Legend Name="Legend1">
                            </asp:Legend>
                        </Legends>
                    </asp:Chart>
                </td>
            </tr>
            <tr>
                <td class="style3">
    
        <asp:Chart ID="SchoolAttribute" runat="server" Height="377px" Width="417px">
            <Series>
                <asp:Series ChartArea="ChartArea1" ChartType="Radar" Name="School Attribute" 
                    Legend="Legend1" LegendText="School">
                </asp:Series>
                <asp:Series ChartArea="ChartArea1" ChartType="Radar" Color="Orange" 
                    Legend="Legend1" LegendText="Programme" Name="Programme Attribute">
                </asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </ChartAreas>
            <Legends>
                <asp:Legend DockedToChartArea="ChartArea1" Docking="Top" 
                    IsDockedInsideChartArea="False" MaximumAutoSize="10" Name="Legend1" 
                    TitleAlignment="Near">
                </asp:Legend>
            </Legends>
            <Titles>
                <asp:Title Name="Programme">
                </asp:Title>
            </Titles>
        </asp:Chart>
    
                </td>
                <td>
    
        <asp:Chart ID="ProgrammeAttribute" runat="server" Height="377px" Width="417px">
            <Series>
                <asp:Series ChartArea="ChartArea1" ChartType="Radar" Name="Program Attribute" 
                    Color="Orange" Legend="Legend1" LegendText="Programme">
                </asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </ChartAreas>
            <Legends>
                <asp:Legend DockedToChartArea="ChartArea1" Docking="Top" 
                    IsDockedInsideChartArea="False" MaximumAutoSize="10" Name="Legend1" 
                    TitleAlignment="Near">
                </asp:Legend>
            </Legends>
            <Titles>
                <asp:Title Name="Programme">
                </asp:Title>
            </Titles>
        </asp:Chart>
    
                </td>
            </tr>
            <tr>
                <td class="style3">
    
                    &nbsp;</td>
                <td>
    
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style3">
    
                    <asp:Chart ID="Chart1" runat="server">
                        <Series>
                            <asp:Series ChartArea="ChartArea1" ChartType="Bar" Name="Series1">
                            </asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                            </asp:ChartArea>
                        </ChartAreas>
                        <Titles>
                            <asp:Title Font="Microsoft Sans Serif, 8.25pt, style=Bold" Name="Title1" 
                                Text="Professional Competence">
                            </asp:Title>
                        </Titles>
                    </asp:Chart>
                </td>
                <td>
    
                    <asp:Chart ID="Chart2" runat="server">
                        <Series>
                            <asp:Series ChartType="Bar" Name="Series1">
                            </asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                            </asp:ChartArea>
                        </ChartAreas>
                        <Titles>
                            <asp:Title Font="Microsoft Sans Serif, 8.25pt, style=Bold" Name="Title1" 
                                Text="Leadership">
                            </asp:Title>
                        </Titles>
                    </asp:Chart>
                </td>
            </tr>
            <tr>
                <td class="style3">
    
                    <asp:Chart ID="Chart3" runat="server">
                        <Series>
                            <asp:Series ChartType="Bar" Name="Series1">
                            </asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                            </asp:ChartArea>
                        </ChartAreas>
                        <Titles>
                            <asp:Title Font="Microsoft Sans Serif, 8.25pt, style=Bold" Name="Title1" 
                                Text="Communication">
                            </asp:Title>
                        </Titles>
                    </asp:Chart>
                </td>
                <td>
    
                    <asp:Chart ID="Chart4" runat="server">
                        <Series>
                            <asp:Series ChartType="Bar" Name="Series1" XValueMember="programme" 
                                YValueMembers="Creativity">
                            </asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                            </asp:ChartArea>
                        </ChartAreas>
                        <Titles>
                            <asp:Title Font="Microsoft Sans Serif, 8.25pt, style=Bold" Name="Title1" 
                                Text="Creativity">
                            </asp:Title>
                        </Titles>
                    </asp:Chart>
                </td>
            </tr>
            <tr>
                <td class="style3">
    
                    <asp:Chart ID="Chart5" runat="server">
                        <Series>
                            <asp:Series ChartType="Bar" Name="Series1">
                            </asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                            </asp:ChartArea>
                        </ChartAreas>
                        <Titles>
                            <asp:Title Font="Microsoft Sans Serif, 8.25pt, style=Bold" Name="Title1" 
                                Text="Initiative">
                            </asp:Title>
                        </Titles>
                    </asp:Chart>
                </td>
                <td>
    
                    <asp:Chart ID="Chart6" runat="server">
                        <Series>
                            <asp:Series ChartType="Bar" Name="Series1">
                            </asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                            </asp:ChartArea>
                        </ChartAreas>
                        <Titles>
                            <asp:Title Font="Microsoft Sans Serif, 8.25pt, style=Bold" Name="Title1" 
                                Text="Self Development">
                            </asp:Title>
                        </Titles>
                    </asp:Chart>
                </td>
            </tr>
            <tr>
                <td class="style3">
    
                    <asp:Chart ID="Chart7" runat="server">
                        <Series>
                            <asp:Series ChartType="Bar" Name="Series1">
                            </asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                            </asp:ChartArea>
                        </ChartAreas>
                        <Titles>
                            <asp:Title Font="Microsoft Sans Serif, 8.25pt, style=Bold" Name="Title1" 
                                Text="Self Development">
                            </asp:Title>
                        </Titles>
                    </asp:Chart>
                </td>
                <td>
    
                    <asp:Chart ID="Chart8" runat="server">
                        <Series>
                            <asp:Series ChartType="Bar" Name="Series1">
                            </asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                            </asp:ChartArea>
                        </ChartAreas>
                        <Titles>
                            <asp:Title Font="Microsoft Sans Serif, 8.25pt, style=Bold" Name="Title1" 
                                Text="Language">
                            </asp:Title>
                        </Titles>
                    </asp:Chart>
                </td>
            </tr>
            <tr>
                <td class="style3">
    
                    <asp:Chart ID="Chart9" runat="server">
                        <Series>
                            <asp:Series ChartType="Bar" Name="Series1">
                            </asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                            </asp:ChartArea>
                        </ChartAreas>
                        <Titles>
                            <asp:Title Font="Microsoft Sans Serif, 8.25pt, style=Bold" Name="Title1" 
                                Text="IT Application">
                            </asp:Title>
                        </Titles>
                    </asp:Chart>
                </td>
                <td>
    
                
                </td>
            </tr>
            <tr>
                <td class="style3">
    
                    &nbsp;</td>
                <td>
    
                    &nbsp;</td>
            </tr>
    </table>
    <asp:hiddenfield ID="message" runat="server"></asp:hiddenfield>

   
  
   </div>
   </div>
  
    </form>
</body>
</html>
