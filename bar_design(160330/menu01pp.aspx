<%@ Page Language="C#" AutoEventWireup="true" CodeFile="menu01pp.aspx.cs" Inherits="menu01pp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
   <link href="menu1style3/style.css" rel="stylesheet" />


    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

<%--    <script type="text/javascript">

        $(document).ready(function () {
            $('#DarkLinkButton1').click(function () {
                //alert('123');
                $("#redli").addClass("active");
                return false;
            });
        });
    </script>--%>




</head>

<body>
    <form id="form1" runat="server">
        <header class="darknavi">
            <nav>
                <div class="container">
                    <ul class="darknaviul">
                        <li class="red" runat="server" id="redli">
                            <%--<a href="menu1p.aspx">Firefox</a>--%>
                            <asp:LinkButton ID="DarkLinkButton1" runat="server" OnClick="DarkLinkButton1_Click">Firefox</asp:LinkButton>


                        </li>
                        <li class="green" runat="server" id="greenli">
                            <%--<a href="menu1p.aspx">Chrome</a>--%>
                            <asp:LinkButton ID="DarkLinkButton2" runat="server" OnClick="DarkLinkButton2_Click">Chrome</asp:LinkButton>

                        </li>
                        <li class="orange" runat="server" id="orangeli">
                            <%--<a href="menu1p.aspx">Safari</a>--%>
                            <asp:LinkButton ID="DarkLinkButton3" runat="server" OnClick="DarkLinkButton3_Click">Safari</asp:LinkButton>

                        </li>
                        <li class="blue" runat="server" id="blueli">
                            <%--<a href="menu1p.aspx">Opera</a>--%>
                            <asp:LinkButton ID="DarkLinkButton4" runat="server" OnClick="DarkLinkButton4_Click">Opera</asp:LinkButton>

                        </li>
                        <li class="purple" runat="server" id="purpleli">
                            <%--<a href="menu1p.aspx">Internet Explorer</a>--%>
                            <asp:LinkButton ID="DarkLinkButton5" runat="server" OnClick="DarkLinkButton5_Click">Internet Explorer</asp:LinkButton>

                        </li>
                        <li class="lightgreen" runat="server" id="lightgreenli">
                            <%--<a href="menu1p.aspx">Internet Explorer2</a>--%>
                            <asp:LinkButton ID="DarkLinkButton6" runat="server" OnClick="DarkLinkButton6_Click">Internet Explorer2</asp:LinkButton>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
    </form>
</body>
</html>