<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="awesomefont.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
    <link href="bootstrapstyle/bootstrap.min.css" rel="stylesheet" />
    <%--    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css" />--%>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" />

    <style>
        .btn-success {
            width: 121px;
            height: 40px;
            border: solid #1F861F 1.5px;
            font-size: 18px;
            padding-left:0px;
        }

            .btn-success:hover {
                width: 121px;
                height: 40px;
                border: solid #1F861F 2px;
                font-size: 18px;
                /*color: #1F861F;*/
            }

        .btn-success:before {
            font-family: FontAwesome;
            content: "\f015";
            position:relative;
            left:-50px;
            transition: all 200ms ease;
        }

        .btn-success:hover:before {
            left: -9px;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div style="margin: auto; width: 800px; text-align: center; margin-top: 50px">
            <button id="Button1" runat="server" class="btn btn-success" OnServerClick="Button1_Click">Home</button>

        </div>
    </form>
</body>
</html>