<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditComments.aspx.cs" Inherits="Teacher_EditComments" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Edit Comments</title>
    <link rel="stylesheet" href="../button.css" type="text/css" media="screen" />
    <style type="text/css">
        #wrapper
        {
            width: 1080px;
            min-height: 950px;
            margin-top: -5px;
            margin-left: auto;
            margin-right: auto;
            background-color:White;
        }
        
        #content
        { 
            min-height:920px;
            margin-left: 5px;
            margin-right: 5px;
            
        }
        </style>
</head>
<body background="../images/gp1.jpg">
    <form id="form1" runat="server">
     <div id="wrapper">
    <div id="content">
     <asp:Panel ID="stdPanel" runat="server" >
     <div style="border: solid 1px;">
     <p style="color:black;font-size:18pt;font-family:comic sans ms,sans-serif;">Instructor Remark</p>
        <table>
            <tr>
                <td>
                    Code:
                </td>
                <td>
                <asp:TextBox ID="txt_CODE" runat="server" Width="222px" Enabled="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Instructor Name:
                </td>
                <td>
                <asp:TextBox ID="txt_TechName" runat="server" Width="222px" Enabled="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="display:none;">
                    Class Code:</td>
                <td style="display:none;"> 
                    <asp:TextBox ID="txt_ClassCode" runat="server" Width="222px" Enabled="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <span style="color:Red;">*</span>Comments: </td>
                <td>
                    <asp:TextBox ID="txt_comments" runat="server" Height="168px" TextMode="MultiLine" 
                        Width="354px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="req_message" ControlToValidate="txt_comments" ErrorMessage="Comments is required！"
                        runat="server" style="color:Red;"  />
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
         <br />
        <br />
        <div>
         <asp:Button ID="btn_home" runat="server" onclick="btn_home_Click" Text="Home" Width="100px" CausesValidation="false" CssClass="blue"/>
          
            <asp:Button ID="btn_back" runat="server" Text="Back" Width="100px" 
                onclick="btn_back_Click" CausesValidation="false" CssClass="blue"/>

                  <asp:Button ID="btn_update" runat="server" Text="Update" Width="100px" 
                onclick="btn_update_Click" CssClass="blue"/>

                  <asp:Button ID="btn_delete" runat="server" Text="Delete" Width="100px" 
                onclick="btn_delete_Click" CssClass="blue"/>
        </div>
         <br />
    </div>
       </asp:Panel>
       </div>
    </div>
    </form>
</body>
</html>

