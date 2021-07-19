<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdvisoryDetails.aspx.cs" Inherits="Student_AdvisoryDetails" validateRequest="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>AdvisoryDetails</title>
     <link rel="stylesheet" href="../style.css" type="text/css" />
    <link rel="stylesheet" href="../button.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="../Styles/chatstyle.css" type="text/css" media="screen" />
    <script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
	<script type="text/javascript" src="../ckeditor/adapters/jquery.js"></script>
     <style type="text/css">
        body
        {
             background: url(../images/bg-blue.jpg);
        }
        #wrapper1
        {
            width: 80%;
            min-height: 950px;
            margin-left: auto;
            margin-right: auto;
			margin-top: 0px;
        }
        
        #content1
        { 
            background-color:#fff;
            min-height:920px;
            padding-left: 5px;
            padding-right: 5px;
            border-left:solid 1px #CCC;
            border-right:solid 1px #CCC;
        }
        
         .tLabel
        {  
            text-align:left;
        }
        
        .stdLabel
        {
            text-align:left;
        }
        
         .std
        {
            color:White;			        
			float: right;
			overflow: hidden;
			text-align: right;
			width: 100%;
        }
        .teacher
        {
            color:White;
            margin-top: auto;
        }
         a 
        {
            color: #FFFFFF;
	        text-decoration:underline;
	    }
	    
        a:active {
            color: #FFFFFF;
        }
        
	    a:hover
	    {
	        color: #FFFF33;
	    }

         .notDisplay {
            display:none;
        }

        div#tick{
            background-image: url(../images/tick.png);
            background-repeat: no-repeat;
            width:16px;
            height:16px;
			overflow: hidden;
           
        }

        div#notick{
			
			overflow: hidden;
			clear:both;
        }
    </style>

