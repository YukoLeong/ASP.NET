<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdvisoryRemark.aspx.cs"  Inherits="Advice_AdvisoryRemark" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Instructor AR</title>
	 <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="../style.css" type="text/css" />
    <link rel="stylesheet" href="../button.css" type="text/css" media="screen" />
     <link rel="stylesheet" href="../teachGrid.css" type="text/css" media="screen" />
     <style type="text/css">
         body
        {
             background: url(../images/bg-blue.jpg);
        }
        a {
	        text-decoration:underline;

	    }
	
        #wrapper
        {
            width: 90%;
            min-height:980px;
            margin-left: auto;
            margin-right: auto;
            background-color:White;
            border-left: solid black 1px;
            border-right: solid black 1px;
            margin-top:-7px;
        }
        
        #content1
        {
          
            margin-left: 5px;
            margin-right: 5px;
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
        #ImageButton2{
            width:13%;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
   <div id="wrapper">
    <div id="content1">
     <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </cc1:ToolkitScriptManager>
        <br />
          <div class="title">
              <asp:Label ID="lb_title" runat="server" Text="<%$ Resources:Resource, sip_instrutor_comments %>"></asp:Label>
              
              <%--<asp:Button ID="btn_home" runat="server" onclick="btn_home_Click" Text="Home" CssClass="blue" style="font-size:large; margin-left:232px;"/>--%>


          </div>
       <div style="text-align:center;margin-top:-32px;padding-bottom:12px;width:1006px">
               <asp:ImageButton ID="ImageButton2" runat="server" onmouseover="this.src='../images/homeblue_hover.png'" onmouseout="this.src='../images/homeblue.png'" ImageUrl="~/images/homeblue.png" OnClick="ImageButton2_Click" /> 
    </div>
   
     
     <br />
     <div style="color:Blue; font-size:12pt;">
         <asp:Label ID="Label1" runat="server" Text="<%$ Resources:Resource, sip_comment_history %>"></asp:Label></div>

     <br />
         <asp:TextBox runat="server" Enabled="false" ID="txt_teacherCode" Visible="false"></asp:TextBox>
        <asp:GridView ID="GridView1" runat="server" DataKeyNames="id"  
            AutoGenerateColumns="False" AllowPaging="True" AllowSorting="True"
            OnSelectedIndexChanged = "OnSelectedIndexChanged" Height="153px" OnSorting="GridView1_Sorting" 
            OnPageIndexChanging="GridView1_PageIndexChanging"  
            OnRowUpdating="btn_like_Click"  OnRowDeleting="btnUnlike_click"
            Width="100%" PageSize="5" GridLines="Horizontal" 
            CssClass="GridViewStyle" >
            <HeaderStyle ForeColor="Black" CssClass="GridViewHeaderStyle" />
            <PagerStyle CssClass="GridViewPagerStyle" ForeColor="Black" 
                HorizontalAlign="Center" />
            <RowStyle CssClass="GridViewRowStyle" Height="40px" />
            <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />

             <Columns>
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
                 <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_std_name %>" SortExpression="NAME_CH">
                    <ItemTemplate>
                        <asp:Label ID="lblStdName" runat="server" Text='<%#Eval("name")%>' />
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
                <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_advice_instructor %>" SortExpression="author" Visible="false">
                    <ItemTemplate>
                        <asp:Label ID="lblAuthor" runat="server" Text='<%#Eval("author")%>' />
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:TemplateField>
                  <asp:TemplateField HeaderText="TeacherCode" SortExpression="teacher_code" Visible="false">
                    <ItemTemplate>
                        <asp:Label ID="lblTeacherCode" runat="server" Text='<%#Eval("teacher_code")%>' />
                    </ItemTemplate>
                      <HeaderStyle HorizontalAlign="Left" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_advice_title %>" SortExpression="title">
                    <ItemTemplate>
                        <asp:Label ID="lblTitle" runat="server" Text='<%#Eval("title")%>' />
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:TemplateField>
                <%--<asp:TemplateField HeaderText="Message" SortExpression="message">
                    <ItemTemplate>
                        <asp:Label ID="lblTitle" runat="server" Text='<%#Eval("message")%>' />
                    </ItemTemplate>
                </asp:TemplateField>--%>
                  <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_advice_post_date %>" SortExpression="postDate">
                    <ItemTemplate>
                        <asp:Label ID="lblPostDate" runat="server" Text='<%#Eval("postDate")%>' />
                    </ItemTemplate>
                      <HeaderStyle HorizontalAlign="Left" />
                </asp:TemplateField>
                  <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_advice_status %>" SortExpression="status">
                    <ItemTemplate>
                        <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("status")%>' />
                    </ItemTemplate>
                      <HeaderStyle HorizontalAlign="Left" />
                </asp:TemplateField>

                 <%--<asp:TemplateField HeaderText="Ratings" Visible="false">
                     <ItemTemplate>
                         <cc1:Rating ID="Rating1" AutoPostBack="true" OnChanged="OnRatingChanged" runat="server"
                             StarCssClass="Star" WaitingStarCssClass="WaitingStar" EmptyStarCssClass="Star"
                             FilledStarCssClass="FilledStar" CurrentRating='<%# Eval("Rating") %>' />
                     </ItemTemplate>
                     <HeaderStyle HorizontalAlign="Left" />
                 </asp:TemplateField>--%>

                  <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_advice_like %>" SortExpression="Likes" >
                     <ItemTemplate>
                        <asp:Label ID="lblikes" runat="server" Text='<%#Eval("Likes")%>'  />
                    </ItemTemplate>
                      <HeaderStyle HorizontalAlign="Left" />
                 </asp:TemplateField>


                  <asp:TemplateField >
                    <ItemTemplate>
                      <asp:ImageButton ID="btn_like" runat="server" Text="Like" CommandName="Update" ImageUrl="~/images/like_icon.png" Visible='<%#Eval("BIT")%>'
                      style="width:32px;height:32px;"></asp:ImageButton>
                       
                        <asp:LinkButton ID="btn_unlike" runat="server" Text="<%$ Resources:Resource, sip_advice_unlike %>" 
                            CommandName="Delete" Visible='<%# !(bool) Eval("BIT")%>' 
                      style="width:32px;height:32px;" ForeColor="#0095CD"></asp:LinkButton>

                    </ItemTemplate>
                      <HeaderStyle HorizontalAlign="Left" />
                 </asp:TemplateField>


                   <asp:ButtonField Text="<%$ Resources:Resource, sip_sp_relevantDescrib %>" CommandName="Select" >
                 <HeaderStyle HorizontalAlign="Left" />
                 <ItemStyle ForeColor="#0095CD" />
                 </asp:ButtonField>
            </Columns>
            <SelectedRowStyle CssClass="GridViewSelectRowStyle" />
        </asp:GridView>
  <br />

  Search Previous Comments  (搜索以前的評論)  &nbsp;
            <br />
            <br />
        <asp:Panel ID="searchPanel" runat="server">
            <table>
                <tr>
                    <td>
                        Suject (科目)
                    </td>
                    <td>
                        <asp:ListBox ID="subjectlist" runat="server" Height="189px" 
                            Width="255px" OnSelectedIndexChanged="subjectList_SelectedIndexChanged"></asp:ListBox>
                    </td>
                    <td>
                        <asp:ImageButton ID="btn_search" runat="server" Text="<%$ Resources:Resource, sip_search %>"  style="width: 100px" 
                            onclick="btn_search_Click"  onmouseover="this.src='../images/search2.png'" onmouseout="this.src='../images/search1.png'" 
                            ImageUrl="../images/search1.png"/>
                    </td>
                </tr>
            </table>
            <br />
  
              <asp:Label ID="msg" runat="server" Text="Record not found! (記錄不存在!)" style="color:Green;font-size:14pt;" Visible="False"></asp:Label>
          
        </asp:Panel>

      
  
  <div>

  <asp:Panel ID="rPanel" runat="server" >
  <br />

       <label>Comment Archives (有關以前的評論)</label>
       <br /><br />
        <asp:GridView ID="rGridView" runat="server" DataKeyNames="id" AutoGenerateColumns="False" 
          OnSelectedIndexChanged = "rOnSelectedIndexChanged" Height="90px" 
          Width="900px" AllowPaging="True" AllowSorting="True"
          OnSorting="rGridView_Sorting" 
          OnPageIndexChanging="rGridView_PageIndexChanging" PageSize="5" 
          OnRowUpdating="rbtn_like_Click"  OnRowDeleting="rbtnUnlike_click" 
          CssClass="GridViewStyle" GridLines="Horizontal">
            <HeaderStyle ForeColor="Black" 
                CssClass="GridViewHeaderStyle" />
            <PagerStyle CssClass="GridViewPagerStyle" ForeColor="Black" 
                HorizontalAlign="Center" />
            <RowStyle CssClass="GridViewRowStyle" />

            <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />

            <Columns>
             <asp:TemplateField HeaderText="ID" SortExpression="id" Visible="false">
                    <ItemTemplate>
                        <asp:Label ID="lblID" runat="server" Text='<%#Eval("id")%>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_advice_std_id %>" SortExpression="std_id" Visible="false">
                    <ItemTemplate>
                        <asp:Label ID="lblStdID" runat="server" Text='<%#Eval("std_id")%>' />
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_std_name %>" SortExpression="NAME_CH" Visible="false">
                    <ItemTemplate>
                        <asp:Label ID="lblStdName" runat="server" Text='<%#Eval("name")%>' />
                    </ItemTemplate>
                     <HeaderStyle HorizontalAlign="Left" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_advice_year %>" SortExpression="year" Visible="false">
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
                <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_advice_instructor %>" SortExpression="author" Visible="false">
                    <ItemTemplate>
                        <asp:Label ID="lblAuthor" runat="server" Text='<%#Eval("author")%>' />
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="TeacherCode" SortExpression="teacher_code" Visible="false">
                    <ItemTemplate>
                        <asp:Label ID="lblTeacherCode" runat="server" Text='<%#Eval("teacher_code")%>' />
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="CODE" SortExpression="teacher_code" Visible="false">
                    <ItemTemplate>
                        <asp:Label ID="lblCODE" runat="server" Text='<%#Eval("teacher_code")%>' />
                    </ItemTemplate>
                     <HeaderStyle HorizontalAlign="Left" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_advice_title %>" SortExpression="title">
                    <ItemTemplate>
                        <asp:Label ID="lblTitle" runat="server" Text='<%#Eval("title")%>' />
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:TemplateField>
                <%--<asp:TemplateField HeaderText="Message" SortExpression="message">
                    <ItemTemplate>
                        <asp:Label ID="lblTitle" runat="server" Text='<%#Eval("message")%>' />
                    </ItemTemplate>
                </asp:TemplateField>--%>
                  <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_advice_post_date %>" SortExpression="postDate" Visible="false">
                    <ItemTemplate>
                        <asp:Label ID="lblPostDate" runat="server" Text='<%#Eval("postDate")%>' />
                    </ItemTemplate>
                      <HeaderStyle HorizontalAlign="Left" />
                </asp:TemplateField>
                  <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_advice_status %>" SortExpression="status">
                    <ItemTemplate>
                        <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("status")%>' />
                    </ItemTemplate>
                      <HeaderStyle HorizontalAlign="Left" />
                </asp:TemplateField>

             <%--    <asp:TemplateField HeaderText="Ratings" Visible="false">
                     <ItemTemplate>
                         <cc1:Rating ID="Rating1" AutoPostBack="true" OnChanged="rOnRatingChanged" runat="server"
                             StarCssClass="Star" WaitingStarCssClass="WaitingStar" EmptyStarCssClass="Star"
                             FilledStarCssClass="FilledStar" CurrentRating='<%# Eval(" Rating") %>' />
                     </ItemTemplate>
                 </asp:TemplateField>--%>
                 
                   <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_advice_like %>" SortExpression="Likes" >
                     <ItemTemplate>
                        <asp:Label ID="lblikes" runat="server" Text='<%#Eval("Likes")%>' />
                    </ItemTemplate>
                       <HeaderStyle HorizontalAlign="Left" />
                 </asp:TemplateField>


                  <asp:TemplateField>
                    <ItemTemplate>
                      <asp:ImageButton ID="rbtn_like" runat="server" Text="<%$ Resources:Resource, sip_advice_like %>" CommandName="Update" Visible='<%#Eval("BIT")%>' ImageUrl="~/images/like_icon.png" 
                      style="width:32px;height:32px;" ></asp:ImageButton>

                      <asp:LinkButton ID="rbtn_unlike" runat="server" Text="<%$ Resources:Resource, sip_advice_unlike %>" 
                            CommandName="Delete" Visible='<%# !(bool) Eval("BIT")%>'  
                      style="width:32px;height:32px;" ForeColor="#0095CD"></asp:LinkButton>
                    </ItemTemplate>
                      <HeaderStyle HorizontalAlign="Left" />
                 </asp:TemplateField>

                 <asp:ButtonField Text="<%$ Resources:Resource, sip_sp_relevantDescrib %>" CommandName="Select" >

               
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle ForeColor="#0095CD" />
                </asp:ButtonField>

               
            </Columns>
            <SelectedRowStyle CssClass="GridViewSelectRowStyle" />
        </asp:GridView>

        </asp:Panel>


        <br />
     
        </div>
    </div>
   </div>
   </form>
</body>
</html>

