<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Learning.aspx.vb" Inherits="ep.LearningRecords" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit.HTMLEditor" tagprefix="cc1" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">

        .style2
        {
            font-family: "Berlin Sans FB";
            font-size: xx-large;
        }
        .style1
        {
            font-family: "Berlin Sans FB";
            font-size: x-large;
        }
        .style3
        {
            width: 100%;
        }
        </style>
        <link rel="stylesheet" href="../button.css" type="text/css" media="screen" />
        <link rel="stylesheet" href="../button1.css" type="text/css" media="screen" />
</head>
<body background="images/Learning.gif">
    <form id="form1" runat="server">
    <div>
    
        <span class="style2">Learning Records  
          <asp:LinkButton ID="LinkButton1" runat="server" CssClass="blue" 
                  style="margin-left: 232px" Font-Size="Large">Home</asp:LinkButton>
        </span><br class="style1" />
    
    </div>
    <br />
    
    
    <br />
    
   
    <table class="style3">
        <tr>
            <td>
     <asp:Button ID="Button1" runat="server" Text="Seminar &amp; Conference" 
        CssClass="blue" />
            </td>
            <td>
                <asp:Button ID="Button2" runat="server" Text="Professional Certificate" 
        CssClass="blue" />
            </td>
            <td>
    <asp:Button ID="Button3" runat="server" 
        Text="Competition/Exhibition Participation Results" CssClass="blue" />
            </td>
            <td>
              <asp:Button ID="Button4" runat="server" Text="Library Record" CssClass="blue" /></td>
            <td>
                  <asp:Button ID="Button5" runat="server" Text="Awards" CssClass="blue" /></td>
            <td>
                  <asp:Button ID="Button6" runat="server" Text="Study Abroad/Tour" 
        CssClass="blue" /></td>
            <td>
                <asp:Button ID="Button7" runat="server" Text="Internship" CssClass="blue" /></td>
        </tr>
    </table>
    
    
   
    <br />
