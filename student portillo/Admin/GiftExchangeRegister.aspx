<%@ Page Language="VB" AutoEventWireup="false" CodeFile="GiftExchangeRegister.aspx.vb" Inherits="Operator_GiftExchangeRegister" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
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

        .style2
        {
            font-family: "Berlin Sans FB";
            font-size: xx-large;
        }

          .style9
        {
            font-family: "Berlin Sans FB";
            font-size: x-large;
        }
           .style10
           {
               width: 100%;
           }
           .style12
           {
               width: 858px;
           }
           #ImageButton2{
            width:11%;
        }


           .style14
           {
               width: 417px;
           }
           .style15
           {
               width: 406px;
           }


        </style>

</head>
<body background="../images/church.gif">
<script type="text/javascript">
    function ConfirmMessage() {
        var selectedvalue = confirm("Confirm To Exchange?");
        if (selectedvalue) {
            document.getElementById('<%=message.ClientID %>').value = "Yes";
        } else {
            document.getElementById('<%=message.ClientID %>').value = "No";
        }
    }

 
    </script>
  
    <form id="form1" runat="server">
    <div>
         
            <div class="style2">Gift Exchange For Registered Student</div>
    <div style="text-align:center;margin-top:-32px;padding-bottom:12px;max-width:1400px">
               <asp:ImageButton ID="ImageButton2" runat="server" onmouseover="this.src='../images/homeblue_hover.png'" onmouseout="this.src='../images/homeblue.png'" ImageUrl="~/images/homeblue.png" CausesValidation="False" /> 
    </div>



        <%--<asp:Button ID="home" runat="server" Text="Home" 
            style="font-size:Large; margin-left:545px;" CssClass="blue"/>--%>
        <br />
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
             <%--<span class="style9">Gift Exchange For Registered Student</span>--%>
              <br /><br />
                <br /> <br />
                <table class="style10">
                    <tr>
                        <td class="style15">
                            <asp:Label ID="Label15" runat="server" Font-Size="Large" 
                                Text="Student ID/Chinese Name/Student Library Number :"></asp:Label>
                        </td>
                        <td class="style12">
                            <asp:TextBox ID="searchTxt" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style15">
                            &nbsp;</td>
                        <td class="style12">
                            <asp:Button ID="Search" runat="server" CssClass="blue" OnClick="Search_Click" 
                                Text="Search" />
                        </td>
                    </tr>
                </table>
                <br />
                  
                          <asp:GridView ID="GridViewSearch" runat="server" AutoGenerateColumns="False" 
                    GridLines="Horizontal" BorderStyle="None" CssClass="GridViewStyle" 
                    Width="100%" EmptyDataText="There are no data records to display.">
                    <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                    <Columns>
                     <asp:TemplateField>
                     </asp:TemplateField>
                        <asp:BoundField DataField="STUDENT_ID" HeaderText="Student ID" >
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="NAME_CH" HeaderText="Chinese Name" >
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="NAME_PT" HeaderText="English Name" >
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Register Credit">
                              <ItemTemplate>
                                <asp:HyperLink ID="HyperLink2" runat="server" 
                                    NavigateUrl='<%# Eval("pess_cod", "GiftExchangeRegister.aspx?pesscod={0}&view=1") %>' 
                                    Text='<%# Eval("used_credit") %>'></asp:HyperLink>
                                      <asp:HyperLink ID="linkpic2" runat="server" 
                                    ImageUrl="~/images/icons-png/view.png" 
                                    NavigateUrl='<%# Eval("pess_cod", "GiftExchangeRegister.aspx?pesscod={0}&view=1") %>'></asp:HyperLink> 
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                            </EditItemTemplate>
                              <HeaderStyle HorizontalAlign="Left" />
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle CssClass="GridViewHeaderStyle" Font-Size="Large" ForeColor="White" 
                                  Height="40px" />
                    <PagerStyle HorizontalAlign="Center" CssClass="GridViewPagerStyle" />
                    <RowStyle CssClass="GridViewRowStyle" Height="40px" HorizontalAlign="Left" />
                </asp:GridView><br />
                <asp:SqlDataSource ID="giftExchange" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                    SelectCommand="select record.STUDENT_ID,record.NAME_CH,record.NAME_PT,record.pess_cod,record.Total_Point,sum(record.used_credit)as used_credit, (record.Total_Point-sum(record.used_credit))as valid_credit from
