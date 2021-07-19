<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="studentInfo.aspx.vb" Inherits="ep.studentInfo1" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
      <link rel="stylesheet" href="../button.css" type="text/css" media="screen" />
</head>
<body background="../images/background.gif">
    <form id="form1" runat="server">
   
  <asp:LinkButton ID="LinkButton1" runat="server" CssClass="blue" 
                  style="margin-left: 432px" Font-Size="Large">Home</asp:LinkButton>
 
        <br />
        <br />
   <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large"></asp:Label>
   <br />
   <br />
    <div>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
            DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" 
            EmptyDataText="There are no data records to display.">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="studentid" HeaderText="studentid" 
                    SortExpression="studentid" />
                <asp:BoundField DataField="studentname" HeaderText="studentname" 
                    SortExpression="studentname" />
                <asp:BoundField DataField="Seminar_Conference" HeaderText="Seminar_Conference" 
                    SortExpression="Seminar_Conference" />
                <asp:BoundField DataField="Professional_Certificate" 
                    HeaderText="Professional_Certificate" 
                    SortExpression="Professional_Certificate" />
                <asp:BoundField DataField="Match_Results" HeaderText="Match_Results" 
                    SortExpression="Match_Results" />
                <asp:BoundField DataField="Readings" HeaderText="Readings" 
                    SortExpression="Readings" />
                <asp:BoundField DataField="Awards" HeaderText="Awards" 
                    SortExpression="Awards" />
                <asp:BoundField DataField="Study_Abroad" HeaderText="Study_Abroad" 
                    SortExpression="Study_Abroad" />
                <asp:BoundField DataField="Intership" HeaderText="Intership" 
                    SortExpression="Intership" />
                <asp:HyperLinkField DataNavigateUrlFields="studentid" 
                    DataNavigateUrlFormatString="~/Student/schoolStaff.aspx?studentid={0}" 
                    DataTextField="studentid" DataTextFormatString="view" 
                    HeaderText="student_info" />
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
            ConnectionString="<%$ ConnectionStrings:EPConnectionString1 %>" SelectCommand="select programmeStud.studentid,programmeStud.studentname,Learning_Records_Correspond.Seminar_Conference,
Learning_Records_Correspond.Professional_Certificate,
Learning_Records_Correspond.Match_Results,
Learning_Records_Correspond.Readings,
Learning_Records_Correspond.Awards,
Learning_Records_Correspond.Study_Abroad,
Learning_Records_Correspond.Intership
from programmeStud,Learning_Records_Correspond
where programmeStud.pess_cod=Learning_Records_Correspond.pess_cod and coordinator_password=@coordinator_password
">
         <SelectParameters>
             <asp:SessionParameter Name="coordinator_password" 
                 SessionField="coordinator_password" />
         </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:EPConnectionString4 %>" 
            SelectCommand="SELECT [experience_name] FROM [Learining_Records_Experience]">
        </asp:SqlDataSource>
    </div>
      <asp:Chart ID="Chart1" runat="server" Height="412px" Width="614px" 
        Visible="False">
        <Series>
               <asp:Series ChartArea="ChartArea1" ChartType="Radar" 
                                                       IsValueShownAsLabel="True" 
                                                        Label="#VAL" LabelForeColor="Black" Name="learning record" YValuesPerPoint="6" 
                                                                Legend="Legend1">
                                                     
                                                            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1">
            </asp:ChartArea>
        </ChartAreas>
    </asp:Chart>
    </form>
  
</body>
</html>
