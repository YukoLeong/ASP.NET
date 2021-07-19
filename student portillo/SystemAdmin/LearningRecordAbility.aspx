<%@ Page Language="VB" AutoEventWireup="false" CodeFile="LearningRecordAbility.aspx.vb" Inherits="SystemAdmin_LearningRecordAbility" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
         .style1
        {
            font-family: "Berlin Sans FB";
            font-size: xx-large;
        }
        .style3
        {
            width: 100%;
        }
        .style4
        {
            width: 437px;
        }
        </style>
   
  <link rel="stylesheet" href="../button.css" type="text/css" media="screen" />  
</head>
<body background="images/studentWork2.gif">
    <form id="form1" runat="server">
    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="blue" 
                  style="margin-left: 432px" Font-Size="Large">Home</asp:LinkButton>
    <br />
    
    
    
    <br />
    
    
    
   
      
    <table class="style3">
        <tr>
            <td class="style4">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <br />
    
     
    
   
      
 
        <span class="style1">Learning Record Attribute</span>
     <br />
     <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" 
        EmptyDataText="There are no data records to display." ForeColor="#333333" 
        GridLines="None" 
        style="z-index: 1; left: 15px; top: 75px;  " 
        Font-Names="Calibri" Font-Size="Small" Height="114px" 
        Width="1260px" DataKeyNames="id">
        <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:TemplateField HeaderText="experience_name" 
                    SortExpression="experience_name">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("experience_name") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("experience_name") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:CheckBoxField DataField="professional_certificate" 
                    HeaderText="professional_certificate" 
                    SortExpression="professional_certificate" />
                <asp:CheckBoxField DataField="leadership" HeaderText="leadership" 
                    SortExpression="leadership" />
                <asp:CheckBoxField DataField="communication" HeaderText="communication" 
                    SortExpression="communication" />
                <asp:CheckBoxField DataField="comprehension" HeaderText="comprehension" 
                    SortExpression="comprehension" />
                <asp:CheckBoxField DataField="creativity" HeaderText="creativity" 
                    SortExpression="creativity" />
                <asp:CheckBoxField DataField="initiative" HeaderText="initiative" 
                    SortExpression="initiative" />
                <asp:CheckBoxField DataField="self_enhancement" HeaderText="self_enhancement" 
                    SortExpression="self_enhancement" />
                <asp:CheckBoxField DataField="ethics" HeaderText="ethics" 
                    SortExpression="ethics" />
                <asp:CheckBoxField DataField="language" HeaderText="language" 
                    SortExpression="language" />
                <asp:CheckBoxField DataField="it_application" HeaderText="it_application" 
                    SortExpression="it_application" />
            </Columns>
        <EditRowStyle BackColor="#0095CD" />
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
        ConnectionString="<%$ ConnectionStrings:EPConnectionString4 %>" 
        
                
                SelectCommand="SELECT * FROM [Learning_Records_Attribute_Ability]" 
        DeleteCommand="DELETE FROM [Learning_Records_Attribute_Ability] WHERE [id] = @id" 
        InsertCommand="INSERT INTO [Learning_Records_Attribute_Ability] ([experience_name], [professional_certificate], [leadership], [communication], [comprehension], [creativity], [initiative], [self_enhancement], [ethics], [language], [it_application]) VALUES (@experience_name, @professional_certificate, @leadership, @communication, @comprehension, @creativity, @initiative, @self_enhancement, @ethics, @language, @it_application)" 
        UpdateCommand="UPDATE [Learning_Records_Attribute_Ability] SET [experience_name] = @experience_name, [professional_certificate] = @professional_certificate, [leadership] = @leadership, [communication] = @communication, [comprehension] = @comprehension, [creativity] = @creativity, [initiative] = @initiative, [self_enhancement] = @self_enhancement, [ethics] = @ethics, [language] = @language, [it_application] = @it_application WHERE [id] = @id">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="experience_name" Type="String" />
            <asp:Parameter Name="professional_certificate" Type="Boolean" />
            <asp:Parameter Name="leadership" Type="Boolean" />
            <asp:Parameter Name="communication" Type="Boolean" />
            <asp:Parameter Name="comprehension" Type="Boolean" />
            <asp:Parameter Name="creativity" Type="Boolean" />
            <asp:Parameter Name="initiative" Type="Boolean" />
            <asp:Parameter Name="self_enhancement" Type="Boolean" />
            <asp:Parameter Name="ethics" Type="Boolean" />
            <asp:Parameter Name="language" Type="Boolean" />
            <asp:Parameter Name="it_application" Type="Boolean" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="experience_name" Type="String" />
            <asp:Parameter Name="professional_certificate" Type="Boolean" />
            <asp:Parameter Name="leadership" Type="Boolean" />
            <asp:Parameter Name="communication" Type="Boolean" />
            <asp:Parameter Name="comprehension" Type="Boolean" />
            <asp:Parameter Name="creativity" Type="Boolean" />
            <asp:Parameter Name="initiative" Type="Boolean" />
            <asp:Parameter Name="self_enhancement" Type="Boolean" />
            <asp:Parameter Name="ethics" Type="Boolean" />
            <asp:Parameter Name="language" Type="Boolean" />
            <asp:Parameter Name="it_application" Type="Boolean" />
            <asp:Parameter Name="id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    
      
        
 
    
      
    </form>
</body>
</html>
