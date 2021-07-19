<%@ Page Language="C#" AutoEventWireup="true" CodeFile="layout50pp.aspx.cs" Inherits="layout50pp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        #logopart {
            background: url(layout50style2/logo_mcpoly.png) no-repeat top center;
            width: 43%;
            height: 94px;
            margin-top: 18px;
            float: left;
        }

        #logopart2 {
            background: url(layout50style2/title_right.png) no-repeat top center;
            width: 57%;
            height: 94px;
            margin-top: 29px;
            float: left;
        }

        #wrapper {
            width: 100%;
            height: 100vh; /*div高度等於畫面高度*/
            background: url(layout50style2/body_bg.gif) repeat left top;
            /*min-width: 960px;*/
            /*min-height:900px;*/
        }

        #top_wrap {
            background: url(layout50style2/test4.png) no-repeat top center;
            height: 192px;
            /*display: block;*/
        }

        #middle_wrap {
            background: url(layout50style2/content_visual.png) no-repeat top center;
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
    </style>

    <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css" />
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 100px; width: 1000px; margin: auto">
            <div id="logopart">
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

                        <div class="form-group">
                            <label for="account1" class="col-sm-2 control-label">Account Name:<span style="color:red">*</span></label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="TextBoxID" runat="server" class="form-control" placeholder="Account Name"></asp:TextBox>
                               <%-- <input type="text" class="form-control" id="ainput1" placeholder="Account Name"/>--%>
                            </div>
                        </div>


                        <div class="form-group">
                            <label for="account2" class="col-sm-2 control-label">Password:<span style="color:red">*</span></label>
                            <div class="col-sm-5">
                                <asp:TextBox ID="TextBoxPassword1" runat="server" class="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                            </div>
                            <div class="col-sm-5">
                                <asp:TextBox ID="TextBoxPassword2" runat="server" class="form-control" placeholder="Re-enter Password" TextMode="Password"></asp:TextBox>
                            </div>
                        </div>


                        <div class="form-group">
                            <label for="account3" class="col-sm-2 control-label">Email:</label>
                            <div class="col-sm-5">
                                <asp:TextBox ID="TextBoxEmail1" runat="server" class="form-control" placeholder="Email"></asp:TextBox>
                            </div>
                            <div class="col-sm-5">
                                <asp:TextBox ID="TextBoxEmail2" runat="server" class="form-control" placeholder="Re-enter Email"></asp:TextBox>
                            </div>
                        </div>


                        <br />


                        <div class="form-group">
                            <label for="label1" class="col-sm-2 control-label">機構名稱: </label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="TextBox1" runat="server" class="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="label2" class="col-sm-2 control-label">公司地址:</label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="TextBox2" runat="server" class="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="label3" class="col-sm-2 control-label">公司商業登記號碼: </label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="TextBox3" runat="server" class="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="label4" class="col-sm-2 control-label">本登記聯絡人: </label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="TextBox4" runat="server" class="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="label5" class="col-sm-2 control-label">職位及部門:</label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="TextBox5" runat="server" class="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="label6" class="col-sm-2 control-label">電話: </label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="TextBox6" runat="server" class="form-control"></asp:TextBox>
                            </div>
                        </div>



                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox"/>
                                        I accept the Terms of Use and Privacy Policy.
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <%--<button type="submit" class="btn btn-default">Register</button>--%>
                                <asp:Button ID="Button1" class="btn btn-default" runat="server" Text="Button" OnClick="Button1_Click" />
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>