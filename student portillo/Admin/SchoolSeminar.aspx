<%@ Page Language="VB" AutoEventWireup="false" CodeFile="SchoolSeminar.aspx.vb" Inherits="Operator_SchoolSeminar" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>

<link rel="stylesheet" href="../button.css" type="text/css" media="screen" />
<link rel="stylesheet" href="../teachGrid.css" type="text/css" media="screen" />
 <link rel="stylesheet" href="../grid.css" type="text/css" media="screen" />  
   <script src="Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="Scripts/jquery.dynDateTime.min.js" type="text/javascript"></script>
    <script src="Scripts/calendar-en.min.js" type="text/javascript"></script>
    <link href="Styles/calendar-blue.css" rel="stylesheet" type="text/css" />
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
        .style1
        {
            width: 33%;
        }
        .style3
        {
            width: 187px;
            height: 41px;
        }
        .style4
        {
            height: 41px;
        }
        .style5
        {
            width: 187px;
            height: 38px;
        }
        .style6
        {
            height: 38px;
        }
        .style7
        {
            width: 187px;
        }
           .style8
        {
            font-family: "Berlin Sans FB";
            font-size: xx-large;
        }
        #ImageButton2{
            width:12%;
        }
        .style9
        {
            width: 100%;
        }
        .style11
        {
            width: 145px;
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
        <span class="style8">Seminar Management</span> <%--        <asp:LinkButton ID="home" runat="server" CssClass="blue" 
                  style="margin-left: 255px" Font-Size="Large">Home</asp:LinkButton>--%>
    <div style="text-align:center;margin-top:-32px;padding-bottom:12px;width:1105px">
               <asp:ImageButton ID="ImageButton2" runat="server" onmouseover="this.src='../images/homeblue_hover.png'" onmouseout="this.src='../images/homeblue.png'" ImageUrl="~/images/homeblue.png" /> 
    </div>
                  <br />
                  <br />

    </div>
    
    
    
    <asp:SqlDataSource ID="SemYear" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
        
        
        SelectCommand="SELECT  distinct year([startDate]) as year FROM [Seminar_Info] WHERE (status=@status and COD = @COD) ORDER BY year DESC">
        <SelectParameters>
            <asp:Parameter DefaultValue="Internal" Name="status" />
             <asp:SessionParameter Name="COD" SessionField="COD" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SemCategory" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
        
        
        
        SelectCommand="SELECT DISTINCT category FROM Seminar_Info WHERE (status=@status and COD = @COD and year(startDate)=@startDate and category != '')">
        <SelectParameters>
            <asp:Parameter DefaultValue="Internal" Name="status" />
            <asp:SessionParameter Name="COD" SessionField="COD" Type="String" />
            <asp:ControlParameter ControlID="year" DefaultValue="" Name="startDate" 
                PropertyName="SelectedValue" />
               
        </SelectParameters>
    </asp:SqlDataSource>
   

    
    
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">

            <table class="style1">
                <tr>
                    <td class="style3">
                        <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Size="Larger" 
                            Text="Seminar Year:"></asp:Label>
                    </td>
                    <td class="style4">
                        <asp:DropDownList ID="year" runat="server" DataSourceID="SemYear" 
                            DataTextField="year" DataValueField="year" Height="25px" 
                            style="margin-left: 0px" AutoPostBack="True">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="style5">
                        <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Size="Larger" 
                            Text="Seminar Category:"></asp:Label>
                    </td>
                    <td class="style6">
                        <asp:DropDownList ID="category" runat="server" DataSourceID="SemCategory" 
                            DataTextField="category" DataValueField="category" Height="25px" 
                            AutoPostBack="True">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="style7">
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
            <asp:Button ID="addSem" runat="server" CssClass="blue" Text="Add Seminar" />
            <br />
            <br />
             
    <asp:GridView ID="GridViewSeminar" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="id" DataSourceID="SeminarInfo" GridLines="Horizontal" 
        Width="1300px" Height="40px" AllowPaging="True" AllowSorting="True" 
        BorderStyle="None" 
        EmptyDataText="There are no data records to display." 
        style="margin-right: 0px" CssClass="GridViewStyle">
        <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
        <Columns>
           <asp:TemplateField>
           </asp:TemplateField>
            <asp:TemplateField HeaderText="Date" SortExpression="startDate">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" 
                        Text='<%# Bind("startDate", "{0:yyyy/M/d h:mm tt}") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    &nbsp;<asp:TextBox ID="TextBox1" runat="server" class="Calender" Height="22px" 
                        Text='<%# Bind("startDate", "{0:yyyy/MM/dd hh:mm}") %>' Width="104px"></asp:TextBox>
                    <img src="../images/calendar.ico" 
    style="height: 24px; width: 24px; margin-top: 4px;" />
                </EditItemTemplate>
                <FooterTemplate>
                    &nbsp;&nbsp;
                </FooterTemplate>
                <HeaderStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Topic" SortExpression="topicName">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("topicName") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Height="123px" 
                        Text='<%# Bind("topicName") %>' TextMode="MultiLine" Width="245px"></asp:TextBox>
                </EditItemTemplate>
                <HeaderStyle HorizontalAlign="Left" Wrap="True" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Category" SortExpression="category">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("category") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("category") %>'></asp:TextBox>
                </EditItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Duration(hours)" SortExpression="duration">
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("duration") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("duration") %>' 
                        Width="80px"></asp:TextBox>
                </EditItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Organization" SortExpression="organizer">
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("organizer") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("organizer") %>'></asp:TextBox>
                </EditItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Bonus Point" SortExpression="bonus_point">
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("bonus_point") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("bonus_point") %>' 
                        Width="50px"></asp:TextBox>
                </EditItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="School Code" SortExpression="COD">
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("COD") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("COD") %>'></asp:Label>
                </EditItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Update Time" SortExpression="update_time" 
                Visible="False">
                <ItemTemplate>
                    <asp:Label ID="time" runat="server" 
                        Text='<%# Bind("update_time", "{0:yyyy-MM-dd HH:mm:ss.fff}") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Label ID="time_edit" runat="server" 
                        Text='<%# Bind("update_time", "{0:yyyy-MM-dd HH:mm:ss.fff}") %>'></asp:Label>
                </EditItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:CommandField ShowSelectButton="True" SelectText="Detail" />
        </Columns>
        <FooterStyle BackColor="White" Height="40px" />
        <HeaderStyle Height="40px" ForeColor="White" CssClass="GridViewHeaderStyle" 
            Font-Size="Large" />
        <PagerStyle HorizontalAlign="Center" CssClass="GridViewPagerStyle" />
        <RowStyle CssClass="GridViewRowStyle" Height="40px" HorizontalAlign="Left" />
        <SelectedRowStyle BackColor="Silver" />
    </asp:GridView>
    <br />
     <asp:Label ID="success" runat="server" ForeColor="Blue" Font-Size="X-Large"></asp:Label>
       <br />
        <asp:Label ID="fail" runat="server" ForeColor="Red" Font-Size="X-Large"></asp:Label>
         <br />
    <asp:SqlDataSource ID="SeminarInfo" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
        DeleteCommand="DELETE FROM [Seminar_Info] WHERE [id] = @id" 
        InsertCommand="INSERT INTO [Seminar_Info] ([topicName], [category], [startDate], [duration], [organizer], [bonus_point], [status], [update_time], [topicNameCht], [categoryCht], [organizerCht]) VALUES (@topicName, @category, @startDate, @duration, @organizer, @bonus_point, @status, GETDATE(), @topicNameCht, @categoryCht, @organizerCht)" 
        SelectCommand="SELECT [id],[topicName], [category], [startDate], REPLACE (duration, '-1', '') as duration, [organizer], [bonus_point], [status], [update_time], [topicNameCht], [categoryCht], [organizerCht],[COD] FROM [Seminar_Info] WHERE ((year([startDate]) = @startDate) AND ([category] = @category) AND ([status] = @status) AND ([COD] = @COD)) order by startDate desc"
        UpdateCommand="UPDATE [Seminar_Info] SET [topicName] = @topicName, [category] = @category, [startDate] = @startDate, [duration] = @duration, [organizer] = @organizer, [bonus_point] = @bonus_point,  [update_time] = GETDATE(), [topicNameCht] = @topicNameCht, [categoryCht] = @categoryCht, [organizerCht] = @organizerCht WHERE [id] = @id">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
          <SelectParameters>
                    <asp:ControlParameter ControlID="year" Name="startDate" 
                        PropertyName="SelectedValue"  Type="String" />
                    <asp:ControlParameter ControlID="category" Name="category" 
                        PropertyName="SelectedValue" Type="String" />
                          
                    <asp:Parameter DefaultValue="Internal" Name="status" Type="String" />
                  
                    <asp:SessionParameter Name="COD" SessionField="COD" Type="String" />
                </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="topicName" Type="String" />
            <asp:Parameter Name="category" Type="String" />
            <asp:Parameter Name="startDate" Type="DateTime" />
            <asp:Parameter Name="duration" Type="Int32" />
            <asp:Parameter Name="organizer" Type="String" />
            <asp:Parameter Name="bonus_point" Type="Int32" />
            <asp:Parameter DefaultValue="Internal" Name="status" Type="String" />
            <asp:Parameter Name="topicNameCht" Type="String" />
            <asp:Parameter Name="categoryCht" Type="String" />
            <asp:Parameter Name="organizerCht" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="topicName" Type="String" />
            <asp:Parameter Name="category" Type="String" />
            <asp:Parameter Name="startDate" Type="DateTime" />
            <asp:Parameter Name="duration" Type="Int32" />
            <asp:Parameter Name="organizer" Type="String" />
            <asp:Parameter Name="bonus_point" Type="Int32" />
            <asp:Parameter Name="id" Type="Int32" />
            <asp:Parameter Name="topicNameCht" Type="String" />
            <asp:Parameter Name="categoryCht" Type="String" />
            <asp:Parameter Name="organizerCht" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
           
        
            
           
        
        </asp:View>
        <asp:View ID="View2" runat="server">
            <table class="style9">
                <tr>
                    <td class="style11">
                        <asp:Label ID="semDate" runat="server" Text="Seminar Year:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="semYearText" runat="server" class="Calender"></asp:TextBox>
                        <img src="../images/calendar.ico" />
                         
                    </td>
                </tr>
                <tr>
                    <td class="style11">
                        <asp:Label ID="semTitle" runat="server" Text="Topic:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="titleText" runat="server" Height="123px" TextMode="MultiLine" 
                            Width="245px"></asp:TextBox>
                    </td>
                </tr>
                   <tr>
                    <td class="style11">
                        <asp:Label ID="semTitleCht" runat="server" Text="Topic(Chinese):"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="titleTextCht" runat="server" Height="123px" TextMode="MultiLine" 
                            Width="245px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style11">
                        <asp:Label ID="semType" runat="server" Text="Category:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="typeText" runat="server"></asp:TextBox>
                    </td>
                </tr>
                  <tr>
                    <td class="style11">
                        <asp:Label ID="semTypeCht" runat="server" Text="Category(Chinese):"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="typeTextCht" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style11">
                        <asp:Label ID="semDuration" runat="server" Text="Duration(hours)"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="durationText" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style11">
                        <asp:Label ID="semOrg" runat="server" Text="Organization:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="orgText" runat="server"></asp:TextBox>
                    </td>
                </tr>
                 <tr>
                    <td class="style11">
                        <asp:Label ID="semOrgCht" runat="server" Text="Organization(Chinese):"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="orgTextCht" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style11">
                        <asp:Label ID="semPoint" runat="server" Text="Bonus Point:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="pointText" runat="server" style="height: 22px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style11">
                        &nbsp;</td>
                    <td>
                        <asp:Button ID="insBtn" runat="server" CssClass="blue" Text="Confirm" />
                        <asp:Button ID="cancelBtn" runat="server" CssClass="blue" Text="Cancel" CausesValidation="False" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View3" runat="server">
            <asp:DetailsView ID="DetailsViewSeminar" runat="server" Height="50px" Width="1000px" 
                AutoGenerateRows="False" DataSourceID="SeminarInfoDetail" 
                BorderStyle="None" GridLines="Horizontal" DataKeyNames="id" 
                CssClass="GridViewStyle">
                <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle2" />
                <CommandRowStyle BackColor="White" />
                <EditRowStyle Width="1000px" />
                <Fields>
                    <asp:TemplateField HeaderText="Date">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" 
                                Text='<%# Bind("startDate", "{0:yyyy/M/d h:mm tt}") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" class="Calender"
                                Text='<%# Bind("startDate", "{0:yyyy/MM/dd hh:mm}") %>'></asp:TextBox>
                            <img src="../images/calendar.ico" style="height: 24px; width: 24px; margin-top: 4px;" />
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" class="Calender"
                                Text='<%# Bind("startDate", "{0:yyyy/MM/dd hh:mm}") %>'></asp:TextBox>
                            <img src="../images/calendar.ico" style="height: 24px; width: 24px; margin-top: 4px;" />
                        </InsertItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Topic">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("topicName") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Height="123px" 
                                Text='<%# Bind("topicName") %>' TextMode="MultiLine" Width="245px"></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Height="123px" 
                                Text='<%# Bind("topicName") %>' TextMode="MultiLine" Width="245px"></asp:TextBox>
                        </InsertItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Topic(Chinese)">
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("topicNameCht") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Height="123px" 
                                Text='<%# Bind("topicNameCht") %>' TextMode="MultiLine" Width="245px"></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Height="123px" 
                                Text='<%# Bind("topicNameCht") %>' TextMode="MultiLine" Width="245px"></asp:TextBox>
                        </InsertItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Category">
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("category") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("category") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("category") %>'></asp:TextBox>
                        </InsertItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="categoryCht" HeaderText="Category(Chinese)" />
                    <asp:BoundField DataField="duration" HeaderText="Duration(hours)" />
                    <asp:BoundField DataField="organizer" HeaderText="Organization" />
                    <asp:BoundField DataField="organizerCht" HeaderText="Organization(Chinese)" />
                    <asp:BoundField DataField="bonus_point" HeaderText="Bonus Point" />
                    <asp:BoundField DataField="COD" HeaderText="School Code" ReadOnly="True" />
                    <asp:TemplateField HeaderText="Update Time" Visible="False">
                        <ItemTemplate>
                            <asp:Label ID="DetailTime" runat="server" 
                                Text='<%# Bind("update_time", "{0:yyyy-MM-dd HH:mm:ss.fff}") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Label ID="DetailTimeEdit" runat="server" 
                                Text='<%# Bind("update_time", "{0:yyyy-MM-dd HH:mm:ss.fff}") %>'></asp:Label>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:Label ID="DetailTimeIns" runat="server" 
                                Text='<%# Bind("update_time", "{0:yyyy-MM-dd HH:mm:ss.fff}") %>'></asp:Label>
                        </InsertItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False" >
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                CommandName="Edit" Text="Edit"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                CommandName="New" Text="New"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" 
                                CommandName="Delete" OnClientClick="ConfirmMessage();" Text="Delete"></asp:LinkButton>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                                CommandName="Update" Text="Update"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                                CommandName="Insert" Text="Insert"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                        </InsertItemTemplate>
                        <ItemStyle BackColor="White" />
                    </asp:TemplateField>
                </Fields>
                <RowStyle CssClass="GridViewRowStyle2" />
            </asp:DetailsView>
            <br />
            <br />
            <asp:Button ID="back" runat="server" CssClass="blue" Text="Back" />
            <asp:SqlDataSource ID="SeminarInfoDetail" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                DeleteCommand="DELETE FROM [Seminar_Info] WHERE [id] = @id" 
                InsertCommand="INSERT INTO [Seminar_Info] ([topicName], [category], [startDate], [duration], [organizer], [bonus_point], [status], [update_time], [topicNameCht], [categoryCht], [organizerCht], [uid], [COD]) VALUES (@topicName, ISNULL(@category, 'Not define' ), @startDate, @duration, @organizer, @bonus_point, @status, GETDATE(), @topicNameCht, @categoryCht, @organizerCht, @uid, @COD)" 
                SelectCommand="SELECT [id],[topicName], [category], [startDate], REPLACE (duration, '-1', '') as duration, [organizer], [bonus_point], [status], [update_time], [topicNameCht], [categoryCht], [organizerCht],[COD]  FROM [Seminar_Info] WHERE (id=@id)" 
                UpdateCommand="UPDATE [Seminar_Info] SET [topicName] = @topicName, [category] = ISNULL(@category, 'Not define'), [startDate] = @startDate, [duration] = ISNULL(@duration, '-1'), [organizer] = @organizer, [bonus_point] = @bonus_point,  [update_time] = GETDATE(), [topicNameCht] = @topicNameCht, [categoryCht] = @categoryCht, [organizerCht] = @organizerCht WHERE [id] = @id">
                <DeleteParameters>
                       <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridViewSeminar" Name="id" 
                        PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <InsertParameters>
                    <asp:Parameter Name="topicName" Type="String" />
                    <asp:Parameter Name="category" Type="String" />
                    <asp:Parameter Name="startDate" Type="DateTime" />
                    <asp:Parameter Name="duration" Type="Int32" />
                    <asp:Parameter Name="organizer" Type="String" />
                    <asp:Parameter Name="bonus_point" Type="Int32" />
                      <asp:Parameter DefaultValue="Internal" Name="status" Type="String" />
                    <asp:Parameter Name="topicNameCht" Type="String" />
                    <asp:Parameter Name="categoryCht" Type="String" />
                    <asp:Parameter Name="organizerCht" Type="String" />
                    <asp:SessionParameter Name="uid" SessionField="ID" Type="String" />
                    <asp:SessionParameter Name="COD" SessionField="COD" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="topicName" Type="String" />
                    <asp:Parameter Name="category" Type="String" />
                    <asp:Parameter Name="startDate" Type="DateTime" />
                    <asp:Parameter Name="duration" Type="Int32" />
                    <asp:Parameter Name="organizer" Type="String" />
                    <asp:Parameter Name="bonus_point" Type="Int32" />
                    <asp:Parameter Name="id" Type="Int32" />
                  
                    <asp:Parameter Name="topicNameCht" Type="String" />
                    <asp:Parameter Name="categoryCht" Type="String" />
                    <asp:Parameter Name="organizerCht" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </asp:View>

    </asp:MultiView>
    
    
   
    
     <asp:SqlDataSource ID="verify" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                SelectCommand="SELECT * FROM [userGroup] WHERE ([id] = @id)">
                <SelectParameters>
                    <asp:SessionParameter Name="id" SessionField="Role_Type" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
    <asp:hiddenfield ID="message" runat="server"></asp:hiddenfield>
    
    </form>
</body>
</html>
