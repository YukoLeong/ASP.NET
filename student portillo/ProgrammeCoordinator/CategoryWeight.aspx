<%@ Page Language="VB" AutoEventWireup="false" CodeFile="CategoryWeight.aspx.vb" Inherits="CategoryWeight" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            font-family: "Berlin Sans FB";
            font-weight: normal;
        }
        .style2
        {
            width: 100%;
        }
        .style3
        {
            width: 297px;
        }
    </style>
    <link rel="stylesheet" href="../button.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="../teachGrid.css" type="text/css" media="screen" />
</head>
<body background="../images/weight.gif">
    <form id="form1" runat="server">
    <h1 class="style1">
        Program Attributes
         <asp:LinkButton ID="LinkButton1" runat="server" CssClass="blue" 
                  style="margin-left: 212px" Font-Size="Large">Home</asp:LinkButton>
    </h1>
    <p>
        &nbsp;</p>
    <p>
        <asp:GridView ID="GridViewCategory" runat="server" AllowPaging="True" AutoGenerateColumns="False" 
                DataKeyNames="programme" DataSourceID="SqlDataSource1" 
                EmptyDataText="There are no data records to display." 
                GridLines="Horizontal" PageSize="6" Font-Names="Calibri" Font-Size="Small" 
            Width="574px" CssClass="GridViewStyle">
                <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" SelectText="View" >
                    <ItemStyle ForeColor="#0095CD" />
                    </asp:CommandField>
                    <asp:BoundField DataField="programme" HeaderText="Program" 
                        SortExpression="programme" />
                    <asp:BoundField DataField="school" HeaderText="School" 
                        SortExpression="school" />
                    <asp:BoundField DataField="Professional_Competence" HeaderText="Professional Competence" 
                        SortExpression="Professional_Competence" />
                    <asp:BoundField DataField="Leadership" HeaderText="Leadership" 
                        SortExpression="Leadership" />
                    <asp:BoundField DataField="Communication" HeaderText="Communication" 
                        SortExpression="Communication" />
                    <asp:BoundField DataField="Creativity" HeaderText="Creativity" 
                        SortExpression="Creativity" />
                    <asp:BoundField DataField="Initiative" HeaderText="Initiative" 
                        SortExpression="Initiative" />
                    <asp:BoundField DataField="Self_Development" HeaderText="Self Development" 
                        SortExpression="Self_Development" />
                    <asp:BoundField DataField="Social_Responsibility" 
                        HeaderText="Social Responsibility" SortExpression="Social_Responsibility" />
                    <asp:BoundField DataField="Language" HeaderText="Language" 
                        SortExpression="Language" />
                    <asp:BoundField DataField="IT_Application" HeaderText="IT Application" 
                        SortExpression="IT_Application" />
                </Columns>
                <HeaderStyle CssClass="GridViewHeaderStyle" />
                <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                <RowStyle HorizontalAlign="Left" CssClass="GridViewRowStyle" />
            </asp:GridView>
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
    <br />
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                SelectCommand="SELECT * FROM [userGroup] WHERE ([id] = @id)">
                <SelectParameters>
                    <asp:SessionParameter Name="id" SessionField="Role_Type" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        <table class="style2">
            <tr>
                <td class="style3">
    
    <asp:DetailsView ID="DetailsViewCategory" runat="server" AllowPaging="True" 
        AutoGenerateRows="False" DataKeyNames="programme" 
        DataSourceID="SqlDataSource3" Font-Names="Calibri" Font-Size="Small" GridLines="Horizontal" 
        
        
                        style="z-index: 1; left: 15px; top: 410px;  height: 243px; width: 343px; margin-right: 0px;" 
                        CssClass="GridViewStyle">
        <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle2" />
        <Fields>
            <asp:BoundField DataField="programme" HeaderText="Program" 
                SortExpression="programme" ReadOnly="True" />
            <asp:BoundField DataField="school" HeaderText="School" 
                SortExpression="school" />
            <asp:BoundField DataField="Professional_Competence" HeaderText="Professional_Competence" 
                SortExpression="Professional_Competence" />
            <asp:BoundField DataField="Leadership" HeaderText="Leadership" 
                SortExpression="Leadership" />
            <asp:BoundField DataField="Communication" HeaderText="Communication" 
                SortExpression="Communication" />
            <asp:BoundField DataField="Creativity" HeaderText="Creativity" 
                SortExpression="Creativity" />
            <asp:BoundField DataField="Initiative" HeaderText="Initiative" 
                SortExpression="Initiative" />
            <asp:BoundField DataField="Self_Development" HeaderText="Self_Development" 
                SortExpression="Self_Development" />
            <asp:BoundField DataField="Social_Responsibility" HeaderText="Social_Responsibility" 
                SortExpression="Social_Responsibility" />
            <asp:BoundField DataField="Language" 
                HeaderText="Language" SortExpression="Language" />
            <asp:BoundField DataField="IT_Application" HeaderText="IT_Application" 
                SortExpression="IT_Application" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                ShowInsertButton="True" >
            <ItemStyle ForeColor="#0095CD" />
            </asp:CommandField>
        </Fields>
        <PagerSettings PageButtonCount="1" />
        <RowStyle CssClass="GridViewRowStyle2" />
    </asp:DetailsView>
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
    </form>
</body>
</html>
