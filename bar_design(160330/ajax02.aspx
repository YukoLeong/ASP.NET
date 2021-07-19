<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ajax02.aspx.cs" Inherits="ajax02" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
    <script>
        onload = function () {
            $("#Button1").click(function () {
                //var enterdata = '55555';
                var enterdata = document.getElementById("TextBox1").value;
                $.ajax({
                    type: "GET",
                    url: "ajax02WebService.asmx/SubmitData",
                    contentType: "application/json charset=utf-8",
                    dataType: "json",
                    data: { 'data': enterdata },
                    success: function (response) {

                    },
                    failure: function (response) {
                        alert(response.d);
                    }

                });
                return false;
            });

            $("#Button2").click(function () {
                
                $.ajax({
                    type: "POST",
                    url: "ajax02WebService.asmx/ClearData",
                    contentType: "application/json charset=utf-8",
                    dataType: "json",
                    data: {},
                    success: function (response) {

                    },
                    failure: function (response) {
                        alert(response.d);
                    }

                });
                return false;
            });

        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="Sumbit" />
            <asp:Button ID="Button2" runat="server" Text="ClearData" />
        </div>
        <asp:Label ID="Label1" runat="server"></asp:Label>
    </form>
</body>
</html>
