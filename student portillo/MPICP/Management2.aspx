<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Management2.aspx.cs" Inherits="MPICP_Management2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <link rel="shortcut icon" href="images/mpicpicon.ico" />
    <%--jquery ui--%>
    <link href="js/jqueryui/jquery-ui.css" rel="stylesheet" />
    <script src="js/jqueryui/jquery-1.11.2.min.js"></script>
    <script src="js/jqueryui/jquery-ui.js"></script>

    <%--<link rel="stylesheet" href="css/button.css" type="text/css" media="screen" />--%>
    <%--<link rel="stylesheet" href="css/print.css" type="text/css" media="print" />--%>

    <%--bootstrap--%>

    <link rel="stylesheet" href="css/bootstrapstyle/bootstrap.min.css" />
    <link rel="stylesheet" href="css/bootstrapstyle/bootstrap-theme.min.css" />
    <script src="css/bootstrapstyle/bootstrap.min.js"></script>

    <%--<link href="css/bootstrapstyle/changebootstrap.css" rel="stylesheet" />
    <link href="css/bootstrapstyle/bootstrap-theme.min.css" rel="stylesheet" />
    <script src="css/bootstrapstyle/bootstrap.min.js"></script>--%>


    <style type="text/css">
        body {
            /*font-family: DFKai-sb;*/
        }

        #content {
            margin-left: 20px;
            margin-right: 20px;
        }

        .style1 {
            width: 100%;
            /*border: 1px solid #000000;*/
        }

        .style3 {
            width: 100%;
        }

        .style4 {
            width: 212px;
            height: 36px;
        }

        .style5 {
            height: 36px;
        }

        .style6 {
            width: 212px;
        }

        .midleftstyle {
            width: 150px;
        }

        .style10 {
            width: 200px;
        }

        #ImageButton2 {
            width: 9%;
        }

        #logopart {
            /*background: url(images/logo_mcpoly.png) no-repeat top center;*/
            width: 44%;
            height: 94px;
            margin-top: 18px;
            float: left;
        }


        /*layout*/

        #logopart2 {
            background: url(images/jobsmanagement.png) no-repeat top center;
            width: 56%;
            height: 94px;
            margin-top: 20px;
            float: left;
        }

        #wrapper {
            width: 100%;
            /*height: 100vh;*/ /*div高度等於畫面高度*/
            background: url(images/body_bg.gif) repeat;
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
            /*height: 600px;*/
            height: 100%;
            border-right: 1px solid #CDDCB1;
            border-left: 1px solid #CDDCB1;
        }

        #GridView1 td {
            padding: 10px;
        }

        #GridView1 th {
            padding: 10px;
        }

        a {
            margin-left: -29px;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">

        <div style="height: 100px; width: 1200px; margin: auto">
            <div id="logopart">
                <asp:ImageButton ID="LogoImageButton" runat="server" Style="margin-left: 149px" OnClick="LogoImageButton_Click" ImageUrl="images/logo_mcpoly.png" />
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
                    <div style="width: 930px; height: 650px; margin: auto">
                        <%--content start--%>

                        <asp:ImageButton ID="BackButton" runat="server" onmouseover="this.src='images/back01_hover.png'" onmouseout="this.src='images/back01.png'" ImageUrl="images/back01.png" OnClick="BackButton_Click" Style="width: 105px" />
                        <asp:ImageButton ID="UpdateButton" runat="server" onmouseover="this.src='images/update_hover.png'" onmouseout="this.src='images/update.png'" ImageUrl="images/update.png" Style="width: 105px" OnClick="UpdateButton_Click" />


                        <br />
                        <br />
                        <div class="form-group">
                            <label for="label1" class="col-sm-3 control-label" style="padding-top: 8px">機構名稱 Organization Name<span style="color: red">*</span></label>
                            <div class="col-sm-4" style="padding-top: 2px; padding-bottom: 2px">
                                <asp:TextBox ID="TextBox1" runat="server" class="form-control" placeholder="Chinese"></asp:TextBox>
                            </div>
                            <div class="col-sm-5" style="padding-top: 2px; padding-bottom: 2px">
                                <asp:TextBox ID="TextBox1en" runat="server" class="form-control" placeholder="English"></asp:TextBox>
                            </div>
                        </div>


                        <div class="form-group">
                            <label for="label2" class="col-sm-3 control-label" style="padding-top: 8px">電郵地址 Email</label>
                            <div class="col-sm-9" style="padding-top: 2px; padding-bottom: 2px">
                                <asp:TextBox ID="TextBoxEmail1" runat="server" class="form-control" placeholder="Email"></asp:TextBox>
                            </div>
                        </div>

                        <%--                       <div class="form-group">
                            <label for="account3" class="col-sm-3 control-label" style="padding-top: 8px">電郵地址 Email<span style="color: red">*</span></label>
                            <div class="col-sm-5" style="padding-top: 2px; padding-bottom: 2px">
                                <asp:TextBox ID="TextBoxEmail1" runat="server" class="form-control" placeholder="Email"></asp:TextBox>
                            </div>
                            <div class="col-sm-4" style="padding-top: 2px; padding-bottom: 2px">
                                <asp:TextBox ID="TextBoxEmail2" runat="server" class="form-control" placeholder="Re-enter Email"></asp:TextBox>
                            </div>
                        </div>--%>


                        <div class="form-group">
                            <label for="label2" class="col-sm-3 control-label" style="padding-top: 8px">公司地址 Company Address</label>
                            <div class="col-sm-9" style="padding-top: 2px; padding-bottom: 2px">
                                <asp:TextBox ID="TextBox2" runat="server" class="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="label4" class="col-sm-3 control-label" style="padding-top: 8px">本登記聯絡人 ContactPerson</label>
                            <div class="col-sm-9" style="padding-top: 2px; padding-bottom: 2px">
                                <asp:TextBox ID="TextBox4" runat="server" class="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="label5" class="col-sm-3 control-label" style="padding-top: 8px">職位及部門 Department</label>
                            <div class="col-sm-9" style="padding-top: 2px; padding-bottom: 2px">
                                <asp:TextBox ID="TextBox5" runat="server" class="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="label6" class="col-sm-3 control-label" style="padding-top: 8px">電話 Telephone</label>
                            <div class="col-sm-9" style="padding-top: 2px; padding-bottom: 2px">
                                <asp:TextBox ID="TextBox6" runat="server" class="form-control"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="label6" style="padding-top: 8px"></label>
                        </div>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="電郵地址不能為空" ControlToValidate="TextBoxEmail1" ForeColor="red" Style="display: none"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="機構名稱不能為空" ControlToValidate="TextBox1" ForeColor="red" Style="display: none"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="電郵格式不正確" ControlToValidate="TextBoxEmail1" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="red" Style="display: none"></asp:RegularExpressionValidator>
                        <br />
                        &nbsp;<asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                        <p>
                            &nbsp;
                        </p>

                        <%--content close--%>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
