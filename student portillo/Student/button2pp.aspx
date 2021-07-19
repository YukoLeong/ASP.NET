<%@ Page Language="C#" AutoEventWireup="true" CodeFile="button2pp.aspx.cs" Inherits="Student_button2pp" %>

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


                .main-nav-list li.apic1color {
                    background-color: #a8218e;
                }

                .main-nav-list li.apic2color {
                    background-color: #00a7ef;
                }

                .main-nav-list li.apic3color {
                    background-color: #ffa200;
                }

                .main-nav-list li.apic4color {
                    background-color: #9ae900;
                }

                .main-nav-list li.apic5color {
                    background-color: #ff2200;
                }

                .main-nav-list li.apic6color {
                    background-color: #ffd600;
                }

                .main-nav-list li.apic7color {
                    background-color: #00989a;
                }
                /*.main-nav-list li.apic8color { background-color: #00cb79; }*/


                .main-nav-list li img {
                    display: inline-block;
                    /*cursor: pointer;*/   /*pic can click or not*/
                    margin: 0;
                    padding: 0;
                }

        #ImageButton1 {
            width: 8%;
        }
    </style>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="button2style/jquery.resizeOnApproach.1.0.min.js"></script>
    <script>
        $(document).ready(function () {
            //$('.main-nav-list .aimg').resizeOnApproach({
            //    elementDefault: 80,
            //    elementClosest: 100,
            //    triggerDistance: 100
            //});


            //$('.main-nav-list .aimgactive').resizeOnApproach({
            //    elementDefault: 130,
            //    elementClosest: 130,
            //    triggerDistance: 100
            //});

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
    <script type="text/javascript">

        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-36251023-1']);
        _gaq.push(['_setDomainName', 'jqueryscript.net']);
        _gaq.push(['_trackPageview']);

        (function () {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();

    </script>



</head>

<body>
    <form id="form1" runat="server">
        <br />
        <div style="margin: auto; width: 100%; text-align: center">
            <asp:ImageButton ID="ImageButton1" runat="server" onmouseover="this.src='homebutton/homeblue_hover.png'" onmouseout="this.src='homebutton/homeblue.png'" ImageUrl="~/homebutton/homeblue.png" />
        </div>
        <br />
        <br />
        <br />
        <div id="main-nav-wrapper">
            <nav class="main-nav">
                <ul class="main-nav-list">

                    <li class="apic9color">
                        <img src="button2style/nocolor.png" class="nocolorimg" />

                    </li>

                    <li class="apic8color">
                        <asp:ImageButton ID="ImageButtonapic8" runat="server" ImageUrl="~/button2style/apic8.png" CssClass="aimg" OnClick="ImageButtonapic8_Click"/>
                    </li>

                    <li class="apic1color">
                        <asp:ImageButton ID="ImageButtonapic1" runat="server" ImageUrl="~/button2style/apic1.png" CssClass="aimgactive" OnClick="ImageButtonapic1_Click" />

                    </li>
                    <li class="apic2color">

                        <asp:ImageButton ID="ImageButtonapic2" runat="server" ImageUrl="~/button2style/apic2.png" CssClass="aimg" OnClick="ImageButtonapic2_Click" />


                    </li>
                    <li class="apic3color">
                        <asp:ImageButton ID="ImageButtonapic3" runat="server" ImageUrl="~/button2style/apic3.png" CssClass="aimg" OnClick="ImageButtonapic3_Click" />


                    </li>
                    <li class="apic4color">

                        <asp:ImageButton ID="ImageButtonapic4" runat="server" ImageUrl="~/button2style/apic4.png" CssClass="aimg" OnClick="ImageButtonapic4_Click" />

                    </li>
                    <li class="apic5color">

                        <asp:ImageButton ID="ImageButtonapic5" runat="server" ImageUrl="~/button2style/apic5.png" CssClass="aimg" OnClick="ImageButtonapic5_Click" />

                    </li>
                    <li class="apic6color">

                        <asp:ImageButton ID="ImageButtonapic6" runat="server" ImageUrl="~/button2style/apic6.png" CssClass="aimg" OnClick="ImageButtonapic6_Click" />


                    </li>
                    <li class="apic7color">
                        <asp:ImageButton ID="ImageButtonapic7" runat="server" ImageUrl="~/button2style/apic7.png" CssClass="aimg" OnClick="ImageButtonapic7_Click" />

                    </li>



                    <!-- <li class="apic8color"><img src="apic8.png" alt="Properties and changes of materials" title="Properties and changes of materials"></li> -->
                </ul>
            </nav>
        </div>


    </form>
</body>
</html>
