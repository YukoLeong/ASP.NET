<%@ Page Language="C#" AutoEventWireup="true" CodeFile="menu01p.aspx.cs" Inherits="menu01p" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="menu1style2/style.css" rel="stylesheet" />


    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

    <script type="text/javascript">

        $(document).ready(function () {
            $('#DarkLinkButton1').click(function () {
                //alert('123');
                $("#redli").addClass("active");
                return false;
            });
        });
    </script>




</head>

<body>
    <form id="form1" runat="server">
        <header class="darknavi">
            <nav>
                <div class="container">
                    <ul class="darknaviul">
                        <li class="red" id="redli">
                            <%--<a href="menu1p.aspx">Firefox</a>--%>
                            <asp:LinkButton ID="DarkLinkButton1" runat="server">Firefox</asp:LinkButton>


                        </li>
                        <li class="green">
                            <%--<a href="menu1p.aspx">Chrome</a>--%>
                            <asp:LinkButton ID="DarkLinkButton2" runat="server">Chrome</asp:LinkButton>

                        </li>
                        <li class="orange">
                            <%--<a href="menu1p.aspx">Safari</a>--%>
                            <asp:LinkButton ID="DarkLinkButton3" runat="server">Safari</asp:LinkButton>

                        </li>
                        <li class="yellow">
                            <%--<a href="menu1p.aspx">Opera</a>--%>
                            <asp:LinkButton ID="DarkLinkButton4" runat="server">Opera</asp:LinkButton>

                        </li>
                        <li class="purple">
                            <%--<a href="menu1p.aspx">Internet Explorer</a>--%>
                            <asp:LinkButton ID="DarkLinkButton5" runat="server">Internet Explorer</asp:LinkButton>

                        </li>
                        <li class="lightgreen">
                            <%--<a href="menu1p.aspx">Internet Explorer2</a>--%>
                            <asp:LinkButton ID="DarkLinkButton6" runat="server">Internet Explorer2</asp:LinkButton>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
    </form>
</body>
</html>
