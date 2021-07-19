<%@ Page Language="VB" AutoEventWireup="false" CodeFile="SeminarAdding.aspx.vb" Inherits="SystemAdmin_SeminarAdding" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 701px;
        }
         .style3
        {
            font-family: "Berlin Sans FB";
            font-size: xx-large;
        }
        .styled
        {}
    </style>
<link rel="stylesheet" href="../button.css" type="text/css" media="screen" />
</head>
<body background="images/background.gif">
    <form id="form1" runat="server">
    <span class="style3">Seminar & Conference</span>
        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="blue" 
                  style="margin-left: 132px" Font-Size="Large">Home</asp:LinkButton>
                  <br />
    <div>
        <table class="style1">
            <tr>
                <td class="style2">
                    <asp:Label ID="Label1" runat="server" Text="Seminar:" Font-Size="Larger" 
                        Font-Bold="True"></asp:Label>
                    <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" 
                     Height="20px" Width="112px"
                        DataSourceID="SqlDataSource3" DataTextField="topicName" 
                        DataValueField="topicName" CssClass="styled">
                      
                    </asp:DropDownList>
                 </td>
                <td>
                     <asp:Label ID="Label3" runat="server" Text="School:" Font-Size="Larger" 
                         Font-Bold="True"></asp:Label>
                   <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                         Height="20px" Width="112px">
                        
                           <asp:ListItem Text="Please Select"></asp:ListItem>
                         <asp:ListItem>SCHOOL OF BUSINESS</asp:ListItem>
                         <asp:ListItem>SCHOOL OF LANGUAGES AND TRANSLATION</asp:ListItem>
                         <asp:ListItem>SCHOOL OF ARTS</asp:ListItem>
                         <asp:ListItem>SCHOOL OF PUBLIC ADMINISTRATION</asp:ListItem>
                         <asp:ListItem>SCHOOL OF PHYSICAL EDUCATION AND SPORTS</asp:ListItem>
                     </asp:DropDownList>
        <asp:Label ID="Label2" runat="server" Text="Programme:" Font-Size="Larger" Font-Bold="True"></asp:Label>
        <asp:DropDownList ID="DropDownList2" runat="server" 
                         DataSourceID="SqlDataSource2" DataTextField="PROGRAM_COMPOSITE_EN" 
                         DataValueField="PROGRAM_COMPOSITE_EN" Height="22px" Width="100px">
                       </asp:DropDownList>&nbsp;<asp:Button ID="Button1" runat="server" 
                        Text="search" CssClass="blue" />
                    &nbsp;&nbsp;&nbsp;&nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:DetailsView ID="DetailsView1" runat="server" CellPadding="3" 
                        DataSourceID="SqlDataSource4" GridLines="Horizontal" Height="335px" 
                        Width="507px" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" 
                        BorderWidth="1px" EmptyDataText="There are no data records to display.">
                        <AlternatingRowStyle BackColor="#F7F7F7" />
                        <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    </asp:DetailsView>
                </td>
                <td>
    <asp:GridView ID="GridView1"   
    runat="server"   
    AutoGenerateColumns="False"  
    CellPadding="4"   
    DataKeyNames="pess_cod"  
    Width="300px"   
    AllowPaging="True"
   
    OnPageIndexChanging="GridView1_PageIndexChanging" style="margin-left: 0px" ForeColor="#333333" 
                        GridLines="None" EmptyDataText="There are no data records to display.">  
        <AlternatingRowStyle BackColor="White" />
    <Columns>  
        <asp:TemplateField   
            HeaderText="student_info"   
            HeaderStyle-HorizontalAlign="Left">  
            <ItemTemplate>  
                <asp:CheckBox   
                    ID="chk1"   
                    runat="server"   
                    Text='<%#DataBinder.Eval(Container.DataItem,"STUDENT_ID") & " " & DataBinder.Eval(Container.DataItem,"NAME_CH") %>' />  
            </ItemTemplate>  

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
        </asp:TemplateField>  
    </Columns>  
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#0095CD" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#0095CD" Font-Bold="True" 
            ForeColor="White" />  
    
        <PagerStyle BackColor="#0095CD" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    