&nbsp;&nbsp;
    &nbsp;
    &nbsp;

    &nbsp;
 
    &nbsp;
  
    <br />
    <br />
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="ViewMonograph" runat="server">
            <span class="style1">Seminar &amp; Conference<br /> </span>
            <asp:GridView ID="GridViewSeminar" runat="server" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" 
                EmptyDataText="There are no data records to display." ForeColor="#333333" 
                GridLines="None" PageSize="6" Font-Names="Calibri" Font-Size="Small">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="topicName" HeaderText="Topic" 
                        SortExpression="topicName" />
                    <asp:BoundField DataField="category" HeaderText="Category" 
                        SortExpression="category" />
                    <asp:BoundField DataField="startDate" HeaderText="Date" 
                        SortExpression="startDate" DataFormatString="{0:d}" />
                    <asp:BoundField DataField="organizer" HeaderText="Organizer" 
                        SortExpression="organizer" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <EmptyDataTemplate>
                    There are no data records to display.
                </EmptyDataTemplate>
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
                ConnectionString="<%$ ConnectionStrings:EPConnectionString1 %>" 
                ProviderName="<%$ ConnectionStrings:EPConnectionString1.ProviderName %>" 
                SelectCommand="SELECT * FROM [Seminar] WHERE ([pess_cod] = @pess_cod)">
                <SelectParameters>
                    <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            <br />
        </asp:View>
        <asp:View ID="ViewProfessional" runat="server">
            <span class="style1">Professional Certificate</span><br />
            <asp:GridView ID="GridViewProfessional" runat="server" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                DataKeyNames="id" DataSourceID="SqlDataSource2" 
                EmptyDataText="There are no data records to display." ForeColor="#333333" 
                GridLines="None" Font-Names="Calibri" Font-Size="Small">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" SelectText="Detail" />
                    <asp:BoundField DataField="certName" HeaderText="Certificate Name" 
                        SortExpression="certName" />
                    <asp:BoundField DataField="courseName" HeaderText="Course Name" 
                        SortExpression="courseName" />
                    <asp:BoundField DataField="courseType" HeaderText="Course Type" 
                        SortExpression="courseType" />
                    <asp:BoundField DataField="organizer" HeaderText="Organizer" 
                        SortExpression="organizer" />
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
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString1 %>" 
                DeleteCommand="DELETE FROM [ProfessionalCert] WHERE [id] = @id" 
                InsertCommand="INSERT INTO [ProfessionalCert] ([pess_cod], [certName], [courseName], [courseType], [duration], [organizer], [certDate], [endDate], [category]) VALUES (@pess_cod, @certName, @courseName, @courseType, @duration, @organizer, @certDate, @endDate, @category)" 
                ProviderName="<%$ ConnectionStrings:EPConnectionString1.ProviderName %>" 
                SelectCommand="SELECT [id], [pess_cod], [certName], [courseName], [courseType], [duration], [organizer], [certDate], [endDate], [category] FROM [ProfessionalCert] WHERE ([pess_cod] = @pess_cod)" 
                UpdateCommand="UPDATE [ProfessionalCert] SET [pess_cod] = @pess_cod, [certName] = @certName, [courseName] = @courseName, [courseType] = @courseType, [duration] = @duration, [organizer] = @organizer, [certDate] = @certDate, [endDate] = @endDate, [category] = @category WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="pess_cod" Type="Decimal" />
                    <asp:Parameter Name="certName" Type="String" />
                    <asp:Parameter Name="courseName" Type="String" />
                    <asp:Parameter Name="courseType" Type="String" />
                    <asp:Parameter Name="duration" Type="Double" />
                    <asp:Parameter Name="organizer" Type="String" />
                    <asp:Parameter DbType="Date" Name="certDate" />
                    <asp:Parameter DbType="Date" Name="endDate" />
                    <asp:Parameter Name="category" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="pess_cod" Type="Decimal" />
                    <asp:Parameter Name="certName" Type="String" />
                    <asp:Parameter Name="courseName" Type="String" />
                    <asp:Parameter Name="courseType" Type="String" />
                    <asp:Parameter Name="duration" Type="Double" />
                    <asp:Parameter Name="organizer" Type="String" />
                    <asp:Parameter DbType="Date" Name="certDate" />
                    <asp:Parameter DbType="Date" Name="endDate" />
                    <asp:Parameter Name="category" Type="String" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
                
            </asp:SqlDataSource>
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <br />
        <asp:Button ID="Button8" runat="server" Text="Certificate Upload" CssClass="blue" />
            <asp:Label ID="Label1" runat="server" CssClass="style2" ForeColor="Red"></asp:Label>
            <br />
            <asp:SqlDataSource ID="SqlDataSource9" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString1 %>" 
                DeleteCommand="DELETE FROM [ProfessionalCert] WHERE [id] = @id
update Learning_Records_Correspond set Professional_Certificate = Professional_Certificate - 1 where PESS_COD=@pess_cod"
                 
                InsertCommand="INSERT INTO [ProfessionalCert] ([pess_cod], [certName], [courseName], [courseType], [duration], [organizer], [certDate], [endDate], [category]) VALUES (@pess_cod, @certName, @courseName, @courseType, @duration, @organizer, @certDate, @endDate, @category)
