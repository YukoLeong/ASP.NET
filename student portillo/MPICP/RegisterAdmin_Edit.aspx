<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RegisterAdmin_Edit.aspx.cs" Inherits="MPICP_RegisterAdmin_Edit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <link rel="shortcut icon" href="images/mpicpicon.ico" />

    <%--jquery ui--%>
    <link href="js/jqueryui/jquery-ui.css" rel="stylesheet" />
    <script src="js/jqueryui/jquery-1.11.2.min.js"></script>
    <script src="js/jqueryui/jquery-ui.js"></script>


    <style>
        #logopart {
            /*background: url(images/logo_mcpoly.png) no-repeat top center;*/
            width: 43%;
            height: 94px;
            margin-top: 18px;
            float: left;
        }

        #logopart2 {
            background: url(images/title_right.png) no-repeat top center;
            width: 57%;
            height: 94px;
            margin-top: 29px;
            float: left;
        }

        #wrapper {
            width: 100%;
            height: 100vh; /*div高度等於畫面高度*/
            background: url(images/body_bg.gif) repeat left top;
            /*min-width: 960px;*/
            /*min-height:900px;*/
        }

        #top_wrap {
            background: url(images/inside_visual5.png) no-repeat top center;
            height: 192px;
            /*display: block;*/
        }

        #middle_wrap {
            background: url(images/content_visual.png) no-repeat top center;
            min-height: 384px;
            width: 100%;
            /*position: relative;
            float: left;*/
        }

        .divborder {
            width: 961px;
            background-color: white;
            margin: auto; /*置中*/
            height: 600px;
            border-right: 1px solid #CDDCB1;
            border-left: 1px solid #CDDCB1;
        }

        /*radiobuttoncss*/

        .radio h1,
        .checkbox h1 {
            text-align: center;
            color: #aaa;
            margin-top: 30px;
            font-size: 12px;
            font-weight: 400;
        }

        .checkbox {
            left: 50%;
            border-left: 1px solid #b5b5b5;
        }

        .radio .switch {
            font-family: sans-serif; /*from body*/
            font-weight: 800; /*from body*/
            position: absolute;
            top: 50%;
            left: 50%;
            /*width: 150px;*/
            width: 184px;
            height: 50px;
            text-align: center;
            margin: -30px 0 0 -75px;
            background: #4cd964;
            transition: all 0.2s ease;
            border-radius: 25px;
        }

            .radio .switch span {
                position: absolute;
                width: 20px;
                height: 4px;
                top: 50%;
                left: 50%;
                margin: -2px 0px 0px -4px;
                background: #fff;
                display: block;
                transform: rotate(-45deg);
                transition: all 0.2s ease;
            }

                .radio .switch span:after {
                    content: "";
                    display: block;
                    position: absolute;
                    width: 4px;
                    height: 12px;
                    margin-top: -8px;
                    background: #fff;
                    transition: all 0.2s ease;
                }

        .radio input[type=radio] {
            display: none;
        }

        .radio .switch label {
            cursor: pointer;
            color: rgba(0,0,0,0.2);
            width: 80px;
            line-height: 50px;
            transition: all 0.2s ease;
        }

        .radio label[for=yes] {
            position: absolute;
            left: 0px;
            height: 20px;
        }

        .radio label[for=no] {
            position: absolute;
            right: 0px;
        }

        .radio #no:checked ~ .switch {
            background: #ff3b30;
        }

            .radio #no:checked ~ .switch span {
                background: #fff;
                margin-left: -8px;
            }

                .radio #no:checked ~ .switch span:after {
                    background: #fff;
                    height: 20px;
                    margin-top: -8px;
                    margin-left: 8px;
                }

        .radio #yes:checked ~ .switch label[for=yes] {
            color: #fff;
        }

        .radio #no:checked ~ .switch label[for=no] {
            color: #fff;
        }

        .checkbox label {
            position: absolute;
            top: 50%;
            left: 50%;
            width: 150px;
            line-height: 50px;
            text-align: center;
            transform: translate(-50%, -50%);
            background-color: #ff3b30;
            transition: all 0.2s ease;
            border-radius: 25px;
            cursor: pointer;
        }

            .checkbox label:after,
            .checkbox label:before {
                transition: all 0.1s linear;
                content: "";
                display: block;
                position: absolute;
                width: 20px;
                height: 4px;
                top: 50%;
                left: 50%;
                background: #fff;
            }

            .checkbox label:after {
                margin: -2px 0px 0px -10px;
                transform: rotate(-45deg);
            }

            .checkbox label:before {
                margin: -2px 0px 0px -10px;
                transform: rotate(45deg);
            }

            .checkbox label span {
                display: inline-block;
                width: 50%;
                float: left;
                color: rgba(255,255,255,0.9);
                text-shadow: 0px -1px 0px rgba(0,0,0,0.1);
            }

                .checkbox label span:first-child {
                    color: rgba(0,0,0,0.2);
                    cursor: pointer;
                }

                .checkbox label span:last-child {
                    cursor: default;
                }

        .checkbox input[type=checkbox] {
            display: none;
        }

        .checkbox #switch:checked ~ label {
            background-color: #4cd964;
        }

            .checkbox #switch:checked ~ label:after {
                margin: -2px 0px 0px -6px;
                width: 18px;
            }

            .checkbox #switch:checked ~ label:before {
                width: 11px;
                margin: 0px 0px 0px -10px;
            }

            .checkbox #switch:checked ~ label span:first-child {
                color: rgba(255,255,255,0.9);
                cursor: default;
            }

            .checkbox #switch:checked ~ label span:last-child {
                color: rgba(0,0,0,0.2);
                cursor: pointer;
            }

        #yes, #no {
            font-family: sans-serif; /*from body*/
            font-weight: 800; /*from body*/
        }
    </style>

    <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
    <link rel="stylesheet" href="css/bootstrapstyle/bootstrap.min.css" />
    <link rel="stylesheet" href="css/bootstrapstyle/bootstrap-theme.min.css" />
    <script src="css/bootstrapstyle/bootstrap.min.js"></script>


    <script type="text/javascript">


        $(function () {

            $('#ViewPDFButton').click(function () {
                window.open('ViewRegisterPDF.aspx', '_blank');
                return false;
            });

        });


        $(document).ready(function () {
            $('#yes').click(function () {
                //alert("you click yes");
                $("#radioTextBox1").val('1');

                var enterdata = document.getElementById("radioTextBox1").value;
                var careerformid = document.getElementById("FromIDTemp").value;

                $.ajax({
                    type: "GET",
                    url: "RegisterAdmin_EditWebService.asmx/SyncData",
                    contentType: "application/json charset=utf-8",
                    dataType: "json",
                    data: { 'data': enterdata, 'careerformid': careerformid },
                    success: function (response) {

                    },
                    failure: function (response) {
                        alert(response.d);
                    }
                });

            });
            $('#no').click(function () {
                //alert("you click no");
                $("#radioTextBox1").val('0');

                var enterdata = document.getElementById("radioTextBox1").value;
                var careerformid = document.getElementById("FromIDTemp").value;

                $.ajax({
                    type: "GET",
                    url: "RegisterAdmin_EditWebService.asmx/SyncData",
                    contentType: "application/json charset=utf-8",
                    dataType: "json",
                    data: { 'data': enterdata, 'careerformid': careerformid },
                    success: function (response) {

                    },
                    failure: function (response) {
                        alert(response.d);
                    }
                });

            });
        });



    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 100px; width: 1200px; margin: auto">
            <div id="logopart">
                <asp:ImageButton ID="LogoImageButton" runat="server" Style="margin-left: 149px" ImageUrl="images/logo_mcpoly.png" CausesValidation="false" />
            </div>
            <div id="logopart2">
            </div>
        </div>
        <div id="wrapper">
            <div id="top_wrap">
            </div>
            <div id="middle_wrap">
                <div class="divborder">
                    <br />
                    <br />
                    <div style="width: 930px; margin: auto">

                        <%--content start--%>

                        <asp:ImageButton ID="BackButton" runat="server" onmouseover="this.src='images/back01_hover.png'" onmouseout="this.src='images/back01.png'" ImageUrl="images/back01.png" OnClick="BackButton_Click" Style="width: 105px" />

                          <asp:ImageButton ID="ViewPDFButton" runat="server" onmouseover="this.src='images/view02_hover.png'" onmouseout="this.src='images/view02.png'" ImageUrl="images/view02.png" Style="width: 105px" />



                        <asp:TextBox ID="FromIDTemp" Style="display: none" runat="server" ></asp:TextBox>

                        <div class="radio">
                            <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                            <div class="switch">
                                <label for="yes">Post this!</label>
                                <label for="no">No!</label>
                                <span></span>
                                <br />
                                <br />
                                <br />
                                <asp:TextBox ID="radioTextBox1" Style="display: none" runat="server"></asp:TextBox>
                            </div>
                        </div>

                        <br />

                        <%--panel1 content--%>
                        <asp:Panel ID="Panel1" runat="server">


                            <div class="form-group">
                                <label for="label1" class="col-sm-2 control-label" style="padding-top: 8px">電郵地址: </label>
                                <div class="col-sm-10" style="padding-top: 2px; padding-bottom: 2px">
                                    <asp:TextBox ID="TextBoxEmail1" runat="server" class="form-control"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="label1" class="col-sm-2 control-label" style="padding-top: 8px">機構名稱: </label>
                                <div class="col-sm-10" style="padding-top: 2px; padding-bottom: 2px">
                                    <asp:TextBox ID="TextBox1" runat="server" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="label2" class="col-sm-2 control-label" style="padding-top: 8px">公司地址:</label>
                                <div class="col-sm-10" style="padding-top: 2px; padding-bottom: 2px">
                                    <asp:TextBox ID="TextBox2" runat="server" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="label3" class="col-sm-2 control-label" style="padding-top: 8px">公司商業登記號碼: </label>
                                <div class="col-sm-10" style="padding-top: 2px; padding-bottom: 2px">
                                    <asp:TextBox ID="TextBox3" runat="server" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="label4" class="col-sm-2 control-label" style="padding-top: 8px">本登記聯絡人: </label>
                                <div class="col-sm-10" style="padding-top: 2px; padding-bottom: 2px">
                                    <asp:TextBox ID="TextBox4" runat="server" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="label5" class="col-sm-2 control-label" style="padding-top: 8px">職位及部門:</label>
                                <div class="col-sm-10" style="padding-top: 2px; padding-bottom: 2px">
                                    <asp:TextBox ID="TextBox5" runat="server" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="label6" class="col-sm-2 control-label" style="padding-top: 8px">電話: </label>
                                <div class="col-sm-10" style="padding-top: 2px; padding-bottom: 2px">
                                    <asp:TextBox ID="TextBox6" runat="server" class="form-control"></asp:TextBox>
                                </div>
                            </div>


                        </asp:Panel>

                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
