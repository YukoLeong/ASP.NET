<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Student.aspx.cs" Inherits="MPICP_Student" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <link rel="shortcut icon" href="images/mpicpicon.ico" />
    <%--<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>--%>

    <%--jquery ui--%>
    <link href="js/jqueryui/jquery-ui.css" rel="stylesheet" />
    <script src="js/jqueryui/jquery-1.11.2.min.js"></script>
    <script src="js/jqueryui/jquery-ui.js"></script>


    <%--<link rel="stylesheet" href="css/button.css" type="text/css" media="screen" />--%>
    <%--<link rel="stylesheet" href="css/print.css" type="text/css" media="print" />--%>

    <%--bootstrap--%>
    <link href="css/bootstrapstyle/changebootstrap.css" rel="stylesheet" />
    <link href="css/bootstrapstyle/bootstrap-theme.min.css" rel="stylesheet" />
    <script src="css/bootstrapstyle/bootstrap.min.js"></script>


    <style type="text/css">
        body {
            /*font-family: DFKai-sb;*/
        }

        #content {
            margin-left: 20px;
            margin-right: 20px;
        }

        .style1 {
            width: 100%;
            /*border: 1px solid #000000;*/
        }

        .style3 {
            width: 100%;
        }

        .style4 {
            width: 212px;
            height: 36px;
        }

        .style5 {
            height: 36px;
        }

        .style6 {
            width: 212px;
        }

        .midleftstyle {
            width: 150px;
        }

        .style10 {
            width: 200px;
        }

        #ImageButton2 {
            width: 9%;
        }

        #logopart {
            /*background: url(images/logo_mcpoly.png) no-repeat top center;*/
            width: 44%;
            height: 94px;
            margin-top: 18px;
            float: left;
        }


        /*layout*/

        #logopart2 {
            background: url(images/jobsrecruitment.png) no-repeat top center;
            width: 56%;
            height: 94px;
            margin-top: 20px;
            float: left;
        }

        #wrapper {
            width: 100%;
            /*height: 100vh;*/ /*div高度等於畫面高度*/
            background: url(images/body_bg.gif) repeat;
            /*min-width: 960px;*/
            /*min-height:900px;*/
        }

        #top_wrap {
            background: url(images/inside_visual2.jpg) no-repeat top center;
            height: 192px;
            /*display: block;*/
        }

        #middle_wrap {
            background: url(images/content_visual.png) no-repeat top center;
            min-height: 384px;
            width: 100%;
            /*position: relative;
            float: left;*/
        }

        .divborder {
            width: 961px;
            background-color: white;
            margin: auto; /*置中*/
            /*height: 600px;*/
            height: 100%;
            border-right: 1px solid #CDDCB1;
            border-left: 1px solid #CDDCB1;
        }

        #GridView1 td {
            padding: 10px;
        }

        #GridView1 th {
            padding: 10px;
        }

        a {
            margin-left: -34px;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">

        <div style="height: 100px; width: 1200px; margin: auto">
            <div id="logopart">
                <asp:ImageButton ID="LogoImageButton" runat="server" Style="margin-left: 149px" OnClick="LogoImageButton_Click" ImageUrl="images/logo_mcpoly.png" />
            </div>
            <div id="logopart2">
            </div>
        </div>
        <div id="wrapper">
            <div id="top_wrap">
            </div>
            <div id="middle_wrap">
                <div class="divborder">
                    <br />
                    <br />
                    <div style="width: 930px; height: 650px; margin: auto">
                        <%--content start--%>

                        <%--                        <asp:ImageButton ID="BackButton" runat="server" onmouseover="this.src='images/back01_hover.png'" onmouseout="this.src='images/back01.png'" ImageUrl="images/back01.png" OnClick="BackButton_Click" Style="width: 105px;display:none" />

                        <br />--%>
                        <br />
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" GridLines="None" Width="928px" ShowFooter="True" OnSelectedIndexChanged="OnSelectedIndexChanged">
                            <%--PageSize="5" OnPageIndexChanging="GridView1_PageIndexChanging" AllowPaging="true"--%>

                            <Columns>
                                <asp:TemplateField HeaderText="ID" SortExpression="CareerFormID">
                                    <ItemTemplate>
                                        <asp:Label ID="CareerFormID" runat="server" Text='<%#Eval("CareerFormID")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Post Date" SortExpression="ts">
                                    <ItemTemplate>
                                        <asp:Label ID="ts" runat="server" Text='<%#Eval("ts")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Company" SortExpression="Organize">
                                    <ItemTemplate>
                                        <asp:Label ID="Organize" runat="server" Text='<%#Eval("Organize")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Company_en" SortExpression="Organize_en" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="Organize_en" runat="server" Text='<%#Eval("Organize_en")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Job Name" SortExpression="career">
                                    <ItemTemplate>
                                        <asp:Label ID="career" runat="server" Text='<%#Eval("career")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Views" SortExpression="Views">
                                    <ItemTemplate>
                                        <asp:Label ID="Views" runat="server" Text='<%#Eval("Views")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--                                <asp:TemplateField HeaderText="Industry" SortExpression="Industry">
                                    <ItemTemplate>
                                        <asp:Label ID="Industry" runat="server" Text='<%#Eval("Industry")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>--%>
                                <asp:TemplateField HeaderText="">
                                    <ItemTemplate>
                                        <asp:Image ID="gridviewimage01" runat="server" ImageUrl='<%# Bind("phototype2") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:ButtonField Text="View" CommandName="Select" />

                            </Columns>


                            <AlternatingRowStyle BackColor="White" />
                            <EditRowStyle BackColor="#2461BF" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EFF3FB" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
                        </asp:GridView>

                        <%--content close--%>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