update Learning_Records_Correspond set Professional_Certificate =Professional_Certificate + 1 where PESS_COD=@pess_cod" 
                SelectCommand="SELECT * FROM [ProfessionalCert] WHERE ([id] = @id)" 
                
                UpdateCommand="UPDATE [ProfessionalCert] SET [pess_cod] = @pess_cod, [certName] = @certName, [courseName] = @courseName, [courseType] = @courseType, [duration] = @duration, [organizer] = @organizer, [certDate] = @certDate, [endDate] = @endDate, [category] = @category WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                    <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
                    <asp:Parameter Name="certName" Type="String" />
                    <asp:Parameter Name="courseName" Type="String" />
                    <asp:Parameter Name="courseType" Type="String" />
                    <asp:Parameter Name="duration" Type="Double" />
                    <asp:Parameter Name="organizer" Type="String" />
                    <asp:Parameter DbType="Date" Name="certDate" />
                    <asp:Parameter DbType="Date" Name="endDate" />
                    <asp:Parameter Name="category" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridViewProfessional" Name="id" 
                        PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
                    <asp:Parameter Name="certName" Type="String" />
                    <asp:Parameter Name="courseName" Type="String" />
                    <asp:Parameter Name="courseType" Type="String" />
                    <asp:Parameter Name="duration" Type="Double" />
                    <asp:Parameter Name="organizer" Type="String" />
                    <asp:Parameter DbType="Date" Name="certDate" />
                    <asp:Parameter DbType="Date" Name="endDate" />
                    <asp:Parameter Name="category" Type="String" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:DetailsView ID="DetailsViewProfessional" runat="server" AllowPaging="True" 
                AutoGenerateRows="False" CellPadding="4" 
                DataKeyNames="id" DataSourceID="SqlDataSource9" Height="50px" 
                Width="578px" Font-Names="Calibri" Font-Size="Small" ForeColor="#333333" 
                GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                <EditRowStyle BackColor="#0095CD" />
                <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                <Fields>
                   
                    <asp:BoundField DataField="certName" HeaderText="Certificate Name" 
                        SortExpression="certName" />
                    <asp:BoundField DataField="courseName" HeaderText="Course Name" 
                        SortExpression="courseName" />
                    <asp:BoundField DataField="courseType" HeaderText="Course Type" 
                        SortExpression="courseType" />
                    <asp:BoundField DataField="organizer" HeaderText="Organizer" 
                        SortExpression="organizer" />
                 
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                        ShowInsertButton="True" />
                 
                </Fields>
                <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <InsertRowStyle BackColor="#0095CD" />
                <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#0095CD" />
                <RowStyle BackColor="#EFF3FB" />
            </asp:DetailsView>
            <br />
            <br />
            <br />
        </asp:View>
        <asp:View ID="ViewMatch" runat="server">
            <span class="style1">Competition/Exhibition Participation Results<br /> </span>
            <asp:GridView ID="GridViewMatch" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="id" DataSourceID="SqlDataSource3" CellPadding="4" 
                ForeColor="#333333" GridLines="None" AllowPaging="True" 
                AllowSorting="True">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField SelectText="Detail" ShowSelectButton="True" />
                    <asp:BoundField DataField="matchName" HeaderText="Competition/Exhibition Participation" 
                        SortExpression="matchName" />
                    <asp:BoundField DataField="Date" HeaderText="Date" ReadOnly="True" 
                        SortExpression="Date" />
                    <asp:BoundField DataField="category" HeaderText="Category" 
                        SortExpression="category" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
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
            
                SelectCommand="SELECT [id], [pess_cod], [matchName], CONVERT(VARCHAR(10),dateMatch,103) AS Date, [category] FROM [MatchRecord]WHERE pess_cod=@pess_cod">
                <SelectParameters>
                    <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" />
                </SelectParameters>
        </asp:SqlDataSource>
            <br />
            <br />
            <asp:SqlDataSource ID="SqlDataSource10" runat="server" 
                  ConnectionString="<%$ ConnectionStrings:EPConnectionString4 %>" 
            SelectCommand="SELECT * FROM [MatchRecord] WHERE ([id] = @id)" 
                DeleteCommand="DELETE FROM [MatchRecord] WHERE [id] = @id" 
                InsertCommand="INSERT INTO [MatchRecord] ([pess_cod], [matchName], [dateMatch], [category], [position], [description]) VALUES (@pess_cod, @matchName, @dateMatch, @category, @position, @description)" 
                UpdateCommand="UPDATE [MatchRecord] SET [pess_cod] = @pess_cod, [matchName] = @matchName, [dateMatch] = @dateMatch, [category] = @category, [position] = @position, [description] = @description WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="pess_cod" Type="Decimal" />
                    <asp:Parameter Name="matchName" Type="String" />
                    <asp:Parameter DbType="Date" Name="dateMatch" />
                    <asp:Parameter Name="category" Type="String" />
                    <asp:Parameter Name="position" Type="Decimal" />
                    <asp:Parameter Name="description" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridViewMatch" Name="id" 
                        PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="pess_cod" Type="Decimal" />
                    <asp:Parameter Name="matchName" Type="String" />
                    <asp:Parameter DbType="Date" Name="dateMatch" />
                    <asp:Parameter Name="category" Type="String" />
                    <asp:Parameter Name="position" Type="Decimal" />
                    <asp:Parameter Name="description" Type="String" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
        </asp:SqlDataSource>
            <asp:DetailsView ID="DetailsViewMatch" runat="server" AllowPaging="True" 
                AutoGenerateRows="False" CellPadding="4" DataKeyNames="id" 
                DataSourceID="SqlDataSource10" GridLines="None" Height="50px" 
                Width="580px" Font-Names="Calibri" Font-Size="Small" ForeColor="#333333">
                <AlternatingRowStyle BackColor="White" />
                <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                <EditRowStyle BackColor="#0095CD" />
                <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                <Fields>
                
                    <asp:BoundField DataField="matchName" HeaderText="Competition/Exhibition Participation" 
                        SortExpression="matchName" />
                    <asp:BoundField DataField="dateMatch" HeaderText="Date" 
                        SortExpression="dateMatch" />
                    <asp:BoundField DataField="category" HeaderText="Category" 
                        SortExpression="category" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                        ShowInsertButton="True" />
                </Fields>
                <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <InsertRowStyle BackColor="#0095CD" />
                <PagerStyle BackColor="#0095CD" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
            </asp:DetailsView>
            <asp:Button ID="Button9" runat="server" CssClass="blue" Text="Update" />
            <br />
            <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
            </asp:ToolkitScriptManager>
            
            
            <span class="style1">Competition/Exhibition Description</span><cc1:Editor ID="Editor1" 
                runat="server" Height="200px" Width="550px" />
        </asp:View>
        <asp:View ID="ViewReading" runat="server">
            <span class="style1">Library Record<br /> </span>
            <asp:GridView ID="GridViewReading" runat="server" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                DataKeyNames="id" DataSourceID="SqlDataSource4" 
                EmptyDataText="There are no data records to display." ForeColor="#333333" 
                GridLines="None" PageSize="6" Font-Names="Calibri" Font-Size="Small">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" SelectText="Detail" />
                    <asp:BoundField DataField="bookName" HeaderText="Book Name" 
                        SortExpression="bookName" />
                    <asp:BoundField DataField="author" HeaderText="Author" 
                        SortExpression="author" />
                    <asp:BoundField DataField="version" HeaderText="Version" 
                        SortExpression="version" />
                    <asp:BoundField DataField="publisher" HeaderText="Publisher" 
                        SortExpression="publisher" />
                    <asp:BoundField DataField="isbn" HeaderText="ISBN" SortExpression="isbn" />
                    <asp:BoundField DataField="category" HeaderText="Category" 
                        SortExpression="category" />
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
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString1 %>" 
                ProviderName="<%$ ConnectionStrings:EPConnectionString1.ProviderName %>" 
                
                SelectCommand="SELECT * FROM [ReadingRecord] WHERE ([pess_cod] = @pess_cod)">
                <SelectParameters>
                    <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            <asp:DetailsView ID="DetailsViewReading" runat="server" AllowPaging="True" 
                AutoGenerateRows="False" CellPadding="4" DataKeyNames="id" 
                DataSourceID="SqlDataSource11" Height="50px" Width="579px" 
                Font-Names="Calibri" Font-Size="Small" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                <EditRowStyle BackColor="#0095CD" />
                <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                <Fields>
                  
                    <asp:BoundField DataField="bookName" HeaderText="Book Name" 
                        SortExpression="bookName" />
                    <asp:BoundField DataField="author" HeaderText="Author" 
                        SortExpression="author" />
                    <asp:BoundField DataField="version" HeaderText="Version" 
                        SortExpression="version" />
                    <asp:BoundField DataField="publisher" HeaderText="Publisher" 
                        SortExpression="publisher" />
                    <asp:BoundField DataField="isbn" HeaderText="ISBN" 
                        SortExpression="isbn" />
                    <asp:BoundField DataField="category" HeaderText="Category" 
                        SortExpression="category" />
                  
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                        ShowInsertButton="True" />
                  
                </Fields>
                <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <InsertRowStyle BackColor="#0095CD" />
                <PagerStyle BackColor="#0095CD" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
            </asp:DetailsView>
            <br />
            <asp:SqlDataSource ID="SqlDataSource11" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString1 %>" 
                DeleteCommand="DELETE FROM [ReadingRecord] WHERE [id] = @id
