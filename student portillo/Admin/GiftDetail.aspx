<%@ Page Language="VB" AutoEventWireup="false" CodeFile="GiftDetail.aspx.vb" Inherits="Operator_GiftDetail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    
        <link rel="stylesheet" href="../button.css" type="text/css" media="screen" />
  <link rel="stylesheet" href="../teachGrid.css" type="text/css" media="screen" />
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
           .style1
           {
               width: 100%;
               margin-top:-14px;
           }
           .style2
           {
               width: 124px;
           }
        #ImageButton2{
            width:10%;
        }

        </style>
</head>
<body background="../images/church.gif">
    <form id="form1" runat="server">
    <div>
    <br />


            <div style="text-align:center;padding-bottom:12px;max-width:1600px">
               <asp:ImageButton ID="ImageButton2" runat="server" onmouseover="this.src='../images/homeblue_hover.png'" onmouseout="this.src='../images/homeblue.png'" ImageUrl="~/images/homeblue.png" CausesValidation="False" /> 
    </div>


      <%--<asp:LinkButton ID="home" runat="server" CssClass="blue" 
                  style="margin-left: 515px" Font-Size="Large">Home</asp:LinkButton>--%>
                  <br />
                  <br />
              
      <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
           <table class="style1">
            <tr>
                <td class="style2">
                    <asp:Label ID="RegTime" runat="server" Text="Register Time:" Font-Size="Large"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="yearReg" runat="server" AutoPostBack="True" Height="25px">
                    </asp:DropDownList>
                    
                </td>
            </tr>
        </table>
        <br />
              <span class="stylefont">Gift Statistics</span>
                
              <br /><br />
              <asp:GridView ID="GridViewGift" runat="server" DataKeyNames="id"  
            AutoGenerateColumns="False" AllowPaging="True"
            Width="100%" PageSize="3" GridLines="Horizontal" 
            CssClass="GridViewStyle" AllowSorting="True" BorderStyle="None" 
                    EmptyDataText="There are no data records to display." >
            <Columns>
              <asp:TemplateField>
             </asp:TemplateField>
                <asp:BoundField DataField="id" HeaderText="Gift ID" SortExpression="id" />
                <asp:BoundField DataField="Gift" HeaderText="Gift" SortExpression="Gift" />
                <asp:BoundField DataField="total" HeaderText="Total Gift" SortExpression="total" />
                <asp:TemplateField HeaderText="Registered Gift" SortExpression="GiftReg">
                
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("GiftReg") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                                <asp:HyperLink ID="HyperLink1" runat="server" 
                                    NavigateUrl='<%# Eval("id", "GiftDetail.aspx?id={0}&view=1") & "&year=" & yearReg.SelectedValue %>'
                                    Text='<%# Eval("GiftReg") %>'></asp:HyperLink>
                                    <asp:HyperLink ID="linkpic1" runat="server" 
                                    ImageUrl="~/images/icons-png/view.png" 
                               NavigateUrl='<%# Eval("id", "GiftDetail.aspx?id={0}&view=1") & "&year=" & yearReg.SelectedValue %>'></asp:HyperLink> 
                                 </ItemTemplate>
                </asp:TemplateField>
             
                <asp:TemplateField HeaderText="Registered(Not Exchanged)" 
                    SortExpression="GiftRegNotExc">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("GiftRegNotExc") %>'></asp:TextBox>
                    </EditItemTemplate>
                     <ItemTemplate>
                        <asp:HyperLink ID="HyperLink3" runat="server" 
                         NavigateUrl='<%# Eval("id", "GiftDetail.aspx?id={0}&view=3") & "&year=" & yearReg.SelectedValue %>'
                            Text='<%# Eval("GiftRegNotExc") %>'></asp:HyperLink>
                        <asp:HyperLink ID="linkpic3" runat="server" 
                            ImageUrl="~/images/icons-png/view.png" 
                             NavigateUrl='<%# Eval("id", "GiftDetail.aspx?id={0}&view=3") & "&year=" & yearReg.SelectedValue %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Exchanged Gift" SortExpression="GiftExchange">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("GiftExchange") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink2" runat="server" 
                           NavigateUrl='<%# Eval("id", "GiftDetail.aspx?id={0}&view=2") & "&year=" & yearReg.SelectedValue %>'
                            Text='<%# Eval("GiftExchange") %>'></asp:HyperLink>
                        <asp:HyperLink ID="linkpic2" runat="server" 
                            ImageUrl="~/images/icons-png/view.png" 
                              NavigateUrl='<%# Eval("id", "GiftDetail.aspx?id={0}&view=2") & "&year=" & yearReg.SelectedValue %>'></asp:HyperLink> 
                    </ItemTemplate>
                </asp:TemplateField>
             
                <asp:BoundField DataField="quantity" HeaderText="Remaining Gift" 
                    SortExpression="quantity" />
                <asp:BoundField DataField="PerTotal" DataFormatString="{0:p}" 
                    HeaderText="Registered Ratio" SortExpression="PerTotal" />
                <asp:BoundField DataField="PerExchange" DataFormatString="{0:p}" 
                    HeaderText="Exchanged Ratio" SortExpression="PerExchange" />
                <asp:BoundField DataField="PerReg" DataFormatString="{0:p}" 
                    HeaderText="Registered(Not Exchanged) Ratio" SortExpression="PerReg" />
            </Columns>
            <HeaderStyle ForeColor="White" CssClass="GridViewHeaderStyle" Font-Size="Large" 
                      Height="40px" />
            <PagerStyle CssClass="GridViewPagerStyle" 
                HorizontalAlign="Center" />
            <RowStyle CssClass="GridViewRowStyle" Height="40px" HorizontalAlign="Left" />
            <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />

            <SelectedRowStyle CssClass="GridViewSelectRowStyle" />
        </asp:GridView>
            <asp:HiddenField ID="status" runat="server" />
            </asp:View>
            <asp:View ID="View2" runat="server">
            <span class="stylefont">Register Gift Record</span>
              <br /><br />
            <asp:GridView ID="GridViewRegister" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" BorderStyle="None" 
                    DataSourceID="studReg" GridLines="Horizontal" Width="100%" 
                    CssClass="GridViewStyle" 
                    EmptyDataText="There are no data records to display.">
                    <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                    <Columns>
                      <asp:TemplateField>
                     </asp:TemplateField>
                        <asp:BoundField DataField="STUDENT_ID" HeaderText="Student ID" 
                            SortExpression="STUDENT_ID">
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="NAME_CH" HeaderText="Chinese Name" 
                            SortExpression="NAME_CH">
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="NAME_PT" HeaderText="English Name" 
                            SortExpression="NAME_PT">
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="gift_quantity" HeaderText="Gift Quantity" 
                            SortExpression="gift_quantity">
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="register_time" HeaderText="Register Time"  
                            SortExpression="Register Time">
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                    </Columns>
                    <HeaderStyle CssClass="GridViewHeaderStyle" ForeColor="White" Font-Size="Large" 
                        Height="40px" />
                    <PagerStyle CssClass="GridViewPagerStyle" 
                        HorizontalAlign="Center" />
                    <RowStyle CssClass="GridViewRowStyle" Height="40px" HorizontalAlign="Left" />
                </asp:GridView>
                <asp:SqlDataSource ID="studReg" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                    
                    SelectCommand="SELECT student_academic_info.STUDENT_ID,student_academic_info.NAME_CH,student_academic_info.NAME_PT,gift.gift_quantity, gift.register_time, gift.exchange_time from student_academic_info, gift where student_academic_info.pess_cod=gift.pess_cod and gift.gift_id=@id and year(gift.register_time)=@year ">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="id" QueryStringField="id" />
                           <asp:QueryStringParameter Name="year" QueryStringField="year" />
                    </SelectParameters>
                </asp:SqlDataSource><br />
                <asp:Button ID="BackReg" runat="server" Text="Back" CssClass="blue" OnClientClick="JavaScript: window.history.back(1); return false;" />
            </asp:View>
            <asp:View ID="View3" runat="server">
                    <span class="stylefont">Exchange Gift Record</span>
              <br /><br />
           
                
                <asp:GridView ID="GridViewExchange" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" BorderStyle="None" 
                    DataSourceID="studExchange" GridLines="Horizontal" Width="100%" 
                        CssClass="GridViewStyle" 
                        EmptyDataText="There are no data records to display.">
                    <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                    <Columns>
                      <asp:TemplateField>
                     </asp:TemplateField>
                        <asp:BoundField DataField="STUDENT_ID" HeaderText="Student ID" 
                            SortExpression="STUDENT_ID">
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="NAME_CH" HeaderText="Chinese Name" 
                            SortExpression="NAME_CH">
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="NAME_PT" HeaderText="English Name" 
                            SortExpression="NAME_PT">
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="gift_quantity" HeaderText="Gift Quantity" 
                            SortExpression="gift_quantity">
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="register_time" HeaderText="Register Time"  
                            SortExpression="Register Time">
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="exchange_time" HeaderText="Exchange Time" 
                            SortExpression="exchange_time">
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                    </Columns>
                    <HeaderStyle CssClass="GridViewHeaderStyle" ForeColor="White" Font-Size="Large" 
                        Height="40px" />
                    <PagerStyle CssClass="GridViewPagerStyle" 
                        HorizontalAlign="Center" />
                    <RowStyle CssClass="GridViewRowStyle" Height="40px" HorizontalAlign="Left" />
                </asp:GridView>
                <asp:SqlDataSource ID="studExchange" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                    
                    SelectCommand="SELECT student_academic_info.STUDENT_ID,student_academic_info.NAME_CH,student_academic_info.NAME_PT,gift.gift_quantity, gift.register_time, gift.exchange_time from student_academic_info, gift where student_academic_info.pess_cod=gift.pess_cod and gift.gift_id=@id and gift.status=@status and year(gift.register_time)=@year">
                    <SelectParameters>
                       <asp:QueryStringParameter Name="id" QueryStringField="id" />
                               <asp:Parameter DefaultValue="Exchanged" Name="status" />
                                <asp:QueryStringParameter Name="year" QueryStringField="year" />
                    </SelectParameters>
                </asp:SqlDataSource><br />
                <asp:Button ID="BackExchange" runat="server" Text="Back" CssClass="blue" OnClientClick="JavaScript: window.history.back(1); return false;" />
        </asp:View>
        <asp:View ID="View4" runat="server">
        <span class="stylefont">Register Gift(Not Exchanged) Record</span>
              <br /><br />
        <asp:GridView ID="GridViewRegNotExc" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" BorderStyle="None" 
                    DataSourceID="studRegNotExc" GridLines="Horizontal" Width="100%" 
                CssClass="GridViewStyle" 
                EmptyDataText="There are no data records to display.">
                    <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                    <Columns>
                      <asp:TemplateField>
                     </asp:TemplateField>
                        <asp:BoundField DataField="STUDENT_ID" HeaderText="Student ID" 
                            SortExpression="STUDENT_ID">
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="NAME_CH" HeaderText="Chinese Name" 
                            SortExpression="NAME_CH">
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="NAME_PT" HeaderText="English Name" 
                            SortExpression="NAME_PT">
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="gift_quantity" HeaderText="Gift Quantity" 
                            SortExpression="gift_quantity">
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="register_time" HeaderText="Register Time"  
                            SortExpression="Register Time">
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                    </Columns>
                    <HeaderStyle CssClass="GridViewHeaderStyle" ForeColor="White" Font-Size="Large" 
                        Height="40px" />
                    <PagerStyle CssClass="GridViewPagerStyle" 
                        HorizontalAlign="Center" />
                    <RowStyle CssClass="GridViewRowStyle" Height="40px" HorizontalAlign="Left" />
                </asp:GridView>
                <br />
                <asp:Button ID="BackRegExc" runat="server" Text="Back" CssClass="blue" OnClientClick="JavaScript: window.history.back(1); return false;" />
                <asp:SqlDataSource ID="studRegNotExc" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                    
                    
                SelectCommand="SELECT student_academic_info.STUDENT_ID,student_academic_info.NAME_CH,student_academic_info.NAME_PT,gift.gift_quantity, gift.register_time, gift.exchange_time from student_academic_info, gift where student_academic_info.pess_cod=gift.pess_cod and gift.gift_id=@id and gift.status=@status and year(gift.register_time)=@year ">
                    <SelectParameters>
                       <asp:QueryStringParameter Name="id" QueryStringField="id" />
                               <asp:Parameter DefaultValue="Registered" Name="status" />
                         <asp:QueryStringParameter Name="year" QueryStringField="year" />
                    </SelectParameters>
                </asp:SqlDataSource>
            
        </asp:View>
        </asp:MultiView>
  
    </div>
   
    </form>
</body>
</html>


