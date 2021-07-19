<%@ Page Language="C#" AutoEventWireup="true" CodeFile="InstructorComments.aspx.cs" Inherits="Instructor_InstructorComments" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Leave Comments</title>
    <link rel="stylesheet" href="../button.css" type="text/css" media="screen" /> 
    <style type="text/css">
        body {
		margin: 0px 10px;
		padding: 2px;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		font-size: 12px;
	         }
         #wrapper
        {
            width: 80%;
            min-height:930px;
            margin-left: auto;
            margin-right: auto;
            background-color:White;
            border-left: solid gray 1px;
            border-right: solid gray 1px;
        }
         #content
        {   
            min-height:930px;
            margin-left: 5px;
            margin-right: 5px;
        }
 
      
        .paginator { font: 11px Arial, Helvetica, sans-serif;padding:10px 20px 10px 0; margin: 0px;}
        .paginator a {padding: 1px 6px; border: solid 1px #ddd; background: #fff; text-decoration: none;margin-right:2px}
        .paginator a:visited {padding: 1px 6px; border: solid 1px #ddd; background: #fff; text-decoration: none;}
        .paginator .cpb {padding: 1px 6px;font-weight: bold; font-size: 13px;border:none}
        .paginator a:hover {color: #fff; background: #ffa501;border-color:#ffa501;text-decoration: none;}
        
        .anpager { font: 11px Arial, Helvetica, sans-serif;margin:5px 4px 0 0;padding:4px 5px 0;}
        .anpager .cpb {background:#1F3A87;border:1px solid #CCCCCC;color:#FFFFFF;font-weight:bold;margin:0;padding:4px 5px 1px;}
        .anpager a {background:#FFFFFF;border:1px solid #CCCCCC;color:#1F3A87;margin: 0;padding:4px 5px 1px;text-decoration:none}
        .anpager a:hover{background:#1F3A87;border:1px solid #1F3A87;color:#FFFFFF;}
        
        .pages {  color: #999; }
        .pages a, .pages .cpb { text-decoration:none;float: left; padding: 0 5px; border: 1px solid #ddd;background: #ffff;margin:0 2px; font-size:11px; color:#000;}
        .pages a:hover { background-color: #E61636; color:#fff;border:1px solid #E61636; text-decoration:none;}
        .pages .cpb { font-weight: bold; color: #fff; background: #E61636; border:1px solid #E61636;}
            
   </style>
   <script>
   function refimg(){
var randval=Math.random();
document.getElementById("Image2").src="ValidNums.aspx?val="+randval;
}
   </script>
</head>
<body background="../images/bg-blue.jpg">
 <form id="form1" runat="server"> 
    <div id="wrapper">
    <div id="content"> 

         <asp:Label runat=server style="color:black;font-size:xx-large;font-family: 'Berlin Sans FB';" Text="<%$ Resources:Resource, sip_lc_comments %>"></asp:Label>
              <br />  
			  <div align="center">
              <a href="../Academic/home.aspx">
              <img src="../images/homeblue.png" width="130px" height="45px" onmouseover="this.src='../images/homeblue_hover.png'" onmouseout="this.src='../images/homeblue.png'"></a>
              </div>         		
              <br />		      
              <hr /> 
     
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="abox">
        <tbody>
            <tr>
                <td>
                   <table width="100%" border="0",cellpadding="3" cellspacing="2">
                       <tbody>
                           <tr >
                               <td align="center" bgcolor="#E1EFFB" >
                                  
                                   <a href="#bbox" style="font-size:large"><strong><asp:Label ID="lb_leave_message" runat="server" Text="<%$ Resources:Resource, sip_lc_leave %>"></asp:Label></strong></a>
                               </td>
                           </tr>
                           <tr>
                               <td align="left" valign="top">
                                   <table width="100%" border="0" cellpadding="4" cellspacing="0" bgcolor="#FFFFFF">
                                   <tbody>
                                       <tr>
                                          <td height="100%" valign="top" bgcolor="#FFFFFF">
                                              <asp:DataList ID="DataList1" runat="server" Width="100%">
                                                  <ItemTemplate>
                                                      <table width="92%" border="0" style="border-style:solid;border-width:thin" align="center" cellpadding="4" cellspacing="1" bgcolor="#F4F9FD">
                                                          <tr class="header">
                                                              <td width="55%" height="23"><asp:Label ID="lb_publisher" runat="server" Text="<%$ Resources:Resource, sip_lc_publisher %>"></asp:Label>
 															  <asp:Label ID="Label1" runat="server" 
                                                                        Text='<%# DataBinder.Eval(Container.DataItem,"username") %>' 
                                                                        ForeColor="#990000"></asp:Label></td>
                                                              <td width="45%"><asp:Label ID="lb_date" runat="server" Text="<%$ Resources:Resource, sip_lc_date %>"></asp:Label>
															  <asp:Label ID="Label2" runat="server" 
                                                                        Text='<%# DataBinder.Eval(Container.DataItem,"talkdate") %>' 
                                                                        ForeColor="#990000"></asp:Label></td>
                                                          </tr>
                                                          <tr bgcolor="#FFFFF">
                                                              <td height="23" colspan="2">
                                                                  <table border="0" width="100%" cellspacing="1" cellpadding="8" bgcolor="#cccccc">
                                                                          <tr>
                                                                         <td width="100%" bgcolor="#FFFFFF" style="word-break:break-all"><asp:Label ID="lb_contents" runat="server" Text="<%$ Resources:Resource, sip_lc_contents %>"></asp:Label>： <asp:Label ID="Label4" runat="server" 
                                                                             Text='<%# DataBinder.Eval(Container.DataItem,"usercontents") %>' 
                                                                             ForeColor="#990000"></asp:Label></td>
                                                                          </tr>
                                                                   </table>
                                                                     <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1">
                                                                       <tr>
                                                                              <td>
                                                                                  <img src="../Student/images/regb.gif" width="18" height="18" />
                                                                                    <strong><font color="#FF0000"><asp:Label ID="lb_reply" runat="server" Text="<%$ Resources:Resource, sip_lc_reply %>"></asp:Label>:</font></strong>
                                                                                    <asp:Label ID="Label3" runat="server" 
                                                                                     Text='<%# DataBinder.Eval(Container.DataItem,"recontents") %>' 
                                                                                     ForeColor="#990000"></asp:Label>
                                                                              </td>
                                                                         </tr>
                                                                    </table>
                                                              </td>
                                                          </tr>
                                                      </table>
                                                      <br />
                                                  </ItemTemplate>
                                              </asp:DataList>
                                              <!--Paging tag-->
<table width="92%" border="0" align="center" cellpadding="4" cellspacing="1">
<tbody>
    <tr>
        <td style="width:100%; text-align:right;font-size:10pt;height:25px">
        <div id="PageInfo" runat="server" class="anpager"></div>
        </td>
    </tr>
</tbody>
</table>


    <table width="92%" border="0"  style="border-color:#FFFFFF ;border-width:thin;border-bottom:none" align="center" cellpadding="4" cellspacing="1" >
         
         
         <tr class="header" >
             
               
         <td  bgcolor="#F4F9FD" align="center" >
         <strong>
            <a name="bbox" id="bbox" style="font-size:large"><asp:Label ID="lb_please" runat="server" Text="<%$ Resources:Resource, sip_lc_please %>"></asp:Label></a>
         </strong>
        </td>
             
       
        </tr>
        </table>
    <table width="92%" border="1" style="border-color:#FFFFFF ;border-width:thin;" align="center" cellpadding="4" cellspacing="1" >
              
        <tbody>
            <tr bgcolor="#FFFFFF">
                <td width="20%" align="right"><asp:Label ID="lb_nickname" runat="server" Text="<%$ Resources:Resource, sip_lc_nickname %>"></asp:Label>&nbsp;(<span style="color:red">*</span>)：</td>
                <td width="722px" height="23px">
                 <asp:TextBox ID="tbName" runat="server" width="28%" MaxLength="50" ></asp:TextBox>&nbsp;&nbsp;&nbsp;
                 <asp:RequiredFieldValidator ID="tbNameRV" runat="server" ErrorMessage="*" ControlToValidate="tbName"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td width="20%" align="right"><asp:Label ID="lb_mailbox" runat="server" Text="<%$ Resources:Resource, sip_lc_mailbox %>"></asp:Label>&nbsp;(<span style="color:red">*</span>)：</td>
                <td height="23"> 
                    <asp:TextBox ID="tbEmail" runat="server" width="28%" MaxLength="50" ></asp:TextBox>&nbsp;&nbsp;&nbsp;
             <asp:RegularExpressionValidator ID="tbEmailRV" runat="server" ErrorMessage="*" ControlToValidate="tbEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td align="right"><asp:Label ID="lb_contents" runat="server" Text="<%$ Resources:Resource, sip_lc_contents %>"></asp:Label>&nbsp;(<span style="color:red">*</span>)：</td>
                <td height="23">
                    <asp:TextBox ID="tbContents" runat="server" Height="150px" width="80%"
                                    TextMode="MultiLine" EnableTheming="true" ></asp:TextBox>&nbsp;&nbsp;&nbsp;
                    <asp:RequiredFieldValidator ID="tbContentsRV" runat="server" ErrorMessage="*" ControlToValidate="tbContents"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td height="23" align="right"><asp:Label ID="lb_code" runat="server" Text="<%$ Resources:Resource, sip_lc_code %>"></asp:Label>&nbsp;(<span style="color:red">*</span>)：</td>
                <td height="23">
                      <asp:TextBox ID="tbCode" runat="server" Width="23%"></asp:TextBox>
                     <span style="padding-top:initial">
                            <asp:Image 
                                ID="Image2" runat="server"  ImageUrl="ValidNums.aspx" onclick="refimg()" style="cursor:pointer;"
                                Width="58px" />
                                </span>
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td height="23" width="20%"> &nbsp;</td>
                <td height="23">
                     <asp:Button ID="btnSubmit" runat="server" Text="<%$ Resources:Resource, sip_lc_submit %>" OnClick="btnSubmit_Click"  />
                    &nbsp; &nbsp; 
                    <asp:Button ID="btnCancel" runat="server" Text="<%$ Resources:Resource, sip_lc_reset %>"  OnClick="btnCancel_Click"  />    
                
                </td>
            </tr>
        </tbody>
    </table>
  


                                           </td>
                                       </tr>
                                    </tbody>
                                   </table>
                               </td>
                           </tr>
                       </tbody>
                   </table> 
                </td>
            </tr>
        </tbody>
        </table>
       
    </div> 
    <hr />
    </div>
</form> 
</body>
</html>
