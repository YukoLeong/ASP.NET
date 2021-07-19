<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Attribute.aspx.vb" ClientTarget="uplevel" Inherits="Student_Attribute" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit.HTMLEditor" tagprefix="cc1" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

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
        #form1
        {
            height: 337px;
        }
        .style3
        {
            width: 50%;
        }
        .style12
        {
            width: 637px;
            height: 293px;
        }
        .style13
        {
            width: 65px;
            height: 32px;
            font-size: x-large;
            font-family: "Berlin Sans FB";
        }
                
        .style16
        {
            width: 189px;
        }
        .style17
        {
            width: 189px;
            height: 26px;
        }
        .style18
        {
            height: 26px;
        }
        .style19
        {
            width: 25px;
        }
        .style20
        {
            width: 133px;
            height: 26px;
        }
        .style21
        {
            width: 417px;
            height: 26px;
        }
        .style22
        {
            width: 66px;
        }
        .style23
        {
            width: 600px;
        }
        .style24
        {
            width: 603px;
        }
        .style25
        {
            width: 604px;
        }
        .style26
        {
            width: 605px;
        }
        .style27
        {
            width: 616px;
        }
        .style28
        {
            width: 637px;
        }
        .style29
        {
            width: 376px;
        }

        #ImageButton2{
            width:13%;
        }

        </style>
       
     <link rel="stylesheet" href="../button.css" type="text/css" media="screen" />
     <link rel="stylesheet" href="../grid.css" type="text/css" media="screen" />  
</head>
<body style="height: 421px" background="images/career_background.gif">
<script type ="text/javascript">
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
     <table cellpadding="0" cellspacing="0" border="0" width="1160" align="center">
    
    <tr>
<td>
    <div>
    <div class="style1">
  
        Attribute Planning
