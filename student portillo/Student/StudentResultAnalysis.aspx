<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StudentResultAnalysis.aspx.cs" Inherits="StudentResultAnalysis" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Student RA</title>
    <link rel="stylesheet" href="../button.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="../grid.css" type="text/css" media="screen" /> 
 
    <style type="text/css">
        #wrapper
        {            
            margin-left: auto;
            margin-top:-8px;
            margin-right: auto;
            background-color:White;
            border-left:solid gray 1px;
            border-right:solid gray 1px;
			width:90%;
        
        }
        #content
        {          
            min-height:980px;            
            padding-left: 5px;
            padding-right: 5px;
        }
        .style1
        {
            width: 108px;
        }
        .style2
        {
            width: 121px;
        }
        .style3
        {
            width: 143px;
        }
      
     
    </style>
</head>
<body background="../images/bg-blue.jpg">
     <form id="form1" runat="server">
    <div id="wrapper">
    <div  id="content">
    <asp:Label runat="server" ID="lb_title" style="color:black;font-size:xx-large;font-family: 'Berlin Sans FB';" Text="<%$ Resources:Resource, sip_result_analysis %>"></asp:Label>
     <div style="text-align:center;margin-top:-25px;padding-bottom:12px">
               <asp:ImageButton ID="ImageButton2" runat="server" onmouseover="this.src='../images/homeblue_hover.png'" onmouseout="this.src='../images/homeblue.png'" 
			   ImageUrl="~/images/homeblue.png" CausesValidation="false" onclick="btn_home_Click"  Height="55px" Width="150px"/>
	</div>
	 <%--<asp:Button ID="btn_home" runat="server" Text="Back" style="margin-left:176px;" Font-Size="Large"
        CssClass="blue" CausesValidation="false" onclick="btn_home_Click"/>
		--%>
       
        <br />
        <br />
        <fieldset style="width:80%;border:solid #CCC 1px;border-radius:8px;">
      <legend style="color:blue;">
          <asp:Label ID="lb_searchc" runat="server" Text="<%$ Resources:Resource, sip_search_criteria %>"></asp:Label></legend>
              <p>
                  <asp:Label ID="Label1" runat="server" Text="<%$ Resources:Resource, sip_pls_select %>"></asp:Label>"<span style="color:red;"> <asp:Label ID="lb_acadYr" runat="server" Text="<%$ Resources:Resource, sip_acad_year %>"></asp:Label></span>" <asp:Label ID="Label2" runat="server" Text="<%$ Resources:Resource, sip_see_result %>"></asp:Label></p>
    <table style="text-align:left;width:100%">        
    <tr>
    <td style="width:25%;"><asp:Label ID="txt_stdID" Text="<%$ Resources:Resource, sip_advice_std_id %>" runat="server"/>:</td>
    <td><asp:Label ID="stu_id_txt" runat="server" />
    </td>
    </tr>
        <tr>
            <td>
               <asp:Label ID="txt_StdName" Text="<%$ Resources:Resource, sip_std_name %>" runat="server"/>:
            </td>
            <td><asp:Label ID="std_name_txt" runat="server" /></td>
        </tr>
         <tr>
       <td>
           <asp:Label ID="lb_acadyears" runat="server" Text="<%$ Resources:Resource, sip_acad_year %>"></asp:Label><span style="color:red;">*</span>:</td>
         <td colspan="2">
        <asp:DropDownList ID="yearDropDownList" runat="server" AutoPostBack="true" OnSelectedIndexChanged="search_Click"
           style="width:25%;">
        
        </asp:DropDownList>
     
        <%-- <asp:RequiredFieldValidator ID="req_message" ControlToValidate="yearDropDownList" ErrorMessage="<%$ Resources:Resource, sip_acad_year_req %>"
                        runat="server" style="color:Red;"  />--%>
        </td>
        </tr>         
 
      <%-- <tr>
           <td></td>
           <td><asp:ImageButton ID="btn_search" runat="server" Text="Display" style="width:120px" OnClick="search_Click" 
               onmouseover="this.src='../images/search2.png'" onmouseout="this.src='../images/search1.png'" ImageUrl="../images/search1.png"/>
           <asp:Button ID="btn_des" runat="server" Text="Help" 
            OnClick="btn_Des_Click" CausesValidation="false" 
            Width="125px" style="display:none;" /></td>
       </tr>--%>
     
       
    </table>
    <p> <span style="color:Red;">*</span>&nbsp;<asp:Label ID="Label3" runat="server" Text="<%$ Resources:Resource, sip_mandatory %>"></asp:Label></p>
  
            </fieldset> 
      
       <%-- 
        <asp:Button ID="btn_back" runat="server" Text="Back" style="width:120px"
                onclick="btn_back_Click" CausesValidation="false" CssClass="blue"/>
				--%>
       
           
            <br />
              <hr />
      
        <asp:Label ID="noDataMsg" runat="server" Text="<%$ Resources:Resource, sip_no_data %>" 
            Visible="False" Font-Size="X-Large" ForeColor="Green"></asp:Label>
         <asp:Label ID="noGPAMsg" runat="server" Text="No GPA found!" 
            Visible="False" Font-Size="X-Large" ForeColor="Red"></asp:Label>
         
            <p style="color:Blue; font-family: 'Times New Roman', Times, serif;">
                <asp:Label ID="lb_result" runat="server" Visible="false" Text="<%$ Resources:Resource, sip_result %>"></asp:Label></p>   