</head>
<body  background="../images/bg-blue.jpg">

    <form id="form1" runat="server">
    <div id="wrapper1">
    <div id="content1">
   <div>
        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:Resource, sip_advice_details %>" style="color:black;font-size:xx-large;font-family: 'Berlin Sans FB';"></asp:Label>&nbsp;
       <%-- <asp:Button ID="btn_home" runat="server" onclick="btn_home_Click" Text="Home" CausesValidation="false" CssClass="blue" style="font-size:Large;margin-left:232px;"/> --%>
   </div>
        <div style="text-align:center;margin-top:-29px;padding-bottom:12px;">
         <asp:ImageButton ID="ImageButton2" runat="server" onmouseover="this.src='../images/homeblue_hover.png'" onmouseout="this.src='../images/homeblue.png'" 
			   ImageUrl="~/images/homeblue.png" CausesValidation="false" onclick="btn_home_Click"  Height="55px" Width="150px"/>
            
            </div> 
   
    <br />
       
      <div style="border:solid green 1px;">
      <asp:Label runat="server" id="lb_title" style="font-size:14pt;color:#FF4500;" Text="<%$ Resources:Resource, sip_instrutor_comments %>"></asp:Label>
      
       <br />
        <br />
     

        <asp:Repeater ID="rptTopics" runat="server">
        <ItemTemplate>
            <div style="margin-left:5px;margin-top:5px;margin-right:5px;">

             <asp:Label ID="lbCourse" runat="server" Text='<%# Eval("COURSE")== null ? "" : Eval("COURSE") %>' style="color:black;"/> -
             <asp:Label ID="lbClassCode" runat="server" Text='<%# Eval("class_code")   == null ? "" : Eval("class_code") %>' style="color:black;"/>

             <br />
             <br />
             <asp:Label  ID="lblMessage" runat="server" Text='<%# Eval("message") %>'  Width="100%" Height="90px" 
             style="border:solid 1px;background-color:#F0F8FF;"></asp:Label>
                <%--<asp:TextBox ID="lblMessage" runat="server" Text='<%# Eval("message") %>' TextMode="MultiLine" Width="640px" Height="90px" Enabled="false"/>--%>
           
           
            <br />
            
                   
             <asp:Label ID="lblSender" runat="server" Text='<%# Eval("author") %>' style="color:Green;"/>
             <br />
             <asp:Label ID="lblPostDate" runat="server" Text='<%# Eval("postDate") %>' />
              </div>
		</ItemTemplate>

       
        </asp:Repeater>
         </div>
         <br />
         <div style="border:solid red 1px;display:block;background-image:url('../images/bg-chat.jpg'); ">
          <asp:Label  runat="server" style="font-size:14pt;color:#FFCC00;" Text="<%$ Resources:Resource, sip_con %>"></asp:Label>
         <br /> <br /><br />
         <asp:Label ID="Label1" runat="server" Font-Bold="True"  style="color:White;"/>
             <asp:Repeater ID="rptComments" runat="server" OnItemCommand="rRepeater_OnItemCommand" >
                 <ItemTemplate>

                     <div style="margin-left:5px;margin-top:5px;" class="commentArea">
                     <div class='<%# (Eval("role").ToString() =="student") ? "bubbledRight" : "bubbledLeft" %>' >
                     <asp:Label ID="rlblID" runat="server" Visible="false" Text='<%# Eval("id") %>'/>

                     <asp:Label  ID="rlblMessage" runat="server" Text='<%# Eval("message") %>'  
                       CssClass='<%# (Eval("role").ToString() =="student") ? "stdLabel" : "tLabel" %>' />
                   <br />
                   <br />
                     <asp:Label ID="rlblSender" runat="server" Text='<%# Eval("poster") %>' CssClass='<%# (Eval("role").ToString() =="student") ? "std" : "teacher" %>'/>
                 
                 <br />
                    <asp:Label ID="rlblPostDate" runat="server" Text='<%# Eval("postDate") %>' CssClass='<%# (Eval("role").ToString() =="student") ? "std" : "teacher" %>'/>
                    <br />    <div id='<%# (Eval("status").ToString() =="1") ? "tick" : "notick" %>' >
                      
                       </div>
                   </div>
                     <br />
                    
                    </div>

                     <!--
                    <asp:Button   ID="rbtnEdit" runat="server" CommandName="Update" Text="Edit" 
                      Visible='<%# (Eval("role").ToString() =="student") ? true : false %>' CausesValidation="false" cssClass="std"/>
                    -->
                     
                 
                   
                 </ItemTemplate>
                
             </asp:Repeater>
              <br />
          
             <asp:HyperLink ID="linkPrev" runat="server" ><asp:Label ID="Label6" runat="server" Text="<%$ Resources:Resource, sip_previous_page %>"></asp:Label></asp:HyperLink>
             <asp:HyperLink ID="linkNext" runat="server" ><asp:Label ID="Label7" runat="server" Text="<%$ Resources:Resource, sip_next_page %>"></asp:Label></asp:HyperLink>
                <br />
        </div>
        <br />
        <br />
      
     <asp:Panel ID="stdPanel" runat="server" Visible="false" DefaultButton="btn_post">
     <div style="border: solid 1px;">
     
        <table style="width:100%">
            <tr>
                <td style="width: 12%;"> 
                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:Resource, sip_advice_std_id %>"></asp:Label>:
                </td>
                <td>
                <asp:TextBox ID="txt_StdID" runat="server"  Enabled="False" style="width:35%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:Resource, sip_std_name %>"></asp:Label>:
                </td>
                <td>
                <asp:TextBox ID="txt_StdName" runat="server" Enabled="False" style="width:35%"></asp:TextBox>
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
                    <span style="color:Red;">*</span><asp:Label ID="Label5" runat="server" Text="<%$ Resources:Resource, sip_comments %>"></asp:Label>: </td>
                <td>
                    <asp:TextBox ID="txt_comments" runat="server" Height="168px" TextMode="MultiLine"></asp:TextBox>
                        </td>
                        <script  type="text/javascript" >

                            // This call can be placed at any point after the
                            // <textarea>, or inside a <head><script> in a
                            // window.onload event handler.

                            // Replace the <textarea id="editor"> with an CKEditor
                            // instance, using default configurations.

                            //CKEDITOR.replace('txt_comments');

                            CKEDITOR.replace('txt_comments', {
                                toolbar: [
                                { name: 'document', items: [ '-'] }, // Defines toolbar group with name (used to create voice label) and items in 3 subgroups.
                                ['Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Undo', 'Redo','Smiley'], 		// Defines toolbar group without name.
                                '/'																			// Line break - next group will be placed in new line.

                                ],
                                height: '200',
                                width: '100%'
                            });

                        </script>
                        <td>
                       <%-- <asp:RequiredFieldValidator ID="req_message" ControlToValidate="txt_comments" ErrorMessage="Comments is required！"
                        runat="server" style="color:Red;"  />--%>
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
        
            <asp:Button ID="btn_post" runat="server" Text="<%$ Resources:Resource, sip_post %>" Width="100px" 
                onclick="btn_post_Click" CssClass="blue"/>
            <asp:Button ID="btn_back" runat="server" Text="<%$ Resources:Resource, sip_back %>" Width="100px" 
                onclick="btn_back_Click" CausesValidation="false" CssClass="blue"/>
        </div>
         <br />
    </div>
       </asp:Panel>
        </div>
    </div>
    </form>
    
</body>
</html>
