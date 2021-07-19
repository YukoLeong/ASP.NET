<%@ Page  EnableSessionState ="True"  Language="vb" AutoEventWireup="false" ClientTarget="uplevel" CodeBehind="Career.aspx.vb" Inherits="ep.Career" %>

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
            width: 98%;
        }
        .style4
        {
            width: 496px;
        }
        .style8
        {
            height: 293px;
        }
        .style10
        {
            width: 8px;
        }
        .style11
        {
            height: 293px;
            width: 8px;
        }
        .style12
        {
            width: 496px;
            height: 293px;
        }
    </style>
     <link rel="stylesheet" href="../button.css" type="text/css" media="screen" />
</head>
<body style="height: 421px" background="images/career_background.gif">
    <form id="form1" runat="server">
    <div class="style1">
    
        Career Planning
          <asp:LinkButton ID="LinkButton1" runat="server" CssClass="blue" 
                  style="margin-left: 232px" Font-Size="Large">Home</asp:LinkButton>
        </div>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString1 %>" 
        OldValuesParameterFormatString="original_{0}" 
        
        SelectCommand="SELECT * FROM [CareerPlanning] WHERE ([pess_cod] = @pess_cod) ORDER BY [careerPlanning]">
        <SelectParameters>
            <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
     
    <asp:GridView ID="GridViewCareer" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" 
        CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1" 
        EmptyDataText="There are no data records to display." Font-Names="Calibri" 
        ForeColor="#333333" GridLines="None" PageSize="5" 
        style="z-index: 1; left: 15px; top: 75px;  " Font-Size="Small" Width="707px" 
        >


        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="careerPlanning" HeaderText="Name" 
                SortExpression="careerPlanning" />
            <asp:BoundField DataField="planningDate" HeaderText="Date" 
                SortExpression="planningDate" DataFormatString="{0:d}" />
            <asp:BoundField DataField="professional" HeaderText="Professional" 
                SortExpression="professional" />
            <asp:BoundField DataField="leadership" HeaderText="Leadership" 
                SortExpression="leadership" />
            <asp:BoundField DataField="communication" HeaderText="Comm-unication" 
                SortExpression="communication" />
            <asp:BoundField DataField="comprehension" HeaderText="compre-hension" 
                SortExpression="comprehension" />
            <asp:BoundField DataField="expression" HeaderText="Expression" 
                SortExpression="expression" />
            <asp:BoundField DataField="initiative" HeaderText="Initiative" 
                SortExpression="initiative" />
            <asp:BoundField DataField="self_enhancement" HeaderText="Self Enhancement" 
                SortExpression="self_enhancement" />
            <asp:BoundField DataField="civil_responsibility" 
                HeaderText="Civil Responsibility" SortExpression="civil_responsibility" />
            <asp:BoundField DataField="language" HeaderText="Language" 
                SortExpression="language" />
            <asp:BoundField DataField="it_application" HeaderText="I.T. Application" 
                SortExpression="it_application" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#0095CD" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#0095CD" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#0095CD" ForeColor="White" 
            HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" ForeColor="#333333" Font-Bold="True" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    <br />
    <asp:Label ID="LabelDetail" runat="server" Font-Names="Berlin Sans FB" 
        Font-Size="X-Large" Text="Planning Detail" Visible="False"></asp:Label>
    <br />
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString1 %>" 
        DeleteCommand="DELETE FROM [CareerPlanning] WHERE [id] = @id" 
        InsertCommand="INSERT INTO [CareerPlanning] ([pess_cod], [careerPlanning], [description], [planningDate], [professional], [leadership], [communication], [comprehension], [expression], [initiative], [self_enhancement], [civil_responsibility], [language], [it_application], [makePublic], [getComment], [askForComment]) VALUES (@pess_cod, @careerPlanning, @description, @planningDate, @professional, @leadership, @communication, @comprehension, @expression, @initiative, @self_enhancement, @civil_responsibility, @language, @it_application, @makePublic, @getComment, @askForComment)" 
        ProviderName="<%$ ConnectionStrings:EPConnectionString1.ProviderName %>" 
        SelectCommand="SELECT * FROM [CareerPlanning] WHERE ([id] = @id)" 
        
        
        
        
        UpdateCommand="UPDATE [CareerPlanning] SET [careerPlanning] = @careerPlanning, [description] = @description, [planningDate] = @planningDate, [professional] = @professional, [leadership] = @leadership, [communication] = @communication, [comprehension] = @comprehension, [expression] = @expression, [initiative] = @initiative, [self_enhancement] = @self_enhancement, [civil_responsibility] = @civil_responsibility, [language] = @language, [it_application] = @it_application, [makePublic] = @makePublic, [getComment] = @getComment, [askForComment] = @askForComment WHERE [id] = @id">
        <SelectParameters>
                <asp:ControlParameter ControlID="GridViewCareer" PropertyName="SelectedValue" Name="id" 
                Type="Int32"></asp:ControlParameter>
        </SelectParameters>

        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="pess_cod" Type="Decimal" />
            <asp:Parameter Name="careerPlanning" Type="String" />
            <asp:Parameter Name="description" Type="String" />
            <asp:Parameter Name="planningDate" DbType="Date" />
            <asp:Parameter Name="professional" Type="Int32" />
            <asp:Parameter Name="leadership" Type="Int32" />
            <asp:Parameter Name="communication" Type="Int32" />
            <asp:Parameter Name="comprehension" Type="Int32" />
            <asp:Parameter Name="expression" Type="Int32" />
            <asp:Parameter Name="initiative" Type="Int32" />
            <asp:Parameter Name="self_enhancement" Type="Int32" />
            <asp:Parameter Name="civil_responsibility" Type="Int32" />
            <asp:Parameter Name="language" Type="Int32" />
            <asp:Parameter Name="it_application" Type="Int32" />
            <asp:Parameter Name="makePublic" Type="Boolean" />
            <asp:Parameter Name="getComment" Type="Boolean" />
            <asp:Parameter Name="askForComment" Type="Boolean" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="careerPlanning" Type="String" />
            <asp:Parameter Name="description" Type="String" />
            <asp:Parameter Name="planningDate" DbType="Date" />
            <asp:Parameter Name="professional" Type="Int32" />
            <asp:Parameter Name="leadership" Type="Int32" />
            <asp:Parameter Name="communication" Type="Int32" />
            <asp:Parameter Name="comprehension" Type="Int32" />
            <asp:Parameter Name="expression" Type="Int32" />
            <asp:Parameter Name="initiative" Type="Int32" />
            <asp:Parameter Name="self_enhancement" Type="Int32" />
            <asp:Parameter Name="civil_responsibility" Type="Int32" />
            <asp:Parameter Name="language" Type="Int32" />
            <asp:Parameter Name="it_application" Type="Int32" />
            <asp:Parameter Name="makePublic" Type="Boolean" />
            <asp:Parameter Name="getComment" Type="Boolean" />
            <asp:Parameter Name="askForComment" Type="Boolean" />
            <asp:Parameter Name="id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString4 %>" 
        SelectCommand="SELECT * FROM [CareerAttribute]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource7" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString4 %>" 
        SelectCommand="SELECT * FROM [CareerAttribute]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource8" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString4 %>" 
        SelectCommand="SELECT * FROM [CareerAttribute]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource9" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString4 %>" 
        SelectCommand="SELECT * FROM [CategoryWeight] WHERE ([programme] = @programme)">
        <SelectParameters>
            <asp:SessionParameter Name="programme" SessionField="programme" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <table class="style3">
        <tr>
            <td class="style4">
                <strong>Attribute Analysis</strong></td>
            <td class="style10">
                </td>
            <td>
                <strong>Careers Match with</strong></td>
        </tr>
        <tr>
            <td class="style4">
                Draw:
                <asp:CheckBox ID="chkStatus" runat="server" AutoPostBack="True" 
                    Text="Current Status" />
                <asp:CheckBox ID="chkMPIattribute" runat="server" AutoPostBack="True" 
                    Text="MPI Attribute" />
                <asp:CheckBox ID="chkCareer" runat="server" AutoPostBack="True" Text="Career" />
                <asp:DropDownList ID="DropDownCareer" runat="server" AutoPostBack="True" 
                    DataSourceID="SqlDataSource6" DataTextField="career" DataValueField="career">
                </asp:DropDownList>
            </td>
            <td class="style10">
                </td>
            <td>
                &nbsp;<asp:RadioButtonList ID="RadioMatch" runat="server" AutoPostBack="True" 
                    RepeatDirection="Horizontal">
                    <asp:ListItem Value="Current_Status">Current Status</asp:ListItem>
                    <asp:ListItem Value="MPI_Attribute">Prog Attribute</asp:ListItem>
                    <asp:ListItem Value="Graduation_Status">Graduation Status (Estimate)</asp:ListItem>
                </asp:RadioButtonList>
