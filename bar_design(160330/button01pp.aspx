<%@ Page Language="C#" AutoEventWireup="true" CodeFile="button01pp.aspx.cs" Inherits="button01pp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
    <%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css" />--%>
    <link href="button01style/bootstrap.min.css" rel="stylesheet" />
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" />

    <link href="button01style/demo-page.css" rel="stylesheet" />
    <link href="button01style/hover.css" rel="stylesheet" />


    <style>
        .btn-success {
            width: 120px;
            height: 40px;
            border: solid #1F861F 1.5px;
            font-size: 18px;
        }

            .btn-success:hover {
                width: 120px;
                height: 40px;
                border: solid #1F861F 2px;
                font-size: 18px;
                /*color: #1F861F;*/
            }

            .btn-success:before {
                font-family: FontAwesome;
                content: "\f015";
                position: relative;
                left: -13px;
            }

        /*.btn-success:hover:before {
            left: 9px;
        }*/
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div style="margin: auto; width: 800px; text-align: center; margin-top: 50px">
            <button id="Button1" runat="server" class="btn btn-success hvr-icon-pulse-grow" onserverclick="Button1_Click">Home</button>
        </div>
    </form>
</body>
</html>