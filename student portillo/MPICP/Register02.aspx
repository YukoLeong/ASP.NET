<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register02.aspx.cs" Inherits="MPICP_Register02" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <link rel="shortcut icon" href="images/mpicpicon.ico" />
    <link rel="stylesheet" href="css/print2.css" type="text/css" media="print" />

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
            min-height: 1445px;
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
            height: 1250px;
            border-right: 1px solid #CDDCB1;
            border-left: 1px solid #CDDCB1;
        }

        ol li {
            font-size: 14px;
        }
    </style>

    <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
    <link rel="stylesheet" href="css/bootstrapstyle/bootstrap.min.css" />
    <link rel="stylesheet" href="css/bootstrapstyle/bootstrap-theme.min.css" />
    <script src="css/bootstrapstyle/bootstrap.min.js"></script>

    <%--entervalid part--%>
<%--    <script type="text/javascript">
        function refimg() {
            var randval = Math.random();
            document.getElementById("imagevalid").src = "validnum01.aspx?val=" + randval;
        }

    </script>--%>





</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 100px; width: 1200px; margin: auto">
            <div id="logopart">
                <asp:ImageButton ID="LogoImageButton" runat="server" Style="margin-left: 149px" ImageUrl="images/logo_mcpoly.png" OnClick="LogoImageButton_Click" CausesValidation="false" />
            </div>
            <div id="logopart2">
            </div>
        </div>
        <div id="wrapper">
            <div id="top_wrap">
            </div>
            <div id="middle_wrap">
                <div id="part10" class="divborder">
                    <br />
                    <br />
                    <div style="width: 930px; margin: auto">
                        <div id="part1" class="form-group">
                            <label for="account1" class="col-sm-3 control-label" style="padding-top: 8px">帳號名稱 Account<span style="color: red">*</span></label>
                            <div class="col-sm-9" style="padding-top: 2px; padding-bottom: 2px">
                                <asp:TextBox ID="TextBoxID" runat="server" class="form-control" placeholder="Account Name"></asp:TextBox>
                                <%-- <input type="text" class="form-control" id="ainput1" placeholder="Account Name"/>--%>
                            </div>
                        </div>

                        <div id="part2" class="form-group">
                            <label for="account2" class="col-sm-3 control-label" style="padding-top: 8px">密碼 Password<span style="color: red">*</span></label>
                            <div class="col-sm-5" style="padding-top: 2px; padding-bottom: 2px">
                                <asp:TextBox ID="TextBoxPassword1" runat="server" class="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                            </div>
                            <div class="col-sm-4" style="padding-top: 2px; padding-bottom: 2px">
                                <asp:TextBox ID="TextBoxPassword2" runat="server" class="form-control" placeholder="Re-enter Password" TextMode="Password"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="account3" class="col-sm-3 control-label" style="padding-top: 8px">電郵地址 Email<span style="color: red">*</span></label>
                            <div class="col-sm-5" style="padding-top: 2px; padding-bottom: 2px">
                                <asp:TextBox ID="TextBoxEmail1" runat="server" class="form-control" placeholder="Email"></asp:TextBox>
                            </div>
                            <div class="col-sm-4" style="padding-top: 2px; padding-bottom: 2px">
                                <asp:TextBox ID="TextBoxEmail2" runat="server" class="form-control" placeholder="Re-enter Email"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="label1" class="col-sm-3 control-label" style="padding-top: 8px">機構名稱 Organization Name<span style="color: red">*</span></label>
                            <div class="col-sm-5" style="padding-top: 2px; padding-bottom: 2px">
                                <asp:TextBox ID="TextBox1" runat="server" class="form-control" placeholder="Chinese"></asp:TextBox>
                            </div>
                            <div class="col-sm-4" style="padding-top: 2px; padding-bottom: 2px">
                                <asp:TextBox ID="TextBox1en" runat="server" class="form-control" placeholder="English"></asp:TextBox>
                            </div>
                        </div>
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

                        <%--detail start--%>
                        <table class="style3" frame="border">
                            <tr>
                                <td style="padding: 4px 4px 4px 4px;">
                                    <asp:Label ID="Label263" runat="server" Text="注意事項 Important Notice: " Font-Size="14px" />
                                    <br />
                                    <br />
                                    <ol>
                                        <li>申請獲接納後第一部份內容將刊登在本院網頁&quot;學生園地&quot;內，版權為本院所有。<br />
                                            Upon acceptance, &quot;Session 1&quot; will be displayed on our website - Student&#39;s
                                corner. The copyright (website) belongs to MPI, and the Institute has the authority
                                to amend the information posted whenever appropriate.<br />
                                            &quot;Session 2&quot; will only be seen by MPI staff.</li>
                                        <%--<li>商業機構第一次申請刊登需要同時遞交公司商業登記副本。For commercial organizations, copy of your Commericial
                                Registration should be submitted when posting your first advertisement on this site.</li>--%>
                                        <li>申請招聘刊登申請最長可刊登3 個月。The maximum duration dor each posting is 3 months. </li>
                                        <li>澳門理工學院學生事務處聯絡資料。Contact information of the Student Affairs Office, MPI:
                                <br />
                                            傅真 Fax: +853 28706747 ; 電話: 8599 6625/6463; 電郵 Email: <a href="mailto:jobsforstudent@ipm.edu.mo">jobsforstudent@ipm.edu.mo</a><br />
                                            地址 Address: 澳門高美士街A119室Room A119, Rua de Luis Gonzaga Comes, Macau<br />
                                            <li>塡妥表格後請先列印，再按&quot;提交&quot;按鈕，而列印表格需簽名蓋章後以電郵或傳真方式交回學生事務處。</li>
                                            <div style="font-size: 14px">
                                                Please print out the completed form before pressing &quot;Submit&quot;buttons, and
                                send the form with signature &amp; stamp to the Student Affairs Office via email
                                or fax.
                                            </div>
                                        </li>
                                    </ol>
                                    <br />
                                    <div style="margin: 0 auto; width: 80%;">
                                        <div style="float: left; width: 50%; text-align: center; font-size: 14px">
                                            _____________________________________________&nbsp;&nbsp;&nbsp;&nbsp;
                                <br />
                                            公司簽章 Signature &amp; Company&#39;s Stamp
                                        </div>
                                        <div style="float: right; width: 50%; font-size: 14px">
                                            ___________/___________/__________<br />
                                            日DO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; / 月MM&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /年YY
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </table>
                        <%--detail end--%>






                        <div id="part9" style="margin: auto; width: 930px; text-align: center">
                            <p style="color: red">請先列印，再按“提交 Submit”按鈕 Please print out before pressing “Submit” button.</p>
                            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/MPICP/images/print_printer-500x500.png" CausesValidation="false" Height="70px" OnClientClick="javascript:window.print();return false" />
                            <br />
                        </div>




