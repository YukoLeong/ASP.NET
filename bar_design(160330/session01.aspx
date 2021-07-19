<%@ Page Language="C#" AutoEventWireup="true" CodeFile="session01.aspx.cs" Inherits="session01" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>

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


    </style>
    <script src="button02style/jquery-2.1.4.min.js"></script>
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
        <br />
            <a href="?lang=en" runat="server" id="linkEnglish">
                <asp:Literal ID="Literal1" runat="server" Text="<%$Resources:chienvh.language, langEnglish%>" /></a>
            <a href="?lang=zh" runat="server" id="linkChinese">
                <asp:Literal ID="Literal2" runat="server" Text="<%$Resources:chienvh.language, langVietnamese%>" /></a>
            <br />
            <br />
            <br />
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Text="<%$Resources:chienvh.language, testlan1%>"></asp:Label>



        <br />
        <div id="main-nav-wrapper">
            <nav class="main-nav">
                <ul class="main-nav-list">

                    <li class="apic9color">
                        <img src="button02style/nocolor.png" class="nocolorimg" />

                    </li>

                    <li class="apic8color">
                        <asp:ImageButton ID="ImageButtonapic8" runat="server" ImageUrl="~/button02style/bbb/cpic5.png" CssClass="aimg" />
                    </li>

                    <li class="apic1color">
                        <asp:ImageButton ID="ImageButtonapic1" runat="server" ImageUrl="~/button02style/bbb/spic1.png" CssClass="aimgactive" OnClick="ImageButtonapic1_Click" />

                    </li>
                    <li class="apic2color">

                        <asp:ImageButton ID="ImageButtonapic2" runat="server" ImageUrl="~/button02style/bbb/spic2.png" CssClass="aimg" OnClick="ImageButtonapic2_Click" />


                    </li>
                    <li class="apic3color">
                        <asp:ImageButton ID="ImageButtonapic3" runat="server" ImageUrl="~/button02style/bbb/spic3.png" CssClass="aimg" OnClick="ImageButtonapic3_Click" />


                    </li>
                    <li class="apic4color">

                        <asp:ImageButton ID="ImageButtonapic4" runat="server" ImageUrl="~/button02style/bbb/spic4.png" CssClass="aimg" OnClick="ImageButtonapic4_Click" />

                    </li>
                    <li class="apic5color">

                        <asp:ImageButton ID="ImageButtonapic5" runat="server" ImageUrl="~/button02style/bbb/spic5.png" CssClass="aimg" OnClick="ImageButtonapic5_Click" />

                    </li>
                    <li class="apic6color">

                        <asp:ImageButton ID="ImageButtonapic6" runat="server" ImageUrl="~/button02style/bbb/spic6.png" CssClass="aimg" OnClick="ImageButtonapic6_Click" />


                    </li>
                    <li class="apic7color">
                        <asp:ImageButton ID="ImageButtonapic7" runat="server" ImageUrl="~/button02style/bbb/spic7.png" CssClass="aimg" OnClick="ImageButtonapic7_Click" />

                    </li>



                    <!-- <li class="apic8color"><img src="apic8.png" alt="Properties and changes of materials" title="Properties and changes of materials"></li> -->
                </ul>
            </nav>
        </div>

    </form>
</body>
</html>
