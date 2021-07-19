<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="calendar01.aspx.cs" Inherits="AJAXToolkit.calendar01" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="calendar01style/orange.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
           <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
           <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="TextBox1" Format="dd/MM/yyyy" CssClass="orange">
          </cc1:CalendarExtender>
    </form>
</body>
</html>
