<%@ Page Language="C#" AutoEventWireup="true" CodeFile="weather02.aspx.cs" Inherits="weather02" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>zWeatherFeed - Displaying a 5 Day Forecast</title>

    <link href="weather01style/example.css" rel="stylesheet" type="text/css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
    <script src="weather01style/jquery.zweatherfeed.min.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $('#test').weatherfeed(['CHXX0512'], {
                forecast: true
            });
        });
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <h1>zWeatherFeed - Displaying a 5 Day Forecast</h1>
        <p>The example show the current weather conditions along with the a 5 day forecast.</p>

        <h4>Script</h4>
        <pre>
$(document).ready(function () {
	$('#test').weatherfeed(['CHXX0512'], {
		forecast: true
	});
});
</pre>

        <h4>Result</h4>
        <div id="test"></div>
    </form>
</body>
</html>