update Learning_Records_Correspond set Readings = Readings - 1 where PESS_COD=@pess_cod"
                InsertCommand="INSERT INTO [ReadingRecord] ([pess_cod], [bookName], [author], [version], [publisher], [isbn], [pages], [readingComment], [category]) VALUES (@pess_cod, @bookName, @author, @version, @publisher, @isbn, @pages, @readingComment, @category)
update Learning_Records_Correspond set Readings = Readings + 1 where PESS_COD=@pess_cod" 
                SelectCommand="SELECT * FROM [ReadingRecord] WHERE ([id] = @id)" 
                
                
                UpdateCommand="UPDATE [ReadingRecord] SET [pess_cod] = @pess_cod, [bookName] = @bookName, [author] = @author, [version] = @version, [publisher] = @publisher, [isbn] = @isbn, [pages] = @pages, [readingComment] = @readingComment, [category] = @category WHERE [id] = @id">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridViewReading" Name="id" 
                        PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>

                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                    <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
                    <asp:Parameter Name="bookName" Type="String" />
                    <asp:Parameter Name="author" Type="String" />
                    <asp:Parameter Name="version" Type="Decimal" />
                    <asp:Parameter Name="publisher" Type="String" />
                    <asp:Parameter Name="isbn" Type="String" />
                    <asp:Parameter Name="pages" Type="Decimal" />
                    <asp:Parameter Name="readingComment" Type="String" />
                    <asp:Parameter Name="category" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
                    <asp:Parameter Name="bookName" Type="String" />
                    <asp:Parameter Name="author" Type="String" />
                    <asp:Parameter Name="version" Type="Decimal" />
                    <asp:Parameter Name="publisher" Type="String" />
                    <asp:Parameter Name="isbn" Type="String" />
                    <asp:Parameter Name="pages" Type="Decimal" />
                    <asp:Parameter Name="readingComment" Type="String" />
                    <asp:Parameter Name="category" Type="String" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </asp:View>
        <asp:View ID="ViewAward" runat="server">
            <span class="style1">Awards<br /> </span>
            <asp:GridView ID="GridViewAward" runat="server" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                DataKeyNames="id" DataSourceID="SqlDataSource5" 
                EmptyDataText="There are no data records to display." PageSize="6" 
                Font-Names="Calibri" Font-Size="Small" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" SelectText="Detail" />
                    <asp:BoundField DataField="awardName" HeaderText="Award Name" 
                        SortExpression="awardName" />
                    <asp:BoundField DataField="dateAward" HeaderText="Date" 
                        SortExpression="dateAward" DataFormatString="{0:d}" />
                    <asp:BoundField DataField="organizer" HeaderText="Organizer" 
                        SortExpression="organizer" />
                    <asp:BoundField DataField="description" HeaderText="Description" 
                        SortExpression="description" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#0095CD" ForeColor="White" Font-Bold="True" />
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
                ConnectionString="<%$ ConnectionStrings:EPConnectionString1 %>" 
                DeleteCommand="DELETE FROM [AwardRecord] WHERE [id] = @id" 
                InsertCommand="INSERT INTO [AwardRecord] ([pess_cod], [awardName], [dateAward], [organizer], [description]) VALUES (@pess_cod, @awardName, @dateAward, @organizer, @description)" 
                ProviderName="<%$ ConnectionStrings:EPConnectionString1.ProviderName %>" 
                SelectCommand="SELECT [id], [pess_cod], [awardName], [dateAward], [organizer], [description] FROM [AwardRecord] WHERE ([pess_cod] = @pess_cod)" 
                UpdateCommand="UPDATE [AwardRecord] SET [pess_cod] = @pess_cod, [awardName] = @awardName, [dateAward] = @dateAward, [organizer] = @organizer, [description] = @description WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="pess_cod" Type="Decimal" />
                    <asp:Parameter Name="awardName" Type="String" />
                    <asp:Parameter DbType="Date" Name="dateAward" />
                    <asp:Parameter Name="organizer" Type="String" />
                    <asp:Parameter Name="description" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="pess_cod" Type="Decimal" />
                    <asp:Parameter Name="awardName" Type="String" />
                    <asp:Parameter DbType="Date" Name="dateAward" />
                    <asp:Parameter Name="organizer" Type="String" />
                    <asp:Parameter Name="description" Type="String" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            <asp:DetailsView ID="DetailsViewAward" runat="server" AllowPaging="True" 
                AutoGenerateRows="False" CellPadding="4" DataKeyNames="id" 
                DataSourceID="SqlDataSource12" ForeColor="#333333" GridLines="None" 
                Height="50px" Width="575px" Font-Names="Calibri" Font-Size="Small">
                <AlternatingRowStyle BackColor="White" />
                <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                <EditRowStyle BackColor="#0095CD" />
                <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                <Fields>
                   
                    <asp:BoundField DataField="awardName" HeaderText="Award Name" 
                        SortExpression="awardName" />
                    <asp:BoundField DataField="dateAward" HeaderText="Date" 
                        SortExpression="dateAward" />
                    <asp:BoundField DataField="organizer" HeaderText="Organizer" 
                        SortExpression="organizer" />
                    <asp:BoundField DataField="description" HeaderText="Description" 
                        SortExpression="description" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                        ShowInsertButton="True" />
                </Fields>
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <InsertRowStyle BackColor="#0095CD" />
                <PagerStyle BackColor="#0095CD" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
            </asp:DetailsView>
            <br />
            <asp:SqlDataSource ID="SqlDataSource12" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString1 %>" 
                DeleteCommand="DELETE FROM [AwardRecord] WHERE [id] = @id
