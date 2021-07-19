<%@ Page Language="VB" AutoEventWireup="false" CodeFile="RegisterGift.aspx.vb" Inherits="Student_RegisterGift" %>

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

        .style1
        {
            width: 81%;
        }
           .style6
           {
               width: 98px;
               height: 41px;
           }
           .style7
           {
               width: 98px;
               height: 51px;
           }
           .style8
           {
               height: 51px;
           }
           .style10
           {
               width: 100%;
           }
        #ImageButton2{
            max-width:9%;
        }


        
		        
        /*animatemenu*/

		#main-nav-wrapper{			
			overflow:hidden;
			margin-left: 5%;
		}

        .main-nav {
           position: absolute;
             /* bottom: 0;*/
			/*width:1024px;*/	
            width:1166px;		
			height: 100px;
            padding: 0;
            text-align: right;
			margin-left: auto;
            margin-right: auto;
			margin: 0;
            font-size: 0;
            /*margin-top:-184px;*/
            /*z-index:-1;*/
            top:16px;
            
        }

        .main-nav-list {
            display: inline-block;
            padding: 0;
            list-style: none;
        }

            .main-nav-list li {
                display: inline-block;
                margin: 0;
                padding: 0;
                min-width: 50px;
                min-height: 50px;

				/*margin-top: 80px;*/
            }

                .main-nav-list li.apic1color {
                    background-color: #a8218e;
                }

                .main-nav-list li.apic2color {
                    background-color: #00a7ef;
                }

                .main-nav-list li.apic3color {
                    background-color: #ffa200;
                }

                .main-nav-list li.apic4color {
                    background-color: #9ae900;
                }

                .main-nav-list li.apic5color {
                    background-color: #ff2200;
                }

                .main-nav-list li.apic6color {
                    background-color: #ffd600;
                }

                .main-nav-list li.apic7color {
                    background-color: #00989a;
                }

                .main-nav-list li.apic8color {
                    background-color: #00cb79;
                }

                .main-nav-list li .aimg {
                    display: inline-block;
                    cursor: pointer;
                    margin: 0;
                    padding: 0;
                }




        .style11
    {
        width: 97px;
        height: 51px;
    }
    .style12
    {
        width: 97px;
        height: 41px;
    }
        .aimg{
            width:75px;
        }
        .aimgactive{
            width:130px;
        }



        </style>
        </head>
        <body background="../images/church.gif">
             <script type="text/javascript">
                 function ConfirmMessage() {
                     var lang = '<%=Session("CurrentUI") %>';

                     if (lang == "zh-TW") {
                         var selectedvalue = confirm("您確定要登記?");
                         if (selectedvalue) {
                             document.getElementById('<%=message.ClientID %>').value = "Yes";
                         } else {
                             document.getElementById('<%=message.ClientID %>').value = "No";
                         }
                     }
                     else {

                         var selectedvalue = confirm("Confirm To Register?");
                         if (selectedvalue) {
                             document.getElementById('<%=message.ClientID %>').value = "Yes";
                         } else {
                             document.getElementById('<%=message.ClientID %>').value = "No";
                         }


                     }

                 }
                 function DelMessage() {
                     var lang = '<%=Session("CurrentUI") %>';

                     if (lang == "zh-TW") {
                         var selectedvalue = confirm("您確定要刪除它?");
                         if (selectedvalue) {
                             document.getElementById('<%=delmsg.ClientID %>').value = "Yes";
                         } else {
                             document.getElementById('<%=delmsg.ClientID %>').value = "No";
                         }
                     }
                     else {

                         var selectedvalue = confirm("Are you sure you want to delete it?");
                         if (selectedvalue) {
                             document.getElementById('<%=delmsg.ClientID %>').value = "Yes";
                         } else {
                             document.getElementById('<%=delmsg.ClientID %>').value = "No";
                         }


                     }
                 }
    </script>

    <script src="animatedmenu3/jquery-2.1.1.js"></script>
    <%--<script src="script/jquery-1.10.2.min.js"></script>--%>
    <%--<script src="animatedmenu3/jquery.resizeOnApproach.1.0.min.js"></script>--%>

        <script>
            $(document).ready(function () {
                //$('.main-nav-list .aimg').resizeOnApproach({
                //    elementDefault: 80,
                //    elementClosest: 100,
                //    triggerDistance: 100
                //});


                //$('.main-nav-list .aimgactive').resizeOnApproach({
                //    elementDefault: 130,
                //    elementClosest: 130,
                //    triggerDistance: 100
                //});

                $('.main-nav-list .aimg').resizeOnApproach({
                    elementDefault: 75,
                    elementClosest: 130,
                    triggerDistance: 100
                });


                $('.main-nav-list .aimgactive').resizeOnApproach({
                    elementDefault: 110,
                    elementClosest: 110,
                    triggerDistance: 100
                });


                $('.main-nav-list .nocolorimg').resizeOnApproach({
                    elementDefault: 150,
                    elementClosest: 150,
                    triggerDistance: 100
                });

            });
    </script>
                <script type="text/javascript">

                    var _gaq = _gaq || [];
                    _gaq.push(['_setAccount', 'UA-36251023-1']);
                    _gaq.push(['_setDomainName', 'jqueryscript.net']);
                    _gaq.push(['_trackPageview']);

                    (function () {
                        var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
                        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
                        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
                    })();

    </script>


