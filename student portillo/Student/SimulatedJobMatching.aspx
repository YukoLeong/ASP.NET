<%@ Page  EnableSessionState ="True" Language="VB" AutoEventWireup="false" CodeFile="SimulatedJobMatching.aspx.vb" ClientTarget="uplevel" Inherits="Student_SimulatedJobMatching" %>

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
    
        Job Matching Simulation<asp:LinkButton ID="LinkButton1" runat="server" CssClass="blue" 
                  style="margin-left: 232px" Font-Size="Large">Home</asp:LinkButton>
        </div>
    <br />
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
                &nbsp;</td>
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
         <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString4 %>" 
                SelectCommand="SELECT * FROM [userGroup] WHERE ([id] = @id)">
                <SelectParameters>
                    <asp:SessionParameter Name="id" SessionField="Role_Type" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
    <br />
    </form>
</body>
</html>
