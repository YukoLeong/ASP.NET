<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Analysis.aspx.vb" Inherits="Operator_Analysis" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
            margin-top: 0px;
        }
        .style2
        {
            font-family: "Berlin Sans FB";
            font-size: xx-large;
        }
             #wrapper
        {
            width: 1100px;
            min-height:915px;
            margin-left: auto;
            margin-right: auto;
            background-color:White;
            border-left: solid black 1px;
            border-right: solid black 1px;
        }
        
        #content
        {
            min-height:915px;
            margin-left: 5px;
            margin-right: 5px;
        }

        #ImageButton2{
            width:14%;
        }
        </style>
   <link rel="stylesheet" href="../button.css" type="text/css" media="screen" />
</head>
<body background="../images/bg-blue.jpg" style="margin-top: 0px">

<div id="wrapper">
    <div id="content">
    <form id="form1" runat="server">
   <br />

    <div style="text-align:center;padding-bottom:12px;max-width:1005px">
               <asp:ImageButton ID="ImageButton2" runat="server" onmouseover="this.src='../images/homeblue_hover.png'" onmouseout="this.src='../images/homeblue.png'" ImageUrl="~/images/homeblue.png" CausesValidation="False" /> 
    </div>



      <%--<asp:Button ID="home" runat="server" Text="Home" 
            style="font-size:Large; margin-left:480px;" CssClass="blue"/>--%>
        <br /><br />
 
        <table class="style1">
            <tr>
                <td>
                     <span class="style2">Seminar</span>&nbsp<asp:Label ID="SemTop" runat="server"
                         Text="(TOP 10)" Font-Size="X-Large" Font-Bold="True"></asp:Label></td>
                <td>
                     <span class="style2">Exchanged Gift</span>&nbsp<asp:Label ID="GiftTop" runat="server"
                         Text="(TOP 10)" Font-Size="X-Large" Font-Bold="True"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    <asp:Chart ID="SeminarChart" runat="server" Height="362px" 
                        Width="585px">
                        <Series>
                            <asp:Series ChartType="Pie" Color="255, 255,128,112" IsValueShownAsLabel="true" 
                                IsVisibleInLegend="true" LabelFormat="{0:p}" Name="Series1" 
                                XValueMember="Category" YValueMembers="Percent">
                            </asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                                <AxisX LineColor="Gray">
                                    <MajorGrid LineColor="Gray" />
                                </AxisX>
                                <AxisY LineColor="Gray">
                                    <MajorGrid LineColor="Gray" />
                                </AxisY>
                                <Area3DStyle Enable3D="True" LightStyle="Realistic" />
                            </asp:ChartArea>
                        </ChartAreas>
                        <Legends>
                            <asp:Legend>
                            </asp:Legend>
                        </Legends>
                    </asp:Chart>
                </td>
                <td>
                    <asp:Chart ID="GiftChart" runat="server" Height="362px" 
                        Width="499px">
                        <Series>
                            <asp:Series ChartType="Pie" Color="255, 255,128,112" IsValueShownAsLabel="true" 
                                IsVisibleInLegend="true" LabelFormat="{0:p}" Name="Series1" 
                                XValueMember="GiftCount" YValueMembers="Percent">
                            </asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                                <AxisX LineColor="Gray">
                                    <MajorGrid LineColor="Gray" />
                                </AxisX>
                                <AxisY LineColor="Gray">
                                    <MajorGrid LineColor="Gray" />
                                </AxisY>
                                <Area3DStyle Enable3D="True" LightStyle="Realistic" />
                            </asp:ChartArea>
                        </ChartAreas>
                        <Legends>
                            <asp:Legend>
                            </asp:Legend>
                        </Legends>
                    </asp:Chart>
                </td>
            </tr>
        </table>
  <hr style="height: 1px; width: 1092px;" />
        <table class="style1">
            <tr>
                <td>
                    <span class="style2">This Week Of Seminar</span>&nbsp<asp:Label ID="SemWeekTop" runat="server"
                         Text="(TOP 10)" Font-Size="X-Large" Font-Bold="True"></asp:Label></td>
                <td>
                    <span class="style2">This Week Of Exchanged Gift</span>&nbsp<asp:Label 
                        ID="GiftWeekTop" runat="server"
                         Text="(TOP 10)" Font-Size="X-Large" Font-Bold="True"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    <asp:Chart ID="SemWeekChart" runat="server" Height="362px" 
                        Width="585px">
                        <Series>
                            <asp:Series ChartType="Pie" Color="255, 255,128,112" IsValueShownAsLabel="true" 
                                IsVisibleInLegend="true" LabelFormat="{0:p}" Name="Series1" 
                                XValueMember="SemWeekCount" YValueMembers="Percent">
                            </asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                                <AxisX LineColor="Gray">
                                    <MajorGrid LineColor="Gray" />
                                </AxisX>
                                <AxisY LineColor="Gray">
                                    <MajorGrid LineColor="Gray" />
                                </AxisY>
                                <Area3DStyle Enable3D="True" LightStyle="Realistic" />
                            </asp:ChartArea>
                        </ChartAreas>
                        <Legends>
                            <asp:Legend>
                            </asp:Legend>
                        </Legends>
                    </asp:Chart>
                </td>
                <td>
                    <asp:Chart ID="GiftWeekChart" runat="server" Height="362px" 
                        Width="498px">
                        <Series>
                            <asp:Series ChartType="Pie" Color="255, 255,128,112" IsValueShownAsLabel="true" 
                                IsVisibleInLegend="true" LabelFormat="{0:p}" Name="Series1" 
                                XValueMember="GiftWeekCount" YValueMembers="Percent">
                            </asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                                <AxisX LineColor="Gray">
                                    <MajorGrid LineColor="Gray" />
                                </AxisX>
                                <AxisY LineColor="Gray">
                                    <MajorGrid LineColor="Gray" />
                                </AxisY>
                                <Area3DStyle Enable3D="True" LightStyle="Realistic" />
                            </asp:ChartArea>
                        </ChartAreas>
                        <Legends>
                            <asp:Legend>
                            </asp:Legend>
                        </Legends>
                    </asp:Chart>
                </td>
            </tr>
        </table>
  <br />
  </form>
    </div>
    </div>
</body>
</html>
