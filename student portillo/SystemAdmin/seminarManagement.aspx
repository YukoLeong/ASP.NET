<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="seminarManagement.aspx.vb" Inherits="ep.seminarManagement" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <style type="text/css">

         .style1
        {
            font-family: "Berlin Sans FB";
            font-size: xx-large;
        }
    </style>
    <link rel="stylesheet" href="../button.css" type="text/css" media="screen" />
</head>
<body background="../images/background.gif">
    <form id="form1" runat="server">
    <div>
      <span class="style1">Seminar Management</span>
        <asp:LinkButton ID="LinkButton2" runat="server" CssClass="blue" 
                  style="margin-left: 118px" Font-Size="Large">Home</asp:LinkButton>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Seminar" 
            style="margin-left: 243px" CssClass="blue" />
        <asp:Button ID="Button2" runat="server" Text="Seminar Attribute" 
            style="margin-left: 342px" CssClass="blue" />
       
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">
        <br />
             <asp:Label ID="Label1" runat="server" Font-Bold="True" 
            Text="Seminar:" Font-Size="Larger"></asp:Label>
                <br />
         <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
            DataKeyNames="id" DataSourceID="SqlDataSource1" ForeColor="#333333" 
            GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="topicName" HeaderText="topicName" 
                    SortExpression="topicName" />
                <asp:BoundField DataField="category" HeaderText="category" 
                    SortExpression="category" />
                <asp:BoundField DataField="startDate" HeaderText="startDate" 
                    SortExpression="startDate" />
                <asp:BoundField DataField="duration" HeaderText="duration" 
                    SortExpression="duration" />
                <asp:BoundField DataField="organizer" HeaderText="organizer" 
                    SortExpression="organizer" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#0095CD" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#0095CD" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#0095CD" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" 
            AutoGenerateRows="False" CellPadding="4" DataKeyNames="id" 
            DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" 
            Height="50px" Width="857px">
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
            <EditRowStyle BackColor="#0095CD" />
            <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="topicName" HeaderText="topicName" 
                    SortExpression="topicName" />
                <asp:BoundField DataField="category" HeaderText="category" 
                    SortExpression="category" />
                <asp:BoundField DataField="startDate" HeaderText="startDate" 
                    SortExpression="startDate" />
                <asp:BoundField DataField="duration" HeaderText="duration" 
                    SortExpression="duration" />
                <asp:BoundField DataField="organizer" HeaderText="organizer" 
                    SortExpression="organizer" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                    ShowInsertButton="True" />
            </Fields>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <InsertRowStyle BackColor="#0095CD" />
            <PagerStyle BackColor="#0095CD" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
        </asp:DetailsView>
     
    
        
           <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:EPConnectionString4 %>" 
            SelectCommand="SELECT * FROM [Seminar_Info]"></asp:SqlDataSource>
        
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:EPConnectionString4 %>" 
            DeleteCommand="DELETE FROM [Seminar_Info] WHERE [id] = @id" 
            InsertCommand="INSERT INTO [Seminar_Info] ([topicName], [category], [startDate], [duration], [organizer]) VALUES (@topicName, @category, @startDate, @duration, @organizer)" 
            SelectCommand="SELECT * FROM [Seminar_Info] WHERE ([id] = @id)" 
            UpdateCommand="UPDATE [Seminar_Info] SET [topicName] = @topicName, [category] = @category, [startDate] = @startDate, [duration] = @duration, [organizer] = @organizer WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="topicName" Type="String" />
                <asp:Parameter Name="category" Type="String" />
                <asp:Parameter DbType="Date" Name="startDate" />
                <asp:Parameter Name="duration" Type="Int32" />
                <asp:Parameter Name="organizer" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="id" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="topicName" Type="String" />
                <asp:Parameter Name="category" Type="String" />
                <asp:Parameter DbType="Date" Name="startDate" />
                <asp:Parameter Name="duration" Type="Int32" />
                <asp:Parameter Name="organizer" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
         </asp:View>
         <asp:View ID="View2" runat="server">
               <br />
            <asp:Label ID="Label2" runat="server" Font-Bold="True" 
            Text="Seminar Attribute:" Font-Size="Larger"></asp:Label>
                <br />
            <asp:DetailsView ID="DetailsView2" runat="server" AllowPaging="True" 
            AutoGenerateRows="False" CellPadding="4" DataKeyNames="id" 
            DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" 
            Height="50px" Width="125px">
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
            <EditRowStyle BackColor="#0095CD" />
            <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="atribute" HeaderText="atribute" 
                    SortExpression="atribute" />
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
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                    ShowInsertButton="True" />
            </Fields>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <InsertRowStyle BackColor="#0095CD" />
            <PagerStyle BackColor="#0095CD" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:EPConnectionString4 %>" 
            DeleteCommand="DELETE FROM [seminarAttribute] WHERE [id] = @id" 
            InsertCommand="INSERT INTO [seminarAttribute] ([atribute], [professional], [leadership], [communication], [comprehension], [expression], [initiative], [self_enhancement], [civil_responsibility], [language], [it_application]) VALUES (@atribute, @professional, @leadership, @communication, @comprehension, @expression, @initiative, @self_enhancement, @civil_responsibility, @language, @it_application)" 
            SelectCommand="SELECT * FROM [seminarAttribute]" 
            UpdateCommand="UPDATE [seminarAttribute] SET [atribute] = @atribute, [professional] = @professional, [leadership] = @leadership, [communication] = @communication, [comprehension] = @comprehension, [expression] = @expression, [initiative] = @initiative, [self_enhancement] = @self_enhancement, [civil_responsibility] = @civil_responsibility, [language] = @language, [it_application] = @it_application WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="atribute" Type="String" />
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
            <UpdateParameters>
                <asp:Parameter Name="atribute" Type="String" />
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
          </asp:View>
        </asp:MultiView>
       
     

    </div>
    </form>
</body>
</html>
