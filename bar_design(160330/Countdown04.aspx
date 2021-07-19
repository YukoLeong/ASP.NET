<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Countdown04.aspx.cs" Inherits="Countdown04" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="countdownstyle/flipclock.css" rel="stylesheet" />

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

    <script src="countdownstyle/flipclock.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div style="text-align: right">
            <asp:Label ID="Label2" runat="server" Text="Label">2号卷</asp:Label>
        </div>
        <div class="clock" style="margin: 2em; margin-top: 2px"></div>
        <div class="message"></div>

        <script type="text/javascript">
            var clock;

            $(document).ready(function () {
                var clock;

                clock = $('.clock').FlipClock({
                    clockFace: 'DailyCounter',
                    autoStart: false,
                    callbacks: {
                        stop: function () {
                            window.open('Countdown05.aspx', '_self');
                            //$('.message').html('The clock has stopped!')
                        }
                    }
                });
                clock.setCountdown(true);
                clock.setTime(240);
                clock.start();

            });
        </script>
        <img src="countdownstyle/2_444.jpg" style="margin-top:-30px"/>
    </form>
</body>
</html>
