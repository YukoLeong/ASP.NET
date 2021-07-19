<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="studentProfile.aspx.vb" Inherits="ep.studentProfile1" %>


<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit.HTMLEditor" tagprefix="cc1" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            font-family: "Berlin Sans FB";
            font-size: x-large;
        }
        .style2
        {
            font-family: "Berlin Sans FB";
            font-size: xx-large;
        }
        #form1
        {
            height: 75px;
        }
        </style>



    <link rel="stylesheet" href="../button.css" type="text/css" media="screen" />
     <link rel="stylesheet" href="../button1.css" type="text/css" media="screen" />
</head>
<body background="images/profile.gif">
    <form id="form1" runat="server">
    <div>
    
        <span class="style2">Student Profile
        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="blue" 
                  style="margin-left: 232px" Font-Size="Large">Home</asp:LinkButton>
        </span><br class="style1" />
        
    </div>
    
    
    <br />
    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large"></asp:Label>
    <br />
    <br />
   <asp:Button ID="Button1" runat="server" Text="Personal Information" 
        CssClass="blue" />
    &nbsp;
   <asp:Button ID="Button2" runat="server" Text="Education" CssClass="blue" />
    &nbsp;
    <asp:Button ID="Button3" runat="server" Text="Academic Results" CssClass="blue" />
    &nbsp;
    <asp:Button ID="Button4" runat="server" Text="Scholarship" CssClass="blue" />
    &nbsp;
    <asp:Button ID="Button5" runat="server" Text="Result Analysis" 
        CssClass="blue" />
    &nbsp;
   <asp:Button ID="Button6" runat="server" Text="Curriculum Vitae" 
        CssClass="blue" />
    <br />
    <br />
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="ViewPersonal" runat="server">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString4 %>" 
                
                
                
                SelectCommand="SELECT NAME_CH,NAME_PT,SEX, ID_CARD_NUM ,CONVERT(VARCHAR(10),DOB,103) AS Birth,MO_ADDRESS_CH AS Current_Address, ADDRESS_CH AS Permanent_Address FROM [personal_info] WHERE ([PESS_COD] = @PESS_COD)">
                <SelectParameters>
                    <asp:SessionParameter Name="PESS_COD" SessionField="pess_cod" Type="Decimal" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <span class="style1">Personal Information</span><asp:DetailsView 
                ID="DetailsViewPersonal" runat="server" 
                AutoGenerateRows="False" CellPadding="4" 
                DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" 
                Height="50px" Width="615px" Font-Names="Calibri">
                <AlternatingRowStyle BackColor="White" />
                <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                <EditRowStyle BackColor="#2461BF" />
                <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                <Fields>
                    <asp:BoundField DataField="NAME_CH" HeaderText="Chinese Name" 
                        SortExpression="NAME_CH" />
                    <asp:BoundField DataField="NAME_PT" HeaderText="English Name" 
                        SortExpression="NAME_PT" />
                    <asp:BoundField DataField="SEX" HeaderText="Gender" SortExpression="SEX" />
                    <asp:BoundField DataField="ID_CARD_NUM" HeaderText="ID Number" 
                        SortExpression="ID_CARD_NUM" />
                    <asp:BoundField DataField="Birth" HeaderText="Date of Birth" ReadOnly="True" 
                        SortExpression="Birth" />
                    <asp:BoundField DataField="Current_Address" HeaderText="Current Address" 
                        SortExpression="Current_Address" />
                    <asp:BoundField DataField="Permanent_Address" HeaderText="Permanent Address" 
                        SortExpression="Permanent_Address" />
                </Fields>
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#0095CD" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
            </asp:DetailsView>
            <br />
            <br />
            <span class="style1">
            Biography&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button8" runat="server" Text="Edit" CssClass="blue" />
                <asp:Button ID="Button7" runat="server" Text="Update" CssClass="blue" 
                Visible="False" />
            <br />
             <br />
            <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
            <cc1:Editor ID="Editor1" runat="server" Height="200px" Width="550px" 
                Visible="False" />
            <br />
            
            <br />
            </span><br />
            
        </asp:View>
        <asp:View ID="ViewEducation" runat="server">
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString4 %>" 
                
                
                SelectCommand="SELECT [START_YEAR], [END_YEAR], [LEVEL_CH]+' / '+ [LEVEL_EN] AS LEVEL, [SCHOOL_CH]+' / ' + [SCHOOL_EN] AS School FROM [education_info] WHERE ([PESS_COD] = @PESS_COD) ORDER BY [END_YEAR]">
                <SelectParameters>
                    <asp:SessionParameter Name="PESS_COD" SessionField="pess_cod" Type="Decimal" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString4 %>" 
                
                SelectCommand="SELECT STUDENT_ID,SCHOOL_CODE+' / '+SCHOOL_CH+' / '+SCHOOL_EN AS School, PROGRAM_COMPOSITE_CODE,PROGRAM_COMPOSITE_CH,PROGRAM_COMPOSITE_EN,STUDENT_STATUS_EN FROM [student_academic_info] WHERE ([PESS_COD] = @PESS_COD) ORDER BY [PESS_COD] DESC
