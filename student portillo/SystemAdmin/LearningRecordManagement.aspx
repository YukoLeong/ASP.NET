<%@ Page Language="VB" AutoEventWireup="false" CodeFile="LearningRecordManagement.aspx.vb" Inherits="SystemAdmin_LearningRecordManagement" %>

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
  <link rel="stylesheet" href="../grid.css" type="text/css" media="screen" />  
</head>
<body background="images/studentWork2.gif">
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
   <br />
    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="blue" 
                  style="margin-left: 432px" Font-Size="Large">Home</asp:LinkButton>
    <br />
    <br />
    
    <span class="style1">Learning Record Attribute</span>
     <br />
     <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" 
        EmptyDataText="There are no data records to display." 
        GridLines="Horizontal" 
        style="z-index: 1; left: 15px; top: 75px;  " 
        Font-Names="Calibri" Font-Size="Small" Height="114px" 
        Width="1024px" CssClass="GridViewStyle" DataKeyNames="experience_id">
            <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" SelectText="Detail" >
            <ItemStyle ForeColor="#0095CD" />
            </asp:CommandField>
            <asp:BoundField DataField="experience_id" HeaderText="ID" 
                SortExpression="experience_id" />
            <asp:BoundField DataField="Learning_Experience" 
                HeaderText="Learning_Experience" SortExpression="Learning_Experience" >
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:CheckBoxField DataField="Professional_Competence" HeaderText="Professional Competence" 
                SortExpression="Professional_Competence" >
            <HeaderStyle HorizontalAlign="Left" />
            <ItemStyle Width="10%" />
            </asp:CheckBoxField>
            <asp:CheckBoxField DataField="Leadership" HeaderText="Leadership" 
                SortExpression="Leadership" >
            <HeaderStyle HorizontalAlign="Left" />
            <ItemStyle Width="10%" />
            </asp:CheckBoxField>
            <asp:CheckBoxField DataField="Communication" HeaderText="Communication" 
                SortExpression="Communication" >
            <HeaderStyle HorizontalAlign="Left" />
            <ItemStyle Width="10%" />
            </asp:CheckBoxField>
            <asp:CheckBoxField DataField="Creativity" HeaderText="Creativity" 
                SortExpression="Creativity" >
            <HeaderStyle HorizontalAlign="Left" />
            <ItemStyle Width="10%" />
            </asp:CheckBoxField>
            <asp:CheckBoxField DataField="Self_Development" HeaderText="Self Development" 
                SortExpression="Self_Development" >
            <HeaderStyle HorizontalAlign="Left" />
            <ItemStyle Width="10%" />
            </asp:CheckBoxField>
            <asp:CheckBoxField DataField="Social_Responsibility" HeaderText="Social Responsibility" 
                SortExpression="Social_Responsibility" >
            <HeaderStyle HorizontalAlign="Left" />
            <ItemStyle Width="10%" />
            </asp:CheckBoxField>
            <asp:CheckBoxField DataField="Language" HeaderText="Language" 
                SortExpression="Language" >
            <HeaderStyle HorizontalAlign="Left" />
            <ItemStyle Width="10%" />
            </asp:CheckBoxField>
            <asp:CheckBoxField DataField="IT_Application" HeaderText="IT Application" 
                SortExpression="IT_Application" >
            <HeaderStyle HorizontalAlign="Left" />
            <ItemStyle Width="10%" />
            </asp:CheckBoxField>
        </Columns>
            <HeaderStyle CssClass="GridViewHeaderStyle" ForeColor="White" />
            <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
            <RowStyle CssClass="GridViewRowStyle" />
            <SortedAscendingCellStyle CssClass="GridViewSortStyle" />
            <SortedAscendingHeaderStyle CssClass="GridViewSortHeaderStyle" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
        
                
                
        SelectCommand="SELECT Learning_Records_Attribute.experience_id,Learning_Records_Experience.Learning_Experience,Learning_Records_Attribute.Professional_Competence,Learning_Records_Attribute.Leadership,Learning_Records_Attribute.Communication,Learning_Records_Attribute.Creativity,Learning_Records_Attribute.Self_Development,Learning_Records_Attribute.Social_Responsibility,Learning_Records_Attribute.Language,Learning_Records_Attribute.IT_Application FROM [Learning_Records_Attribute],[Learning_Records_Experience] where Learning_Records_Attribute.experience_id=Learning_Records_Experience.id">
    </asp:SqlDataSource>
  
    
      
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
        DeleteCommand="DELETE FROM [Learning_Records_Attribute] WHERE [experience_id] = @id
