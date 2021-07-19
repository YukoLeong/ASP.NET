<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GiveAdvice.aspx.cs" Inherits="Advice_GiveAdvice" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Give Advice</title>
    <script type="text/javascript" language="javascript" src="../media/js/jquery.js"></script>
    <script src="../ckeditor/ckeditor.js" type="text/javascript"></script>
    <script type="text/javascript" src="../ckeditor/adapters/jquery.js"></script>
        <link rel="stylesheet" href="../button.css" type="text/css" media="screen" />
	<%--<link rel="stylesheet" href="../Styles/sample.css"/>--%>
    <script type="text/javascript">
//        $(document).ready(function () {
//             $(".txt_message").ckeditor();
//        });
    </script>
    <style type="text/css">
        #content
        {
            width: 80%;
            min-height: 920px;
            margin-top: -8px;
            margin-left: auto;
            margin-right: auto;
            background-color:White;
			border-left: solid black 1px;
            border-right: solid black 1px;
        }
    </style>

   
</head>
<body background="../images/gp1.jpg">
    <form id="form1" runat="server">
    <div id="content">
    <asp:Label ID="lb_give_advice" runat="server" style="font-size:18pt; color:Black;" Text="<%$ Resources:Resource, sip_give_advice %>"></asp:Label>
     <br />
     <br />      
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="Following error occurs:"
                ShowMessageBox="false" DisplayMode="BulletList" ShowSummary="true" style="color:red;"/>
        
            <asp:Label ID="txt_success" runat="server" Text="Advise has been sent!" 
                style="color:Green;font-size:14pt;" Visible="False"></asp:Label>
        
        <table>
        <tr style="display:none;">
        <td>ALUN_NUMERO</td>
        <td><asp:TextBox ID="txt_alun_numero" runat="server" Enabled="false"></asp:TextBox></td>
        </tr>
        <tr style="display:none;">
        <td>ALUN_NUMERO_SEQ</td>
        <td><asp:TextBox ID="txt_alun_seq" runat="server" Enabled="false"></asp:TextBox></td>
        </tr>
        <tr>
        <td>
            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:Resource, sip_advice_std_id %>"></asp:Label>:</td>
        <td><asp:TextBox ID="txt_sid" runat="server" Width="288px" Enabled="False"></asp:TextBox></td>
        </tr>
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:Resource, sip_receiver %>"></asp:Label>:<span style="color: red;">*</span>
                </td>
                <td>
                    <asp:TextBox ID="txt_receiver" runat="server" Width="288px" Enabled="False"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="req_txt_receiver" ControlToValidate="txt_receiver"
                        ErrorMessage="Receiver is required！" runat="server" Display="None" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:Resource, sip_advice_title %>"></asp:Label>:<span style="color: red;">*</span>
                </td>
                <td>
                    <asp:TextBox ID="txt_title" runat="server" Width="388px" MaxLength="50"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="req_subject" ControlToValidate="txt_title" ErrorMessage="Subject is required！"
                        runat="server" Display="None" />
                </td>
            </tr>
            <tr>
                <td><asp:Label ID="lbl_classCode" runat="server" Text="<%$ Resources:Resource, sip_subject_code %>">:</asp:Label></td>                
                <td><asp:TextBox ID="txt_class_code" runat="server" Width="288px" Enabled="False"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:Resource, sip_content %>"></asp:Label>:<span style="color: red;">*</span>
                </td>
                <td>
                    <asp:TextBox ID="txt_message"   runat="server" Height="190px" Width="388px" 
                        TextMode="MultiLine"></asp:TextBox>
                    <%--<asp:RequiredFieldValidator ID="req_message" ControlToValidate="txt_message" ErrorMessage="Message is required！"
                        runat="server" Display="None"  />--%>

                         <script  type="text/javascript" >

                             // This call can be placed at any point after the
                             // <textarea>, or inside a <head><script> in a
                             // window.onload event handler.

                             // Replace the <textarea id="editor"> with an CKEditor
                             // instance, using default configurations.

                             // CKEDITOR.replace('txt_comments');

                             CKEDITOR.replace('txt_message', {
                                 toolbar: [
                                { name: 'document', items: ['-'] }, // Defines toolbar group with name (used to create voice label) and items in 3 subgroups.
                                ['Cut', 'Copy', 'Paste', 'PasteText', '-', 'Undo', 'Redo', 'Smiley'], 		// Defines toolbar group without name.
                                '/'																			// Line break - next group will be placed in new line.

                                ],
                                 height: 200,
                                 width: 600
                             });
                             
                        </script>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:Resource, sip_sender %>"></asp:Label> :<span style="color: red;">*</span>
                </td>
                <td>
                    <asp:TextBox ID="txt_author" runat="server" Width="288px" Enabled="False"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="req_author" ControlToValidate="txt_author" ErrorMessage="Author is required！"
                        runat="server" Display="None" />
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btn_send" runat="server" Text="<%$ Resources:Resource, sip_send %>" onclick="btn_send_Click" CssClass="blue"/>
                    <asp:Button ID="btn_back" runat="server" Text="<%$ Resources:Resource, sip_back %>"  CausesValidation="false" CssClass="blue" OnClientClick="JavaScript: window.history.back(1); return false;"/>
                </td>
            </tr>
        </table>
        <br />
        <br />
        <div>
          <p style="font-size:11pt;font-family:Times New Roman;color:Gray;"> &nbsp;In this page, Instructor can give advices to student who needs to be encouraged in order to achieve the ideal attributes of MPI. </p> 
        </div>
    </div>
    </form>
</body>
</html>