">
                <SelectParameters>
                    <asp:SessionParameter Name="PESS_COD" SessionField="pess_cod" Type="Decimal" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <span class="style1">Macao Polytechnic Institute</span><asp:DetailsView 
                ID="DetailsView2" runat="server" AllowPaging="True" AutoGenerateRows="False" 
                BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" 
                CellPadding="3" DataSourceID="SqlDataSource5" Font-Names="Calibri" 
                GridLines="Horizontal" Height="50px" Width="691px">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                <Fields>
                    <asp:BoundField DataField="STUDENT_ID" HeaderText="Studnet ID Number" 
                        SortExpression="STUDENT_ID" />
                    <asp:BoundField DataField="School" HeaderText="School(Code/Chinese/English)" 
                        ReadOnly="True" SortExpression="School" />
                    <asp:BoundField DataField="PROGRAM_COMPOSITE_CODE" HeaderText="Programme Code" 
                        SortExpression="PROGRAM_COMPOSITE_CODE" />
                    <asp:BoundField DataField="PROGRAM_COMPOSITE_CH" 
                        HeaderText="Programme Chinese Name" SortExpression="PROGRAM_COMPOSITE_CH" />
                    <asp:BoundField DataField="PROGRAM_COMPOSITE_EN" 
                        HeaderText="Programme English Name" SortExpression="PROGRAM_COMPOSITE_EN" />
                    <asp:BoundField DataField="STUDENT_STATUS_EN" HeaderText="STUDENT STATUS" 
                        SortExpression="STUDENT_STATUS_EN" />
                </Fields>
                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                <PagerStyle BackColor="#0095CD" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            </asp:DetailsView>
            <br />
            <span class="style1">Previous Education Background </span>
            <br />
            <asp:DataList ID="DataList2" runat="server" BackColor="White" 
                BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                DataSourceID="SqlDataSource2" GridLines="Horizontal" Width="690px">
                <AlternatingItemStyle BackColor="#F7F7F7" />
                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                <ItemStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                <ItemTemplate>
                    From:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="START_YEARLabel" runat="server" 
                        Text='<%# Eval("START_YEAR") %>' />
                    <br />
                    <br />
                    To:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="END_YEARLabel" runat="server" Text='<%# Eval("END_YEAR") %>' />
                    <br />
                    <br />
                    Level(Chinese/English):&nbsp;&nbsp;
                    <asp:Label ID="LEVELLabel" runat="server" Text='<%# Eval("LEVEL") %>' />
                    <br />
                    <br />
                    School(Chinese/English):
                    <asp:Label ID="SchoolLabel" runat="server" Text='<%# Eval("School") %>' />
                    <br />
                    <br />
                </ItemTemplate>
                <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            </asp:DataList>
            <br />
        </asp:View>
        <asp:View ID="ViewAcademicResult" runat="server">
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString4 %>" 
                
                SelectCommand="SELECT [PESS_COD], [ACADEMIC_YEAR], [ACADEMIC_SEMESTER], [SUBJECT_CODE], [SUBJECT_CH], [SUBJECT_EN], [SUBJECT_STATUS_EN], [FINAL_MARK], [FINAL_GRADE] FROM [academic_result_info] WHERE ([PESS_COD] = @PESS_COD) ORDER BY [ACADEMIC_YEAR], [ACADEMIC_SEMESTER]">
                <SelectParameters>
                    <asp:SessionParameter Name="PESS_COD" SessionField="pess_cod" Type="Decimal" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <span class="style1">Academic Results</span>
                <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
                AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource3" 
                EmptyDataText="There are no data records to display." Font-Names="Calibri" 
                ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="ACADEMIC_YEAR" HeaderText="Academic Year" 
                        SortExpression="ACADEMIC_YEAR" />
                    <asp:BoundField DataField="ACADEMIC_SEMESTER" HeaderText="Academic Semester" 
                        SortExpression="ACADEMIC_SEMESTER" />
                    <asp:BoundField DataField="SUBJECT_CODE" HeaderText="Subject Code" 
                        SortExpression="SUBJECT_CODE" />
                    <asp:BoundField DataField="SUBJECT_CH" HeaderText="Subject(Chinese)" 
                        SortExpression="SUBJECT_CH" />
                    <asp:BoundField DataField="SUBJECT_EN" HeaderText="Subject(English)" 
                        SortExpression="SUBJECT_EN" />
                    <asp:BoundField DataField="FINAL_MARK" HeaderText="Mark" 
                        SortExpression="FINAL_MARK" />
                    <asp:BoundField DataField="FINAL_GRADE" HeaderText="Grade" 
                        SortExpression="FINAL_GRADE" />
                    <asp:BoundField DataField="SUBJECT_STATUS_EN" HeaderText="Status" 
                        SortExpression="SUBJECT_STATUS_EN" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#0095CD" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#0095CD" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#0095CD" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
        </asp:View>
        <asp:View ID="ViewScholarship" runat="server">
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                ConnectionString="Data Source=172.25.2.64;Initial Catalog=EP;Persist Security Info=True;User ID=ep_client;Password=46709394" 
                ProviderName="System.Data.SqlClient" 
                SelectCommand="SELECT * FROM [scholarship_info] WHERE ([PESS_COD] = @PESS_COD)">
                <SelectParameters>
                    <asp:SessionParameter Name="PESS_COD" SessionField="pess_cod" Type="Decimal" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <span class="style1">Scholarship</span><asp:GridView ID="GridView2" 
                runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                DataSourceID="SqlDataSource4" 
                EmptyDataText="here are no data records to display." Font-Names="Calibri" 
                ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="ANOL_ANO" HeaderText="Year" 
                        SortExpression="ANOL_ANO" />
                    <asp:BoundField DataField="SEMESTRE" HeaderText="Semester" 
                        SortExpression="SEMESTRE" />
                    <asp:BoundField DataField="DESC_CH" HeaderText="Description (Chinese)" 
                        SortExpression="DESC_CH" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#0095CD" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#0095CD" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#0095CD" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
        </asp:View>
        <asp:View ID="View5" runat="server">
            <br />
            <span class="style1">Current Status</span><br />
            <br />
            <br />
            <span class="style1">Active Degree</span><br />
            <br />
            <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString4 %>" 
                SelectCommand="SELECT * FROM [Learining_Records_Experience]">
            </asp:SqlDataSource>
        </asp:View>
    </asp:MultiView>
    <asp:SqlDataSource ID="SqlDataSource7" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString1 %>" 
        SelectCommand="SELECT * FROM [Learning_Records_Correspond]"></asp:SqlDataSource>
    </form>

</body>
</html>
