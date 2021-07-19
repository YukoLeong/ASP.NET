<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login01.aspx.cs" Inherits="login01" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        #logopart {
            /*background: url(layout50style2/logo_mcpoly.png) no-repeat top center;*/
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
            background: url(layout50style2/inside_visual5.png) no-repeat top center;
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
    <link rel="stylesheet" href="bootstrapstyle/bootstrap.min.css" />
    <link rel="stylesheet" href="bootstrapstyle/bootstrap-theme.min.css" />
    <script src="bootstrapstyle/bootstrap.min.js"></script>

    <%--entervalid part--%>
    <script type="text/javascript">
        function refimg() {
            var randval = Math.random();
            document.getElementById("imagevalid").src = "validnum01.aspx?val=" + randval;
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 100px; width: 1200px; margin: auto">
            <div id="logopart">
                <asp:ImageButton ID="LogoImageButton" runat="server" Style="margin-left: 149px" ImageUrl="~/layout50style2/logo_mcpoly.png" OnClick="LogoImageButton_Click" CausesValidation="false" />
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
                            <label for="account1" class="col-sm-2 control-label" style="padding-top: 8px">帳號名稱:<span style="color: red">*</span></label>
                            <div class="col-sm-10" style="padding-top: 2px; padding-bottom: 2px">
                                <asp:TextBox ID="TextBoxID" runat="server" class="form-control" placeholder="Account Name"></asp:TextBox>
                                <%-- <input type="text" class="form-control" id="ainput1" placeholder="Account Name"/>--%>
                            </div>
                        </div>


                        <div class="form-group">
                            <label for="account2" class="col-sm-2 control-label" style="padding-top: 8px">密碼:<span style="color: red">*</span></label>
                            <div class="col-sm-5" style="padding-top: 2px; padding-bottom: 2px">
                                <asp:TextBox ID="TextBoxPassword1" runat="server" class="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                            </div>
                            <div class="col-sm-5" style="padding-top: 2px; padding-bottom: 2px">
                                <asp:TextBox ID="TextBoxPassword2" runat="server" class="form-control" placeholder="Re-enter Password" TextMode="Password"></asp:TextBox>
                            </div>
                        </div>


                        <div class="form-group">
                            <label for="account3" class="col-sm-2 control-label" style="padding-top: 8px">電郵地址:</label>
                            <div class="col-sm-5" style="padding-top: 2px; padding-bottom: 2px">
                                <asp:TextBox ID="TextBoxEmail1" runat="server" class="form-control" placeholder="Email"></asp:TextBox>
                            </div>
                            <div class="col-sm-5" style="padding-top: 2px; padding-bottom: 2px">
                                <asp:TextBox ID="TextBoxEmail2" runat="server" class="form-control" placeholder="Re-enter Email"></asp:TextBox>
                            </div>
                        </div>


                        <br />


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
                        <%--entervalid part--%>
                        <div class="form-group">
                            <label for="label6" class="col-sm-2 control-label" style="padding-top: 8px">驗證碼: </label>
                            <div class="col-sm-10" style="padding-top: 2px; padding-bottom: 2px">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="entervalid" runat="server" Width="100px" class="form-control" MaxLength="4"></asp:TextBox>

                                        </td>
                                        <td>&nbsp;&nbsp;
                                            <asp:Image
                                                ID="imagevalid" runat="server" ImageUrl="validnum01.aspx" onclick="refimg()" Style="cursor: pointer;"
                                                Width="58px" />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <div class="checkbox">
                                    <label>
                                        <asp:CheckBox ID="CheckBox1" runat="server" />
                                        I accept the Terms of Use and Privacy Policy.
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <%--<button type="submit" class="btn btn-default">Register</button>--%>
                                <asp:Button ID="Button1" class="btn btn-primary" Style="width: 70px" runat="server" Text="Sumbit" OnClick="Button1_Click" />
                                <asp:Button ID="Button2" class="btn btn-primary" Style="width: 70px" runat="server" Text="Back" CausesValidation="false" OnClick="Button2_Click" />
                            </div>
                        </div>
                        <br />
                        <br />
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="帳號不能為空" ControlToValidate="TextBoxID" ForeColor="red"></asp:RequiredFieldValidator>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="密碼不能為空" ControlToValidate="TextBoxPassword1" ForeColor="red"></asp:RequiredFieldValidator>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="確認密碼不能為空" ControlToValidate="TextBoxPassword2" ForeColor="red"></asp:RequiredFieldValidator>
                        <br />
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="密碼不相同" ControlToValidate="TextBoxPassword1" ControlToCompare="TextBoxPassword2" ForeColor="red"></asp:CompareValidator>
                        <br />
                        <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="電郵不相同" ControlToValidate="TextBoxEmail1" ControlToCompare="TextBoxEmail2" ForeColor="red"></asp:CompareValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="電郵格式不正確" ControlToValidate="TextBoxEmail1" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="red"></asp:RegularExpressionValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="電話號碼格式不正確" ControlToValidate="TextBox6" ValidationExpression="\d+" ForeColor="red"></asp:RegularExpressionValidator>


                        <%--<asp:ValidationSummary ID="ValidationSummary1" runat="server" />--%>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
