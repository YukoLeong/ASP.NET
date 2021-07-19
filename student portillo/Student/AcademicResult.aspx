<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AcademicResult.aspx.vb" Inherits="Student_AcademicResult" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <style type="text/css">
        .style1
        {
            font-family: "Berlin Sans FB";
            font-size: x-large;
        }
        #form1
        {
            height: 75px;
        }
        .style4
        {
            width: 146px;
        }
		.ajax__htmleditor_editor_bottomtoolbar {
		display :none;
         }
        
        #ImageButton2{
            width:14%;
        }
        
        </style>

     <link rel="stylesheet" href="../button.css" type="text/css" media="screen" />
     <link rel="stylesheet" href="../button1.css" type="text/css" media="screen" />
     <link rel="stylesheet" href="../grid.css" type="text/css" media="screen" />  
      <link rel="stylesheet" href="../Student/styles/orange.css" type="text/css" media="screen" />  
</head>
<body background="images/profile.gif">
    <form id="form1" runat="server">
    <div>
        <div style="text-align:center;margin-top:1px;padding-bottom:12px;width:1005px">
               <asp:ImageButton ID="ImageButton2" runat="server" onmouseover="this.src='../images/homeblue_hover.png'" onmouseout="this.src='../images/homeblue.png'" ImageUrl="~/images/homeblue.png" CausesValidation="False" /> 
    </div>
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
                  <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                
                
                SelectCommand="SELECT [academic_result_info].[ACADEMIC_YEAR], [academic_result_info].[ACADEMIC_SEMESTER], [academic_result_info].[SUBJECT_CODE], [academic_result_info].[SUBJECT_CH], [academic_result_info].[SUBJECT_EN], [academic_result_info].[SUBJECT_STATUS_EN], [academic_result_info].[FINAL_MARK], [academic_result_info].[FINAL_GRADE],[ep_class_grade].CLASS_WORK_SCORE,[ep_class_grade].EXAM_SCORE,[ep_class_grade].ABSENT_PCT FROM [academic_result_info],[ep_class_grade] WHERE ([academic_result_info].[ALUN_NUMERO]=[ep_class_grade].[NUMERO] AND [academic_result_info].[ALUN_NUMERO_SEQ]=[ep_class_grade].[NUMERO_SEQ] AND [academic_result_info].[SUBJECT_CODE]=[ep_class_grade].[CLASS_CODE] AND [academic_result_info].[ALUN_NUMERO] = @ALUN_NUMERO AND [academic_result_info].[ALUN_NUMERO_SEQ] = @ALUN_NUMERO_SEQ AND [academic_result_info].[ACADEMIC_YEAR]= [ep_class_grade].[YEAR] AND [academic_result_info].[ACADEMIC_SEMESTER]=[ep_class_grade].[SEMESTRE] AND [academic_result_info].[ACADEMIC_YEAR]=@academic_year) ORDER BY  [academic_result_info].[ACADEMIC_YEAR],  [academic_result_info].[ACADEMIC_SEMESTER]">
                <SelectParameters>
                    <asp:SessionParameter Name="ALUN_NUMERO" SessionField="ALUN_NUMERO" Type="String" />
                    <asp:SessionParameter Name="ALUN_NUMERO_SEQ" SessionField="ALUN_NUMERO_SEQ" Type="Decimal" />
                    <asp:ControlParameter ControlID="DropDownList1" Name="academic_year" 
                        PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <span class="style1">Academic Results<br />
            <br />
            </span>
             <asp:Label ID="stdNameV1" runat="server" Text="" style="color:black;font-size:large;font-family: 'Berlin Sans FB';"></asp:Label>
                <br /><br />
                <table>
                    <tr>
                        <td class="style4">
                            <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Large" 
                                Text="Academic Year:"></asp:Label>
                        </td>
                        <td>
            <span class="style1">
                            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                                DataSourceID="SqlDataSource8" DataTextField="ACADEMIC_YEAR" 
                                DataValueField="ACADEMIC_YEAR">
                            </asp:DropDownList>
            </span>
                        </td>
                    </tr>
            </table>
            <br />
            <asp:SqlDataSource ID="SqlDataSource8" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                
                SelectCommand="SELECT DISTINCT [ACADEMIC_YEAR] FROM [academic_result_info] WHERE ([ALUN_NUMERO] = @ALUN_NUMERO AND [ALUN_NUMERO_SEQ] = @ALUN_NUMERO_SEQ)ORDER BY [ACADEMIC_YEAR] DESC">
                <SelectParameters>
                    <asp:SessionParameter Name="ALUN_NUMERO" SessionField="ALUN_NUMERO" Type="String" />
                    <asp:SessionParameter Name="ALUN_NUMERO_SEQ" SessionField="ALUN_NUMERO_SEQ" Type="Decimal" />
                  
                
                </SelectParameters>
            </asp:SqlDataSource>
