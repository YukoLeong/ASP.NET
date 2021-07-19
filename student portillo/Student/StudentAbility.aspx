<%@ Page Language="VB" AutoEventWireup="false" CodeFile="StudentAbility.aspx.vb" Inherits="Student_StudentAbility" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
     <link rel="stylesheet" href="../button.css" type="text/css" media="screen" />
  <link rel="stylesheet" href="../teachGrid.css" type="text/css" media="screen" />
  	<link rel="stylesheet" type="text/css" href="../resources/demo.css"/>

       <style type="text/css">
            .stylefont
        {
            font-family: "Berlin Sans FB";
            font-size: xx-large;
        }
tr.row
{
    background-color:#fff;
}
tr.row td
{ 
}

tr.row:hover td, 
tr.row.over td
{ 
    background-color: #eee;
}

        .style2
        {
            font-family: "Berlin Sans FB";
            font-size: xx-large;
        }


           .style6
           {
               width: 197px;
               height: 41px;
           }
           .style7
           {
               width: 197px;
               height: 51px;
           }
           .style8
           {
               height: 51px;
           }
          .style9
        {
            font-family: "Berlin Sans FB";
            font-size: xx-large;
               width: 132px;
           }
           .style11
           {
               font-family: "Berlin Sans FB";
               font-size: xx-large;
               width: 133px;
           }
           .style16
           {
               width: 219px;
           }
           .style17
           {
               font-family: "Berlin Sans FB";
               font-size: xx-large;
               width: 219px;
           }
          #wrapper
          {
            width: 1100px;
            min-height:950px;
            margin-left: auto;
            margin-right: auto;
            background-color:White;
            border-left: solid black 1px;
            border-right: solid black 1px;
          }
        
          #content
          {
            min-height:900px;
            margin-left: 5px;
            margin-right: 5px;
          }
        #ImageButton2{
            width:14%;
        }



        </style>