DELETE FROM [Learning_Records_Experience] WHERE [id] = @id

" 
        InsertCommand="INSERT INTO [Learning_Records_Experience] (id,Learning_Experience) VALUES(@experience_id,@Learning_Experience)
INSERT INTO [Learning_Records_Attribute] ([experience_id], [Professional_Competence], [Leadership], [Communication], [Creativity], [Initiative], [Self_Development], [Social_Responsibility], [Language], [IT_Application]) VALUES (@experience_id, @Professional_Competence, @Leadership, @Communication, @Creativity, @Initiative, @Self_Development, @Social_Responsibility, @Language, @IT_Application)


" 
        SelectCommand="
SELECT Learning_Records_Attribute.experience_id,Learning_Records_Experience.Learning_Experience,Learning_Records_Attribute.Professional_Competence,Learning_Records_Attribute.Leadership,Learning_Records_Attribute.Communication,Learning_Records_Attribute.Creativity,Learning_Records_Attribute.Self_Development,Learning_Records_Attribute.Social_Responsibility,Learning_Records_Attribute.Language,Learning_Records_Attribute.IT_Application FROM [Learning_Records_Attribute],[Learning_Records_Experience] where Learning_Records_Attribute.experience_id=Learning_Records_Experience.id and Learning_Records_Attribute.experience_id = @id" 
        
        
        
        
        
        
        
        UpdateCommand="UPDATE [Learning_Records_Attribute] SET  Learning_Records_Attribute.Professional_Competence = @Professional_Competence, Learning_Records_Attribute.Leadership= @Leadership, Learning_Records_Attribute.Communication = @Communication, Learning_Records_Attribute.Creativity = @Creativity, Learning_Records_Attribute.Initiative = @Initiative, Learning_Records_Attribute.Self_Development = @Self_Development, Learning_Records_Attribute.Social_Responsibility = @Social_Responsibility, Learning_Records_Attribute.Language = @Language, Learning_Records_Attribute.IT_Application = @IT_Application  from Learning_Records_Attribute,Learning_Records_Experience WHERE Learning_Records_Attribute.experience_id=Learning_Records_Experience.id and Learning_Records_Attribute.experience_id= @id

