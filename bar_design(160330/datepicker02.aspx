<%@ Page Language="C#" AutoEventWireup="true" CodeFile="datepicker02.aspx.cs" Inherits="datepicker02" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="layout01pppage01style/jquery-ui.css" rel="stylesheet" />
    <script src="layout01pppage01style/jquery-1.11.2.min.js"></script>
    <script src="layout01pppage01style/jquery-ui.js"></script>

    <script type="text/javascript">
        $(function () {
            $("#datepicker1").datepicker({
                showOn: "button",
                buttonImage: "layout01pppage01style/calendar.gif",
                buttonImageOnly: true,
                showWeek: false,
                changeMonth: true,
                changeYear: true,
                buttonText: "Select date"
            });

            $("#datepicker2").datepicker({
                showOn: "button",
                buttonImage: "layout01pppage01style/calendar.gif",
                buttonImageOnly: true,
                showWeek: false,
                changeMonth: true,
                changeYear: true,
                buttonText: "Select date"
            });

            //$(".ui-datepicker-trigger").css("margin-bottom", "-1px");
            //$(".ui-datepicker-trigger").css("margin-left", "1px");

        });
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="datepicker1" runat="server"></asp:TextBox>
            <asp:TextBox ID="datepicker2" runat="server"></asp:TextBox>
        </div>
    </form>
</body>
</html>