</asp:GridView>  
                </td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    <asp:Button ID="Button2" runat="server" Text="select all" Visible="False" 
                        CssClass="blue" />
                    <asp:Button ID="Button3" runat="server" Text="unselect" Visible="False" 
                        CssClass="blue" />
                    <asp:Button ID="Button4" runat="server" Text="insert" Visible="False" 
                        CssClass="blue" />
                </td>
            </tr>
        </table>
<asp:HiddenField ID="hiddenCatIDs" runat="server" />  
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                         ConnectionString="<%$ ConnectionStrings:EPConnectionString1 %>" 
                         SelectCommand="SELECT distinct [PROGRAM_COMPOSITE_EN] FROM [student_academic_info] WHERE ([SCHOOL_EN] = @SCHOOL_EN)">
                         <SelectParameters>
                             <asp:ControlParameter ControlID="DropDownList1" Name="SCHOOL_EN" 
                                 PropertyName="SelectedValue" Type="String" />
                         </SelectParameters>
                     </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:EPConnectionString1 %>" 
            SelectCommand="SELECT distinct [topicName] FROM [Seminar_Info]"></asp:SqlDataSource>
        <asp:Button ID="Button6" runat="server" Text="delete" 
            Visible="False" CssClass="blue" Height="38px" Width="106px" />
        <br />
        <br />
          <asp:GridView ID="GridView2"   
    runat="server"   
    AutoGenerateColumns="False"  
    CellPadding="4"   
    DataKeyNames="pess_cod"  
    Width="1089px"   
    AllowPaging="True"
   
    OnPageIndexChanging="GridView2_PageIndexChanging" style="margin-left: 0px" ForeColor="#333333" 
                        GridLines="None" Height="16px" PageSize="5">  
        <AlternatingRowStyle BackColor="White" />
    <Columns>  
        <asp:TemplateField   
            HeaderText="student_info"   
            HeaderStyle-HorizontalAlign="Left">  
            <ItemTemplate>  
                <asp:CheckBox   
                    ID="chk2"   
                    runat="server"   
                    Text='<%# DataBinder.Eval(Container.DataItem,"STUDENT_ID")& " " & DataBinder.Eval(Container.DataItem,"NAME_CH") %>' />  
            </ItemTemplate>  

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
        </asp:TemplateField>  
        <asp:BoundField DataField="topicName" HeaderText="Topic" ReadOnly="True" 
            SortExpression="topicName" />
    </Columns>  
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#0095CD" Font-Bold="True" ForeColor="White" />
    <HeaderStyle HorizontalAlign="Center" BackColor="#0095CD" Font-Bold="True" 
            ForeColor="White" />  
    
        <PagerStyle BackColor="#0095CD" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    
</asp:GridView>  
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
            ConnectionString="<%$ ConnectionStrings:EPConnectionString1 %>" 
            
            
            SelectCommand="SELECT distinct [topicName],  [category], [startDate],  [duration], [organizer],[mpi_gen] FROM [Seminar_Info] WHERE ([topicName] = @topicName)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList3" Name="topicName" 
                    PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                         ConnectionString="<%$ ConnectionStrings:EPConnectionString1 %>" 
                          SelectCommand="SELECT [STUDENT_ID], [NAME_CH] FROM [student_academic_info] WHERE (([SCHOOL_EN] = @SCHOOL_EN) AND ([PROGRAM_COMPOSITE_EN] = @PROGRAM_COMPOSITE_EN))">
                         <SelectParameters>
                             <asp:ControlParameter ControlID="DropDownList1" Name="SCHOOL_EN" 
                                 PropertyName="SelectedValue" Type="String" />
                             <asp:ControlParameter ControlID="DropDownList2" Name="PROGRAM_COMPOSITE_EN" 
                                 PropertyName="SelectedValue" Type="String" />
                         </SelectParameters>
                     </asp:SqlDataSource>
                     <asp:HiddenField ID="HiddenField1" runat="server" />
    </div>
    </form>
</body>
</html>