<%--                        <div>
                            <asp:Label ID="Label1" runat="server" Text="Label">商業機構 For Commercial Organizations:</asp:Label>
                        </div>--%>
<%--                        <div class="form-group">
                            <label for="label3" class="col-sm-3 control-label" style="padding-top: 8px">商業登記號碼 Commercial No</label>
                            <div class="col-sm-9" style="padding-top: 2px; padding-bottom: 2px">
                                <asp:TextBox ID="TextBox3" runat="server" class="form-control"></asp:TextBox>
                            </div>
                        </div>--%>

                        <div id="part3" class="form-group">
                            <label for="label3" class="col-sm-6 control-label" style="padding-top: 8px">上傳公司盖章 Upload Company's Stamp</label>
                            <div class="col-sm-8" style="padding-top: 25px; padding-bottom: 2px">
                                <asp:FileUpload ID="FileUpload1" runat="server" accept=".jpg,.pdf,.doc,.docx" />
                                <asp:Label ID="RecruitLabel" runat="server" Text="(Less than 50MB of pdf, jpg file)"
                                    Style="font-family: Arial Unicode MS"></asp:Label>
                            </div>
                        </div>






                        <%-- <asp:FileUpload ID="FileUpload1" runat="server" accept=".pdf,.doc,.docx" />
                                <asp:Label ID="RecruitLabel" runat="server" Text="(Less than 50MB of pdf file)"
                                    Style="font-family: Arial Unicode MS"></asp:Label>--%>

                        <div id="part6" class="form-group">
                            <label for="label6" style="padding-top: 8px"></label>
                        </div>
                        <div id="part7" class ="form-group">
                            <label for="label6" style="padding-top: 8px"></label>
                        </div>

                        <%--entervalid part--%>
                        <%--<div id="part4" class="form-group">
                            <label for="label6" class="col-sm-3 control-label" style="padding-top: 8px">驗證碼 Valid Code: </label>
                            <div class="col-sm-9" style="padding-top: 2px; padding-bottom: 2px">
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
                        </div>--%>

                        <br /><br />
                                        <asp:CheckBox ID="CheckBox1" runat="server" />
                        <span id="part11">I accept the Terms of Use and Privacy Policy.</span>
                        </div>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="帳號不能為空" ControlToValidate="TextBoxID" ForeColor="red" Style="display: none"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="密碼不能為空" ControlToValidate="TextBoxPassword1" ForeColor="red" Style="display: none"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="確認密碼不能為空" ControlToValidate="TextBoxPassword2" ForeColor="red" Style="display: none"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="電郵地址不能為空" ControlToValidate="TextBoxEmail1" ForeColor="red" Style="display: none"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="機構名稱不能為空" ControlToValidate="TextBox1" ForeColor="red" Style="display: none"></asp:RequiredFieldValidator>

                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="密碼不相同" ControlToValidate="TextBoxPassword1" ControlToCompare="TextBoxPassword2" ForeColor="red" Style="display: none"></asp:CompareValidator>
                        <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="電郵不相同" ControlToValidate="TextBoxEmail1" ControlToCompare="TextBoxEmail2" ForeColor="red" Style="display: none"></asp:CompareValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="電郵格式不正確" ControlToValidate="TextBoxEmail1" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="red" Style="display: none"></asp:RegularExpressionValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="電話號碼格式不正確" ControlToValidate="TextBox6" ValidationExpression="\d+" ForeColor="red" Style="display: none"></asp:RegularExpressionValidator>
                        <br />
                        &nbsp;<asp:ValidationSummary ID="ValidationSummary1" runat="server" />

                        <p>
                            &nbsp;
                        </p>
                       

                        <div id="part8" style="margin: auto; width: 930px; text-align: center">
                            <%--<p style="color: red">請先列印，再按“提交 Submit”按鈕 Please print out before pressing “Submit” button.</p>
                            <asp:ImageButton ID="PrintButton" runat="server" ImageUrl="~/MPICP/images/print_printer-500x500.png" CausesValidation="false" Height="70px" OnClientClick="javascript:window.print();return false" />
                            <br />--%>
                            <asp:Button ID="Button3" class="btn btn-primary" Style="width: 70px" runat="server" Text="Sumbit" OnClick="Button1_Click" />
                            <asp:Button ID="Button4" class="btn btn-primary" Style="width: 70px" runat="server" Text="Back" CausesValidation="false" OnClick="Button2_Click" />
                        </div>





                        <%--         <div class="form-group">
                            <div class="col-sm-offset-5 col-sm-7">

                                <asp:Button ID="Button1" class="btn btn-primary" Style="width: 70px" runat="server" Text="Sumbit" OnClick="Button1_Click" />
                                <asp:Button ID="Button2" class="btn btn-primary" Style="width: 70px" runat="server" Text="Back" CausesValidation="false" OnClick="Button2_Click" />
                            </div>
                        </div>--%>
                        <%--<asp:ValidationSummary ID="ValidationSummary1" runat="server" />--%>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
