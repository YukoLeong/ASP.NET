<%@ Page Language="C#" AutoEventWireup="true" CodeFile="validnum01p.aspx.cs" Inherits="validnum01p" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script src="jquery01style/jquery-2.1.1.min.js"></script>
    <script type="text/javascript">
            function refimg() {
                var randval = Math.random();
                document.getElementById("imagevalid").src = "validnum01.aspx?val=" + randval;
            }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <tr>
                <td height="23" align="right">
                    <asp:Label ID="lb_code" runat="server" Text="Security Code"></asp:Label>&nbsp;(<span style="color: red">*</span>)：</td>
                <td height="23">
                    <asp:TextBox ID="entervalid" runat="server" Width=100px></asp:TextBox>
                    <span style="padding-top: initial">
                        <asp:Image
                            ID="imagevalid" runat="server" ImageUrl="validnum01.aspx" onclick="refimg()" Style="cursor: pointer;"
                            Width="58px" />
                    </span>
                </td>
            </tr>
            <%--<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>--%>
            <asp:Button ID="ValidButton" runat="server" Text="Button" OnClick="ValidButton_Click" />
        </div>
    </form>
</body>
</html>
