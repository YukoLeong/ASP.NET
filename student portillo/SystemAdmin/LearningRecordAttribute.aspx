<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="LearningRecordAttribute.aspx.vb" Inherits="ep.LearningRecordAttribute" %>

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
        Font-Names="Calibri" Font-Size="Small" Height="16px" 
        Width="562px" DataKeyNames="id">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="experience_name" HeaderText="experience_name" 
                SortExpression="experience_name" />
            <asp:CheckBoxField DataField="professional" HeaderText="professional" 
                SortExpression="professional" />
            <asp:CheckBoxField DataField="leadership" HeaderText="leadership" 
                SortExpression="leadership" />
            <asp:CheckBoxField DataField="communication" HeaderText="communication" 
                SortExpression="communication" />
            <asp:CheckBoxField DataField="comprehension" HeaderText="comprehension" 
                SortExpression="comprehension" />
            <asp:CheckBoxField DataField="expression" HeaderText="expression" 
                SortExpression="expression" />
            <asp:CheckBoxField DataField="initiative" HeaderText="initiative" 
                SortExpression="initiative" />
            <asp:CheckBoxField DataField="self_enhancement" HeaderText="self_enhancement" 
                SortExpression="self_enhancement" />
            <asp:CheckBoxField DataField="civil_responsibility" 
                HeaderText="civil_responsibility" SortExpression="civil_responsibility" />
            <asp:CheckBoxField DataField="language" HeaderText="language" 
                SortExpression="language" />
            <asp:CheckBoxField DataField="it_application" HeaderText="it_application" 
                SortExpression="it_application" />
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
        ConnectionString="<%$ ConnectionStrings:EPConnectionString4 %>" 
        SelectCommand="SELECT [experience_name], [professional], [leadership], [communication], [comprehension], [expression], [initiative], [self_enhancement], [civil_responsibility], [language], [it_application], [id] FROM [abilityMatrix] WHERE ([pess_cod] = @pess_cod)">
        <SelectParameters>
            <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString4 %>" 
        
        
        
        
        SelectCommand="SELECT [experience_name], [professional], [leadership], [communication], [comprehension], [expression], [initiative], [self_enhancement], [civil_responsibility], [language], [it_application], [id] FROM [abilityMatrix] WHERE ([id] = @id)" 
        DeleteCommand="DELETE FROM [abilityMatrix] WHERE [id] = @id" 
        InsertCommand="INSERT INTO [abilityMatrix] ([experience_name], [professional], [leadership], [communication], [comprehension], [expression], [initiative], [self_enhancement], [civil_responsibility], [language], [it_application]) VALUES (@experience_name, @professional, @leadership, @communication, @comprehension, @expression, @initiative, @self_enhancement, @civil_responsibility, @language, @it_application)" 
        
        UpdateCommand="UPDATE [abilityMatrix] SET [experience_name] = @experience_name, [professional] = @professional, [leadership] = @leadership, [communication] = @communication, [comprehension] = @comprehension, [expression] = @expression, [initiative] = @initiative, [self_enhancement] = @self_enhancement, [civil_responsibility] = @civil_responsibility, [language] = @language, [it_application] = @it_application WHERE [id] = @id">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="experience_name" Type="String" />
            <asp:Parameter Name="professional" Type="Boolean" />
            <asp:Parameter Name="leadership" Type="Boolean" />
            <asp:Parameter Name="communication" Type="Boolean" />
            <asp:Parameter Name="comprehension" Type="Boolean" />
            <asp:Parameter Name="expression" Type="Boolean" />
            <asp:Parameter Name="initiative" Type="Boolean" />
            <asp:Parameter Name="self_enhancement" Type="Boolean" />
            <asp:Parameter Name="civil_responsibility" Type="Boolean" />
            <asp:Parameter Name="language" Type="Boolean" />
            <asp:Parameter Name="it_application" Type="Boolean" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="id" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="experience_name" Type="String" />
            <asp:Parameter Name="professional" Type="Boolean" />
            <asp:Parameter Name="leadership" Type="Boolean" />
            <asp:Parameter Name="communication" Type="Boolean" />
            <asp:Parameter Name="comprehension" Type="Boolean" />
            <asp:Parameter Name="expression" Type="Boolean" />
            <asp:Parameter Name="initiative" Type="Boolean" />
            <asp:Parameter Name="self_enhancement" Type="Boolean" />
            <asp:Parameter Name="civil_responsibility" Type="Boolean" />
            <asp:Parameter Name="language" Type="Boolean" />
            <asp:Parameter Name="it_application" Type="Boolean" />
            <asp:Parameter Name="id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" 
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
            <asp:TemplateField HeaderText="experience_name" 
                SortExpression="experience_name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" ReadOnly="True" 
                        Text='<%# Bind("experience_name") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" ReadOnly="True" 
                        Text='<%# Bind("experience_name") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("experience_name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CheckBoxField DataField="professional" HeaderText="professional" 
                SortExpression="professional" />
            <asp:CheckBoxField DataField="leadership" HeaderText="leadership" 
                SortExpression="leadership" />
            <asp:CheckBoxField DataField="communication" HeaderText="communication" 
                SortExpression="communication" />
            <asp:CheckBoxField DataField="comprehension" HeaderText="comprehension" 
                SortExpression="comprehension" />
            <asp:CheckBoxField DataField="expression" HeaderText="expression" 
                SortExpression="expression" />
            <asp:CheckBoxField DataField="initiative" HeaderText="initiative" 
                SortExpression="initiative" />
            <asp:CheckBoxField DataField="self_enhancement" HeaderText="self_enhancement" 
                SortExpression="self_enhancement" />
            <asp:CheckBoxField DataField="civil_responsibility" 
                HeaderText="civil_responsibility" SortExpression="civil_responsibility" />
            <asp:CheckBoxField DataField="language" HeaderText="language" 
                SortExpression="language" />
            <asp:CheckBoxField DataField="it_application" HeaderText="it_application" 
                SortExpression="it_application" />
            <asp:CommandField ShowEditButton="True" />
        </Fields>
        <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <InsertRowStyle BackColor="#0095CD" />
        <PagerStyle BackColor="#0095CD" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
    </asp:DetailsView>
     
  
    
      
    </form>
</body>
</html>
