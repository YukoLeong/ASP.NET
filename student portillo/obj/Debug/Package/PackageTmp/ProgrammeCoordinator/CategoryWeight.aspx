<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="CategoryWeight.aspx.vb" Inherits="ep.CategoryWeight3" %>

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
</head>
<body background="../images/weight.gif">
    <form id="form1" runat="server">
    <h1 class="style1">
        Program Attiributes
         <asp:LinkButton ID="LinkButton1" runat="server" CssClass="blue" 
                  style="margin-left: 212px" Font-Size="Large">Home</asp:LinkButton>
    </h1>
    <p>
        &nbsp;</p>
    <p>
        <asp:GridView ID="GridViewCategory" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
            DataKeyNames="programme" DataSourceID="SqlDataSource1" 
            EmptyDataText="There are no data records to display." 
            EnablePersistedSelection="True" ForeColor="#333333" GridLines="None" 
            ShowFooter="True" ShowHeaderWhenEmpty="True" 
            Font-Names="Calibri" Font-Size="X-Small" 
            
            style="z-index: 1; left: 15px; top: 75px;  " Width="428px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="programme" HeaderText="programme" ReadOnly="True" 
                    SortExpression="programme" />
                <asp:BoundField DataField="school" HeaderText="school" 
                    SortExpression="school" />
                <asp:BoundField DataField="professional" HeaderText="professional" 
                    SortExpression="professional" />
                <asp:BoundField DataField="leadership" HeaderText="leadership" 
                    SortExpression="leadership" />
                <asp:BoundField DataField="communication" HeaderText="communication" 
                    SortExpression="communication" />
                <asp:BoundField DataField="comprehension" HeaderText="comprehension" 
                    SortExpression="comprehension" />
                <asp:BoundField DataField="expression" HeaderText="expression" 
                    SortExpression="expression" />
                <asp:BoundField DataField="initiative" HeaderText="initiative" 
                    SortExpression="initiative" />
                <asp:BoundField DataField="self_enhancement" 
                    HeaderText="self_enhancement" SortExpression="self_enhancement" />
                <asp:BoundField DataField="civil_responsibility" HeaderText="civil_responsibility" 
                    SortExpression="civil_responsibility" />
                <asp:BoundField DataField="language" HeaderText="language" 
                    SortExpression="language" />
                <asp:BoundField DataField="it_application" HeaderText="it_application" 
                    SortExpression="it_application" />
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
    </p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:EPConnectionString4 %>" 
            OldValuesParameterFormatString="original_{0}" 
            ProviderName="<%$ ConnectionStrings:EPConnectionString4.ProviderName %>" 
            SelectCommand="SELECT * FROM [CategoryWeight] ORDER BY programme asc">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:EPConnectionString4 %>" 
            DeleteCommand="DELETE FROM [CategoryWeight] WHERE [programme] = @programme" 
            InsertCommand="INSERT INTO [CategoryWeight] ([programme], [school], [professional], [leadership], [communication], [comprehension], [expression], [initiative], [self_enhancement], [civil_responsibility], [language], [it_application]) VALUES (@programme, @school, @professional, @leadership, @communication, @comprehension, @expression, @initiative, @self_enhancement, @civil_responsibility, @language, @it_application)" 
            SelectCommand="SELECT * FROM [CategoryWeight] WHERE ([programme] = @programme)" 
            
        UpdateCommand="UPDATE [CategoryWeight] SET [school] = @school, [professional] = @professional, [leadership] = @leadership, [communication] = @communication, [comprehension] = @comprehension, [expression] = @expression, [initiative] = @initiative, [self_enhancement] = @self_enhancement, [civil_responsibility] = @civil_responsibility, [language] = @language, [it_application] = @it_application WHERE [programme] = @programme">
            <DeleteParameters>
                <asp:Parameter Name="programme" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="programme" Type="String" />
                <asp:Parameter Name="school" Type="String" />
                <asp:Parameter Name="professional" Type="Double" />
                <asp:Parameter Name="leadership" Type="Double" />
                <asp:Parameter Name="communication" Type="Double" />
                <asp:Parameter Name="comprehension" Type="Double" />
                <asp:Parameter Name="expression" Type="Double" />
                <asp:Parameter Name="initiative" Type="Double" />
                <asp:Parameter Name="self_enhancement" Type="Double" />
                <asp:Parameter Name="civil_responsibility" Type="Double" />
                <asp:Parameter Name="language" Type="Double" />
                <asp:Parameter Name="it_application" Type="Double" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridViewCategory" Name="programme" 
                    PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="school" Type="String" />
                <asp:Parameter Name="professional" Type="Double" />
                <asp:Parameter Name="leadership" Type="Double" />
                <asp:Parameter Name="communication" Type="Double" />
                <asp:Parameter Name="comprehension" Type="Double" />
                <asp:Parameter Name="expression" Type="Double" />
                <asp:Parameter Name="initiative" Type="Double" />
                <asp:Parameter Name="self_enhancement" Type="Double" />
                <asp:Parameter Name="civil_responsibility" Type="Double" />
                <asp:Parameter Name="language" Type="Double" />
                <asp:Parameter Name="it_application" Type="Double" />
                <asp:Parameter Name="programme" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString4 %>" 
        SelectCommand="SELECT * FROM [CategoryWeight]"></asp:SqlDataSource>
    <br />
    
        <table class="style2">
            <tr>
                <td class="style3">
    
    <asp:DetailsView ID="DetailsViewCategory" runat="server" AllowPaging="True" 
        AutoGenerateRows="False" CellPadding="4" DataKeyNames="programme" 
        DataSourceID="SqlDataSource3" Font-Names="Calibri" Font-Size="Small" 
        ForeColor="#333333" GridLines="None" 
        
        style="z-index: 1; left: 15px; top: 410px;  height: 243px; width: 343px">
        <AlternatingRowStyle BackColor="White" />
        <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
        <EditRowStyle BackColor="#0095CD" />
        <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="programme" HeaderText="programme" 
                SortExpression="programme" ReadOnly="True" />
            <asp:BoundField DataField="school" HeaderText="school" 
                SortExpression="school" />
            <asp:BoundField DataField="professional" HeaderText="professional" 
                SortExpression="professional" />
            <asp:BoundField DataField="leadership" HeaderText="leadership" 
                SortExpression="leadership" />
            <asp:BoundField DataField="communication" HeaderText="communication" 
                SortExpression="communication" />
            <asp:BoundField DataField="comprehension" HeaderText="comprehension" 
                SortExpression="comprehension" />
            <asp:BoundField DataField="expression" HeaderText="expression" 
                SortExpression="expression" />
            <asp:BoundField DataField="initiative" HeaderText="initiative" 
                SortExpression="initiative" />
            <asp:BoundField DataField="self_enhancement" HeaderText="self_enhancement" 
                SortExpression="self_enhancement" />
            <asp:BoundField DataField="civil_responsibility" 
                HeaderText="civil_responsibility" SortExpression="civil_responsibility" />
            <asp:BoundField DataField="language" HeaderText="language" 
                SortExpression="language" />
            <asp:BoundField DataField="it_application" HeaderText="it_application" 
                SortExpression="it_application" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                ShowInsertButton="True" />
        </Fields>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <InsertRowStyle BackColor="#0095CD" />
        <PagerSettings PageButtonCount="1" />
        <PagerStyle BackColor="#0095CD" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
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
                                Text="Professional">
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
                                YValueMembers="comprehension">
                            </asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                            </asp:ChartArea>
                        </ChartAreas>
                        <Titles>
                            <asp:Title Font="Microsoft Sans Serif, 8.25pt, style=Bold" Name="Title1" 
                                Text="Comprehension">
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
                                Text="Expression">
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
                                Text="Initiative">
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
                                Text="Self-enhancement">
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
                                Text="Civil Responsibility">
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
                                Text="Language">
                            </asp:Title>
                        </Titles>
                    </asp:Chart>
                </td>
                <td>
    
                    <asp:Chart ID="Chart10" runat="server">
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
                                Text="I.T. Skill">
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
    </table>
    </form>
</body>
</html>
