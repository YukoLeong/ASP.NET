<%@ Page Language="VB" AutoEventWireup="false" CodeFile="SubjectCategory.aspx.vb" Inherits="Student_SubjectCategory" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
     <link rel="stylesheet" href="../button.css" type="text/css" media="screen" />

    <link rel="stylesheet" href="../grid.css" type="text/css" media="screen" />

  	

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
            margin-top:50px;
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
               margin-top:20px;
           }
           .style17
           {
               font-family: "Berlin Sans FB";
               font-size: xx-large;
               width: 219px;
           }
          #wrapper
          {
            width: 90%;
            min-height:950px;
            margin-top:-8px;
            margin-left: auto;
            margin-right: auto;
            background-color:White;
            border-left: solid black 1px;
            border-right: solid black 1px;
          }
        
          #content
          {
            min-height:980px;
            margin-left: 5px;
            margin-right: 5px;
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

      <asp:Label ID="title" runat="server" Text="<%$ Resources:Resource, sip_subject_category %>" style="color:black;font-size:xx-large;font-family: 'Berlin Sans FB';"></asp:Label>
    <div style="text-align:center;margin-top:-25px;padding-bottom:12px">
               <asp:ImageButton ID="ImageButton2" runat="server" onmouseover="this.src='../images/homeblue_hover.png'" onmouseout="this.src='../images/homeblue.png'" ImageUrl="~/images/homeblue.png" CausesValidation="False" Height="55px" Width="150px"/>
    </div>

       <%--<span class="style9">Student Subject Category Score</span>
       <asp:Button ID="home" runat="server" Text="Home" 
            style="font-size:Large; margin-left:115px;" CssClass="blue"/>--%>
       <br /><br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
            
           SelectCommand=" select AREA_CH,SUM(FINAL_MARK) as score from academic_result_info where ALUN_NUMERO=@ALUN_NUMERO and ALUN_NUMERO_SEQ=@ALUN_NUMERO_SEQ and SUBJECT_STATUS_EN=@SUBJECT_STATUS_EN group by AREA_CH ">
            <SelectParameters>
                <asp:SessionParameter Name="ALUN_NUMERO" SessionField="ALUN_NUMERO" />
                <asp:SessionParameter Name="ALUN_NUMERO_SEQ" SessionField="ALUN_NUMERO_SEQ" />
              
                <asp:Parameter DefaultValue="Pass" Name="SUBJECT_STATUS_EN" />
              
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                SelectCommand="SELECT * FROM [userGroup] WHERE ([id] = @id)">
                <SelectParameters>
                    <asp:SessionParameter Name="id" SessionField="Role_Type" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        <table class="style16">
  
            <tr>
                <td>
    
        <asp:GridView ID="GridViewScore" runat="server" AutoGenerateColumns="False" GridLines="Horizontal" 
            DataKeyNames="AREA_CH" BorderStyle="None" CssClass="GridViewStyle" Width="300px" 
                        EmptyDataText="<%$ Resources:Resource, sip_data_check %>">
            <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
            <Columns>
                         <asp:TemplateField></asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_subject_cat %>">
                    <ItemTemplate>
                        <asp:LinkButton ID="Category" runat="server" Text='<%# Bind("AREA_CH") %>' 
                            CommandName="Select"></asp:LinkButton>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("AREA_CH") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:TemplateField>
                <asp:BoundField DataField="score" HeaderText="<%$ Resources:Resource, sip_total_score %>" >
                <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
            </Columns>
            <HeaderStyle CssClass="GridViewHeaderStyle" />
            <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
            <RowStyle CssClass="GridViewRowStyle" />
            <SelectedRowStyle BackColor="Silver" />
        </asp:GridView>
                </td>
                <td>
                           <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1" 
            Height="478px" Width="660px">
            <Series>
                <asp:Series ChartArea="ChartArea1" ChartType="Radar" Name="Series1" 
                    XValueMember="AREA_CH" YValueMembers="score" YValuesPerPoint="2">
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
            
            SelectCommand=" select AREA_CH,SUBJECT_CODE,SUBJECT_CH,SUBJECT_EN,FINAL_MARK from academic_result_info where ALUN_NUMERO=@ALUN_NUMERO and ALUN_NUMERO_SEQ=@ALUN_NUMERO_SEQ and SUBJECT_STATUS_EN=@SUBJECT_STATUS_EN  group by AREA_CH,SUBJECT_CODE,SUBJECT_CH,SUBJECT_EN,FINAL_MARK having AREA_CH=@AREA_CH  ">
            <SelectParameters>
                   <asp:SessionParameter Name="ALUN_NUMERO" SessionField="ALUN_NUMERO" />
                   <asp:SessionParameter Name="ALUN_NUMERO_SEQ" SessionField="ALUN_NUMERO_SEQ" />
                  <asp:Parameter DefaultValue="Pass" Name="SUBJECT_STATUS_EN" />
                <asp:ControlParameter ControlID="GridViewScore" Name="AREA_CH" 
                    PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />  <br /> 
                   <asp:Label ID="subjectCategory" runat="server" Text="<%$ Resources:Resource, sip_subject_type %>" 
                     ForeColor="Black" style="font-size:larger;margin-left:0px;" 
                    Font-Bold="True" Visible="False" ></asp:Label>&nbsp
                    <asp:Label ID="categoryInfo" runat="server" Text="" 
                            ForeColor="Black" style="font-size:larger;margin-left:0px;" 
                     ></asp:Label>
                    <br /><br />
               <asp:Label ID="info" runat="server" Text="<%$ Resources:Resource, sip_subject_info %>" 
                            ForeColor="Black" style="font-size:larger;margin-left:0px;" 
                    Font-Bold="True" Visible="False" ></asp:Label>&nbsp
                <br />  <br /> 
        <asp:GridView ID="GridView3" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" DataSourceID="SqlDataSource3" 
            GridLines="Horizontal" BorderStyle="None" CssClass="GridViewStyle">
            <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
            <Columns>
                <asp:TemplateField></asp:TemplateField>
                <asp:BoundField DataField="subject_code" HeaderText="<%$ Resources:Resource, sip_advice_class_code %>" 
                    SortExpression="subject_code" >
                <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="SUBJECT_CH" HeaderText="<%$ Resources:Resource, sip_subject_cht %>" 
                    SortExpression="SUBJECT_CH" >
                <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="SUBJECT_EN" HeaderText="<%$ Resources:Resource, sip_subject_en %>" 
                    SortExpression="SUBJECT_EN" >
                <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="FINAL_MARK" HeaderText="<%$ Resources:Resource, sip_final_score %>" 
                    SortExpression="FINAL_MARK" >
                <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
            </Columns>
            <HeaderStyle CssClass="GridViewHeaderStyle" />
            <PagerStyle BackColor="White" HorizontalAlign="Center" />
            <RowStyle CssClass="GridViewRowStyle" />
        </asp:GridView>
    <br />  <br /> 
    </div>
    </div>
    </div>
    </form>
</body>
</html>