&nbsp;</td>
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
            <td class="style11">
                </td>
            <td class="style8">
                &nbsp;<strong><asp:ListBox ID="MatchList" runat="server" AutoPostBack="True" 
                    DataSourceID="SqlDataSource8" DataTextField="career" DataValueField="career" 
                    Height="382px" Width="562px"></asp:ListBox>
                </strong></td>
        </tr>
        <tr>
            <td class="style4">
    <cc1:Editor ID="Editor1" runat="server" Height="200px" Width="550px" 
        Visible="False" />
    <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" 
        AutoGenerateRows="False" CellPadding="4" DataKeyNames="id" 
        DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" 
        Height="16px" Width="565px" 
        style="z-index: 1; left: 15px; top: 278px; " Font-Names="Calibri" 
        Font-Size="Small">
        <AlternatingRowStyle BackColor="White" />
        <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
        <EditRowStyle BackColor="#0095CD" />
        <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="careerPlanning" HeaderText="Name" 
                SortExpression="careerPlanning" />
            <asp:BoundField DataField="planningDate" HeaderText="Date" 
                SortExpression="planningDate" DataFormatString="{0:d}" />
            <asp:BoundField DataField="professional" HeaderText="Professional" 
                SortExpression="professional"  />
            <asp:BoundField DataField="leadership" HeaderText="Leadership" 
                SortExpression="leadership" />
            <asp:BoundField DataField="communication" HeaderText="Communication" 
                SortExpression="communication" />
            <asp:BoundField DataField="comprehension" HeaderText="Comprehension" 
                SortExpression="comprehension" />
            <asp:BoundField DataField="expression" HeaderText="Expression" 
                SortExpression="expression" />
            <asp:BoundField DataField="initiative" HeaderText="Initiative" 
                SortExpression="initiative" />
            <asp:BoundField DataField="self_enhancement" HeaderText="Self Enhancement" 
                SortExpression="self_enhancement" />
            <asp:BoundField DataField="civil_responsibility" 
                HeaderText="Civil Responsibility" SortExpression="civil_responsibility" />
            <asp:BoundField DataField="language" HeaderText="Language" 
                SortExpression="language" />
            <asp:BoundField DataField="it_application" HeaderText="I.T. Application" 
                SortExpression="it_application" />
            <asp:BoundField DataField="description" HeaderText="Description" 
                SortExpression="description" />
            <asp:CheckBoxField DataField="makePublic" HeaderText="Public" 
                SortExpression="makePublic" />
            <asp:CheckBoxField DataField="getComment" HeaderText="Comment" 
                SortExpression="getComment" />
            <asp:CheckBoxField DataField="askForComment" HeaderText="Ask for advisory" 
                SortExpression="askForComment" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                ShowInsertButton="True" />
        </Fields>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <InsertRowStyle BackColor="#0095CD" />
        <PagerStyle BackColor="#0095CD" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
    </asp:DetailsView>
            </td>
            <td class="style10">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <br />
    
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString1 %>" 
        SelectCommand="SELECT * FROM [Ability]"></asp:SqlDataSource>
    
    <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString1 %>" 
        SelectCommand="SELECT * FROM [Ability]"></asp:SqlDataSource>
    
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString1 %>" 
        SelectCommand="SELECT * FROM [CareerPlanning]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource10" runat="server" 
            ConnectionString="<%$ ConnectionStrings:EPConnectionString4 %>" 
            SelectCommand="SELECT [professional], [leadership], [communication], [comprehension], [expression], [initiative], [self_enhancement], [civil_responsibility], [language], [it_application] FROM [seminarAttribute]">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource11" runat="server" 
            ConnectionString="<%$ ConnectionStrings:EPConnectionString4 %>" 
            SelectCommand="SELECT [Seminar_Conference], [Professional_Certificate], [Match_Results], [Readings], [Awards], [Study_Abroad], [Intership] FROM [Learning_Records_Correspond] WHERE ([PESS_COD] = @PESS_COD)">
            <SelectParameters>
                <asp:SessionParameter Name="PESS_COD" SessionField="pess_cod" Type="Decimal" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource12" runat="server" 
            ConnectionString="<%$ ConnectionStrings:EPConnectionString4 %>" 
            SelectCommand="SELECT * FROM [Ability]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource13" runat="server" 
            ConnectionString="<%$ ConnectionStrings:EPConnectionString4 %>" 
            SelectCommand="SELECT [experience_name] FROM [Learining_Records_Experience]">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource14" runat="server" 
            ConnectionString="<%$ ConnectionStrings:EPConnectionString4 %>" 
            SelectCommand="SELECT [professional], [leadership], [communication], [comprehension], [expression], [initiative], [self_enhancement], [civil_responsibility], [language], [it_application] FROM [abilityMatrix] WHERE ([pess_cod] = @pess_cod)">
            <SelectParameters>
                <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
            </SelectParameters>
        </asp:SqlDataSource>

    <br />
    </form>
</body>
</html>
