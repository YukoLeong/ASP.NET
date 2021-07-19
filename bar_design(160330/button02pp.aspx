<%@ Page Language="C#" AutoEventWireup="true" CodeFile="button02pp.aspx.cs" Inherits="button02pp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        html,
        body {
            padding: 0;
            margin: 0;
        }

        /*#main-nav-wrapper {
            height: 100px;
            overflow: hidden;
        }*/


        .main-nav {
            position: relative;
            /*  bottom: 0;*/
            width: 100%;
            padding: 0;
            margin: 0;
            text-align: center;
            font-size: 0;
        }

        .main-nav-list {
            display: inline-block;
            padding: 0;
            list-style: none;
        }

            .main-nav-list li {
                display: inline-block;
                margin: 0;
                padding: 0;
                min-width: 50px;
                min-height: 50px;
                /*margin-top: 30px;*/
                /*top:30px;*/
            }

                .main-nav-list li img {
                    display: inline-block;
                    /*cursor: pointer;*/ /*pic can click or not*/
                    margin: 0;
                    padding: 0;
                }

        #ImageButton1 {
            width: 8%;
        }

        .aimg {
            width: 75px;
        }

        .aimgactive {
            width: 130px;
        }

        /*circlepic*/

        .circlepic {
            -webkit-filter: grayscale(90%);
            margin-left: 10px;
            cursor: pointer;
        }

            .circlepic:hover {
                -webkit-filter: grayscale(0);
            }
    </style>


    <script src="button02style/jquery-2.1.4.min.js"></script>
    <%--<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>--%>

    <%--open and close the js effect(會有閃屏)--%>
    <script src="button02style/jquery.resizeOnApproach.1.0.min.js"></script>
    <script>
        $(document).ready(function () {
            $('.main-nav-list .aimg').resizeOnApproach({
                elementDefault: 75,
                elementClosest: 130,
                triggerDistance: 100
            });

            $('.main-nav-list .aimgactive').resizeOnApproach({
                elementDefault: 110,
                elementClosest: 110,
                triggerDistance: 100
            });

            $('.main-nav-list .nocolorimg').resizeOnApproach({
                elementDefault: 150,
                elementClosest: 150,
                triggerDistance: 100
            });

        });
    </script>

</head>

<body>
    <form id="form1" runat="server">
        <br />
        <div style=" font-size:20px">
            <asp:ImageButton ID="ImageButton1" runat="server" onmouseover="this.src='button02style/homeblue_hover.png'" onmouseout="this.src='button02style/homeblue.png'" ImageUrl="~/button02style/homeblue.png" OnClick="ImageButton1_Click" />
        </div>
        <br />
        <br />
        <br />
        <div id="main-nav-wrapper">
            <nav class="main-nav">
                <ul class="main-nav-list">

                    <li class="apic9color">
                        <img src="button02style/nocolor.png" class="nocolorimg" />

                    </li>

                    <li class="apic8color">
                        <asp:ImageButton ID="ImageButtonapic8" runat="server" ImageUrl="~/button02style/apic8.png" CssClass="aimg" />
                    </li>

                    <li class="apic1color">
                        <asp:ImageButton ID="ImageButtonapic1" runat="server" ImageUrl="~/button02style/apic1.png" CssClass="aimgactive" OnClick="ImageButtonapic1_Click" />

                    </li>
                    <li class="apic2color">

                        <asp:ImageButton ID="ImageButtonapic2" runat="server" ImageUrl="~/button02style/apic2.png" CssClass="aimg" OnClick="ImageButtonapic2_Click" />


                    </li>
                    <li class="apic3color">
                        <asp:ImageButton ID="ImageButtonapic3" runat="server" ImageUrl="~/button02style/apic3.png" CssClass="aimg" OnClick="ImageButtonapic3_Click" />


                    </li>
                    <li class="apic4color">

                        <asp:ImageButton ID="ImageButtonapic4" runat="server" ImageUrl="~/button02style/apic4.png" CssClass="aimg" OnClick="ImageButtonapic4_Click" />

                    </li>
                    <li class="apic5color">

                        <asp:ImageButton ID="ImageButtonapic5" runat="server" ImageUrl="~/button02style/apic5.png" CssClass="aimg" OnClick="ImageButtonapic5_Click" />

                    </li>
                    <li class="apic6color">

                        <asp:ImageButton ID="ImageButtonapic6" runat="server" ImageUrl="~/button02style/apic6.png" CssClass="aimg" OnClick="ImageButtonapic6_Click" />


                    </li>
                    <li class="apic7color">
                        <asp:ImageButton ID="ImageButtonapic7" runat="server" ImageUrl="~/button02style/apic7.png" CssClass="aimg" OnClick="ImageButtonapic7_Click" />

                    </li>



                    <!-- <li class="apic8color"><img src="apic8.png" alt="Properties and changes of materials" title="Properties and changes of materials"></li> -->
                </ul>
            </nav>
        </div>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <div style="margin: auto; width: 100%; text-align: center">
            <asp:ImageButton ID="ImageButton2" runat="server" onmouseover="this.src='button02style/search2.png'" onmouseout="this.src='button02style/search1.png'" ImageUrl="~/button02style/search1.png" Style="width: 120px" />
            <asp:ImageButton ID="ImageButton3" runat="server" onmouseover="this.src='button02style/detail2.png'" onmouseout="this.src='button02style/detail1.png'" ImageUrl="~/button02style/detail1.png" Style="width: 120px" />
            <asp:ImageButton ID="ImageButton4" runat="server" onmouseover="this.src='button02style/advice2.png'" onmouseout="this.src='button02style/advice1.png'" ImageUrl="~/button02style/advice1.png"
                Style="width: 120px" />
            <asp:ImageButton ID="ImageButton5" runat="server" onmouseover="this.src='button02style/help2.png'" onmouseout="this.src='button02style/help1.png'" ImageUrl="~/button02style/help1.png"
                Style="width: 120px" />
        </div>
        <br />
        <br />
        <br />
        <br />
        <div style="margin: auto; width: 100%; text-align: center">
            <img id="btn1" class="circlepic" src="button02style/circlepic01.png" />
            <img id="btn2" class="circlepic" src="button02style/circlepic02.png" />
            <img id="btn3" class="circlepic" src="button02style/circlepic03.png" />
            <img id="btn4" class="circlepic" src="button02style/circlepic04.png" />
        </div>




    </form>
</body>
</html>