&nbsp;<asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
                AutoGenerateColumns="False" DataSourceID="SqlDataSource3" 
                EmptyDataText="There are no data records to display." Font-Names="Calibri" 
                GridLines="Horizontal" Height="172px" Width="100%" CssClass="GridViewStyle">
                <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                <Columns>
                    <asp:TemplateField></asp:TemplateField>
                    <asp:BoundField DataField="ACADEMIC_YEAR" HeaderText="Academic Year" 
                        SortExpression="ACADEMIC_YEAR" >
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="ACADEMIC_SEMESTER" HeaderText="Semester" 
                        SortExpression="ACADEMIC_SEMESTER" >
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="SUBJECT_CODE" HeaderText="Subject Code" 
                        SortExpression="SUBJECT_CODE" >
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="SUBJECT_CH" HeaderText="Subject(Chinese)" 
                        SortExpression="SUBJECT_CH" >
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="SUBJECT_EN" HeaderText="Subject(English)" 
                        SortExpression="SUBJECT_EN" >
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="CLASS_WORK_SCORE" HeaderText="Course Work" 
                        SortExpression="CLASS_WORK_SCORE" >
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="EXAM_SCORE" HeaderText="Final Exam" 
                        SortExpression="EXAM_SCORE" >
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="FINAL_MARK" HeaderText="Final Score" 
                        SortExpression="FINAL_MARK" >
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="FINAL_GRADE" HeaderText="Grade" 
                        SortExpression="FINAL_GRADE" >
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="ABSENT_PCT" DataFormatString="{0:p}" 
                        HeaderText="Absence Rate" SortExpression="ABSENT_PCT">
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Status" SortExpression="SUBJECT_STATUS_EN">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("SUBJECT_STATUS_EN") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" 
                                Text='<%# Bind("SUBJECT_STATUS_EN") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                </Columns>
                <HeaderStyle CssClass="GridViewHeaderStyle" ForeColor="White" />
                <PagerStyle CssClass="GridViewPagerStyle" />
                <RowStyle CssClass="GridViewRowStyle" />
                <SelectedRowStyle CssClass="GridViewSelectRowStyle" />
                <SortedAscendingCellStyle CssClass="GridViewSortStyle" />
                <SortedAscendingHeaderStyle CssClass="GridViewSortHeaderStyle" />
            </asp:GridView>
            <br />
            </asp:View>
            <asp:View ID="View2" runat="server">
                       <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                
                
                SelectCommand="SELECT [academic_result_info].[ACADEMIC_YEAR], [academic_result_info].[ACADEMIC_SEMESTER], [academic_result_info].[SUBJECT_CODE], [academic_result_info].[SUBJECT_CH], [academic_result_info].[SUBJECT_EN], [academic_result_info].[SUBJECT_STATUS_EN], [academic_result_info].[FINAL_MARK], [academic_result_info].[FINAL_GRADE],[ep_class_grade].CLASS_WORK_SCORE,[ep_class_grade].EXAM_SCORE,[ep_class_grade].ABSENT_PCT FROM [academic_result_info],[ep_class_grade] WHERE ([academic_result_info].[ALUN_NUMERO]=[ep_class_grade].[NUMERO] AND [academic_result_info].[ALUN_NUMERO_SEQ]=[ep_class_grade].[NUMERO_SEQ] AND [academic_result_info].[SUBJECT_CODE]=[ep_class_grade].[CLASS_CODE] AND [academic_result_info].[ALUN_NUMERO] = @ALUN_NUMERO AND [academic_result_info].[ALUN_NUMERO_SEQ] = @ALUN_NUMERO_SEQ AND [academic_result_info].[ACADEMIC_YEAR]= [ep_class_grade].[YEAR] AND [academic_result_info].[ACADEMIC_SEMESTER]=[ep_class_grade].[SEMESTRE] AND [academic_result_info].[ACADEMIC_YEAR]=@academic_year) ORDER BY  [academic_result_info].[ACADEMIC_YEAR],  [academic_result_info].[ACADEMIC_SEMESTER]">
                <SelectParameters>
                    <asp:SessionParameter Name="ALUN_NUMERO" SessionField="ALUN_NUMERO" Type="String" />
                    <asp:SessionParameter Name="ALUN_NUMERO_SEQ" SessionField="ALUN_NUMERO_SEQ" Type="Decimal" />
                    <asp:ControlParameter ControlID="DropDownList2" Name="academic_year" 
                        PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <span class="style1">Academic Results<br />
            <br />
            </span>
            <asp:Label ID="stdNameV2" runat="server" Text="" style="color:black;font-size:large;font-family: 'Berlin Sans FB';"></asp:Label>
            <br /><br />
                <table>
                    <tr>
                        <td class="style4">
                            <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Large" 
                                Text="Academic Year:"></asp:Label>
                        </td>
                        <td>
            <span class="style1">
                            <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" 
                                DataSourceID="SqlDataSource2" DataTextField="ACADEMIC_YEAR" 
                                DataValueField="ACADEMIC_YEAR">
                            </asp:DropDownList>
            </span>
                        </td>
                    </tr>
            </table>
            <br />
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                
                SelectCommand="SELECT DISTINCT [ACADEMIC_YEAR] FROM [academic_result_info] WHERE ([ALUN_NUMERO] = @ALUN_NUMERO AND [ALUN_NUMERO_SEQ] = @ALUN_NUMERO_SEQ)ORDER BY [ACADEMIC_YEAR] DESC">
                <SelectParameters>
                 <asp:SessionParameter Name="ALUN_NUMERO" SessionField="ALUN_NUMERO" Type="String" />
                    <asp:SessionParameter Name="ALUN_NUMERO_SEQ" SessionField="ALUN_NUMERO_SEQ" Type="Decimal" />
                  
                
                </SelectParameters>
            </asp:SqlDataSource>
          &nbsp;<span class="style1"><asp:SqlDataSource ID="SqlDataSource9" runat="server" 
                           ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                           SelectCommand="select academic_result_info.SUBJECT_CODE from academic_result_info,teacher_course_info
