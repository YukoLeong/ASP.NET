<%@ Page Language="C#" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="MPICP_home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <link rel="shortcut icon" href="images/mpicpicon.ico" />

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
            overflow:hidden;
        }


        .bgset {
            background-image: url('images/homepic.jpg');
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
            top: calc(49vh - 200px);
            left: calc(77vw - 200px);
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

            .box .inputtype {
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

        .button02 {
            background: #2ecc71;
            /*background: #742ECC;*/
            border: 0;
            color: #fff;
            padding: 10px;
            font-size: 20px;
            width: 330px;
            margin: 20px auto;
            display: block;
            cursor: pointer;
        }

            .button02:active {
                background: #27ae60;
                /*background: #4E24D6;*/
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
            <div class="bgset"></div>
            <img style="margin-left: 25%; margin-top: 90px" src="images/logo_mcpoly.png" />
            <div style="font-family: 'Microsoft JhengHei'; margin-top: -80px; margin-left:500px; color: white; text-align: center;">
                <div style="font-size: 36px;">
                    <asp:Label ID="Label2" runat="server" Text="澳門理工學院企業招聘系統"></asp:Label>
                </div>
                <div style="font-size: 30px;">
                    <asp:Label ID="Label1" runat="server" Text="Macao Polytechnic Institute Career Platform"></asp:Label>
                </div>
            </div>
            <div class="inner-container">
                <div class="box">
                    <h1>Login</h1>
                    <asp:TextBox ID="AccountBox" CssClass="inputtype" runat="server" placeholder="Username"></asp:TextBox>
                    <asp:TextBox ID="PasswordBox" CssClass="inputtype" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                    <%--<input class="inputtype" type="text" placeholder="Username" />
                    <input class="inputtype" type="text" placeholder="Password" />--%>
                    <%--<button class="button01">Login / Post Job</button>--%>
                    <asp:Button ID="LoginButton" CssClass="button01" runat="server" Text="Login / Post Job" OnClick="LoginButton_Click" />
                    <%--<button class="button02">Register</button>--%>
                    <asp:Button ID="RegisterButton" CssClass="button02" runat="server" Text="Not a member? Sign Up" OnClick="RegisterButton_Click" />
                    <%--<button class="button02">Not a member? Sign Up</button>--%>

                    <%--<p>Not a member? <span>Sign Up</span></p>--%>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
