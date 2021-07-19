<%@ Page Language="VB" AutoEventWireup="false" CodeFile="LearningRecordAttribute.aspx.vb" ClientTarget="uplevel" Inherits="LearningRecordAttribute" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
         .style1
        {
            font-family: "Berlin Sans FB";
            font-size: xx-large;
        }
        .style3
        {
            width: 100%;
        }
        .style4
        {
            width: 437px;
        }

        #ImageButton2{
            width:13%;
        }

        </style>
   
  <link rel="stylesheet" href="../button.css" type="text/css" media="screen" />  
  <link rel="stylesheet" href="../grid.css" type="text/css" media="screen" />  
</head>
<body background="images/studentWork2.gif">
    <form id="form1" runat="server">
         <table cellpadding="0" cellspacing="0" border="0" width="1160" align="center">
    
    <tr>
<td>
     <div>
   <br />   <span class="style1">Learning Record Attribute</span>
<%--    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="blue" 
                  style="margin-left: 232px" Font-Size="Large">Back</asp:LinkButton>--%>
                <div style="text-align:center;margin-top:-38px;padding-bottom:12px;width:1127px">
               <asp:ImageButton ID="ImageButton2" runat="server" onmouseover="this.src='../images/homeblue_hover.png'" onmouseout="this.src='../images/homeblue.png'" ImageUrl="~/images/homeblue.png" /> 
    </div>   


       <br />
      <br />
     <br />
    
   
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" 
        EmptyDataText="There are no data records to display." 
        GridLines="Horizontal" 
        style="z-index: 1; left: 15px; top: 75px;  " 
        Font-Names="Calibri" Font-Size="Small" Height="114px" 
        Width="100%" CssClass="GridViewStyle">
            <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
        <Columns>
            <asp:BoundField DataField="Learning_Experience" 
                HeaderText="Learning_Experience" SortExpression="Learning_Experience" >
            <HeaderStyle HorizontalAlign="Left" Width="10%" />
            <ItemStyle Width="10%" />
            </asp:BoundField>
            <asp:CheckBoxField DataField="Professional_Competence" HeaderText="Professional Competence" 
                SortExpression="Professional_Competence" >
            <HeaderStyle Width="10%" />
            <ItemStyle Width="10%" HorizontalAlign="Center" />
            </asp:CheckBoxField>
            <asp:CheckBoxField DataField="Leadership" HeaderText="Leadership" 
                SortExpression="Leadership" >
            <HeaderStyle Width="10%" />
            <ItemStyle Width="10%" HorizontalAlign="Center" />
            </asp:CheckBoxField>
            <asp:CheckBoxField DataField="Communication" HeaderText="Communication" 
                SortExpression="Communication" >
            <HeaderStyle Width="10%" />
            <ItemStyle Width="10%" HorizontalAlign="Center" />
            </asp:CheckBoxField>
            <asp:CheckBoxField DataField="Creativity" HeaderText="Creativity" 
                SortExpression="Creativity" >
            <HeaderStyle Width="10%" />
            <ItemStyle Width="10%" HorizontalAlign="Center" />
            </asp:CheckBoxField>
            <asp:CheckBoxField DataField="Self_Development" HeaderText="Self Development" 
                SortExpression="Self_Development" >
            <HeaderStyle Width="10%" />
            <ItemStyle Width="10%" HorizontalAlign="Center" />
            </asp:CheckBoxField>
            <asp:CheckBoxField DataField="Social_Responsibility" HeaderText="Social Responsibility" 
                SortExpression="Social_Responsibility" >
            <HeaderStyle Width="10%" />
            <ItemStyle Width="10%" HorizontalAlign="Center" />
            </asp:CheckBoxField>
            <asp:CheckBoxField DataField="Language" HeaderText="Language" 
                SortExpression="Language" >
            <HeaderStyle Width="10%" />
            <ItemStyle Width="10%" HorizontalAlign="Center" />
            </asp:CheckBoxField>
            <asp:CheckBoxField DataField="IT_Application" HeaderText="IT Application" 
                SortExpression="IT_Application" >
            <HeaderStyle Width="10%" />
            <ItemStyle Width="10%" HorizontalAlign="Center" />
            </asp:CheckBoxField>
        </Columns>
            <HeaderStyle CssClass="GridViewHeaderStyle" ForeColor="White" />
            <PagerStyle CssClass="GridViewPagerStyle" />
            <RowStyle CssClass="GridViewRowStyle" />
            <SortedAscendingCellStyle CssClass="GridViewSortStyle" />
            <SortedAscendingHeaderStyle CssClass="GridViewSortHeaderStyle" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
        
                
                
        SelectCommand="SELECT Learning_Records_Experience.Learning_Experience,Learning_Records_Attribute.Professional_Competence,Learning_Records_Attribute.Leadership,Learning_Records_Attribute.Communication,Learning_Records_Attribute.Creativity,Learning_Records_Attribute.Self_Development,Learning_Records_Attribute.Social_Responsibility,Learning_Records_Attribute.Language,Learning_Records_Attribute.IT_Application FROM [Learning_Records_Attribute],[Learning_Records_Experience] where Learning_Records_Attribute.experience_id=Learning_Records_Experience.id">
    </asp:SqlDataSource>
    
       <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                SelectCommand="SELECT * FROM [userGroup] WHERE ([id] = @id)">
                <SelectParameters>
                    <asp:SessionParameter Name="id" SessionField="Role_Type" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        
     <asp:SqlDataSource ID="SqlDataSource4" runat="server"
     ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
            SelectCommand="SELECT * FROM [userGroup] WHERE ([id] = @id)">
            <SelectParameters>
                <asp:SessionParameter Name="id" SessionField="position" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
  </div>
  </td>
  </tr>
    </table>
    </form>
</body>
</html>
