<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CounterTimer.aspx.cs" Inherits="CounterTimer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div id="timelabel"></div>
        <script type="text/javascript">

            var leave =<%=seconds %>;
            var count=0 // 為了只執行一次

            if(leave>10000000){   //好像只是為了執行function 裡面是什麼都不重要
                CounterTimer();
            }
            var interv=setInterval(CounterTimer,1000);

            function CounterTimer()
            {
                if(leave>=0)
                {
                    var day = Math.floor(leave / ( 60 * 60 * 24))
                    var hour = Math.floor(leave / 3600) - (day * 24)
                    var minute = Math.floor(leave / 60) - (day * 24 *60) - (hour * 60)
                    var second = Math.floor(leave) - (day * 24 *60*60) - (hour * 60 * 60) - (minute*60)

                    hour=hour<10 ? "0" + hour : hour;
                    minute=minute<10 ? "0" + minute : minute;
                    second=second<10 ? "0" + second : second;

                    //var remain=day + " days   "+hour + ":"+minute+":"+second;
                    remain=minute+":"+second;
                    leave=leave-1;

                    document.getElementById("timelabel").innerText=remain;
                }
                else{
                    if(count==0){
                        alert("Time End!");
                        //$("#Button1").click();        //執行某些按鍵功能時用
                        count=count+1;
                    }
                }
            }
        </script>
    </form>
</body>
</html>