<asp:GridView ID="GridView2" runat="server" CssClass="GridViewStyle" 
                        style="width:100%" AutoGenerateColumns="False" 
            GridLines="Horizontal" Width="100%">
                    <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                    <HeaderStyle CssClass="GridViewHeaderStyle" ForeColor="White" />
                    <PagerStyle CssClass="GridViewPagerStyle" />
                    <RowStyle CssClass="GridViewRowStyle" />
                    <Columns>
                        <asp:TemplateField></asp:TemplateField>
                        <asp:BoundField DataField="PROGRAM_COMPOSITE_CH" HeaderText="<%$ Resources:Resource, sip_program_chinese %>">
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="PROGRAM_COMPOSITE_EN" HeaderText="<%$ Resources:Resource, sip_program_engl %>">
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="GPA" HeaderText="GPA">
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="RANK" HeaderText="<%$ Resources:Resource, sip_gpa_rank %>">
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                       
                    </Columns>
                    </asp:GridView>
					
                      <br />
                     <br />
                    <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle" 
                        style="width:100%" 
            Visible="False" AutoGenerateColumns="False" GridLines="Horizontal">
                    <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                    <HeaderStyle CssClass="GridViewHeaderStyle" ForeColor="White" />
                    <PagerStyle CssClass="GridViewPagerStyle" />
                    <RowStyle CssClass="GridViewRowStyle" />
                    <Columns>
                        <asp:TemplateField></asp:TemplateField>
                        <asp:BoundField DataField="CLASS_NAME" HeaderText="<%$ Resources:Resource, sip_advice_class_code %>">
                        <HeaderStyle HorizontalAlign="Left" Width="111px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="COURSE_CH" HeaderText="<%$ Resources:Resource, sip_advice_subject_chinese %>">
                        <HeaderStyle HorizontalAlign="Left" Width="150px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="COURSE" HeaderText="<%$ Resources:Resource, sip_advice_subject_engl %>" >
                        <HeaderStyle HorizontalAlign="Left" Width="150px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="CLASS_WORK_SCORE" HeaderText="<%$ Resources:Resource, sip_class_work %>" >
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="CLASS_WORK_SCORE_RANK" 
                            HeaderText="<%$ Resources:Resource, sip_class_work_rank %>" >
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="EXAM_SCORE" HeaderText="<%$ Resources:Resource, sip_exam_score %>">
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="EXAM_SCORE_RANK" HeaderText="<%$ Resources:Resource, sip_exam_rank %>" >
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="FINAL_SCORE" HeaderText="<%$ Resources:Resource, sip_final %>">
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="FINAL_SCORE_RANK" HeaderText="<%$ Resources:Resource, sip_final_rank %>">
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                       
                        <asp:BoundField DataField="CLASS_NAME_TOTAL" HeaderText="<%$ Resources:Resource, sip_total_std %>">
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                       
                    </Columns>
                    </asp:GridView>



                    

                    </div>
                   <br />
                 
     
      

   </div>
  
    </form>
</body>
</html>