update Learning_Records_Correspond set Awards = Awards - 1 where PESS_COD=@pess_cod"
                InsertCommand="INSERT INTO [AwardRecord] ([pess_cod], [awardName], [dateAward], [organizer], [description]) VALUES (@pess_cod, @awardName, @dateAward, @organizer, @description)
update Learning_Records_Correspond set Awards = Awards + 1 where PESS_COD=@pess_cod" 
                SelectCommand="SELECT * FROM [AwardRecord] WHERE ([id] = @id)" 
                
                UpdateCommand="UPDATE [AwardRecord] SET [pess_cod] = @pess_cod, [awardName] = @awardName, [dateAward] = @dateAward, [organizer] = @organizer, [description] = @description WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                    <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
                    <asp:Parameter Name="awardName" Type="String" />
                    <asp:Parameter DbType="Date" Name="dateAward" />
                    <asp:Parameter Name="organizer" Type="String" />
                    <asp:Parameter Name="description" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridViewAward" Name="id" 
                        PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
                    <asp:Parameter Name="awardName" Type="String" />
                    <asp:Parameter DbType="Date" Name="dateAward" />
                    <asp:Parameter Name="organizer" Type="String" />
                    <asp:Parameter Name="description" Type="String" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </asp:View>
        <asp:View ID="ViewAbroad" runat="server">
            <span class="style1">Study Abroad / Tour<br /> </span>
      
            <asp:GridView ID="GridViewAbroad" runat="server" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                DataKeyNames="id" DataSourceID="SqlDataSource6" 
                EmptyDataText="There are no data records to display." PageSize="6" 
                Font-Names="Calibri" Font-Size="Small" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" SelectText="Detail" />
                    <asp:BoundField DataField="country" HeaderText="Country" 
                        SortExpression="country" />
                    <asp:BoundField DataField="school" HeaderText="School" 
                        SortExpression="school" />
                    <asp:BoundField DataField="majorSubj" HeaderText="Topic / Subject" 
                        SortExpression="majorSubj" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#0095CD" ForeColor="White" Font-Bold="True" />
                <HeaderStyle BackColor="#0095CD" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#0095CD" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString1 %>" 
                ProviderName="<%$ ConnectionStrings:EPConnectionString1.ProviderName %>" 
                SelectCommand="SELECT * FROM [StudyTA] WHERE ([pess_cod] = @pess_cod)">
                <SelectParameters>
                    <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            <asp:DetailsView ID="DetailsViewAbroad" runat="server" AllowPaging="True" 
                AutoGenerateRows="False" CellPadding="4" DataKeyNames="id" 
                DataSourceID="SqlDataSource13" ForeColor="#333333" GridLines="None" Height="50px" 
                Width="613px" Font-Names="Calibri" Font-Size="Small">
                <AlternatingRowStyle BackColor="White" />
                <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                <EditRowStyle BackColor="#0095CD" />
                <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                <Fields>
                  
                    <asp:BoundField DataField="country" HeaderText="Country" 
                        SortExpression="country" />
                    <asp:BoundField DataField="school" HeaderText="School" 
                        SortExpression="school" />
                    <asp:BoundField DataField="majorSubj" HeaderText="Topic/Subject" 
                        SortExpression="majorSubj" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                        ShowInsertButton="True" />
                </Fields>
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <InsertRowStyle BackColor="#0095CD" />
                <PagerStyle BackColor="#0095CD" ForeColor="White" 
                    HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
            </asp:DetailsView>
            <br />
            <asp:SqlDataSource ID="SqlDataSource13" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString1 %>" 
                DeleteCommand="DELETE FROM [StudyTA] WHERE [id] = @id
