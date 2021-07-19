<%@ Page Language="VB" AutoEventWireup="false" CodeFile="GiftExchange.aspx.vb" Inherits="Operator_GiftExchange" %>

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
        .style1
        {
            width: 81%;
        }

        .style2
        {
            font-family: "Berlin Sans FB";
            font-size: xx-large;
            margin-top:30px;
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
            font-size: x-large;
            
        }

        #ImageButton2{
            width:14%;
        }


           .style10
           {
               width: 585px;
           }


           .style11
           {
               width: 157px;
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
    function DelMessage() {
        var selectedvalue = confirm("Are you sure you want to delete it?");
        if (selectedvalue) {
            document.getElementById('<%=delmsg.ClientID %>').value = "Yes";
        } else {
            document.getElementById('<%=delmsg.ClientID %>').value = "No";
        }
    }

   
 
    </script>
  
    <form id="form1" runat="server">
    <div>
         

            <div class="style2">Gift Exchange</div>
    <div style="text-align:center;margin-top:-42px;padding-bottom:12px;width:1005px">
               <asp:ImageButton ID="ImageButton2" runat="server" onmouseover="this.src='../images/homeblue_hover.png'" onmouseout="this.src='../images/homeblue.png'" ImageUrl="~/images/homeblue.png" CausesValidation="False" /> 
    </div>

       <%-- <asp:Button ID="home" runat="server" Text="Home" 
            style="font-size:Large; margin-left:545px;" CssClass="blue"/>--%>
        <br />
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
             
              <br /><br />
               <table class="style10">
                    <tr>
                        <td class="style15">
                            <asp:Label ID="Label15" runat="server" Font-Size="Large" 
                                Text="Student ID/Chinese Name/Student Library Number :"></asp:Label>
                        </td>
                        <td class="style11">
                            <asp:TextBox ID="searchTxt" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style15">
                            &nbsp;</td>
                        <td class="style11">
                            <asp:Button ID="Search" runat="server" CssClass="blue" OnClick="Search_Click" 
                                Text="Search" />
                        </td>
                    </tr>
                </table>
                <br /> <br />
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
                        <asp:TemplateField HeaderText="Earned Credit">
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLink1" runat="server" 
                                    NavigateUrl='<%# Eval("pess_cod", "GiftExchange.aspx?pesscod={0}&view=1") %>' 
                                    Text='<%# Eval("Total_Point") %>'></asp:HyperLink>
                                    <asp:HyperLink ID="linkpic1" runat="server" 
                                    ImageUrl="~/images/icons-png/view.png" 
                                      NavigateUrl='<%# Eval("pess_cod", "GiftExchange.aspx?pesscod={0}&view=1") %>'></asp:HyperLink> 
                          
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Used Credit">
                              <ItemTemplate>
                                <asp:HyperLink ID="HyperLink2" runat="server" 
                                    NavigateUrl='<%# Eval("pess_cod", "GiftExchange.aspx?pesscod={0}&view=2") %>' 
                                    Text='<%# Eval("used_credit") %>'></asp:HyperLink>
                                      <asp:HyperLink ID="linkpic2" runat="server" 
                                    ImageUrl="~/images/icons-png/view.png" 
                                    NavigateUrl='<%# Eval("pess_cod", "GiftExchange.aspx?pesscod={0}&view=2") %>'></asp:HyperLink> 
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                            </EditItemTemplate>
                              <HeaderStyle HorizontalAlign="Left" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Available Credit">
                           <ItemTemplate>
                                  <asp:HyperLink ID="HyperLink3" runat="server" 
                                    NavigateUrl='<%# Eval("pess_cod", "GiftExchange.aspx?pesscod={0}&view=3") %>' 
                                    Text='<%# Eval("valid_credit") %>'></asp:HyperLink>
                       
                                 
                                <asp:HyperLink ID="linkpic3" runat="server"   ImageUrl="~/images/icons-png/cart.png" 
                                     NavigateUrl='<%# Eval("pess_cod", "GiftExchange.aspx?pesscod={0}&view=3") %>'></asp:HyperLink> 
                       
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle CssClass="GridViewHeaderStyle" Font-Size="Large" ForeColor="White" 
                                  Height="40px" />
                    <PagerStyle HorizontalAlign="Center" CssClass="GridViewPagerStyle" />
                    <RowStyle CssClass="GridViewRowStyle" Height="40px" HorizontalAlign="Left" />
                </asp:GridView><br />
                <asp:Button ID="searchBack" runat="server" Text="Back" CssClass="blue" 
                    Visible="False" />
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
                <span class="style9">Earned Credit</span><br /><br />
                  <asp:Label ID="Label2" runat="server" Text="Student ID:" 
                            ForeColor="Black" style="font-size:larger;margin-left:0px;" 
                    Font-Bold="True"  ></asp:Label>&nbsp
            <asp:Label ID="studID" runat="server"></asp:Label>
                <br />  <br /> 
                <asp:Label ID="Label7" runat="server" Text="Chinese Name:" 
                            style="font-size:larger;margin-left:0px;" Font-Bold="True" 
                    ForeColor="Black"  ></asp:Label>&nbsp
            <asp:Label ID="chname" runat="server"></asp:Label>
                <br /> <br />
                   <asp:Label ID="Label11" runat="server" Text="English Name:" 
                            style="font-size:larger;margin-left:0px;" Font-Bold="True" 
                    ForeColor="Black"  ></asp:Label>&nbsp
            <asp:Label ID="pnname" runat="server"></asp:Label>
                <br /> <br />
                               
                <asp:GridView ID="GridViewSeminar" runat="server" AutoGenerateColumns="False" 
                    BorderStyle="None" DataKeyNames="id,pess_cod,bonus_point" GridLines="Horizontal" 
                    Width="100%" CssClass="GridViewStyle" AllowPaging="True" 
                    EmptyDataText="There are no data records to display.">
                    <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                    <Columns>
                    <asp:TemplateField>
                    </asp:TemplateField>
                        <asp:BoundField DataField="startDate" HeaderText="Date" >
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="topicName" HeaderText="Topic" >
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="category" HeaderText="Category" >
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="duration" HeaderText="Duration(Hours)" >
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="organizer" HeaderText="Organization" >
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="bonus_point" HeaderText="Bonus Point" >
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                             <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                    CommandName="Delete" OnClientClick="DelMessage();" Text="Delete"></asp:LinkButton>
                             
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle CssClass="GridViewHeaderStyle" Font-Size="Large" ForeColor="White" 
                        Height="40px" />
                    <PagerStyle HorizontalAlign="Center" CssClass="GridViewPagerStyle" />
                    <RowStyle CssClass="GridViewRowStyle" Height="40px" HorizontalAlign="Left" />
                </asp:GridView>
                               
                <br />
                <br />
                  
                  <asp:Label ID="Label5" runat="server" Text="Total Bonus Point:" 
                            ForeColor="Blue" style="font-size:larger;margin-left:1000px;"  ></asp:Label>
            <asp:Label ID="TotalSem" runat="server" Font-Size="Larger" ForeColor="Red"></asp:Label>
                <br />
                <asp:Button ID="EarnedBack" runat="server" Text="Back" CssClass="blue" />
            </asp:View>

            <asp:View ID="View3" runat="server">
            <span class="style9">Used Credit</span><br /><br />

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
                        <asp:BoundField DataField="status" HeaderText="Status">
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="exchange_time" HeaderText="Exchange Time">
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
                                <asp:LinkButton ID="DelGift" runat="server" CausesValidation="False" 
                                    CommandName="Delete" OnClientClick="DelFun();" Text="Delete"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle CssClass="GridViewHeaderStyle" Font-Size="Large" ForeColor="White" 
                        Height="40px" />
                    <PagerStyle HorizontalAlign="Center" CssClass="GridViewPagerStyle" />
                    <RowStyle CssClass="GridViewRowStyle" Height="40px" HorizontalAlign="Left" />
                </asp:GridView>
                 
                 
                
                <br />
                 <br />
                  <asp:Label ID="Label6" runat="server" Text="Total Used Credit:" 
                            ForeColor="Blue" style="font-size:larger;margin-left:1000px;"  ></asp:Label>
            <asp:Label ID="TotalUsed" runat="server" Font-Size="Larger" ForeColor="Red"></asp:Label>
                <br />
                <asp:Button ID="UsedBack" runat="server" Text="Back" CssClass="blue" />
            </asp:View>

            <asp:View ID="View4" runat="server">
                <asp:SqlDataSource ID="CartSrc" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                    SelectCommand="SELECT * FROM [gift_info] WHERE ([active] = @active)">
                     <SelectParameters>
                        <asp:Parameter DefaultValue="True" Name="active" />
                    </SelectParameters>
                    </asp:SqlDataSource>
                      <span class="style9">Available Credit</span><br /><br />
                
                <asp:HiddenField ID="id" runat="server" />

              
                <asp:HiddenField ID="time" runat="server" />
                
                <asp:HiddenField ID="maxExchange" runat="server" />
                
                <asp:GridView ID="GridViewCart" runat="server" AutoGenerateColumns="False" 
                    BorderStyle="None" DataKeyNames="id,update_time" GridLines="Horizontal" 
                    Width="100%" CssClass="GridViewStyle" AllowPaging="True" 
                    EmptyDataText="There are no data records to display.">
                    <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                    <Columns>
                    <asp:TemplateField>
                    </asp:TemplateField>
                        <asp:BoundField HeaderText="Gift ID" DataField="id" >
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Gift Image">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageBtn" runat="server" Height="50px" 
                                    ImageUrl='<%# Bind("image") %>' onclick="ImageBtn_Click" Width="50px" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("image") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="Gift Title" DataField="title" >
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="Gift Description" DataField="detail" >
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="Quantity" DataField="quantity" >
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="Gift Credit" DataField="credit" >
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:ButtonField ButtonType="Button" CommandName="Select" 
                            HeaderText="Add To Cart" ShowHeader="True" Text="add">
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:ButtonField>
                        
                        <asp:BoundField DataField="update_time" 
                            DataFormatString="{0:yyyy-MM-dd HH:mm:ss.fff}" HeaderText="Update Time" 
                            Visible="False" />
                    </Columns>
                    <HeaderStyle CssClass="GridViewHeaderStyle" Font-Size="Large" ForeColor="White" 
                        Height="40px" />
                    <PagerStyle HorizontalAlign="Center" CssClass="GridViewPagerStyle" />
                    <RowStyle CssClass="GridViewRowStyle" Height="40px" HorizontalAlign="Left" />
                </asp:GridView>

                <br />
              
                <asp:Label ID="Label8" runat="server" Text="Available Credit:" 
                            ForeColor="Blue" style="font-size:larger;margin-left:1000px;"  ></asp:Label>
            <asp:Label ID="validCredit" runat="server" Font-Size="Larger" ForeColor="Red"></asp:Label>
          

                <asp:Panel ID="Panel2" runat="server" BackColor="White" Width="781px" 
                    Height="631px" HorizontalAlign="Center">
                <asp:Label ID="Label3" runat="server" BackColor="#333333" ForeColor="White" 
                           Width="100%" Height="32px">
              
                     <asp:ImageButton ID="ImageButton3" runat="server" style="margin-left:750px;"
                        ImageUrl="~/images/icons-png/close.png" />
                            
                            </asp:Label>
                  
                      
                    <asp:Image ID="pic"  style="margin-left:0px;" runat="server" />
                     <br />
                 
               
                     
                   
                </asp:Panel>
                    <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" 
                        BackgroundCssClass="cssModalBackground" OkControlID="ImageButton3" 
                        PopupControlID="Panel2" PopupDragHandleControlID="Label2" 
                        TargetControlID="Button7"></cc1:ModalPopupExtender>
                    <asp:Button ID="Button7" runat="server" style="display:none" Text="Button" />
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
           
    
   <br /> <br />
    <asp:Button ID="CartBack" runat="server" CssClass="blue" Text="Back" />
                
        </asp:View>
           
            <asp:View ID="View5" runat="server">
                     <span class="style9">Gift Exchange</span><br /><br />
                <asp:DetailsView ID="DetailsViewExchange" runat="server" AutoGenerateRows="False" 
                    DataKeyNames="id" DataSourceID="GiftExchangeSrc" Height="50px" 
                    Width="1000px" GridLines="Horizontal" BorderStyle="None" 
                         CssClass="GridViewStyle">
                    <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle2" />
                    <Fields>
                        <asp:BoundField DataField="id" HeaderText="Gift ID" InsertVisible="False" 
                            ReadOnly="True" SortExpression="id" />
                        <asp:TemplateField HeaderText="Gift Image" SortExpression="image">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("image") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("image") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Image ID="Image2" runat="server" Height="50px" 
                                    ImageUrl='<%# Bind("image") %>' Width="50px" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="title" HeaderText="Gift Title" 
                            SortExpression="title" />
                        <asp:BoundField DataField="detail" HeaderText="Gift Describtion" 
                            SortExpression="detail" />
                        <asp:BoundField DataField="quantity" HeaderText="Quantity" 
                            SortExpression="quantity" />
                        <asp:BoundField DataField="credit" HeaderText="Gift Credit" 
                            SortExpression="credit" />
                    </Fields>
                    <RowStyle CssClass="GridViewRowStyle2" Height="40px" />
                </asp:DetailsView>
                <asp:SqlDataSource ID="GiftExchangeSrc" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                    SelectCommand="SELECT * FROM [gift_info] WHERE ([id] = @id)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewCart" Name="id" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                   <asp:SqlDataSource ID="timeSrc" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                    SelectCommand="SELECT * FROM [gift_info]"></asp:SqlDataSource>
                   <br />
                   <table class="style1">
        <tr>
            <td class="style7">
                <asp:Label ID="Label1" runat="server" Text="Gift Exchange Quantity:" 
                    Font-Bold="True" Font-Size="Large"></asp:Label>
                
            </td>
            <td class="style8">
                <asp:DropDownList ID="giftCount" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style6">
                <asp:Button ID="ExchangeBack" runat="server" CssClass="blue" Text="Back" />
            </td>
            <td>
                <asp:Button ID="ExchangeBtn" runat="server" CssClass="blue" OnClientClick="ConfirmMessage();"
                    Text="Confirm To Exchange" />
            </td>
        </tr>
    </table>
            </asp:View>
            <asp:View ID="View6" runat="server">
            <span class="style9">Delete Gift</span><br /><br />
            <asp:DetailsView ID="DetailsViewGift" runat="server" AutoGenerateRows="False" 
                    DataKeyNames="id" DataSourceID="giftInfo" Height="50px" 
                    Width="1000px" GridLines="Horizontal" BorderStyle="None" 
                    CssClass="GridViewStyle">
                    <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle2" />
                    <Fields>
                        <asp:BoundField DataField="id" HeaderText="Gift ID" InsertVisible="False" 
                            ReadOnly="True" SortExpression="id" />
                        <asp:TemplateField HeaderText="Gift Image" SortExpression="image">
                            <ItemTemplate>
                                <asp:Image ID="Image3" runat="server" ImageUrl='<%# Eval("image") %>' 
                                    Height="50px" Width="50px" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("image") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("image") %>'></asp:TextBox>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="title" HeaderText="Gift Title" 
                            SortExpression="title" />
                        <asp:BoundField DataField="detail" HeaderText="Gift Describtion" 
                            SortExpression="detail" />
                        <asp:BoundField DataField="credit" HeaderText="Gift Credit" 
                            SortExpression="credit" />
                    </Fields>
                    <RowStyle CssClass="GridViewRowStyle2" Height="40px" />
                </asp:DetailsView>
                <asp:SqlDataSource ID="giftInfo" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                    SelectCommand="SELECT * FROM [gift_info] WHERE ([id] = @id)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="giftID" Name="id" PropertyName="Value" 
                            Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />

                  <table class="style1">
        <tr>
            <td class="style7">
                <asp:Label ID="Label16" runat="server" Text="Quantity:" 
                    Font-Bold="True" Font-Size="Large"></asp:Label>
                
            </td>
            <td class="style8">
                 <asp:DropDownList ID="giftCountDel" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style6">
                <asp:Button ID="giftDelBack" runat="server" CssClass="blue" Text="Back" />
            </td>
            <td>
               <asp:Button ID="DelBtn" runat="server" OnClientClick="DelMessage();" Text="Delete" CssClass="blue" />
            </td>
        </tr>
    </table>


              
                <asp:HiddenField ID="giftTime" runat="server" />
                <asp:HiddenField ID="exchangeID" runat="server" />
                <asp:HiddenField ID="giftID" runat="server" />
                <asp:HiddenField ID="gift_quantity" runat="server" />
            </asp:View>
            
        </asp:MultiView>
      <asp:hiddenfield ID="message" runat="server"></asp:hiddenfield>
        <asp:hiddenfield ID="delmsg" runat="server"></asp:hiddenfield>
         <asp:hiddenfield ID="HiddenText" runat="server"></asp:hiddenfield>
    </div>
    </form>
</body>
</html>

