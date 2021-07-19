<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdvisoryRemark.aspx.cs"  Inherits="Student_AdvisoryRemark" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Advisory Remark</title>

     <link rel="stylesheet" href="../style.css" type="text/css" />
    <link rel="stylesheet" href="../button.css" type="text/css" media="screen" />
      <link rel="stylesheet" href="../grid.css" type="text/css" media="screen" />  
    <style type="text/css">
        body
        {
            background: url(../images/bg-blue.jpg);
        }
        
        a 
        {
	       text-decoration:underline;
	    }
	    
        #wrapper1
        {
            width: 1111px;
            margin-left: auto;
            margin-top:-5px;
            margin-right: auto;
       
           
        }
        #content1
        {
            background-color:#fff;
            min-height:950px;
            padding-left: 5px;
            padding-right: 5px;
            border-left:solid 1px #CCC;
            border-right:solid 1px #CCC;
        }
        
        .Star
        {
            background-image: url(../images/Star.gif);
            height: 17px;
            width: 17px;
        }
        .WaitingStar
        {
            background-image: url(../images/WaitingStar.gif);
            height: 17px;
            width: 17px;
        }
        .FilledStar
        {
            background-image: url(../images/FilledStar.gif);
            height: 17px;
            width: 17px;
        }

       

    </style>
</head>
<body>
    <form id="form1" runat="server">
     <div id="wrapper1">
    <div id="content1">
     <br />
       
     <div class="title"> <asp:Label ID="lb_titile_head" runat="server" Text="<%$ Resources:Resource, sip_instrutor_comments %>"></asp:Label>
     &nbsp;&nbsp;
