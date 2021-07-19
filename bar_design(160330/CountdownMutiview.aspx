﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CountdownMutiview.aspx.cs" Inherits="CountdownMutiview" %>

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
        <div>
            <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                <asp:View ID="View1" runat="server">
                    <div style="text-align: right">
                        <asp:Label ID="Label2" runat="server" Text="Label">2号卷</asp:Label>
                    </div>
                    <%--調整大小 zoom: 0.5; -moz-transform: scale(0.5)--%>
                    <div class="clock" style="margin: 2em; margin-top: 2px; zoom: 0.4; -moz-transform: scale(0.4)"></div>

                    <div class="message"></div>

                    <script type="text/javascript">
                        var clock;

                        $(document).ready(function () {
                            var clock;
                            clock = $('.clock').FlipClock({
                                //clockFace: 'DailyCounter',
                                clockFace: 'MinuteCounter',
                                autoStart: false,
                                callbacks: {
                                    stop: function () {
                                        $("#Button1").click();
                                    }
                                }
                            });
                            clock.setCountdown(true);
                            clock.setTime(5);
                            clock.start();
                        });
                    </script>
                    <img src="countdownstyle/2_111.jpg" style="margin-top: -25px" />
                    <asp:Button ID="Button1" runat="server" Text="Button" Style="display: none" OnClick="Button1_Click" />
                </asp:View>


                <asp:View ID="View2" runat="server">
                    <div style="text-align: right">
                        <asp:Label ID="Label1" runat="server" Text="Label">2号卷</asp:Label>
                    </div>
                    <div class="clock" style="margin: 2em; margin-top: 2px; zoom: 0.4; -moz-transform: scale(0.4)"></div>

                    <div class="message"></div>

                    <script type="text/javascript">
                        var clock;

                        $(document).ready(function () {
                            var clock;

                            clock = $('.clock').FlipClock({
                                //clockFace: 'DailyCounter',
                                clockFace: 'MinuteCounter',
                                autoStart: false,
                                callbacks: {
                                    stop: function () {
                                        window.open('Countdown03.aspx', '_self');
                                        //$('.message').html('The clock has stopped!')
                                    }
                                }
                            });
                            clock.setCountdown(true);
                            clock.setTime(150);
                            clock.start();
                        });
                    </script>
                    <img src="countdownstyle/2_222.jpg" />
                </asp:View>

            </asp:MultiView>
        </div>
    </form>
</body>
</html>