update Learning_Records_Correspond set Study_Abroad = Study_Abroad - 1 where PESS_COD=@pess_cod" 
                InsertCommand="INSERT INTO [StudyTA] ([pess_cod], [country], [school], [majorSubj], [grade], [startDate], [endDate], [description]) VALUES (@pess_cod, @country, @school, @majorSubj, @grade, @startDate, @endDate, @description)
update Learning_Records_Correspond set Study_Abroad = Study_Abroad + 1 where PESS_COD=@pess_cod" 
                SelectCommand="SELECT * FROM [StudyTA] WHERE ([id] = @id)" 
                
                
                UpdateCommand="UPDATE [StudyTA] SET [pess_cod] = @pess_cod, [country] = @country, [school] = @school, [majorSubj] = @majorSubj, [grade] = @grade, [startDate] = @startDate, [endDate] = @endDate, [description] = @description WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                    <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
                    <asp:Parameter Name="country" Type="String" />
                    <asp:Parameter Name="school" Type="String" />
                    <asp:Parameter Name="majorSubj" Type="String" />
                    <asp:Parameter Name="grade" Type="String" />
                    <asp:Parameter DbType="Date" Name="startDate" />
                    <asp:Parameter DbType="Date" Name="endDate" />
                    <asp:Parameter Name="description" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridViewAbroad" Name="id" 
                        PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
                    <asp:Parameter Name="country" Type="String" />
                    <asp:Parameter Name="school" Type="String" />
                    <asp:Parameter Name="majorSubj" Type="String" />
                    <asp:Parameter Name="grade" Type="String" />
                    <asp:Parameter DbType="Date" Name="startDate" />
                    <asp:Parameter Name="endDate" DbType="Date" />
                    <asp:Parameter Name="description" Type="String" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <br />
        </asp:View>
        <asp:View ID="ViewIntership" runat="server">
            <span class="style1">Internship<br /> </span>
            <asp:GridView ID="GridViewIntership" runat="server" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                DataKeyNames="id" DataSourceID="SqlDataSource7" 
                EmptyDataText="There are no data records to display." PageSize="6" 
                Font-Names="Calibri" Font-Size="Small" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" SelectText="Detail" />
                    <asp:BoundField DataField="company" HeaderText="Company" 
                        SortExpression="company" />
                    <asp:BoundField DataField="jobTitle" HeaderText="Job Title" 
                        SortExpression="jobTitle" />
                    <asp:BoundField DataField="duration" HeaderText="Duration(hours)" 
                        SortExpression="duration" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#0095CD" ForeColor="White" Font-Bold="True" />
                <HeaderStyle BackColor="#0095CD" Font-Bold="True" ForeColor="White" />
                <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#0095CD" />
                <RowStyle BackColor="#EFF3FB" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource7" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString1 %>" 
                ProviderName="<%$ ConnectionStrings:EPConnectionString1.ProviderName %>" 
                SelectCommand="SELECT * FROM [Intership] WHERE ([pess_cod] = @pess_cod)">
                <SelectParameters>
                    <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            <asp:DetailsView ID="DetailsViewIntership" runat="server" AllowPaging="True" 
                AutoGenerateRows="False" CellPadding="4" 
                DataKeyNames="id" DataSourceID="SqlDataSource14" Height="50px" 
                Width="582px" Font-Names="Calibri" Font-Size="Small" ForeColor="#333333" 
                GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                <EditRowStyle BackColor="#0095CD" />
                <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                <Fields>
                   
                    <asp:BoundField DataField="company" HeaderText="Company" 
                        SortExpression="company" />
                    <asp:BoundField DataField="jobTitle" HeaderText="Job Title" 
                        SortExpression="jobTitle" />
                    <asp:BoundField DataField="duration" HeaderText="Duration(hours)" 
                        SortExpression="duration" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                        ShowInsertButton="True" />
                </Fields>
                <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <InsertRowStyle BackColor="#0095CD" />
                <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#0095CD" />
                <RowStyle BackColor="#EFF3FB" />
            </asp:DetailsView>
            <br />
            <asp:SqlDataSource ID="SqlDataSource14" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString1 %>" 
                DeleteCommand="DELETE FROM [Intership] WHERE [id] = @id
