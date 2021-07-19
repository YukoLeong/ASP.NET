<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CareerFormStudentView.aspx.cs" ClientTarget="uplevel"
    Inherits="Student_CareerFormStudentView" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery.js" type="text/javascript"></script>
    <script src="Styles/jquery-ui.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript" src="media/js/jquery.js"></script>
    <script type="text/javascript" language="javascript" src="media/js/jquery.dataTables.js"></script>
    <script type="text/javascript" language="javascript" src="resources/syntax/shCore.js"></script>
    <script type="text/javascript" language="javascript" src="resources/demo.js"></script>
    <link href="Styles/jquery-ui.css" rel="stylesheet" />
    <link rel="stylesheet" href="../button.css" type="text/css" media="screen" />
    <link rel="stylesheet" type="text/css" href="media/css/jquery.dataTables.css">
    <link rel="stylesheet" type="text/css" href="resources/syntax/shCore.css">
    <link rel="stylesheet" type="text/css" href="resources/demo.css">
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
    <style type="text/css">
        #pic
        {
            background-size: cover;
        }
        
        #aspfont
        {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 11px;
        }
        #aspfont2
        {
            font-family: DFKai-sb;
        }
        #content
        {
            margin-left: 80px;
            margin-right: 80px;
        }
        #content2
        {
            margin-left: 20px;
            margin-right: 20px;
        }
        #infoContent
        {
            margin-left: 80px;
            margin-right: 80px;
        }
        
        .style1
        {
            width: 100%;
            border: 1px solid #000000;
        }
        .style3
        {
            width: 100%;
        }
        .style4
        {
            width: 212px;
            height: 36px;
        }
        .style5
        {
            height: 36px;
        }
        .style6
        {
            width: 212px;
        }
        .style10
        {
            width: 200px;
        }
    </style>
</head>
<body background="../images/gp1.jpg" id="pic">
    <form id="form1" runat="server">
    <div>
    </div>
    <asp:Label ID="showviewid" runat="server"></asp:Label>
    <asp:Label ID="Label1" runat="server" Text="Label" style="display:none"></asp:Label>
    <asp:Label ID="ViewTemp" runat="server" Text="Label" style="display:none"></asp:Label>
	<asp:Label ID="FilenameTemp" runat="server" Text="" style="display:none"></asp:Label>
    <br />
    <br />
    <br />
    <div align="center">
        <asp:Panel ID="Panel1" runat="server" BackColor="White" Width="1050">
            <div id="content2">
                <br />
                <asp:Label ID="OragInfo" runat="server" Style="font-size: large; font-weight: 700"></asp:Label>
                <br />
                <br />
                <br />
                <div align="left" id="infoContent">
                    <asp:Label ID="OfferInfo" runat="server"></asp:Label>
                    <asp:Label ID="VacancyInfo" runat="server"></asp:Label>
                    <asp:Label ID="SalaryInfo" runat="server"></asp:Label>
                    <asp:Label ID="HourInfo" runat="server"></asp:Label>
                    <asp:Label ID="DayInfo" runat="server"></asp:Label>
                    <asp:Label ID="MonthInfo" runat="server"></asp:Label>
                    <asp:Label ID="JobDescriptionInfo" runat="server"></asp:Label>
                    <asp:Label ID="RequirementsInfo" runat="server"></asp:Label>
                    <asp:Label ID="DayStartInfo" runat="server"></asp:Label>
                    <asp:Label ID="DayEndInfo" runat="server"></asp:Label>
                    <asp:Label ID="SubmitInfo" runat="server"></asp:Label>
                    <asp:Label ID="Submit1" runat="server"></asp:Label>
                    <asp:Label ID="Submit2" runat="server"></asp:Label>
                    <asp:Label ID="Submit3" runat="server"></asp:Label>
                    <asp:Label ID="Submit4" runat="server"></asp:Label>
                    <asp:Label ID="Contact1" runat="server"></asp:Label>
                    <asp:Label ID="Contact2" runat="server"></asp:Label>
                    <asp:Label ID="Contact3" runat="server"></asp:Label>
                </div>
                <br />
                <p>
                    &nbsp;</p>
            </div>
        </asp:Panel>
        <asp:Panel ID="Panel2" runat="server" BackColor="White" Width="1050">
            <div align="left" ID="content2">
                <br />
                <%--<asp:Label ID="OragInfo2" runat="server" Style="font-size: large; font-weight: 700"></asp:Label>
                <br />--%>
                <br />
                <br />
                <asp:GridView ID="GridView1" runat="server" BackColor="White" 
                    BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4">
                    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                    <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                    <RowStyle BackColor="White" ForeColor="#330099" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                    <SortedAscendingCellStyle BackColor="#FEFCEB" />
                    <SortedAscendingHeaderStyle BackColor="#AF0101" />
                    <SortedDescendingCellStyle BackColor="#F6F0C0" />
                    <SortedDescendingHeaderStyle BackColor="#7E0000" />
                </asp:GridView>
                <br />
                <br />
                <asp:Button ID="Button1" runat="server" Text="Download File" 
                    onclick="Button1_Click"  />
                <br />
                <br />
            </div>
        </asp:Panel>
    </div>
    </form>
</body>
</html>
