<%@ Page Language="C#" AutoEventWireup="true" CodeFile="weather01.aspx.cs" Inherits="weather01" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>zWeatherFeed - Example Of Day And Night CSS Styling</title>

<%--    jquery weather
    http://www.zazar.net/developers/jquery/zweatherfeed/--%>


    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
    <script src="weather01style/jquery.zweatherfeed.min.js" type="text/javascript"></script>
    <link href="weather01style/example.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        .day {
            background-color: #b0b0f0;
        }

            .day a {
                color: #555;
            }

        .night {
            background-color: #2a2a33;
            color: #eaeaf0;
        }

            .night a:hover {
                color: #fff;
            }
    </style>

    <script type="text/javascript">
        $(document).ready(function () {
            $('#test').weatherfeed(['CHXX0512', 'ASXX0112']);
        });
    </script>


</head>
<body>
    <form id="form1" runat="server">

        <h1>zWeatherFeed - Example Of Day And Night CSS Styling</h1>
        <p>This example shows how you can use the '.day' and '.night' CSS classes that are added to each weather feed item.</p>

        <h4>Script</h4>
        <pre>
$(document).ready(function () {
	$('#test').weatherfeed(['UKXX0085','ASXX0112']);
});
</pre>

        <h4>CSS</h4>
        <pre>
.day { background-color: #b0b0f0; }
.day a { color: #555; }

.night { background-color: #2a2a33; color: #eaeaf0; }
.night a:hover { color: #fff; }
</pre>

        <h4>Result</h4>
        <div id="test"></div>

        <p>Note: The '.day' and '.night' classes override the '.odd' and '.even' classes that are also added to each feed item.</p>

    </form>
</body>
</html>
