<%@ Page Language="VB" AutoEventWireup="false" CodeFile="SeminarAdding.aspx.vb" Inherits="SystemAdmin_SeminarAdding" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link rel="stylesheet" href="../login.css" type="text/css" media="screen" />
    <style type="text/css">
        .style1
        {
            width: 181%;
            height: 48px;
        }
         .style3
        {
            font-family: "Berlin Sans FB";
            font-size: xx-large;
        }
        .styled
        {
            margin-left: 14px;
        }
        .style6
        {
            width: 100%;
        }
        .style15
        {
            width: 172px;
        }
        .style18
        {
            width: 1359px;
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
        </style>
<link rel="stylesheet" href="../button.css" type="text/css" media="screen" />
<script>
    function myFunction() {
        var student = prompt("Please enter student ID number:");

        if (student) {
            document.getElementById("HiddenText").value = student;

            return true;
        }
        if (student=="") {
            alert("Invaild Student ID!");

            return false;
        }
        else {
           
            return false;
        }
    }
</script>
</head>
<body background="../images/church.gif">
    <form id="form1" runat="server">
    <span class="style3">Seminar/Conference</span>
        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="blue" 
                  style="margin-left: 132px" Font-Size="Large">Home</asp:LinkButton>
                  <br />
    <div>
    <br />
    <br />
        <table class="style1">
            <tr>
                <td class="style15">
    <asp:Label ID="Label1" runat="server" Text="Seminar Year:" Font-Size="Larger"  Font-Bold="True"></asp:Label>
   
                    <br />

                 </td>
                <td class="style18">
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:ListBox ID="ListBox1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource5" 
                    DataTextField="year" DataValueField="year" Width="195px"></asp:ListBox>
                </td>
            </tr>
            <tr>
                <td class="style15">
                    
                      <asp:Label ID="Label4" runat="server" Text="Seminar Topic:" Font-Size="Larger" 
                        Font-Bold="True"></asp:Label>
                   
                </td>
                <td class="style18">
        
  
                <asp:ListBox ID="ListBox2" runat="server" DataSourceID="SqlDataSource3" 
                    DataTextField="topicName" DataValueField="id" Width="420px" 
                    Height="121px" style="margin-left: 23px">
                </asp:ListBox>
        
  
                </td>
            </tr>
            <tr>
                <td class="style15">

                     <asp:Label ID="Label3" runat="server" Text="School:" Font-Size="Larger" 
                         Font-Bold="True"></asp:Label>
                    </td>
                <td class="style18">
        
         <input type="hidden" id="HiddenText" runat="server" />
                   <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                         Height="20px" Width="335px" style="margin-left: 23px" 
                        DataSourceID="SqlDataSource8" DataTextField="SCHOOL_EN" 
                        DataValueField="SCHOOL_CODE">
                        
                     </asp:DropDownList>



                                                
                </td>
                
            </tr>
            <tr><td>
        <asp:Label ID="Label2" runat="server" Text="Programme:" Font-Size="Larger" Font-Bold="True"></asp:Label>
            </td>
            <td class="style18">
   


        <asp:DropDownList ID="DropDownList2" runat="server" 
                         DataSourceID="SqlDataSource2" DataTextField="PROGRAM_COMPOSITE_EN" 
                         DataValueField="CODE" Height="22px" Width="335px" 
                            style="margin-left: 24px">
                       </asp:DropDownList>
   


                 


                    </td>
              </tr>

              <tr><td></td>
              
              <td class="style18">&nbsp&nbsp&nbsp&nbsp&nbsp
                          <asp:Button ID="Button1" runat="server" 
                        Text="Show" CssClass="blue" />
                        <asp:Button ID="Button7" runat="server" Text="Search by Student ID" OnClick="Button7_Click" OnClientClick="return myFunction()"
                            CssClass="blue" />
                        
                    <asp:Button ID="Button8" runat="server" Text="View Students'Attendance" 
                            CssClass="blue" />
                                 </td>
              <td></td>
             <td></td>
              </tr>
        </table>

     
   


        <asp:SqlDataSource ID="SqlDataSource7" runat="server"></asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource8" runat="server" 
            ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
            SelectCommand="SELECT * FROM [school_info] WHERE ([SCHOOL_CODE] != @SCHOOL_CODE)">
            <SelectParameters>
                <asp:Parameter DefaultValue="N/A" Name="SCHOOL_CODE" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
   
        <asp:SqlDataSource ID="SqlDataSource9" runat="server" 
            ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
            SelectCommand="SELECT * FROM [Learning_Records_Experience]"></asp:SqlDataSource>
   
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="View1" runat="server">
               <asp:GridView ID="GridView3" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" 
                    GridLines="Horizontal" Visible="False" Width="100%" BorderStyle="None" 
                    DataKeyNames="ALUN_NUMERO,ALUN_NUMERO_SEQ">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" />
                        <asp:BoundField DataField="startDate" HeaderText="Date" 
                            SortExpression="startDate">
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="topicName" HeaderText="Topic" 
                            SortExpression="topicName">
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="student_id" HeaderText="Student ID" 
                            SortExpression="student_id">
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="name_ch" HeaderText="Name(Chinese)" 
                            SortExpression="name_ch">
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                    </Columns>
                    <HeaderStyle BackColor="White" ForeColor="Black" Height="40px" />
                    <PagerStyle BackColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3E3E3" CssClass="row" Height="40px" />
                </asp:GridView>
       
                <br />
                   <asp:Label ID="Label5" runat="server" Text="Number Of Students:" Visible="False" 
                            ForeColor="Blue" Font-Size="X-Large"></asp:Label>
                    <asp:Label ID="Label6" runat="server" Visible="False" ForeColor="Red" 
                    Font-Size="X-Large"></asp:Label>
                        

            </asp:View>
            <asp:View ID="View2" runat="server">

                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" DataKeyNames="ALUN_NUMERO,ALUN_NUMERO_SEQ" 
                    EmptyDataText="There are no data records to display." 
                    GridLines="Horizontal" OnPageIndexChanging="GridView1_PageIndexChanging" 
                    style="margin-left: 0px" Width="100%" BorderStyle="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderStyle-HorizontalAlign="Left" 
                            HeaderText="Student Information">
                            <ItemTemplate>
                                <asp:CheckBox ID="chk1" runat="server" 
                                    Text='<%#DataBinder.Eval(Container.DataItem,"STUDENT_ID") & " " & DataBinder.Eval(Container.DataItem,"NAME_CH") %>' />
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle BackColor="White" Height="40px" />
                    <PagerStyle BackColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3E3E3" Height="40px" CssClass="row" />
                </asp:GridView>
                <br />
                <asp:Button ID="Button2" runat="server" CssClass="blue" Text="Select All" 
                    Visible="False" />
                <asp:Button ID="Button3" runat="server" CssClass="blue" Text="Unselect" 
                    Visible="False" />
                <asp:Button ID="Button4" runat="server" CssClass="blue" Text="Insert" 
                    Visible="False" />
                <br />

            </asp:View>
            <asp:View ID="View3" runat="server">

                <asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" BorderStyle="None" 
                    DataKeyNames="ALUN_NUMERO,ALUN_NUMERO_SEQ" GridLines="Horizontal" Height="16px" 
                    OnPageIndexChanging="GridView2_PageIndexChanging" PageSize="5" 
                    style="margin-left: 0px" Width="100%">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderStyle-HorizontalAlign="Left" 
                            HeaderText="Student Information">
                            <ItemTemplate>
                                <asp:CheckBox ID="chk2" runat="server" 
                                    Text='<%# DataBinder.Eval(Container.DataItem,"STUDENT_ID")& " " & DataBinder.Eval(Container.DataItem,"NAME_CH") %>' />
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="topicName" HeaderText="Topic" ReadOnly="True" 
                            SortExpression="topicName">
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                    </Columns>
                    <HeaderStyle BackColor="White" Height="40px" HorizontalAlign="Center" />
                    <PagerStyle BackColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3E3E3" CssClass="row" Height="40px" />
                </asp:GridView>
                <br />
                <asp:Button ID="Button6" runat="server" Text="Delete" CssClass="blue" 
                            Height="38px" Width="106px" />
                <asp:HiddenField ID="topicNameForAdd" runat="server" />
                <asp:HiddenField ID="toipcNameForDel" runat="server" />
            </asp:View>

        </asp:MultiView>

            <table class="style6">
                <tr>
                    <td>
                        </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>

            
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
            ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
            
            
            
            SelectCommand="SELECT distinct [topicName],  [category], [startDate],  [duration], [organizer],[mpi_gen] FROM [Seminar_Info] WHERE ([topicName] = @topicName)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ListBox2" Name="topicName" 
                    PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                         ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                          SelectCommand="SELECT [STUDENT_ID], [NAME_CH] FROM [student_academic_info] WHERE (([SCHOOL_CODE] = @SCHOOL_CODE) AND ([PROGRAM_COMPOSITE_EN] = @PROGRAM_COMPOSITE_EN))">
                         <SelectParameters>
                             <asp:ControlParameter ControlID="DropDownList1" Name="SCHOOL_CODE" 
                                 PropertyName="SelectedValue" Type="String" />
                             <asp:ControlParameter ControlID="DropDownList2" Name="PROGRAM_COMPOSITE_EN" 
                                 PropertyName="SelectedValue" Type="String" />
                         </SelectParameters>
                     </asp:SqlDataSource>
                      <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                SelectCommand="SELECT * FROM [userGroup] WHERE ([id] = @id)">
                <SelectParameters>
                    <asp:SessionParameter Name="id" SessionField="Role_Type" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
                     <asp:HiddenField ID="HiddenField1" runat="server" />
                     <asp:HiddenField ID="hiddenCatIDs" runat="server" />
                     <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                         ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                         
            
            SelectCommand="SELECT [CODE], [PROGRAM_COMPOSITE_EN], [SCHOOL_CODE] FROM [program_info] WHERE ([SCHOOL_CODE] = @SCHOOL_CODE)">
                         <SelectParameters>
                             <asp:ControlParameter ControlID="DropDownList1" Name="SCHOOL_CODE" 
                                 PropertyName="SelectedValue" />
                         </SelectParameters>
                     </asp:SqlDataSource>
                     <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
            
            
            
            SelectCommand="SELECT distinct [topicName],id FROM [Seminar_Info] where  year([startDate])=@year">
            <SelectParameters>
                <asp:ControlParameter ControlID="ListBox1" Name="year" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
            ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
            SelectCommand="SELECT  distinct year([startDate]) as year FROM [Seminar_Info] ORDER BY year DESC">
        </asp:SqlDataSource>
        <asp:HiddenField ID="ALUN_NUMERO" runat="server" />
        <asp:HiddenField ID="ALUN_NUMERO_SEQ" runat="server" />
    </div>
    </form>
</body>
</html>