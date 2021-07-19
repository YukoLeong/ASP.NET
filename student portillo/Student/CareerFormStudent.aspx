<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CareerFormStudent.aspx.cs" Inherits="Student_CareerFormStudent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <link href="Styles/jquery-ui.css" rel="stylesheet" />
    <link rel="stylesheet" href="../button.css" type="text/css" media="screen" />
    <link rel="stylesheet" type="text/css" href="media/css/jquery.dataTables.css" />
    <link rel="stylesheet" type="text/css" href="resources/syntax/shCore.css" />
    <link rel="stylesheet" type="text/css" href="resources/demo.css" />
    <link rel="stylesheet" href="../grid.css" type="text/css" media="screen" />
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
    <style type="text/css">
        #pic {
            background-size: cover;
        }

        #aspfont {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 11px;
        }

        #aspfont2 {
            font-family: DFKai-sb;
        }

        #content {
            margin-left: 80px;
            margin-right: 80px;
        }

        #content2 {
            margin-left: 20px;
            margin-right: 20px;
        }

        #infoContent {
            margin-left: 80px;
            margin-right: 80px;
        }

        #spanmiddle {
            vertical-align: middle;
            text-align: center;
        }
        #ImageButton2{
            width:13%;
        }

    </style>

</head>
<body background="../images/gp1.jpg" id="pic">
    <form id="form1" runat="server">
        <div style="margin: auto; width: 1150px">


            <div align="left" id="aspfont" style="font-size: 16pt; font-weight: bold;">
                <br />
                <br />
                <asp:Label ID="Label41" runat="server" Text="Job Opportunities" ForeColor="BlueViolet"
                    Font-Size="Large" Style="padding-left: 60px;"></asp:Label>
<%--                <asp:Button ID="HomeButton" runat="server" Text="Back" CssClass="blue" Height="40px"
                    OnClick="HomeButton_Click" Style="margin-left: 370px" Font-Size="Large" />--%>
                            <div style="text-align:center;margin-top:-32px;padding-bottom:12px;width:1104px">
               <asp:ImageButton ID="ImageButton2" runat="server" onmouseover="this.src='../images/homeblue_hover.png'" onmouseout="this.src='../images/homeblue.png'" ImageUrl="~/images/homeblue.png" OnClick="ImageButton2_Click" /> 
    </div>
                <br />
                <br />
            </div>
            <div id="content">
                <asp:Label ID="Label27" runat="server" Text="Industry: " Style="margin-right: 15px"></asp:Label>
                <asp:DropDownList ID="IndustryDll" runat="server" OnSelectedIndexChanged="IndustryDll_SelectedIndexChanged"
                    AutoPostBack="true">
                </asp:DropDownList>
                <br />
                <br />
                <asp:Label ID="Label45" runat="server" Text="JobNature: " Style="margin-right: 2px"></asp:Label>
                <asp:DropDownList ID="JobNatureDll" runat="server" Width="306px" AutoPostBack="true"
                    OnSelectedIndexChanged="JobNatureDll_SelectedIndexChanged">
                </asp:DropDownList>
                <br />
                <br />
                <div id="spanmiddle">
                    <asp:GridView ID="GridView1" runat="server" CellPadding="10" GridLines="None" AutoGenerateColumns="False" OnPageIndexChanging="GridView1_PageIndexChanging" AllowPaging="True" OnSelectedIndexChanged = "OnSelectedIndexChanged">
                    <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                        <Columns>
                            <asp:TemplateField HeaderText="ID" SortExpression="CareerFormID">
                                <ItemTemplate>
                                    <asp:Label ID="CareerFormID" runat="server" Text='<%#Eval("CareerFormID")%>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <Columns>
                            <asp:TemplateField HeaderText="Posting Date" SortExpression="tss">
                                <ItemTemplate>
                                    <asp:Label ID="tss" runat="server" Text='<%#Eval("tss")%>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <Columns>
                            <asp:TemplateField HeaderText="Organiztion" SortExpression="OrganiztionName1">
                                <ItemTemplate>
                                    <asp:Label ID="OrganiztionName1" runat="server" Text='<%#Eval("OrganiztionName1")%>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <Columns>
                            <asp:TemplateField HeaderText="JobName" SortExpression="career">
                                <ItemTemplate>
                                    <asp:Label ID="career" runat="server" Text='<%#Eval("career")%>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <Columns>
                            <asp:TemplateField HeaderText="VacancyNum" SortExpression="VacancyNumber">
                                <ItemTemplate>
                                    <asp:Label ID="VacancyNumber" runat="server" Text='<%#Eval("VacancyNumber")%>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <Columns>
                            <asp:TemplateField HeaderText="Salary" SortExpression="Salary">
                                <ItemTemplate>
                                    <asp:Label ID="Salary" runat="server" Text='<%#Eval("Salary")%>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <Columns>
                            <asp:TemplateField HeaderText="Views" SortExpression="Views">
                                <ItemTemplate>
                                    <asp:Label ID="Views" runat="server" Text='<%#Eval("Views")%>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>

                        <Columns>
                            <asp:ButtonField Text="Details" CommandName="Select"/>
                        </Columns>


                       <HeaderStyle
                            Font-Size="Large" Height="40px" CssClass="GridViewHeaderStyle"
                            ForeColor="White" />
                        <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                        <RowStyle HorizontalAlign="Left" CssClass="GridViewRowStyle"
                            Height="40px" />
                        <%--<SelectedRowStyle CssClass="GridViewSelectRowStyle" />--%>
                        <SortedAscendingCellStyle CssClass="GridViewSortStyle" />
                        <SortedAscendingHeaderStyle CssClass="GridViewSortHeaderStyle" />



                        <%--                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />--%>
                        <%--<SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />--%>
                        <%--  <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />--%>


                    </asp:GridView>
                    
                    <br />
                </div>
                <asp:Label ID="NoDataLabel" runat="server" Text=""></asp:Label>
            </div>
        </div>



    </form>
</body>
</html>
