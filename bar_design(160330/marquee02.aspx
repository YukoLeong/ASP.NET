<%@ Page Language="C#" AutoEventWireup="true" CodeFile="marquee02.aspx.cs" Inherits="marquee02" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <style>
        #news {
            width: 35%;
            float: left;
            height: 350px;
            overflow: hidden;
            border: solid #CCC 1px;
            border-radius: 30px;
            -moz-border-radius: 30px;
            -webkit-border-radius: 30px;
            margin: 0% 0 1% 2%;
            box-shadow: 0px 5px 8px #888;
        }

        #newsInfo {
            margin-right: 10px;
        }

        #mdivx1 {
            display: none;
            overflow-y: scroll;
            overflow: -moz-scrollbars-vertical;
            height: 292px;
        }

    </style>

    <script src="jquery01style/jquery-1.11.1.js"></script>
    <script src="marquee02style/jquery.zrssfeed.min.js"></script>

    <%--<script src="jquery01style/jquery-2.1.1.min.js"></script>--%>
    <script>
        onload = function () {
            $('#newsInfo').rssfeed('http://webapps.ipm.edu.mo/mpi_home/news/web_rss.asp?days=5&activity_category=ep', {
                //$('#newsInfo').rssfeed('http://webapps.ipm.edu.mo/mpi_home/news/web_rss.asp?days=5&activity_category=ep&lang=chi', {
                ssl: true,
                linktarget: '_blank',
                dateformat: 'dd/MM/yyyy',
                
                limit: 10
            });
        }
    </script>
</head>

<body>
    <form id="form1" runat="server">

        <div id="news">
            <h2><span id="lb_news">MPI News</span></h2>
            <div style="position: relative; top: 0px; text-align: left;">
                <div id="maq3" style="overflow: hidden; height: 425px; width: 100%;">

                    <div id="newsInfo">
                    </div>

                    <div id="m3"></div>
                    <div id="mdivx1"></div>
                </div>
            </div>
        </div>

        <script type="text/javascript">
            var speed3 = 10;
            document.getElementById("m3").innerHTML = document.getElementById("newsInfo").innerHTML;

            var MyMar3 = setInterval(Marquee3, speed3);
            var maq3 = document.getElementById("maq3");
            //var clientHeight = document.getElementById("maq3").scrollHeight;
            //var height = document.getElementById("maq3").offsetHeight;

            function Marquee3() {

                //if (maq3.offsetHeight + 79 - maq3.scrollTop <= 0)
                if (m3.offsetTop - maq3.offsetHeight - maq3.scrollTop <= 0)
                    maq3.scrollTop = 0;
                else
                    maq3.scrollTop++;

                //console.log('maq height '+ height +' '+ clientHeight);
                console.log('height: ' + maq3.offsetHeight + ' m3 height: ' + m3.offsetTop + ' maq3 scrollTop: ' + maq3.scrollTop);
                console.log(maq3.scrollTop);

                document.getElementById("maq3").onmouseover = function () {
                    clearInterval(MyMar3);
                    $('#newsInfo').hide();
                    $('#mdivx1').show().html($('#newsInfo').html());
                }
                document.getElementById("maq3").onmouseout = function () {
                    $('#newsInfo').show();
                    $('#mdivx1').hide().html();
                    MyMar3 = setInterval(Marquee3, speed3);
                }

            }

        </script>



    </form>
</body>
</html>
