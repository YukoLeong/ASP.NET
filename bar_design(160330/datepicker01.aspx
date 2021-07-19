<%@ Page Language="C#" AutoEventWireup="true" CodeFile="datepicker01.aspx.cs" Inherits="datepicker01" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>jQuery UI Datepicker - Default functionality</title>
<%--    <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
    <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
    <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>--%>

    <link href="layout01pppage01style/jquery-ui.css" rel="stylesheet" />
   <%-- <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>--%> <%--要用這個不然出不了圖--%>
    <script src="layout01pppage01style/jquery-1.11.2.min.js"></script>
    <script src="layout01pppage01style/jquery-ui.js"></script>
    

    <script>
        $(function () {
            $("#datepicker").datepicker();
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <p>Date: <input type="text" id="datepicker"/></p>
        </div>
    </form>
</body>
</html>