UPDATE Learning_Records_Experience set Learning_Records_Experience.Learning_Experience=@Learning_Experience  from Learning_Records_Attribute,Learning_Records_Experience WHERE Learning_Records_Attribute.experience_id=Learning_Records_Experience.id and Learning_Records_Attribute.experience_id = @id">
        <DeleteParameters>
             <asp:ControlParameter ControlID="GridView1" Name="id" 
                PropertyName="SelectedValue" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="experience_id" Type="Int32" />
            <asp:Parameter Name="Learning_Experience" Type="String" />
            <asp:Parameter Name="Professional_Competence" Type="Boolean" />
            <asp:Parameter Name="Leadership" Type="Boolean" />
            <asp:Parameter Name="Communication" Type="Boolean" />
            <asp:Parameter Name="Creativity" Type="Boolean" />
            <asp:Parameter Name="Initiative" Type="Boolean" />
            <asp:Parameter Name="Self_Development" Type="Boolean" />
            <asp:Parameter Name="Social_Responsibility" Type="Boolean" />
            <asp:Parameter Name="Language" Type="Boolean" />
            <asp:Parameter Name="IT_Application" Type="Boolean" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="id" 
                PropertyName="SelectedValue" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Professional_Competence" Type="Boolean" />
             <asp:Parameter Name="Leadership" Type="Boolean" />
            <asp:Parameter Name="Communication" Type="Boolean" />
            <asp:Parameter Name="Creativity" Type="Boolean" />
            <asp:Parameter Name="Initiative" Type="Boolean" />
            <asp:Parameter Name="Self_Development" Type="Boolean" />
            <asp:Parameter Name="Social_Responsibility" Type="Boolean" />
            <asp:Parameter Name="Language" Type="Boolean" />
            <asp:Parameter Name="IT_Application" Type="Boolean" />
          <asp:ControlParameter ControlID="GridView1" Name="id" 
                PropertyName="SelectedValue" />
            <asp:Parameter Name="Learning_Experience" Type="String"/>
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
        SelectCommand="SELECT * FROM [Learning_Records_Experience]">
    </asp:SqlDataSource>
    <br />
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                SelectCommand="SELECT * FROM [userGroup] WHERE ([id] = @id)">
                <SelectParameters>
                    <asp:SessionParameter Name="id" SessionField="Role_Type" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
        DataSourceID="SqlDataSource2" Height="50px" 
        Width="375px" CssClass="GridViewStyle" GridLines="Horizontal">
        <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle2" />
        <Fields>
            <asp:TemplateField HeaderText="ID" SortExpression="experience_id">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("experience_id") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("experience_id") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("experience_id") %>'></asp:TextBox>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Learning_Experience" 
                HeaderText="Learning_Experience" SortExpression="Learning_Experience" />
            <asp:CheckBoxField DataField="Professional_Competence" 
                HeaderText="Professional_Competence" SortExpression="Professional_Competence" />
            <asp:CheckBoxField DataField="Leadership" HeaderText="Leadership" 
                SortExpression="Leadership" />
            <asp:CheckBoxField DataField="Communication" HeaderText="Communication" 
                SortExpression="Communication" />
            <asp:CheckBoxField DataField="Creativity" HeaderText="Creativity" 
                SortExpression="Creativity" />
            <asp:CheckBoxField DataField="Self_Development" HeaderText="Self_Development" 
                SortExpression="Self_Development" />
            <asp:CheckBoxField DataField="Social_Responsibility" 
                HeaderText="Social_Responsibility" SortExpression="Social_Responsibility" />
            <asp:CheckBoxField DataField="Language" HeaderText="Language" 
                SortExpression="Language" />
            <asp:CheckBoxField DataField="IT_Application" HeaderText="IT_Application" 
                SortExpression="IT_Application" />
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                        CommandName="Edit" ForeColor="#0095CD" Text="Edit"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                        CommandName="New" ForeColor="#0095CD" Text="New"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" 
                        CommandName="Delete" OnClientClick="ConfirmMessage();" ForeColor="#0095CD" Text="Delete"></asp:LinkButton>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                        CommandName="Update" ForeColor="#0095CD" Text="Update"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                        CommandName="Cancel" ForeColor="#0095CD" Text="Cancel"></asp:LinkButton>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                        CommandName="Insert" ForeColor="#0095CD" Text="Insert"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                        CommandName="Cancel" ForeColor="#0095CD" Text="Cancel"></asp:LinkButton>
                </InsertItemTemplate>
            </asp:TemplateField>
        </Fields>
        <RowStyle CssClass="GridViewRowStyle2" />
    </asp:DetailsView>
   <asp:hiddenfield ID="message" runat="server"></asp:hiddenfield>
    
      
    <asp:Button ID="Button1" runat="server" CssClass="blue" Text="Back" 
        Visible="False" />
    <br />
  
    
      
    </form>
</body>
</html>