<form id="form1" runat="server">
    <div>
         

            <div style="text-align:center;padding-bottom:12px;max-width:1600px">
               <asp:ImageButton ID="ImageButton2" runat="server" onmouseover="this.src='../images/homeblue_hover.png'" onmouseout="this.src='../images/homeblue.png'" ImageUrl="~/images/homeblue.png" CausesValidation="False" /> 
                </div>

        <%--<asp:Button ID="home" runat="server" Text="Home" 
            style="font-size:Large; margin-left:545px;" CssClass="blue"/>--%>
        <br /><br />



               
            <div id="main-nav-wrapper">
            <nav class="main-nav">
                <ul class="main-nav-list">

                    <li class="apic10color">
                        <img src="animatedmenu3/nocolor.png" class="nocolorimg" />

                    </li>

                    <li class="apic9color">
                        <asp:ImageButton ID="ImageButtonapic9" runat="server" ImageUrl="~/Student/animatedmenu3/cpic5.png" CssClass="aimg"
                         OnClick="ImageButtonapic9_Click"   />
                    </li>


                    <li class="apic1color">
                        <asp:ImageButton ID="ImageButtonapic1" runat="server" ImageUrl="~/Student/animatedmenu3/cpic1.png" CssClass="aimgactive" OnClick="ImageButtonapic1_Click" />

                    </li>
                    <li class="apic2color">

                        <asp:ImageButton ID="ImageButtonapic2" runat="server" ImageUrl="~/Student/animatedmenu3/cpic2.png" CssClass="aimg" OnClick="ImageButtonapic2_Click" />


                    </li>
                    <li class="apic3color">
                        <asp:ImageButton ID="ImageButtonapic3" runat="server" ImageUrl="~/Student/animatedmenu3/cpic3.png" CssClass="aimg" OnClick="ImageButtonapic3_Click" />


                    </li>
                    <li class="apic4color">

                        <asp:ImageButton ID="ImageButtonapic4" runat="server" ImageUrl="~/Student/animatedmenu3/cpic4.png" CssClass="aimg" OnClick="ImageButtonapic4_Click" />

                    </li>
                </ul>
            </nav>
        </div>

        <br />
        <br />
        <br />

                <table class="style10">
                    <tr>
                        <td>
                
                <asp:Button ID="RegGift" runat="server" Text="Register Gift" CssClass="blue" Width="190px" />
         
                        </td>
                        <td>
         
                <asp:Button ID="EarnedCredit" runat="server" Text="Earned Credit" CssClass="blue" Width="190px" />
                        </td>
                        <td>
                <asp:Button ID="UsedCredit" runat="server" Text="Used Credit" CssClass="blue" Width="190px" />
                
                        </td>
                        <td>
                 <asp:Button ID="CancelGift" runat="server" Text="Cancel Registered Gift" CssClass="blue" Width="190px" /></td>
                    </tr>
                </table>
                <br />
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        

            <asp:View ID="View1" runat="server">
                <asp:SqlDataSource ID="CartSrc" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                    SelectCommand="SELECT * FROM [gift_info] WHERE ([active] = @active)">
                     <SelectParameters>
                        <asp:Parameter DefaultValue="True" Name="active" />
                    </SelectParameters>
                    </asp:SqlDataSource>
                      <asp:Label ID="title" runat="server" Text="<%$ Resources:Resource, sip_reg_gift %>" style="color:black;font-size:xx-large;font-family: 'Berlin Sans FB';"></asp:Label>
                      <br /><br />
                
                <asp:HiddenField ID="id" runat="server" />

              
                <asp:HiddenField ID="time" runat="server" />
                
                <asp:GridView ID="GridViewCart" runat="server" AutoGenerateColumns="False" 
                    BorderStyle="None" DataKeyNames="id,update_time" GridLines="Horizontal" 
                    Width="100%" EmptyDataText="There are no data records to display." 
                    AllowPaging="True" CssClass="GridViewStyle">
                    <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                    <Columns>
                        <asp:TemplateField></asp:TemplateField>
                        <asp:BoundField HeaderText="<%$ Resources:Resource, sip_rg_giftID %>" DataField="id" >
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_rg_giftImage %>">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageBtn" runat="server" Height="50px" 
                                    ImageUrl='<%# Bind("image") %>' onclick="ImageBtn_Click" Width="50px" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("image") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="<%$ Resources:Resource, sip_rg_giftTitle %>" DataField="title" >
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="<%$ Resources:Resource, sip_rg_giftDescrib %>" DataField="detail" >
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="<%$ Resources:Resource, sip_rg_giftQua %>" DataField="quantity" >
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="<%$ Resources:Resource, sip_rg_giftPoint %>" DataField="credit" >
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:ButtonField ButtonType="Button" CommandName="Select" 
                            HeaderText="<%$ Resources:Resource, sip_rg_addCart %>" ShowHeader="True" Text="<%$ Resources:Resource, sip_rg_addCartBtn %>">
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
              
                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:Resource, sip_rg_totalAvailable %>" 
                            ForeColor="Blue" style="font-size:larger;margin-left:1000px;"  ></asp:Label>
            <asp:Label ID="validCredit" runat="server" Font-Size="Larger" ForeColor="#FF3300"></asp:Label>
          

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
           
    
                <asp:HiddenField ID="maxExchange" runat="server" />
           
    
   <br /> <br />
                
        </asp:View>
           
            <asp:View ID="View2" runat="server">
            <asp:Label ID="giftReg" runat="server" Text="<%$ Resources:Resource, sip_reg_gift %>" style="color:black;font-size:xx-large;font-family: 'Berlin Sans FB';"></asp:Label>
                     <br /><br />
                <asp:DetailsView ID="DetailsViewExchange" runat="server" AutoGenerateRows="False" 
                    DataKeyNames="id" DataSourceID="GiftExchangeSrc" Height="50px" 
                    Width="1000px" GridLines="Horizontal" BorderStyle="None" 
                    CssClass="GridViewStyle">
                    <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle2" />
                    <Fields>
                        <asp:BoundField DataField="id" HeaderText="<%$ Resources:Resource, sip_rg_giftID %>" InsertVisible="False" 
                            ReadOnly="True" SortExpression="id" />
                        <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_rg_giftImage %>" SortExpression="image">
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
                        <asp:BoundField DataField="title" HeaderText="<%$ Resources:Resource, sip_rg_giftTitle %>" 
                            SortExpression="title" />
                        <asp:BoundField DataField="detail" HeaderText="<%$ Resources:Resource, sip_rg_giftDescrib %>" 
                            SortExpression="detail" />
                        <asp:BoundField DataField="quantity" HeaderText="<%$ Resources:Resource, sip_rg_giftQua %>" 
                            SortExpression="quantity" />
                        <asp:BoundField DataField="credit" HeaderText="<%$ Resources:Resource, sip_rg_giftPoint %>" 
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
            <td class="style11">
                <asp:Label ID="Label1" runat="server" Text="<%$ Resources:Resource, sip_rg_giftQuaDel %>" 
                    Font-Bold="True" Font-Size="Large"></asp:Label>
                
            </td>
            <td class="style8">
                <asp:DropDownList ID="giftCount" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style12">
                <asp:Button ID="ExchangeBack" runat="server" CssClass="blue" Text="<%$ Resources:Resource, sip_back %>" />
            </td>
            <td>
                <asp:Button ID="RegisterBtn" runat="server" CssClass="blue" OnClientClick="ConfirmMessage();"
                    Text="<%$ Resources:Resource, sip_rg_giftConfirm %>" />
            </td>
        </tr>
    </table>
            </asp:View>
          
            <asp:View ID="View3" runat="server">
               <asp:Label ID="giftEarned" runat="server" Text="<%$ Resources:Resource, sip_rg_earned %>" style="color:black;font-size:xx-large;font-family: 'Berlin Sans FB';"></asp:Label>
             <br /><br />
                  <asp:Label ID="Label2" runat="server" Text="<%$ Resources:Resource, sig_rg_stdID %>" 
                            ForeColor="Black" style="font-size:larger;margin-left:0px;" 
                    Font-Bold="True"  ></asp:Label>&nbsp
            <asp:Label ID="studID" runat="server"></asp:Label>
                <br />  <br /> 
                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:Resource, sig_rg_stdName %>" 
                            style="font-size:larger;margin-left:0px;" Font-Bold="True" 
                    ForeColor="Black"  ></asp:Label>&nbsp
            <asp:Label ID="chname" runat="server"></asp:Label>
                <br /> <br />
                   <asp:Label ID="Label11" runat="server" Text="<%$ Resources:Resource, sig_rg_stdNameEn %>" 
                            style="font-size:larger;margin-left:0px;" Font-Bold="True" 
                    ForeColor="Black"  ></asp:Label>&nbsp
            <asp:Label ID="pnname" runat="server"></asp:Label>
                <br /> <br />
                               
                <asp:GridView ID="GridViewSeminar" runat="server" AutoGenerateColumns="False" 
                    BorderStyle="None" DataKeyNames="id,pess_cod" GridLines="Horizontal" 
                    Width="100%" EmptyDataText="There are no data records to display." 
                    AllowPaging="True" CssClass="GridViewStyle">
                    <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                    <Columns>
                        <asp:TemplateField></asp:TemplateField>
                        <asp:BoundField DataField="startDate" HeaderText="<%$ Resources:Resource, sip_sp_relevantDate %>" >
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="topicName" HeaderText="<%$ Resources:Resource, sip_lr_topic %>" >
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="category" HeaderText="<%$ Resources:Resource, sip_lr_type %>" >
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="duration" HeaderText="<%$ Resources:Resource, sip_lr_duration %>" >
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="organizer" HeaderText="<%$ Resources:Resource, sip_sp_relevantOrg %>" >
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="bonus_point" HeaderText="<%$ Resources:Resource, sip_lr_bonus %>" >
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                    </Columns>
                    <HeaderStyle CssClass="GridViewHeaderStyle" Font-Size="Large" ForeColor="White" 
                        Height="40px" />
                    <PagerStyle HorizontalAlign="Center" CssClass="GridViewPagerStyle" />
                    <RowStyle CssClass="GridViewRowStyle" Height="40px" HorizontalAlign="Left" />
                </asp:GridView>
                               
                <br />
                <br />
                  
                  <asp:Label ID="Label5" runat="server" Text="<%$ Resources:Resource, sip_rg_totalBonus %>" 
                            ForeColor="Blue" style="font-size:larger;margin-left:1000px;"  ></asp:Label>
            <asp:Label ID="TotalSem" runat="server" Font-Size="Larger" ForeColor="Red"></asp:Label>
                <br />
            </asp:View>

            <asp:View ID="View4" runat="server">
              <asp:Label ID="giftUsed" runat="server" Text="<%$ Resources:Resource, sip_rg_used %>" style="color:black;font-size:xx-large;font-family: 'Berlin Sans FB';"></asp:Label>
              <br /><br />

             <asp:Label ID="Label10" runat="server" Text="<%$ Resources:Resource, sig_rg_stdID %>" 
                            ForeColor="Black" style="font-size:larger;margin-left:0px;" 
                    Font-Bold="True"  ></asp:Label>&nbsp
            <asp:Label ID="stuID" runat="server"></asp:Label>
                <br />  <br /> 
                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:Resource, sig_rg_stdName %>" 
                            style="font-size:larger;margin-left:0px;" Font-Bold="True" 
                    ForeColor="Black"  ></asp:Label>&nbsp
            <asp:Label ID="cname" runat="server"></asp:Label>
                <br /> <br />
                   <asp:Label ID="Label14" runat="server" Text="<%$ Resources:Resource, sig_rg_stdNameEn %>" 
                            style="font-size:larger;margin-left:0px;" Font-Bold="True" 
                    ForeColor="Black"  ></asp:Label>&nbsp
            <asp:Label ID="pname" runat="server"></asp:Label>
                <br /> <br />
                <asp:GridView ID="GridViewGift" runat="server" AutoGenerateColumns="False" 
                    BorderStyle="None" GridLines="Horizontal" Width="100%" 
                    DataKeyNames="exchangeID,gift_quantity,giftID,update_time" 
                    EmptyDataText="There are no data records to display." 
                    AllowPaging="True" CssClass="GridViewStyle">
                    <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                    <Columns>
                        <asp:TemplateField></asp:TemplateField>
                        <asp:BoundField DataField="giftID" HeaderText="<%$ Resources:Resource, sip_rg_giftID %>">
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
                        <asp:BoundField DataField="title" HeaderText="<%$ Resources:Resource, sip_rg_giftTitle %>">
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="detail" HeaderText="<%$ Resources:Resource, sip_rg_giftDescrib %>">
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="credit" HeaderText="<%$ Resources:Resource, sip_rg_giftExchange %>">
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="gift_quantity" HeaderText="<%$ Resources:Resource, sip_rg_giftQua %>">
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="status" HeaderText="<%$ Resources:Resource, sip_rg_giftStatus %>">
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="register_time" HeaderText="<%$ Resources:Resource, sip_rg_giftRegTime %>">
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="exchange_time" HeaderText="<%$ Resources:Resource, sip_rg_giftExchangeTime %>">
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
                    </Columns>
                    <HeaderStyle CssClass="GridViewHeaderStyle" Font-Size="Large" ForeColor="White" 
                        Height="40px" />
                    <PagerStyle HorizontalAlign="Center" CssClass="GridViewPagerStyle" />
                    <RowStyle CssClass="GridViewRowStyle" Height="40px" HorizontalAlign="Left" />
                </asp:GridView>
                 
                 
                
                <br />
                 <br />
                  <asp:Label ID="Label6" runat="server" Text="<%$ Resources:Resource, sip_rg_totalUsed %>" 
                            ForeColor="Blue" style="font-size:larger;margin-left:1000px;"  ></asp:Label>
            <asp:Label ID="TotalUsed" runat="server" Font-Size="Larger" ForeColor="Red"></asp:Label>
                <br />


                </asp:View>
            <asp:View ID="View5" runat="server">
            <asp:Label ID="giftReged" runat="server" Text="<%$ Resources:Resource, sip_rg_reged %>" style="color:black;font-size:xx-large;font-family: 'Berlin Sans FB';"></asp:Label>
            <br /><br />

             <asp:Label ID="studentID" runat="server" Text="<%$ Resources:Resource, sig_rg_stdID %>" 
                            ForeColor="Black" style="font-size:larger;margin-left:0px;" 
                    Font-Bold="True"  ></asp:Label>&nbsp
            <asp:Label ID="stuidReg" runat="server"></asp:Label>
                <br />  <br /> 
                <asp:Label ID="chn" runat="server" Text="<%$ Resources:Resource, sig_rg_stdName %>" 
                            style="font-size:larger;margin-left:0px;" Font-Bold="True" 
                    ForeColor="Black"  ></asp:Label>&nbsp
            <asp:Label ID="chnReg" runat="server"></asp:Label>
                <br /> <br />
                   <asp:Label ID="ename" runat="server" Text="<%$ Resources:Resource, sig_rg_stdNameEn %>" 
                            style="font-size:larger;margin-left:0px;" Font-Bold="True" 
                    ForeColor="Black"  ></asp:Label>&nbsp
            <asp:Label ID="enameReg" runat="server"></asp:Label>
                <br /> <br />
            <asp:GridView ID="GridViewRegGift" runat="server" AutoGenerateColumns="False" 
                    BorderStyle="None" GridLines="Horizontal" Width="100%" 
                    DataKeyNames="exchangeID,gift_quantity,giftID,update_time" 
                    EmptyDataText="There are no data records to display." 
                    AllowPaging="True" CssClass="GridViewStyle">
                    <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                    <Columns>
                         <asp:TemplateField></asp:TemplateField>
                        <asp:BoundField DataField="giftID" HeaderText="<%$ Resources:Resource, sip_rg_giftID %>">
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
                        <asp:BoundField DataField="title" HeaderText="<%$ Resources:Resource, sip_rg_giftTitle %>">
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="detail" HeaderText="<%$ Resources:Resource, sip_rg_giftDescrib %>">
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="credit" HeaderText="<%$ Resources:Resource, sip_rg_giftExchange %>">
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="gift_quantity" HeaderText="<%$ Resources:Resource, sip_rg_giftQua %>">
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="status" HeaderText="<%$ Resources:Resource, sip_rg_giftStatus %>">
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
                                    CommandName="Delete" OnClientClick="DelFun();" Text="<%$ Resources:Resource, sip_sp_del %>"></asp:LinkButton>
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
                      <asp:Label ID="totalReg" runat="server" Text="<%$ Resources:Resource, sip_rg_totalReged %>" 
                            ForeColor="Blue" style="font-size:larger;margin-left:1000px;"  ></asp:Label>
            <asp:Label ID="regCredit" runat="server" Font-Size="Larger" ForeColor="Red"></asp:Label>
            </asp:View>
                  <asp:View ID="View6" runat="server">
            <asp:Label ID="giftRgDel" runat="server" Text="<%$ Resources:Resource, sip_rg_delete %>" style="color:black;font-size:xx-large;font-family: 'Berlin Sans FB';"></asp:Label>
            <br /><br />
            <asp:DetailsView ID="DetailsViewGift" runat="server" AutoGenerateRows="False" 
                    DataKeyNames="id" DataSourceID="giftInfo" Height="50px" 
                    Width="1000px" GridLines="Horizontal" BorderStyle="None" 
                          CssClass="GridViewStyle">
                    <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle2" />
                    <Fields>
                        <asp:BoundField DataField="id" HeaderText="<%$ Resources:Resource, sip_rg_giftID %>" InsertVisible="False" 
                            ReadOnly="True" SortExpression="id" />
                        <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_rg_giftImage %>" SortExpression="image">
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
                        <asp:BoundField DataField="title" HeaderText="<%$ Resources:Resource, sip_rg_giftTitle %>" 
                            SortExpression="title" />
                        <asp:BoundField DataField="detail" HeaderText="<%$ Resources:Resource, sip_rg_giftDescrib %>" 
                            SortExpression="detail" />
                        <asp:BoundField DataField="credit" HeaderText="<%$ Resources:Resource, sip_rg_giftPoint %>" 
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
            <td class="style11">
                <asp:Label ID="Label16" runat="server" Text="<%$ Resources:Resource, sip_rg_giftQuaDel %>" 
                    Font-Bold="True" Font-Size="Large"></asp:Label>
                
            </td>
            <td class="style8">
                 <asp:DropDownList ID="giftCountDel" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style12">
                <asp:Button ID="giftDelBack" runat="server" CssClass="blue" Text="<%$ Resources:Resource, sip_back %>" />
            </td>
            <td>
               <asp:Button ID="DelBtn" runat="server" OnClientClick="DelMessage();" Text="<%$ Resources:Resource, sip_sp_del %>" CssClass="blue" />
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
            <asp:SqlDataSource ID="AccessTime" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
        SelectCommand="SELECT * FROM [giftAccessTime]"></asp:SqlDataSource>
    </div>
    </form>
</body>
</html>