update Learning_Records_Correspond set Intership = Intership - 1 where PESS_COD=@pess_cod" 
                InsertCommand="INSERT INTO [Intership] ([pess_cod], [company], [jobTitle], [description], [startDate], [endDate], [duration]) VALUES (@pess_cod, @company, @jobTitle, @description, @startDate, @endDate, @duration)
update Learning_Records_Correspond set Intership = Intership + 1 where PESS_COD=@pess_cod" 
                SelectCommand="SELECT * FROM [Intership] WHERE ([id] = @id)" 
                
                
                UpdateCommand="UPDATE [Intership] SET [pess_cod] = @pess_cod, [company] = @company, [jobTitle] = @jobTitle, [description] = @description, [startDate] = @startDate, [endDate] = @endDate, [duration] = @duration WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                    <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
                    <asp:Parameter Name="company" Type="String" />
                    <asp:Parameter Name="jobTitle" Type="String" />
                    <asp:Parameter Name="description" Type="String" />
                    <asp:Parameter DbType="Date" Name="startDate" />
                    <asp:Parameter DbType="Date" Name="endDate" />
                    <asp:Parameter Name="duration" Type="Int32" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridViewIntership" Name="id" 
                        PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
                    <asp:Parameter Name="company" Type="String" />
                    <asp:Parameter Name="jobTitle" Type="String" />
                    <asp:Parameter Name="description" Type="String" />
                    <asp:Parameter DbType="Date" Name="startDate" />
                    <asp:Parameter Name="endDate" DbType="Date" />
                    <asp:Parameter Name="duration" Type="Int32" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </asp:View>
    </asp:MultiView>
     <asp:SqlDataSource ID="SqlDataSource15" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString1 %>" 
        SelectCommand="SELECT * FROM [Learining_Records_Experience]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource16" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString1 %>" 
        SelectCommand="SELECT * FROM [Learning_Records_Correspond]">
    </asp:SqlDataSource>
    </form>

</body>
</html>
