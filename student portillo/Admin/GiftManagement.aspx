<%@ Page Language="VB" AutoEventWireup="false" EnableEventValidation = "false" CodeFile="GiftManagement.aspx.vb" Inherits="Operator_GiftManagement" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>

<link rel="stylesheet" href="../button.css" type="text/css" media="screen" />
<link rel="stylesheet" href="../teachGrid.css" type="text/css" media="screen" />
 <link rel="stylesheet" href="../grid.css" type="text/css" media="screen" />  
    <script type="text/javascript">

        $(document).ready(function () {
            $(".Calender").dynDateTime({
                showsTime: true,
                ifFormat: "%Y/%m/%d %H:%M",
                daFormat: "%l;%M %p, %e %m,  %Y",
                align: "BR",
                electric: false,
                singleClick: false,
                displayArea: ".siblings('.dtcDisplayArea')",
                button: ".next()"
            });
        });
    </script>
     
  
    <style type="text/css">
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
           .style8
        {
            font-family: "Berlin Sans FB";
            font-size: xx-large;
        }

        #ImageButton2{
            width:9%;
        }

        .style9
        {
            height: 26px;
        }
      
        .box input{    
         width: 25px;    
         height: 25px;
    }

        </style>


</head>
<body background="../images/church.gif">
<script type="text/javascript">
    function ConfirmMessage() {
        var selectedvalue = confirm("Are you sure you want to delete it?");
        if (selectedvalue) {
            document.getElementById('<%=message.ClientID %>').value = "Yes";
        } else {
            document.getElementById('<%=message.ClientID %>').value = "No";
        }
    }
    </script>
    <form id="form1" runat="server">
    <div>

    <div class="style8">Gift Management</div>
    <div style="text-align:center;margin-top:-32px;padding-bottom:12px;max-width:1680px">
               <asp:ImageButton ID="ImageButton2" runat="server" onmouseover="this.src='../images/homeblue_hover.png'" onmouseout="this.src='../images/homeblue.png'" ImageUrl="~/images/homeblue.png" CausesValidation="False" /> 
    </div>


  <%--       <span class="style8">Gift Management</span>
        <asp:LinkButton ID="home" runat="server" CssClass="blue" 
                  style="margin-left: 328px" Font-Size="Large">Home</asp:LinkButton>
                  <br />--%>
                  <br />
       
        <br />
    </div>
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">
            <asp:Button ID="addGift" runat="server" CssClass="blue" Text="Add Gift" />
            <br />
            <br />
            <asp:GridView ID="GridViewGift" runat="server" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False" BorderStyle="None" 
                DataKeyNames="id" DataSourceID="GiftInfo" 
                EmptyDataText="There are no data records to display." GridLines="Horizontal" 
                Height="40px"  style="margin-right: 0px" Width="1250px" 
                CssClass="GridViewStyle">
                <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                <Columns>
                      <asp:TemplateField></asp:TemplateField>
                  
                    <asp:BoundField DataField="id" HeaderText="ID" ReadOnly="True" 
                        SortExpression="id">
                    <HeaderStyle HorizontalAlign="Left" />
                    <ItemStyle Width="5%" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Gift Image" SortExpression="image">
                        <EditItemTemplate>
                            <asp:FileUpload ID="FileUpload_edit" runat="server" />
                            <br />
                            <asp:Label ID="image" runat="server" Text='<%# Eval("image") %>' 
                                Visible="False"></asp:Label>
                        </EditItemTemplate>
                  
                        <ItemTemplate>
                            <asp:ImageButton ID="pic" runat="server" Height="50px" 
                                ImageUrl='<%# Eval("image") %>' onclick="pic_Click" Width="50px" />
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Gift Title" SortExpression="title">
                        <EditItemTemplate>
                            <asp:TextBox ID="title" runat="server" Text='<%# Bind("title") %>'></asp:TextBox>
                        </EditItemTemplate>
                     
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("title") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Gift Describtion" SortExpression="detail">
                        <EditItemTemplate>
                            <asp:TextBox ID="detail" runat="server" Text='<%# Bind("detail") %>' 
                                Height="123px" TextMode="MultiLine" Width="245px"></asp:TextBox>
                        </EditItemTemplate>
                      
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("detail") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Quantity" SortExpression="quantity">
                        <EditItemTemplate>
                            <asp:TextBox ID="quantity" runat="server" Text='<%# Bind("quantity") %>' 
                                Width="36px"></asp:TextBox>
                        </EditItemTemplate>
                     
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("quantity") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Gift Credit" SortExpression="credit">
                        <EditItemTemplate>
                            <asp:TextBox ID="credit" runat="server" Text='<%# Bind("credit") %>' 
                                Width="36px"></asp:TextBox>
                        </EditItemTemplate>
                    
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("credit") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Max Exchange" SortExpression="max_exchange">
                        <EditItemTemplate>
                            <asp:TextBox ID="maxExchange" runat="server" Text='<%# Bind("max_exchange") %>' 
                                Width="36px"></asp:TextBox>
                        </EditItemTemplate>
                    
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("max_exchange") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Active" SortExpression="active">
                        <EditItemTemplate>
                            <asp:CheckBox ID="active" runat="server" Checked='<%# Bind("active") %>' />
                        </EditItemTemplate>
                    
                        <ItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("active") %>' 
                                Enabled="false" />
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Update Time" SortExpression="update_time" 
                        Visible="False">
                        <EditItemTemplate>
                            <asp:Label ID="time_edit" runat="server" 
                                Text='<%# Bind("update_time", "{0:yyyy-MM-dd HH:mm:ss.fff}") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="time" runat="server" 
                                Text='<%# Bind("update_time", "{0:yyyy-MM-dd HH:mm:ss.fff}") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ID="update" runat="server" CausesValidation="True" 
                                CommandName="Update" Text="Update"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="cancel" runat="server" CausesValidation="False" 
                                CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                        </EditItemTemplate>
                      
                        <ItemTemplate>
                            <asp:LinkButton ID="edit" runat="server" CausesValidation="False" 
                                CommandName="Edit" Text="Edit"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="delete" runat="server" CausesValidation="False" 
                                CommandName="Delete" OnClientClick="ConfirmMessage();" Text="Delete"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
              <FooterStyle BackColor="White" Height="40px" />
                <HeaderStyle CssClass="GridViewHeaderStyle" ForeColor="White" Font-Size="Large" 
                    Height="40px" />
                <PagerStyle HorizontalAlign="Center" CssClass="GridViewPagerStyle" />
                <RowStyle CssClass="GridViewRowStyle" Height="40px" HorizontalAlign="Left" />
            </asp:GridView>
            <asp:SqlDataSource ID="GiftInfo" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
        DeleteCommand="DELETE FROM [gift_info] WHERE [id] = @id" 
        InsertCommand="INSERT INTO [gift_info] ([image], [title], [detail], [quantity], [credit], [active], [max_exchange], [update_time]) VALUES (@image, @title, @detail, @quantity, @credit, @active, @max_exchange, GETDATE())" 
        SelectCommand="SELECT [id], ISNULL(image,'~/Executive/image/noImage.jpg') as image, [title], [detail], [quantity], [credit], [active], [max_exchange], [update_time] FROM [gift_info]  order by id desc" 
        
        
        
        UpdateCommand="UPDATE [gift_info] SET [image] = @image, [title] = @title, [detail] = @detail, [quantity] = @quantity, [credit] = @credit, [active] = @active, [max_exchange]=@max_exchange, [update_time]=GETDATE() WHERE [id] = @id">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
           
        </DeleteParameters>

        <InsertParameters>
            <asp:Parameter Name="image" Type="String" />
            <asp:Parameter Name="title" Type="String" />
            <asp:Parameter Name="detail" Type="String" />
            <asp:Parameter Name="quantity" Type="Int32" />
            <asp:Parameter Name="credit" Type="Int32" />
            <asp:Parameter Name="active" Type="Boolean" />
            <asp:Parameter Name="max_exchange" Type="Int32" />
         
        </InsertParameters>
     
        <UpdateParameters>
            <asp:Parameter Name="image" Type="String" />
            <asp:Parameter Name="title" Type="String" />
            <asp:Parameter Name="detail" Type="String" />
            <asp:Parameter Name="quantity" Type="Int32" />
            <asp:Parameter Name="credit" Type="Int32" />
            <asp:Parameter Name="active" Type="Boolean" />
            <asp:Parameter Name="max_exchange" Type="Int32" />
            <asp:Parameter Name="id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
	
	<asp:SqlDataSource ID="GiftImage" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                SelectCommand="SELECT * FROM [gift_info]"></asp:SqlDataSource>
	
	
      <asp:Label ID="success" runat="server" ForeColor="Blue" Font-Size="X-Large"></asp:Label>
        <br />
        <asp:Label ID="fail" runat="server" ForeColor="Red" Font-Size="X-Large"></asp:Label>
        <br />
          <asp:Panel ID="Panel2" runat="server" BackColor="White" Width="781px" 
                    Height="631px" HorizontalAlign="Center" >
                <asp:Label ID="Label3" runat="server" BackColor="#333333" ForeColor="White" 
                           Width="100%" Height="32px">
              
                     <asp:ImageButton ID="ImageButton3" runat="server" style="margin-left:750px;"
                        ImageUrl="~/images/icons-png/close.png" />
                            
                            </asp:Label>


 

                     
                    <asp:Image ID="picture"  style="margin-left:0px;" runat="server" 
                    Width="16px" />
                 
             
                     <br />
                 
               
                     
                   
                </asp:Panel>
                    <cc1:ModalPopupExtender ID="Popup" runat="server" 
                        BackgroundCssClass="cssModalBackground" OkControlID="ImageButton3" 
                        PopupControlID="Panel2" PopupDragHandleControlID="Label2" 
                        TargetControlID="Button7"></cc1:ModalPopupExtender>
                    <asp:Button ID="Button7" runat="server" style="display:none" Text="Button" />
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
           
    <asp:hiddenfield ID="message" runat="server"></asp:hiddenfield>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <table class="style9">
             
                <tr>
                    <td class="style11">
                        <asp:Label ID="giftTitle" runat="server" Text="Gift Title:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="titleText" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style11">
                        <asp:Label ID="giftDescrib" runat="server" Text="Gift Describtion:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="describText" runat="server" Height="123px" 
                            TextMode="MultiLine" Width="245px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style9">
                        <asp:Label ID="giftQua" runat="server" Text="Quantity:"></asp:Label>
                    </td>
                    <td class="style9">
                        <asp:TextBox ID="giftQuaText" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style11">
                        <asp:Label ID="giftCredit" runat="server" Text="Gift Credit:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="giftCreditText" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style11">
                        <asp:Label ID="giftMax" runat="server" Text="Max Exchange:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="giftMaxText" runat="server" style="height: 22px"></asp:TextBox>
                    </td>
                </tr>
                 <tr>
                    <td class="style11">
                        <asp:Label ID="giftActive" runat="server" Text="Active:"></asp:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="giftActiveBox" runat="server" CssClass="box"  />
                    </td>
                </tr>
                   <tr>
                    <td class="style11">
                        <asp:Label ID="giftImg" runat="server" Text="Gift Image:"></asp:Label>
                    </td>
                    <td>
                        &nbsp;<asp:FileUpload ID="giftImgFile" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="style11">
                        &nbsp;</td>
                    <td>
                        <asp:Button ID="insBtn" runat="server" CssClass="blue" Text="Confirm" />
                        <asp:Button ID="cancelBtn" runat="server" CssClass="blue" Text="Cancel" />
                    </td>
                </tr>
            </table>
    </asp:View>
    </asp:MultiView>
    
    
    
    
   
   
    </form>
</body>
</html>

