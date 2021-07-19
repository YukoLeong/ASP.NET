<%@ Page Language="C#" AutoEventWireup="true" CodeFile="datepicker01p.aspx.cs" Inherits="datepicker01p" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>jQuery UI Datepicker - Default functionality</title>
    <%--    <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
    <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
    <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>--%>
    <link href="layout01pppage01style/jquery-ui.css" rel="stylesheet" />
    <script src="layout01pppage01style/jquery-1.11.2.min.js"></script>
    <script src="layout01pppage01style/jquery-ui.js"></script>

    <link rel="stylesheet" href="bootstrapstyle/bootstrap.min.css" />
    <link rel="stylesheet" href="bootstrapstyle/bootstrap-theme.min.css" />
    <script src="bootstrapstyle/bootstrap.min.js"></script>


    <script>
        $(function () {
            $("#datepicker").datepicker();
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <form class="form-inline">
        </form>
        <form class="form-inline">
            <div class="form-group">
                <label for="exampleInputName2">date:</label>
                <input type="text" class="form-control" style="width: 200px" id="datepicker" />
            </div>
        </form>


    </form>
</body>
</html>