<%--          <asp:LinkButton ID="LinkButton1" runat="server" CssClass="blue" 
                  style="margin-left: 232px" Font-Size="Large" 
            CausesValidation="False">Back</asp:LinkButton>--%>
            <div style="text-align:center;margin-top:-32px;padding-bottom:12px;width:1136px">
               <asp:ImageButton ID="ImageButton2" runat="server" onmouseover="this.src='../images/homeblue_hover.png'" onmouseout="this.src='../images/homeblue.png'" ImageUrl="~/images/homeblue.png"  CausesValidation="False" /> 
    </div>

        </div>

    <br />
    <asp:SqlDataSource ID="SqlDataSource17" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
        OldValuesParameterFormatString="original_{0}" 
        
        
           DeleteCommand="DELETE FROM [CareerPlanning] WHERE [id] = @id" 
        InsertCommand="INSERT INTO [CareerPlanning] ([pess_cod], [careerPlanning], [description], [planningDate], [Professional_Competence], [Leadership], [Communication], [Creativity], [Initiative], [Self_Development], [Social_Responsibility], [Language], [IT_Application]) VALUES (@ALUN_NUMERO, @ALUN_NUMERO_SEQ, @pess_cod, @careerPlanning, @description, @planningDate, @Professional_Competence, @Leadership, @Communication, @Creativity, @Initiative, @Self_Development, @Social_Responsibility, @Language, @IT_Application)" 
        SelectCommand="SELECT * FROM [CareerPlanning] WHERE ([pess_cod] = @pess_cod) ORDER BY [careerPlanning]"
        UpdateCommand="UPDATE [CareerPlanning] SET [pess_cod] = @pess_cod, [careerPlanning] = @careerPlanning, [description] = @description, [planningDate] = @planningDate, [Professional_Competence] = @Professional_Competence, [Leadership] = @Leadership, [Communication] = @Communication, [Creativity] = @Creativity, [Initiative] = @Initiative, [Self_Development] = @Self_Development, [Social_Responsibility] = @Social_Responsibility, [Language] = @Language, [IT_Application] = @IT_Application WHERE [id] = @id">
       
            <DeleteParameters>
               <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
         
                <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
                <asp:Parameter Name="careerPlanning" Type="String" />
                <asp:Parameter Name="description" Type="String" />
                <asp:Parameter DbType="Date" Name="planningDate" />
                <asp:Parameter Name="Professional_Competence" Type="Int32" />
                <asp:Parameter Name="Leadership" Type="Int32" />
                <asp:Parameter Name="Communication" Type="Int32" />
                <asp:Parameter Name="Creativity" Type="Int32" />
                <asp:Parameter Name="Initiative" Type="Int32" />
                <asp:Parameter Name="Self_Development" Type="Int32" />
                <asp:Parameter Name="Social_Responsibility" Type="Int32" />
                <asp:Parameter Name="Language" Type="Int32" />
                <asp:Parameter Name="IT_Application" Type="Int32" />
            </InsertParameters>
       
        <SelectParameters>
           
            <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
        </SelectParameters>

          <UpdateParameters>
               
                <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
                <asp:Parameter Name="careerPlanning" Type="String" />
                <asp:Parameter Name="description" Type="String" />
                <asp:Parameter DbType="Date" Name="planningDate" />
                <asp:Parameter Name="Professional_Competence" Type="Int32" />
                <asp:Parameter Name="Leadership" Type="Int32" />
                <asp:Parameter Name="Communication" Type="Int32" />
                <asp:Parameter Name="Creativity" Type="Int32" />
                <asp:Parameter Name="Initiative" Type="Int32" />
                <asp:Parameter Name="Self_Development" Type="Int32" />
                <asp:Parameter Name="Social_Responsibility" Type="Int32" />
                <asp:Parameter Name="Language" Type="Int32" />
                <asp:Parameter Name="IT_Application" Type="Int32" />
                   <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
    </asp:SqlDataSource>
    <br />

        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
          <asp:View ID="View1" runat="server">
    <asp:Button ID="Button1" runat="server" Text="Add Planning" CssClass="blue" 
        Width="163px" CausesValidation="False" />
        <br />
    <br />
     <asp:GridView ID="GridViewCareer" runat="server" AllowPaging="True" AutoGenerateColumns="False" 
                DataKeyNames="id" DataSourceID="SqlDataSource1" 
                EmptyDataText="There are no data records to display." Font-Names="Calibri" 
                Font-Size="Small" PageSize="5" 
                style="z-index: 1; left: 15px; top: 75px;  " 
                CssClass="GridViewStyle" GridLines="Horizontal" AllowSorting="True" 
                Width="100%">
                <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                CommandName="Edit" Text="Edit" ForeColor="#0095CD"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                CommandName="Delete" OnClientClick="ConfirmMessage();" Text="Delete" 
                                ForeColor="#0095CD"></asp:LinkButton>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                                CommandName="Update" Text="Update" ForeColor="#0095CD"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                CommandName="Cancel" Text="Cancel" ForeColor="#0095CD"></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemStyle ForeColor="#0095CD" Width="8%" Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Year" SortExpression="careerPlanning">
                        <ItemTemplate>
                            <asp:Label ID="Label10" runat="server" Text='<%# Bind("careerPlanning") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <table class="style13">
                                <tr>
                                    <td class="style19">
                                        <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("careerPlanning") %>' 
                                            Width="53px"></asp:TextBox>
                                    </td>
                                    <td class="style29">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                                            ControlToValidate="TextBox10" ErrorMessage="Date can not be empty">*</asp:RequiredFieldValidator>
                                    </td>
                                 
                                </tr>
                            </table>
                        </EditItemTemplate>
                        <HeaderStyle Width="10%" />
                        <ItemStyle Width="10%" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Professional Competence" 
                        SortExpression="Professional_Competence">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" 
                                Text='<%# Bind("Professional_Competence") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <table class="style13">
                                <tr>
                                    <td class="style20">
                                        <asp:TextBox ID="TextBox1" runat="server" 
                                            Text='<%# Bind("Professional_Competence") %>' Width="55px"></asp:TextBox>
                                    </td>
                                    <td class="style21">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                            ControlToValidate="TextBox1" 
                                            ErrorMessage="Professional Competence can not be empty">*</asp:RequiredFieldValidator>
                                    </td>
                                    <td class="style19">
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                            ControlToValidate="TextBox1" 
                                            ErrorMessage="Professional Competence must be a positive number" 
                                            ValidationExpression="^[0-9]\d*$">*</asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                            </table>
                        </EditItemTemplate>
                        <HeaderStyle Width="10%" />
                        <ItemStyle Width="10%" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Leadership" SortExpression="Leadership">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Leadership") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <table class="style22">
                                <tr>
                                    <td class="style20">
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Leadership") %>' 
                                            Width="55px"></asp:TextBox>
                                    </td>
                                    <td class="style21">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                            ControlToValidate="TextBox2" ErrorMessage="Leadership can not be empty">*</asp:RequiredFieldValidator>
                                    </td>
                                    <td class="style18">
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                            ControlToValidate="TextBox2" 
                                            ErrorMessage="Leadership must be a positive number" 
                                            ValidationExpression="^[0-9]\d*$">*</asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                            </table>
                        </EditItemTemplate>
                        <HeaderStyle Width="10%" />
                        <ItemStyle Width="10%" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Communication" SortExpression="Communication">
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("Communication") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <table class="style22">
                                <tr>
                                    <td class="style20">
                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Communication") %>' 
                                            Width="55px"></asp:TextBox>
                                    </td>
                                    <td class="style23">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                            ControlToValidate="TextBox3" ErrorMessage="Communication can not be empty">*</asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                                            ControlToValidate="TextBox3" 
                                            ErrorMessage="Communication must be a positive number" 
                                            ValidationExpression="^[0-9]\d*$">*</asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                            </table>
                        </EditItemTemplate>
                        <HeaderStyle Width="10%" />
                        <ItemStyle Width="10%" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Creativity" SortExpression="Creativity">
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("Creativity") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <table class="style22">
                                <tr>
                                    <td class="style19">
                                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Creativity") %>' 
                                            Width="55px"></asp:TextBox>
                                    </td>
                                    <td class="style24">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                            ControlToValidate="TextBox4" ErrorMessage="Creativity can not be empty">*</asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                                            ControlToValidate="TextBox4" 
                                            ErrorMessage="Creativity must be a positive number" 
                                            ValidationExpression="^[0-9]\d*$">*</asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                            </table>
                        </EditItemTemplate>
                        <HeaderStyle Width="10%" />
                        <ItemStyle Width="10%" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Initiative" SortExpression="Initiative">
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("Initiative") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <table class="style22">
                                <tr>
                                    <td class="style19">
                                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Initiative") %>' 
                                            Width="53px"></asp:TextBox>
                                    </td>
                                    <td class="style23">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                            ControlToValidate="TextBox5" ErrorMessage="Initiative can not be empty">*</asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
                                            ControlToValidate="TextBox5" 
                                            ErrorMessage="Initiative must be a positive number" 
                                            ValidationExpression="^[0-9]\d*$">*</asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                            </table>
                        </EditItemTemplate>
                        <HeaderStyle Width="10%" />
                        <ItemStyle Width="10%" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Self Development" 
                        SortExpression="Self_Development">
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("Self_Development") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <table class="style22">
                                <tr>
                                    <td class="style25">
                                        <asp:TextBox ID="TextBox6" runat="server" 
                                            Text='<%# Bind("Self_Development") %>' Width="55px"></asp:TextBox>
                                    </td>
                                    <td class="style26">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                            ControlToValidate="TextBox6" ErrorMessage="Self Development can not be empty">*</asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" 
                                            ControlToValidate="TextBox6" 
                                            ErrorMessage="Self Development must be a positive number" 
                                            ValidationExpression="^[0-9]\d*$">*</asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                            </table>
                        </EditItemTemplate>
                        <HeaderStyle Width="10%" />
                        <ItemStyle Width="10%" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Social Responsibility" 
                        SortExpression="Social_Responsibility">
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" 
                                Text='<%# Bind("Social_Responsibility") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <table class="style22">
                                <tr>
                                    <td class="style20">
                                        <asp:TextBox ID="TextBox7" runat="server" 
                                            Text='<%# Bind("Social_Responsibility") %>' Width="55px"></asp:TextBox>
                                    </td>
                                    <td class="style26">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                            ControlToValidate="TextBox7" 
                                            ErrorMessage="Social Responsibility can not be empty">*</asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" 
                                            ControlToValidate="TextBox7" 
                                            ErrorMessage="Social Responsibility must be a positive number" 
                                            ValidationExpression="^[0-9]\d*$">*</asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                            </table>
                        </EditItemTemplate>
                        <HeaderStyle Width="10%" />
                        <ItemStyle Width="10%" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Language" SortExpression="Language">
                        <ItemTemplate>
                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("Language") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <table class="style22">
                                <tr>
                                    <td class="style27">
                                        <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Language") %>' 
                                            Width="55px"></asp:TextBox>
                                    </td>
                                    <td class="style23">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                            ControlToValidate="TextBox8" ErrorMessage="Language can not be empty">*</asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" 
                                            ControlToValidate="TextBox8" ErrorMessage="Language must be a positive number" 
                                            ValidationExpression="^[0-9]\d*$">*</asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                            </table>
                        </EditItemTemplate>
                        <HeaderStyle Width="10%" />
                        <ItemStyle Width="10%" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="IT Application" SortExpression="IT_Application">
                        <ItemTemplate>
                            <asp:Label ID="Label9" runat="server" Text='<%# Bind("IT_Application") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <table class="style22">
                                <tr>
                                    <td class="style19">
                                        <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("IT_Application") %>' 
                                            Width="55px"></asp:TextBox>
                                    </td>
                                    <td class="style23">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                                            ControlToValidate="TextBox9" ErrorMessage="IT Application can not be empty">*</asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" 
                                            ControlToValidate="TextBox9" 
                                            ErrorMessage="IT Application must be a positive number" 
                                            ValidationExpression="^[0-9]\d*$">*</asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                            </table>
                        </EditItemTemplate>
                        <HeaderStyle Width="10%" />
                        <ItemStyle Width="10%" />
                    </asp:TemplateField>
                </Columns>
                <HeaderStyle CssClass="GridViewHeaderStyle" ForeColor="White" />
                <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                <RowStyle HorizontalAlign="Center" CssClass="GridViewRowStyle" />
                <SelectedRowStyle CssClass="GridViewSelectRowStyle" />
                <SortedAscendingCellStyle CssClass="GridViewSortStyle" />
                <SortedAscendingHeaderStyle CssClass="GridViewSortHeaderStyle" />
            </asp:GridView>
            <br />
           
          <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
              <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                  ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                  DeleteCommand="DELETE FROM [CareerPlanning] WHERE [id] = @id" 
                  InsertCommand="INSERT INTO [CareerPlanning] ([pess_cod], [careerPlanning], [description], [planningDate], [Professional_Competence], [Leadership], [Communication], [Creativity], [Initiative], [Self_Development], [Social_Responsibility], [Language], [IT_Application]) VALUES (@pess_cod, @careerPlanning, @description, @planningDate, @Professional_Competence, @Leadership, @Communication, @Creativity, @Initiative, @Self_Development, @Social_Responsibility, @Language, @IT_Application)" 
                  SelectCommand="SELECT * FROM [CareerPlanning]WHERE ([pess_cod] = @pess_cod) ORDER BY [careerPlanning]"
                  UpdateCommand="UPDATE [CareerPlanning] SET  [pess_cod] = @pess_cod, [careerPlanning] = @careerPlanning, [description] = @description, [planningDate] = @planningDate, [Professional_Competence] = @Professional_Competence, [Leadership] = @Leadership, [Communication] = @Communication, [Creativity] = @Creativity, [Initiative] = @Initiative, [Self_Development] = @Self_Development, [Social_Responsibility] = @Social_Responsibility, [Language] = @Language, [IT_Application] = @IT_Application WHERE [id] = @id">
                  <DeleteParameters>
                      <asp:Parameter Name="id" Type="Int32" />
                  </DeleteParameters>
                  <InsertParameters>
                    
                        <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
                      <asp:Parameter Name="careerPlanning" Type="String" />
                      <asp:Parameter Name="description" Type="String" />
                      <asp:Parameter DbType="Date" Name="planningDate" />
                      <asp:Parameter Name="Professional_Competence" Type="Int32" />
                      <asp:Parameter Name="Leadership" Type="Int32" />
                      <asp:Parameter Name="Communication" Type="Int32" />
                      <asp:Parameter Name="Creativity" Type="Int32" />
                      <asp:Parameter Name="Initiative" Type="Int32" />
                      <asp:Parameter Name="Self_Development" Type="Int32" />
                      <asp:Parameter Name="Social_Responsibility" Type="Int32" />
                      <asp:Parameter Name="Language" Type="Int32" />
                      <asp:Parameter Name="IT_Application" Type="Int32" />
                  </InsertParameters>
             <SelectParameters>
           
            <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
        </SelectParameters>

                  <UpdateParameters>
                    
                       <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
                      <asp:Parameter Name="careerPlanning" Type="String" />
                      <asp:Parameter Name="description" Type="String" />
                      <asp:Parameter DbType="Date" Name="planningDate" />
                      <asp:Parameter Name="Professional_Competence" Type="Int32" />
                      <asp:Parameter Name="Leadership" Type="Int32" />
                      <asp:Parameter Name="Communication" Type="Int32" />
                      <asp:Parameter Name="Creativity" Type="Int32" />
                      <asp:Parameter Name="Initiative" Type="Int32" />
                      <asp:Parameter Name="Self_Development" Type="Int32" />
                      <asp:Parameter Name="Social_Responsibility" Type="Int32" />
                      <asp:Parameter Name="Language" Type="Int32" />
                      <asp:Parameter Name="IT_Application" Type="Int32" />
                      <asp:Parameter Name="id" Type="Int32" />
                  </UpdateParameters>
              </asp:SqlDataSource>
     <br />
    
    <br />
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
         DeleteCommand="DELETE FROM [CareerPlanning] WHERE [id] = @id" 
            InsertCommand="INSERT INTO [CareerPlanning] ([pess_cod], [careerPlanning], [description], [planningDate], [Professional_Competence], [Leadership], [Communication], [Creativity], [Initiative], [Self_Development], [Social_Responsibility], [Language], [IT_Application]) VALUES (@ALUN_NUMERO, @ALUN_NUMERO_SEQ, @pess_cod, @careerPlanning, @description, @planningDate, @Professional_Competence, @Leadership, @Communication, @Creativity, @Initiative, @Self_Development, @Social_Responsibility, @Language, @IT_Application)" 
            SelectCommand="SELECT * FROM [CareerPlanning] WHERE ([id] = @id)" 
            UpdateCommand="UPDATE [CareerPlanning] SET [pess_cod] = @pess_cod, [careerPlanning] = @careerPlanning, [description] = @description, [planningDate] = @planningDate, [Professional_Competence] = @Professional_Competence, [Leadership] = @Leadership, [Communication] = @Communication, [Creativity] = @Creativity, [Initiative] = @Initiative, [Self_Development] = @Self_Development, [Social_Responsibility] = @Social_Responsibility, [Language] = @Language, [IT_Application] = @IT_Application WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
         
                <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
                <asp:Parameter Name="careerPlanning" Type="String" />
                <asp:Parameter Name="description" Type="String" />
                <asp:Parameter DbType="Date" Name="planningDate" />
                <asp:Parameter Name="Professional_Competence" Type="Int32" />
                <asp:Parameter Name="Leadership" Type="Int32" />
                <asp:Parameter Name="Communication" Type="Int32" />
                <asp:Parameter Name="Creativity" Type="Int32" />
                <asp:Parameter Name="Initiative" Type="Int32" />
                <asp:Parameter Name="Self_Development" Type="Int32" />
                <asp:Parameter Name="Social_Responsibility" Type="Int32" />
                <asp:Parameter Name="Language" Type="Int32" />
                <asp:Parameter Name="IT_Application" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridViewCareer" Name="id" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
               
                <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
                <asp:Parameter Name="careerPlanning" Type="String" />
                <asp:Parameter Name="description" Type="String" />
                <asp:Parameter DbType="Date" Name="planningDate" />
                <asp:Parameter Name="Professional_Competence" Type="Int32" />
                <asp:Parameter Name="Leadership" Type="Int32" />
                <asp:Parameter Name="Communication" Type="Int32" />
                <asp:Parameter Name="Creativity" Type="Int32" />
                <asp:Parameter Name="Initiative" Type="Int32" />
                <asp:Parameter Name="Self_Development" Type="Int32" />
                <asp:Parameter Name="Social_Responsibility" Type="Int32" />
                <asp:Parameter Name="Language" Type="Int32" />
                <asp:Parameter Name="IT_Application" Type="Int32" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource7" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
        SelectCommand="SELECT * FROM [CareerAttribute]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource9" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
        SelectCommand="SELECT * FROM [CategoryWeight] WHERE ([programme] = @programme)">
        <SelectParameters>
            <asp:SessionParameter Name="programme" SessionField="programme" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
      <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                SelectCommand="SELECT * FROM [userGroup] WHERE ([id] = @id)">
                <SelectParameters>
                    <asp:SessionParameter Name="id" SessionField="Role_Type" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>

    <br />
 <table class="style3">
        <tr>
            <td class="style13">
                Attribute Analysis</td>
        </tr>
        <tr>
            <td class="style28">
                Draw:
                <asp:CheckBox ID="chkStatus" runat="server" AutoPostBack="True" 
                    Text="Current Status" />
                <asp:CheckBox ID="chkMPIattribute" runat="server" AutoPostBack="True" 
                    Text="Prog Attribute" />
                &nbsp;&nbsp;&nbsp;</td>
        </tr>
     
        <tr>
            <td class="style12">
            <asp:Chart ID="Chart_Total" runat="server" Width="565px" Height="382px" 
                    style="margin-top: 20px">
                                                           
                                                     <ChartAreas>
                                                            <asp:ChartArea Name="ChartArea1">
                                                               
                                                            </asp:ChartArea>
                                                           
                                                        </ChartAreas>
                                                         <Legends>
                                                             <asp:Legend Docking="Bottom" Name="Legend1">
                                                             </asp:Legend>
                                                        </Legends>
                                                           
                                                    </asp:Chart>
              </td>
        </tr>
        <tr>
            <td class="style28">
    <cc1:Editor ID="Editor1" runat="server" Height="200px" Width="550px" 
        Visible="False" />
                
            </td>
        </tr>
    </table>
            


    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
        SelectCommand="SELECT * FROM [Ability]"></asp:SqlDataSource>
    
    <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
        SelectCommand="SELECT * FROM [AbilityTest]"></asp:SqlDataSource>
    
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
        SelectCommand="SELECT * FROM [CareerPlanning]"></asp:SqlDataSource>
        <asp:HiddenField ID="pess_cod" runat="server" />
       

        <asp:SqlDataSource ID="SqlDataSource10" runat="server" 
            ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
            SelectCommand="SELECT [professional], [leadership], [communication], [comprehension], [expression], [initiative], [self_enhancement], [civil_responsibility], [language], [it_application] FROM [seminarAttribute]">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource11" runat="server" 
            ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
            
        SelectCommand="SELECT * FROM [Learning_Records_Correspond] WHERE ([pess_cod] = @pess_cod)">
            <SelectParameters>
                <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource12" runat="server" 
            ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
            SelectCommand="SELECT * FROM [AttributeColor]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource16" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
        SelectCommand="SELECT [id] FROM [Learning_Records_Experience]">
    </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource13" runat="server" 
            ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
            SelectCommand="SELECT * FROM [Learning_Records_Attribute]">
        </asp:SqlDataSource>
     
    <asp:SqlDataSource ID="SqlDataSource15" runat="server"
     ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
            SelectCommand="SELECT * FROM [userGroup] WHERE ([id] = @id)">
            <SelectParameters>
                <asp:SessionParameter Name="id" SessionField="position" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    <br />
      <asp:hiddenfield ID="message" runat="server"></asp:hiddenfield>
        </asp:View>

         <asp:View ID="View2" runat="server">

             &nbsp;<table>
                <tr>
                    <td class="style16">
                        Year:</td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                            ControlToValidate="TextBox1" ErrorMessage="Date can not be empty">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style16">
                        Professional Competence:</td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                            ControlToValidate="TextBox2" 
                            ErrorMessage="Professional Competence can not be empty">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator10" 
                            runat="server" ControlToValidate="TextBox2" 
                            ErrorMessage="Professional Competence must be a positive number" 
                            ValidationExpression="^[0-9]\d*$">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style16">
                        Leadership:</td>
                    <td>
                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                            ControlToValidate="TextBox3" ErrorMessage="Leadership can not be empty">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator11" 
                            runat="server" ControlToValidate="TextBox3" 
                            ErrorMessage="Leadership must be a positive number" 
                            ValidationExpression="^[0-9]\d*$">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style17">
                        Communication:</td>
                    <td class="style18">
                        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
                            ControlToValidate="TextBox4" ErrorMessage="Communication can not be empty">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator12" 
                            runat="server" ControlToValidate="TextBox4" 
                            ErrorMessage="Communication must be a positive number" 
                            ValidationExpression="^[0-9]\d*$">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style16">
                        Creativity:</td>
                    <td>
                        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" 
                            ControlToValidate="TextBox5" ErrorMessage="Creativity can not be empty">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator13" 
                            runat="server" ControlToValidate="TextBox5" 
                            ErrorMessage="Creativity must be a positive number" 
                            ValidationExpression="^[0-9]\d*$">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style16">
                        Initiative:</td>
                    <td>
                        <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" 
                            ControlToValidate="TextBox6" ErrorMessage="Initiative can not be empty">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator14" 
                            runat="server" ControlToValidate="TextBox6" 
                            ErrorMessage="Initiative must be a positive number" 
                            ValidationExpression="^[0-9]\d*$">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style16">
                        Self Development:</td>
                    <td>
                        <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" 
                            ControlToValidate="TextBox7" ErrorMessage="Self Development can not be empty">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator15" 
                            runat="server" ControlToValidate="TextBox7" 
                            ErrorMessage="Self Development must be a positive number" 
                            ValidationExpression="^[0-9]\d*$">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style16">
                        Social Responsibility:</td>
                    <td>
                        <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" 
                            ControlToValidate="TextBox8" 
                            ErrorMessage="Social Responsibility can not be empty">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator16" 
                            runat="server" ControlToValidate="TextBox8" 
                            ErrorMessage="Social Responsibility must be a positive number" 
                            ValidationExpression="^[0-9]\d*$">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style16">
                        Language:</td>
                    <td>
                        <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" 
                            ControlToValidate="TextBox9" ErrorMessage="Language can not be empty">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator17" 
                            runat="server" ControlToValidate="TextBox9" 
                            ErrorMessage="Language must be a positive number" 
                            ValidationExpression="^[0-9]\d*$">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        IT Application:</td>
                    <td>
                        <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" 
                            ControlToValidate="TextBox10" ErrorMessage="IT Application can not be empty">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator18" 
                            runat="server" ControlToValidate="TextBox10" 
                            ErrorMessage="IT Application must be a positive number" 
                            ValidationExpression="^[0-9]\d*$">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style16">
                        &nbsp;</td>
                    <td>
                        <asp:Button ID="Button2" runat="server" CssClass="blue" Text="Confirm" />
                        <asp:Button ID="Button3" runat="server" CssClass="blue" Text="Cancel" 
                            CausesValidation="False" />
                    </td>
                </tr>
            </table>
            <br />

            <asp:ValidationSummary ID="ValidationSummary2" runat="server" />

        </asp:View>
    </asp:MultiView>

          </div>
</td>
</tr>
    </table>
    </form>
</body>
</html>