(select student_academic_info.STUDENT_ID,student_academic_info.NAME_CH,student_academic_info.NAME_PT,student_academic_info.pess_cod,temp.Total_Point, ISNULL((gift_info.credit*gift_quantity),0)as used_credit,(temp.Total_Point-ISNULL((gift_info.credit*gift_quantity),0))as valid_credit,gift.exchange_time from student_academic_info left join gift on student_academic_info.PESS_COD=gift.pess_cod left join gift_info on gift_info.id=gift.gift_id inner join Seminar on student_academic_info.PESS_COD=Seminar.pess_cod 
left join
(select Seminar.pess_cod, SUM(Seminar_Info.bonus_point) as Total_Point from Seminar,Seminar_Info,student_academic_info 
 where Seminar.Seminar_info_id=Seminar_Info.id 
 and student_academic_info.PESS_COD=Seminar.pess_cod 
group by Seminar.pess_cod)as temp on student_academic_info.pess_cod=temp.pess_cod
group by student_academic_info.pess_cod,temp.Total_Point,student_academic_info.STUDENT_ID,student_academic_info.NAME_CH,student_academic_info.NAME_PT,gift_info.credit,gift.gift_quantity,gift.exchange_time)as record
group by record.STUDENT_ID,record.NAME_CH,record.NAME_PT,record.pess_cod,record.Total_Point">
                </asp:SqlDataSource>
             <asp:SqlDataSource ID="AccessTime" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                    SelectCommand="SELECT * FROM [giftAccessTime]"></asp:SqlDataSource>
   
            </asp:View>

            

            <asp:View ID="View2" runat="server">
            <span class="style9">Register Credit</span><br /><br />

             <asp:Label ID="Label10" runat="server" Text="Student ID:" 
                            ForeColor="Black" style="font-size:larger;margin-left:0px;" 
                    Font-Bold="True"  ></asp:Label>&nbsp
            <asp:Label ID="stuID" runat="server"></asp:Label>
                <br />  <br /> 
                <asp:Label ID="Label12" runat="server" Text="Chinese Name:" 
                            style="font-size:larger;margin-left:0px;" Font-Bold="True" 
                    ForeColor="Black"  ></asp:Label>&nbsp
            <asp:Label ID="cname" runat="server"></asp:Label>
                <br /> <br />
                   <asp:Label ID="Label14" runat="server" Text="English Name:" 
                            style="font-size:larger;margin-left:0px;" Font-Bold="True" 
                    ForeColor="Black"  ></asp:Label>&nbsp
            <asp:Label ID="pname" runat="server"></asp:Label>
                <br /> <br />
                <asp:GridView ID="GridViewGift" runat="server" AutoGenerateColumns="False" 
                    BorderStyle="None" GridLines="Horizontal" Width="100%" 
                    DataKeyNames="exchangeID,gift_quantity,giftID,update_time" 
                    CssClass="GridViewStyle" AllowPaging="True" 
                    EmptyDataText="There are no data records to display.">
                    <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                    <Columns>
                     <asp:TemplateField>
                    </asp:TemplateField>
                        <asp:BoundField DataField="giftID" HeaderText="Gift ID">
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Exchange ID" Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="ExchangeStuID" runat="server" Text='<%# Bind("exchangeID") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("exchangeID") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="title" HeaderText="Gift Title">
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="detail" HeaderText="Gift Describtion">
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="credit" HeaderText="Exchange Used Credit">
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="gift_quantity" HeaderText="Quantity">
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Update Time" SortExpression="update_time" 
                Visible="False">
                <EditItemTemplate>
                    <asp:Label ID="time_edit" runat="server" 
                        Text='<%# Bind("update_time", "{0:yyyy-MM-dd HH:mm:ss.fff}") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="time_show" runat="server" 
                        Text='<%# Bind("update_time", "{0:yyyy-MM-dd HH:mm:ss.fff}") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
            </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="exchange" runat="server" CausesValidation="False" 
                                    CommandName="Exchange" OnClientClick="ConfirmMessage();" Text="Exchange"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle CssClass="GridViewHeaderStyle" />
                    <PagerStyle HorizontalAlign="Center" CssClass="GridViewPagerStyle" />
                    <RowStyle CssClass="GridViewRowStyle" Height="40px" HorizontalAlign="Left" />
                </asp:GridView>
                 
                 
                
                <br />
                 <br />
                  <asp:Label ID="Label6" runat="server" Text="Total Register Credit:" 
                            ForeColor="Blue" style="font-size:larger;margin-left:1000px;"  ></asp:Label>
            <asp:Label ID="TotalUsed" runat="server"></asp:Label>
                <br />
                <asp:Button ID="UsedBack" runat="server" Text="Back" CssClass="blue" />
            </asp:View>
            
            </asp:MultiView>
      <asp:hiddenfield ID="message" runat="server"></asp:hiddenfield>
        <asp:HiddenField ID="time" runat="server" />
     <asp:hiddenfield ID="HiddenText" runat="server"></asp:hiddenfield>
      
         <asp:HiddenField ID="exchangeID" runat="server" />
    </div>
    </form>
</body>
</html>