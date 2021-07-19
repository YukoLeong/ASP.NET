<%@ Page Language="C#" AutoEventWireup="true" CodeFile="logindesign02p.aspx.cs" Inherits="logindesign02p" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>

        html {
            height: 100%;
        }

        body {
            padding: 0;
            margin: 0px;
            /*background: #2a8496;
            background: linear-gradient(135deg, #1274a3 0%,#68ad74 100%);*/
            /*background: #68ad74;
            background: linear-gradient(135deg,#9BCDF2 0%,#68ad74 100%);*/
            /*background: #68ad74;
            background: linear-gradient(135deg, #68ad74 0%,#64C8F2 100%);*/
            background: #68ad74;
            background: linear-gradient(135deg, #68ad74 0%,#9BCDF2 100%);
            color: rgba(255,255,255,0.85);
            min-width: 950px;
            min-height: 400px;
        }


        .bgset {
            background-image: url('logindesign02style/mpi01pppp.jpg');
            background-repeat: no-repeat;
            width: 1920px;
            height: 800px;
            float: left;
            background-attachment: fixed;
            background-position: center;
            position: absolute;
            z-index: -1;
        }


        .vid-container {
            position: relative;
            height: 100vh;
            overflow: hidden;
        }

        .bgvid {
            position: absolute;
            left: 0;
            top: 0;
            width: 100vw;
        }

        .inner-container {
            width: 400px;
            height: 400px;
            position: absolute;
            top: calc(50vh - 200px);
            left: calc(76vw - 200px);
            overflow: hidden;
        }

        .bgvid.inner {
            top: calc(-50vh + 200px);
            left: calc(-50vw + 200px);
            filter: url("data:image/svg+xml;utf9,<svg%20version='1.1'%20xmlns='http://www.w3.org/2000/svg'><filter%20id='blur'><feGaussianBlur%20stdDeviation='10'%20/></filter></svg>#blur");
            -webkit-filter: blur(10px);
            -ms-filter: blur(10px);
            -o-filter: blur(10px);
            filter: blur(10px);
        }

        .box {
            position: absolute;
            height: 100%;
            width: 100%;
            font-family: Helvetica;
            color: #fff;
            background: rgba(0,0,0,0.13);
            padding: 30px 0px;
        }

            .box h1 {
                text-align: center;
                margin: 30px 0;
                font-size: 30px;
            }

            .box input {
                display: block;
                width: 300px;
                margin: 20px auto;
                padding: 15px;
                background: rgba(0,0,0,0.2);
                color: #fff;
                border: 0;
            }

                .box input:focus, .box input:active, .box button:focus, .box button:active {
                    outline: none;
                }

            .button01 {
                /*background: #2ecc71;*/
                background: #742ECC;
                border: 0;
                color: #fff;
                padding: 10px;
                font-size: 20px;
                width: 330px;
                margin: 20px auto;
                display: block;
                cursor: pointer;
            }

                .button01:active {
                    /*background: #27ae60;*/
                    background: #4E24D6;
                }

            .box p {
                font-size: 14px;
                text-align: center;
            }

                .box p span {
                    cursor: pointer;
                    color: #666;
                }
    </style>



</head>
<body>
    <form id="form1" runat="server">
        <div class="vid-container">
            <%--<video class="bgvid" autoplay="autoplay" muted="muted" preload="auto" loop>
                <source src="http://mazwai.com/system/posts/videos/000/000/109/webm/leif_eliasson--glaciartopp.webm?1410742112" type="video/webm">
            </video>--%>
            <div class="bgset"></div>
            <div class="inner-container">
                <%--<video class="bgvid inner" autoplay="autoplay" muted="muted" preload="auto" loop>
                    <source src="http://mazwai.com/system/posts/videos/000/000/109/webm/leif_eliasson--glaciartopp.webm?random=1" type="video/webm">
                </video>--%>
                <div class="box">
                    <h1>Login</h1>
                    <input type="text" placeholder="Username" />
                    <input type="text" placeholder="Password" />
                    <button class="button01">Login / Post Job</button>
                    <p>Not a member? <span>Sign Up</span></p>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