where academic_result_info.SECTION_YEAR=teacher_course_info.SECTION_YEAR and academic_result_info.SECTION_CODE=teacher_course_info.SECTION_CODE
and academic_result_info.ALUN_NUMERO=@ALUN_NUMERO and academic_result_info.ALUN_NUMERO_SEQ=@ALUN_NUMERO_SEQ and teacher_course_info.CODE=@code">
                           <SelectParameters>
                               <asp:SessionParameter Name="ALUN_NUMERO" SessionField="ALUN_NUMERO" />
                               <asp:SessionParameter Name="ALUN_NUMERO_SEQ" SessionField="ALUN_NUMERO_SEQ" Type="Decimal" />
                               <asp:SessionParameter Name="code" SessionField="code" />
                           </SelectParameters>
                       </asp:SqlDataSource>
                       </span>
                       <asp:GridView ID="GridView2" runat="server" AllowSorting="True" 
                AutoGenerateColumns="False" DataSourceID="SqlDataSource1" 
                EmptyDataText="There are no data records to display." Font-Names="Calibri" 
                GridLines="Horizontal" Height="172px" Width="100%" CssClass="GridViewStyle">
                <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                <Columns>
                    <asp:TemplateField></asp:TemplateField>
                    <asp:BoundField DataField="ACADEMIC_YEAR" HeaderText="Academic Year" 
                        SortExpression="ACADEMIC_YEAR" >
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="ACADEMIC_SEMESTER" HeaderText="Semester" 
                        SortExpression="ACADEMIC_SEMESTER" >
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Subject Code" SortExpression="SUBJECT_CODE">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("SUBJECT_CODE") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("SUBJECT_CODE") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="SUBJECT_CH" HeaderText="Subject(Chinese)" 
                        SortExpression="SUBJECT_CH" >
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="SUBJECT_EN" HeaderText="Subject(English)" 
                        SortExpression="SUBJECT_EN" >
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Course Work" SortExpression="CLASS_WORK_SCORE">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" 
                                Text='<%# Bind("CLASS_WORK_SCORE") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("CLASS_WORK_SCORE") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Final Exam" SortExpression="EXAM_SCORE">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("EXAM_SCORE") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("EXAM_SCORE") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Final Score" SortExpression="FINAL_MARK">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("FINAL_MARK") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("FINAL_MARK") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Grade" SortExpression="FINAL_GRADE">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("FINAL_GRADE") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("FINAL_GRADE") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="ABSENT_PCT" HeaderText="Absence Rate" 
                        SortExpression="ABSENT_PCT" DataFormatString="{0:p}" >
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Status" SortExpression="SUBJECT_STATUS_EN">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("SUBJECT_STATUS_EN") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" 
                                Text='<%# Bind("SUBJECT_STATUS_EN") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                </Columns>
                <HeaderStyle CssClass="GridViewHeaderStyle" ForeColor="White" />
                <PagerStyle CssClass="GridViewPagerStyle" />
                <RowStyle CssClass="GridViewRowStyle" />
                <SelectedRowStyle CssClass="GridViewSelectRowStyle" />
                <SortedAscendingCellStyle CssClass="GridViewSortStyle" />
                <SortedAscendingHeaderStyle CssClass="GridViewSortHeaderStyle" />
            </asp:GridView>
                  
                       <br />
            <br />
            <asp:Label ID="Label7" runat="server" Text="*:"></asp:Label>
                       <asp:Label ID="Label8" runat="server" ForeColor="Blue" 
                           Text=" You do not have permission to view it"></asp:Label>
            </asp:View>
        </asp:MultiView>
        
          
        
    </div>
    </form>
</body>
</html>
