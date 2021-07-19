<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="editor01.aspx.cs" Inherits="AJAXToolkit.editor01" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>

    <%--https://www.youtube.com/watch?v=24hIhS2itUU&feature=youtu.be--%>


    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:TextBox ID="TextBox1" runat="server" Height="600px" Width="1000px"></asp:TextBox>

        <cc1:HtmlEditorExtender ID="TextBox1_HtmlEditorExtender" runat="server" TargetControlID="TextBox1">
        </cc1:HtmlEditorExtender>
    </div>
    </form>
</body>
</html>