<%--         <asp:Button ID="btn_home" runat="server" onclick="btn_home_Click" 
     Text="Back" CausesValidation="false" CssClass="blue" style="font-size:Large;margin-left:232px;"/>--%>
     </div>

            <div style="text-align:center;margin-top:-32px;padding-bottom:12px;width:1042px">
               <asp:ImageButton ID="ImageButton2" runat="server" onmouseover="this.src='../images/homeblue_hover.png'" onmouseout="this.src='../images/homeblue.png'" ImageUrl="~/images/homeblue.png" OnClick="ImageButton2_Click" Height="55px" Width="150px"/>
    </div>
    <br />


        <asp:ListBox ID="stdList" runat="server" Height="100px" Width="223px" AutoPostBack="true"
            OnSelectedIndexChanged="stdList_SelectedIndexChanged" Visible="false"></asp:ListBox>
        <br />
        <asp:Label ID="lb_dear" runat="server" Text="<%$ Resources:Resource, sip_advice_dear %>"></asp:Label>&nbsp;<asp:Label ID="lbStdName" runat="server" Text=""></asp:Label>, 
        <br />
        <br />
        <asp:Label ID="lb_msg3" runat="server"  style="color:Green;font-size:12pt;" Text="<%$ Resources:Resource, sip_advice_msg1 %>"></asp:Label> <asp:Label ID="txt_total" runat="server" Text="" style="color:Green;font-size:12pt;"></asp:Label> <asp:Label ID="lb_msg4" runat="server" Text="<%$ Resources:Resource, sip_advice_msg2 %>"></asp:Label>
        <br />
        
        <asp:Panel ID="resulPanel" runat="server" Visible="false">

        <p><asp:Label ID="lb_msg1" runat="server" Text="<%$ Resources:Resource, sip_advice_note1 %>" /></p>
        <p><asp:Label ID="lb_msg2" runat="server" Text="<%$ Resources:Resource, sip_advice_note2 %>" /></p>
      
        <br /> 
        <br />
         <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
         </cc1:ToolkitScriptManager>
		
        <asp:GridView ID="GridView1" runat="server" CellPadding="4" GridLines="None"
            AutoGenerateColumns="False"  OnSelectedIndexChanged = "OnSelectedIndexChanged"
                DataKeyNames="id" AllowPaging="True" AllowSorting="True"
            OnSorting="GridView1_Sorting" 
                OnPageIndexChanging="GridView1_PageIndexChanging" 
                OnRowUpdating="btn_like_Click" Width="1024px" CssClass="GridViewStyle">
            <%--  <AlternatingRowStyle BackColor="White" />
          <EditRowStyle BackColor="#7C6F57" />--%>
           <%-- <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1784D2" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />--%>
             <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
              <HeaderStyle CssClass="GridViewHeaderStyle" ForeColor="White" />
            <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
            <RowStyle CssClass="GridViewRowStyle" />
            <SortedAscendingCellStyle CssClass="GridViewSortStyle" />
            <SortedAscendingHeaderStyle CssClass="GridViewSortHeaderStyle" />
            <Columns>
             <asp:TemplateField></asp:TemplateField>
             <asp:TemplateField HeaderText="ID" SortExpression="id" Visible="false">
                    <ItemTemplate>
                        <asp:Label ID="lblID" runat="server" Text='<%#Eval("id")%>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_advice_std_id %>" SortExpression="std_id">
                    <ItemTemplate>
                        <asp:Label ID="lblStdID" runat="server" Text='<%#Eval("std_id")%>' />
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_advice_year %>" SortExpression="year">
                    <ItemTemplate>
                        <asp:Label ID="lblyear" runat="server" Text='<%#Eval("year")%>' />
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_advice_class_code %>" SortExpression="class_code">
                    <ItemTemplate>
                        <asp:Label ID="lblclass_code" runat="server" Text='<%#Eval("class_code")%>' />
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_advice_subject_chinese %>" SortExpression="subject_ch">
                    <ItemTemplate>
                        <asp:Label ID="lblsubject_ch" runat="server" Text='<%#Eval("subject_ch")%>' />
                    </ItemTemplate>
                     <HeaderStyle HorizontalAlign="Left" />
                </asp:TemplateField>
                   <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_advice_subject_engl %>" SortExpression="subject_en">
                    <ItemTemplate>
                        <asp:Label ID="lblsubject_en" runat="server" Text='<%#Eval("subject_en")%>' />
                    </ItemTemplate>
                       <HeaderStyle HorizontalAlign="Left" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_advice_instructor %>" SortExpression="author">
                    <ItemTemplate>
                        <asp:Label ID="lblAuthor" runat="server" Text='<%#Eval("author")%>' />
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="TeacherCode" SortExpression="teacher_code" Visible="false">
                    <ItemTemplate>
                        <asp:Label ID="lblTeacherCode" runat="server" Text='<%#Eval("teacher_code")%>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_advice_title %>" SortExpression="title">
                    <ItemTemplate>
                        <asp:Label ID="lblTitle" runat="server" Text='<%#Eval("title")%>' />
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_advice_post_date %>" SortExpression="postDate">
                    <ItemTemplate>
                        <asp:Label ID="lblPostDate" runat="server" Text='<%#Eval("postDate")%>' />
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:TemplateField>
                  <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_advice_status %>" SortExpression="status" >
                    <ItemTemplate>
                        <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("status")%>' />
                    </ItemTemplate>
                      <HeaderStyle HorizontalAlign="Left" />
                </asp:TemplateField>

         

                  <asp:TemplateField Visible="false">
                    <ItemTemplate>
                      <asp:ImageButton ID="btn_like" runat="server" Text="Like" CommandName="Update" ImageUrl="~/images/like_icon.png" 
                      style="width:32px;height:32px;"></asp:ImageButton>
                    </ItemTemplate>
                 </asp:TemplateField>

                 <asp:TemplateField ShowHeader="False">
                     <ItemTemplate>
                         <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" 
                             CommandName="Select"  ForeColor="#0095CD" Text="<%$ Resources:Resource, sip_sp_relevantDescrib %>"></asp:LinkButton>
                     </ItemTemplate>
                     <HeaderStyle HorizontalAlign="Left" />
                     <ItemStyle Width="150px" />
                </asp:TemplateField>

                
            </Columns>
        </asp:GridView>
        </asp:Panel>
        <br />

        
    </div>
 </div>
    </form>
     
       
</body>
</html>
