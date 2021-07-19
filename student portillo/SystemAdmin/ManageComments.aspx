<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManageComments.aspx.cs" Inherits="Operator_ManageComments" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
   <meta charset="UTF-8"/>
    <style type="text/css">
        .style1
        {
            width: 100%;
            margin-top: 0px;
        }
        .style2
        {
            font-family: "Berlin Sans FB";
            font-size: xx-large;
        }
             #wrapper
        {
            width: 1100px;
            min-height:915px;
            margin-left: auto;
            margin-right: auto;
            background-color:White;
            border-left: solid black 1px;
            border-right: solid black 1px;
        }
        
        #content
        {
            min-height:915px;
            margin-left: 5px;
            margin-right: 5px;
        }

        #ImageButton2{
            width:14%;
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
   <link rel="stylesheet" href="../button.css" type="text/css" media="screen" />
    <script>
   function refimg(){
               var randval=Math.random();
               document.getElementById("Image2").src="ValidNums.aspx?val="+randval;
               }
   </script>  
</head>
<body background="../images/bg-blue.jpg" style="margin-top: 0px">
  
<form id="form1" runat="server">
<div id="wrapper">
    <div id="content">
      <label style="color:black;font-size:xx-large;font-family: 'Berlin Sans FB';">Manage Messages</label>
              <br />  
     <div style="text-align:center;padding-bottom:12px;max-width:1005px">
               <asp:ImageButton ID="ImageButton2" runat="server" onmouseover="this.src='../images/homeblue_hover.png'" onmouseout="this.src='../images/homeblue.png'" ImageUrl="~/images/homeblue.png" CausesValidation="False" OnClick="ImageButton2_Click" /> 
    </div>
      <div style="padding-left:4%" >
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
      </div>
    
        <br />
 <asp:MultiView ID="mvManageComments" runat="server" ActiveViewIndex="0">
        <asp:View ID="StudentComments" runat="server">
          
           <table  align="center" class="table" cellspacing="0" cellpadding="0" border="0" style="border-style:solid;border-width:thin;width: 92%">
              <tr class="header" >                            
              <td  bgcolor="#F4F9FD" align="center" >
              <strong>
              <a name="box" id="box" style="font-size:large">  Manage Students Messages</a>
              </strong>
             </td>           
             </tr>          
              <tr>
                <td>
                    <asp:Panel ID="p1" runat="server" Visible="false">
                          <h2 align="center"><span  style="color:red"> There are no students' message to reply!</span></h2>
                       </asp:Panel>
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                        AllowSorting="false" AutoGenerateColumns="False" CellPadding="4" 
                        Font-Size="12pt" ForeColor="#333333" 
                        onpageindexchanging="GridView1_PageIndexChanging" 
                        onrowdatabound="GridView1_RowDataBound" onrowdeleting="GridView1_RowDeleting" 
                        onselectedindexchanging="GridView1_SelectedIndexChanging" PageSize="9" 
                        style="text-align: center" Width="100%" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                        <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                        <Columns>
                           <%--<asp:ButtonField datatextfield="id" ButtonType="Link" commandname="select" HeaderText="id" />
                            <asp:BoundField DataField="username" HeaderText="Nickname" SortExpression="username" />--%>
                            <asp:ButtonField datatextfield="username" ButtonType="Link" commandname="select" HeaderText="NickName" />
                            <asp:BoundField DataField="useremail" HeaderText="MailBox" SortExpression="useremail" />
                            <asp:BoundField DataField="talkdate" HeaderText="Date" SortExpression="talkdate" />
                            <asp:BoundField DataField="usercontents" HeaderText="Contents" SortExpression="usercontents" />
                            <asp:CommandField HeaderText="Delete" ShowDeleteButton="True">                            
                            <ControlStyle ForeColor="Blue" />
                            </asp:CommandField>
                            </Columns>
                            
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#2461BF" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                </td>
            </tr>
               <tr>
               <asp:Panel ID="panel1" runat="server" Visible="false">
                         <table width="92.3%" border="0" style="border-style:solid;border-color:#FFFFFF ;border-width:thin;" align="center" cellpadding="4" cellspacing="1" >
                         <tr class="header" >           
                         <td  bgcolor="#F4F9FD" align="center" >
                         <strong>
                         <a name="b" id="b" style="font-size:large"> Feedback Reply</a>
                         </strong>
                         </td>
                         </tr> 
                         </table>
                         <table width="92.3%" border="1" style="border-color:#FFFFFF ;border-width:thin;" align="center" cellpadding="4" cellspacing="1" >
                         <tbody> 
                                                
                              <tr bgcolor="#FFFFFF">
                <td width="20%" align="right">Posted&nbsp;(<span style="color:red">*</span>)：</td>
                <td width="722px" height="23px">
                 <asp:TextBox ID="TextBox1" runat="server" width="28%" ></asp:TextBox>&nbsp;&nbsp;&nbsp;
                 <asp:RequiredFieldValidator ID="tbNameRV" runat="server" ErrorMessage="*" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
                </td>
            </tr>
                              <tr bgcolor="#FFFFFF">
                <td align="right">Contents&nbsp;(<span style="color:red">*</span>)：</td>
                <td height="23">
                    <asp:TextBox ID="TextBox3" runat="server" Height="150px" width="80%"
                                    TextMode="MultiLine" EnableTheming="true" ></asp:TextBox>&nbsp;&nbsp;&nbsp;
                    <asp:RequiredFieldValidator ID="tbContentsRV" runat="server" ErrorMessage="*" ControlToValidate="TextBox3"></asp:RequiredFieldValidator>
                </td>
            </tr>
                              <tr bgcolor="#FFFFFF">
                <td width="20%" align="right">Posted Time&nbsp;(<span style="color:red">*</span>)：</td>
                <td width="722px" height="23px">
                 <asp:TextBox ID="TextBox6" runat="server" width="28%" ></asp:TextBox>&nbsp;&nbsp;&nbsp;
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="TextBox6"></asp:RequiredFieldValidator>
                </td>
            </tr>
                              <tr bgcolor="#FFFFFF">
                <td width="20%" align="right">Reply&nbsp;(<span style="color:red">*</span>)：</td>
                <td width="722px" height="23px">
                 <asp:TextBox ID="TextBox4" runat="server" width="28%" ></asp:TextBox>&nbsp;&nbsp;&nbsp;
               <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="TextBox4"></asp:RequiredFieldValidator>   --%> 

                </td>
            </tr>
                              <tr bgcolor="#FFFFFF">
                <td align="right">    <a name="bbox" id="bbox" style="font-size:large"> Reply Contents&nbsp;(<span style="color:red">*</span>)：</a>
				</td>
                <td height="23">
                    <asp:TextBox ID="TextBox5" runat="server" Height="150px" width="80%"
                                    TextMode="MultiLine" EnableTheming="true" ></asp:TextBox>&nbsp;&nbsp;&nbsp;
                  <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="TextBox5"></asp:RequiredFieldValidator>--%>
                </td>
            </tr>
                              <tr>
                <td height="23" align="right">Code&nbsp;(<span style="color:red">*</span>)：</td>
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
                              <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click"  />
                              &nbsp; &nbsp;                            
                              <asp:Button ID="btnCancel" runat="server" Text="Cancel" onclick="btnCancel_Click"  />    
                               
                           
                </td>
            </tr>

                            </tbody>
                          </table>
                   </asp:Panel>
				   
               </tr>
        </table> 
              
        </asp:View>
        <asp:View ID="TeacherComments" runat="server">
            <table  align="center" class="table" cellspacing="0" cellpadding="0" border="0" style="border-style:solid;border-width:thin;width: 92%">
              <tr class="header" >                            
              <td  bgcolor="#F4F9FD" align="center" >
              <strong>
              <a name="box" id="box" style="font-size:large">  Manage Instructor Messages</a>
              </strong>
             </td>           
             </tr>          
              <tr>
                <td>
                    <asp:Panel ID="p2" runat="server" Visible="false">
                          <h2 align="center"><span  style="color:red"> There are no Instructors' message to reply!</span></h2>
                       </asp:Panel>
                    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
                        AllowSorting="false" AutoGenerateColumns="False" CellPadding="4" 
                        Font-Size="12pt" ForeColor="#333333" 
                        onpageindexchanging="GridView2_PageIndexChanging" 
                        onrowdatabound="GridView2_RowDataBound" onrowdeleting="GridView2_RowDeleting" 
                        onselectedindexchanging="GridView2_SelectedIndexChanging" PageSize="9" 
                        style="text-align: center" Width="100%" GridLines="None" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
                        <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                        <Columns>
                           <%--<asp:ButtonField datatextfield="id" ButtonType="Link" commandname="select" HeaderText="id" />
                            <asp:BoundField DataField="username" HeaderText="Nickname" SortExpression="username" />--%>
                            <asp:ButtonField datatextfield="username" ButtonType="Link" commandname="select" HeaderText="NickName" />
                            <asp:BoundField DataField="useremail" HeaderText="MailBox" SortExpression="useremail" />
                            <asp:BoundField DataField="talkdate" HeaderText="Date" SortExpression="talkdate" />
                            <asp:BoundField DataField="usercontents" HeaderText="Contents" SortExpression="usercontents" />
                            <asp:CommandField HeaderText="Delete" ShowDeleteButton="True">                            
                            <ControlStyle ForeColor="Blue" />
                            </asp:CommandField>
                            </Columns>
                            
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#2461BF" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                </td>
            </tr>
               <tr>
               <asp:Panel ID="panel2" runat="server" Visible="false">
                         <table width="92.3%" border="0" style="border-style:solid;border-color:#FFFFFF ;border-width:thin;" align="center" cellpadding="4" cellspacing="1" >
                         <tr class="header" >           
                         <td  bgcolor="#F4F9FD" align="center" >
                         <strong>
                         <a name="b" id="b" style="font-size:large"> Feedback Reply</a>
                         </strong>
                         </td>
                         </tr> 
                         </table>
                         <table width="92.3%" border="1" style="border-color:#FFFFFF ;border-width:thin;" align="center" cellpadding="4" cellspacing="1" >
                         <tbody> 
                                                
                              <tr bgcolor="#FFFFFF">
                <td width="20%" align="right">Posted&nbsp;(<span style="color:red">*</span>)：</td>
                <td width="722px" height="23px">
                 <asp:TextBox ID="TextBox7" runat="server" width="28%" ></asp:TextBox>&nbsp;&nbsp;&nbsp;
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ControlToValidate="TextBox7"></asp:RequiredFieldValidator>
                </td>
            </tr>
                              <tr bgcolor="#FFFFFF">
                <td align="right">Contents&nbsp;(<span style="color:red">*</span>)：</td>
                <td height="23">
                    <asp:TextBox ID="TextBox8" runat="server" Height="150px" width="80%"
                                    TextMode="MultiLine" EnableTheming="true" ></asp:TextBox>&nbsp;&nbsp;&nbsp;
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ControlToValidate="TextBox8"></asp:RequiredFieldValidator>
                </td>
            </tr>
                              <tr bgcolor="#FFFFFF">
                <td width="20%" align="right">Posted Time&nbsp;(<span style="color:red">*</span>)：</td>
                <td width="722px" height="23px">
                 <asp:TextBox ID="TextBox9" runat="server" width="28%" ></asp:TextBox>&nbsp;&nbsp;&nbsp;
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*" ControlToValidate="TextBox9"></asp:RequiredFieldValidator>
                </td>
            </tr>
                              <tr bgcolor="#FFFFFF">
                <td width="20%" align="right">Reply&nbsp;(<span style="color:red">*</span>)：</td>
                <td width="722px" height="23px">
                 <asp:TextBox ID="TextBox10" runat="server" width="28%" ></asp:TextBox>&nbsp;&nbsp;&nbsp;
              <%--    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="*" ControlToValidate="TextBox10"></asp:RequiredFieldValidator>  --%>

                </td>
            </tr>
                              <tr bgcolor="#FFFFFF">
                <td align="right">    <a name="abox" id="abox" style="font-size:large"> Reply Contents&nbsp;(<span style="color:red">*</span>)：</a>
				</td>
                <td height="23">
                    <asp:TextBox ID="TextBox11" runat="server" Height="150px" width="80%"
                                    TextMode="MultiLine" EnableTheming="true" ></asp:TextBox>&nbsp;&nbsp;&nbsp;
                  <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="TextBox5"></asp:RequiredFieldValidator>--%>
                </td>
            </tr>
                              <tr>
                <td height="23" align="right">Code&nbsp;(<span style="color:red">*</span>)：</td>
                <td height="23">
                      <asp:TextBox ID="tbCode2" runat="server" Width="23%"></asp:TextBox>
                     <span style="padding-top:initial">
                            <asp:Image 
                                ID="Image1" runat="server"  ImageUrl="ValidNums.aspx" onclick="refimg()" style="cursor:pointer;"
                                Width="58px" />
                                </span>
                </td>
            </tr>
                              <tr bgcolor="#FFFFFF">
                              <td height="23" width="20%"> &nbsp;</td>
                              <td height="23">
                              <asp:Button ID="btnSub" runat="server" Text="Submit" OnClick="btnSub_Click"  />
                              &nbsp; &nbsp;                            
                              <asp:Button ID="btnCan" runat="server" Text="Cancel" onclick="btnCan_Click"  />    
                               
                           
                </td>
            </tr>

                            </tbody>
                          </table>
                   </asp:Panel>
				   
               </tr>
        </table> 
			
        </asp:View>
    </asp:MultiView>    
  <br />
<hr />
    </div>
    </div>

    </form>
</body>
</html>
