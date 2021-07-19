<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MultiviewJquery.aspx.cs" Inherits="multiview.MultiviewJquery" %>

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

                    <div class="clock" style="margin: 2em; margin-top: 22px"></div>

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
                            clock.setTime(3);
                            clock.setCountdown(true);
                            clock.start();
                        });
                    </script>

                    <asp:Label ID="Label2" runat="server" Text="Label">This is View 1</asp:Label>
                    <asp:Button ID="Button1" runat="server" Text="Button" Style="display: none" OnClick="Button1_Click" />
                </asp:View>

                <asp:View ID="View2" runat="server">

                    <div class="clock" style="margin: 2em; margin-top: 22px"></div>

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
                                        //window.open('Countdown03.aspx', '_self');
                                        //$('.message').html('The clock has stopped!')
                                    }
                                }
                            });
                            clock.setTime(150);
                            clock.setCountdown(true);
                            clock.start();
                        });
                    </script>
                    <asp:Label ID="Label1" runat="server" Text="Label">This is View 2</asp:Label>
                </asp:View>

            </asp:MultiView>
        </div>
    </form>
</body>
</html>