</head>
<body background="../images/bg-blue.jpg">

    <form id="form1" runat="server">
     <div id="wrapper">
    <div id="content">
    <br />
    <br />
   <div>

           <div class="style2" style="margin-top:56px">Student Academic Result Ability</div>
    <div style="text-align:center;margin-top:-87px;padding-bottom:12px;width:1000px">
               <asp:ImageButton ID="ImageButton2" runat="server" onmouseover="this.src='../images/homeblue_hover.png'" onmouseout="this.src='../images/homeblue.png'" ImageUrl="~/images/homeblue.png" CausesValidation="False" /> 
    </div>


    <%--   <span class="style9">Student Academic Result Ability</span>
       <asp:Button ID="home" runat="server" Text="Home" 
            style="font-size:Large; margin-left:115px;" CssClass="blue"/>--%>
       <br /><br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
            SelectCommand=" select ProgramAbility.ability,sum(academic_result_info.FINAL_MARK) as score from SubjectAbility,ProgramAbility,academic_result_info where ProgramAbility.id=SubjectAbility.abilityID and SubjectAbility.program_code=@program_code and SubjectAbility.subject_code=academic_result_info.subject_code and academic_result_info.ALUN_NUMERO=@ALUN_NUMERO and academic_result_info.ALUN_NUMERO_SEQ=@ALUN_NUMERO_SEQ group by ProgramAbility.ability">
            <SelectParameters>
                <asp:SessionParameter Name="ALUN_NUMERO" SessionField="ALUN_NUMERO" />
                <asp:SessionParameter Name="ALUN_NUMERO_SEQ" SessionField="ALUN_NUMERO_SEQ" />
                <asp:SessionParameter Name="program_code" SessionField="programForAbility" />
            </SelectParameters>
        </asp:SqlDataSource>
        <table class="style16">
  
            <tr>
                <td>
    
        <asp:GridView ID="GridViewScore" runat="server" AutoGenerateColumns="False" GridLines="Horizontal" 
            DataKeyNames="ability" BorderStyle="None" CssClass="GridViewStyle" Width="300px" EmptyDataText="There are no data records to display.">
            <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
            <Columns>
                <asp:TemplateField HeaderText="Program Ability">
                    <ItemTemplate>
                        <asp:LinkButton ID="Ability" runat="server" Text='<%# Bind("ability") %>' 
                            CommandName="Select"></asp:LinkButton>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ability") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:TemplateField>
                <asp:BoundField DataField="score" HeaderText="Total Score" >
                <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
            </Columns>
            <HeaderStyle CssClass="GridViewHeaderStyle" />
            <PagerStyle BackColor="White" HorizontalAlign="Center" />
            <RowStyle CssClass="GridViewRowStyle" />
            <SelectedRowStyle BackColor="Silver" />
        </asp:GridView>
                </td>
                <td>
                           <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1" 
            Height="478px" Width="660px">
            <Series>
                <asp:Series ChartArea="ChartArea1" ChartType="Radar" Name="Series1" 
                    XValueMember="ability" YValueMembers="score" YValuesPerPoint="2">
                </asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </ChartAreas>
        </asp:Chart>
    
    </td>
            </tr>
        </table>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
            
            SelectCommand=" SELECT SubjectAbility.subject_code,subject_info.SUBJECT_CH,subject_info.SUBJECT_EN,temp.FINAL_MARK FROM  SubjectAbility inner join subject_info on SubjectAbility.subject_code=subject_info.subject_code 
            left join (SELECT academic_result_info.SUBJECT_CODE,academic_result_info.SUBJECT_CH,academic_result_info.SUBJECT_EN,academic_result_info.FINAL_MARK FROM  academic_result_info WHERE academic_result_info.ALUN_NUMERO=@ALUN_NUMERO and academic_result_info.ALUN_NUMERO_SEQ=@ALUN_NUMERO_SEQ)as temp on SubjectAbility.subject_code=temp.SUBJECT_CODE 
            inner join ProgramAbility on SubjectAbility.abilityID= ProgramAbility.id WHERE (SubjectAbility.program_code = @programForAbility and ProgramAbility.ability = @ability) order by SubjectAbility.subject_code  ">
            <SelectParameters>
                   <asp:SessionParameter Name="ALUN_NUMERO" SessionField="ALUN_NUMERO" />
                   <asp:SessionParameter Name="ALUN_NUMERO_SEQ" SessionField="ALUN_NUMERO_SEQ" />
                   <asp:SessionParameter Name="programForAbility" SessionField="programForAbility" />
                <asp:ControlParameter ControlID="GridViewScore" Name="ability" 
                    PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
                   <asp:Label ID="proAbility" runat="server" Text="Program Ability:" 
                     ForeColor="Black" style="font-size:larger;margin-left:0px;" 
                    Font-Bold="True" Visible="False" ></asp:Label>&nbsp
                    <asp:Label ID="abilityInfo" runat="server" Text="" 
                            ForeColor="Black" style="font-size:larger;margin-left:0px;" 
                     ></asp:Label>
                    <br /><br />
               <asp:Label ID="info" runat="server" Text=" Subject Information:" 
                            ForeColor="Black" style="font-size:larger;margin-left:0px;" 
                    Font-Bold="True" Visible="False" ></asp:Label>&nbsp
                <br />  <br /> 
        <asp:GridView ID="GridView3" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" DataSourceID="SqlDataSource3" 
            GridLines="Horizontal" BorderStyle="None" CssClass="GridViewStyle">
            <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
            <Columns>
                <asp:BoundField DataField="subject_code" HeaderText="Subject Code" 
                    SortExpression="subject_code" >
                <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="SUBJECT_CH" HeaderText="Subject Chinese Name" 
                    SortExpression="SUBJECT_CH" >
                <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="SUBJECT_EN" HeaderText="Subject English Name" 
                    SortExpression="SUBJECT_EN" >
                <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="FINAL_MARK" HeaderText="Final Score" 
                    SortExpression="FINAL_MARK" >
                <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
            </Columns>
            <HeaderStyle CssClass="GridViewHeaderStyle" />
            <PagerStyle BackColor="White" HorizontalAlign="Center" />
            <RowStyle CssClass="GridViewRowStyle" />
        </asp:GridView>
    
    </div>
    </div>
    </div>
    </form>
</body>
</html>
