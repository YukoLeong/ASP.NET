<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Career3.aspx.vb" Inherits="Student_Career3" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit.HTMLEditor" tagprefix="cc1" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

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
        #form1
        {
            height: 337px;
        }
        .style3
        {
            width: 98%;
        }
        .style4
        {
            width: 496px;
        }
        .style8
        {
            height: 293px;
        }
        .style10
        {
            width: 8px;
        }
        .style11
        {
            height: 293px;
            width: 8px;
        }
        .style12
        {
            width: 496px;
            height: 293px;
        }
        .style13
        {
            width: 100%;
        }
        .style14
        {
            width: 192px;
        }
    </style>
     <link rel="stylesheet" href="../button.css" type="text/css" media="screen" />
</head>
<body style="height: 421px" background="images/job_background.gif">
    <form id="form1" runat="server">
    <div class="style1">
    
       Job Matching Simulation
          <asp:LinkButton ID="LinkButton1" runat="server" CssClass="blue" 
                  style="margin-left: 232px" Font-Size="Large">Home</asp:LinkButton>
        </div>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString4 %>" 
        OldValuesParameterFormatString="original_{0}" 
        
        
        
        
        
        SelectCommand="SELECT * FROM [CareerPlanning] WHERE ([pess_cod] = @pess_cod) ORDER BY [careerPlanning]" 
        DeleteCommand="DELETE FROM [CareerPlanning] WHERE [id] = @original_id" 
        InsertCommand="INSERT INTO [CareerPlanning] ([pess_cod], [careerPlanning], [description], [planningDate], [Professional_Competence], [Leadership], [Communication], [Creativity], [Initiative], [Self_Development], [Social_Responsibility], [Language], [IT_Application], [makePublic], [getComment], [askForComment]) VALUES (@pess_cod, @careerPlanning, @description, @planningDate, @Professional_Competence, @Leadership, @Communication, @Creativity, @Initiative, @Self_Development, @Social_Responsibility, @Language, @IT_Application, @makePublic, @getComment, @askForComment)" 
        UpdateCommand="UPDATE [CareerPlanning] SET [pess_cod] = @pess_cod, [careerPlanning] = @careerPlanning, [description] = @description, [planningDate] = @planningDate, [Professional_Competence] = @Professional_Competence, [Leadership] = @Leadership, [Communication] = @Communication, [Creativity] = @Creativity, [Initiative] = @Initiative, [Self_Development] = @Self_Development, [Social_Responsibility] = @Social_Responsibility, [Language] = @Language, [IT_Application] = @IT_Application, [makePublic] = @makePublic, [getComment] = @getComment, [askForComment] = @askForComment WHERE [id] = @original_id">
        <DeleteParameters>
            <asp:Parameter Name="original_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
          <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
            <asp:Parameter Name="careerPlanning" Type="String" />
            <asp:Parameter Name="description" Type="String" />
            <asp:Parameter DbType="Date" Name="planningDate" />
            <asp:Parameter Name="Professional_Competence" Type="Int32" />
            <asp:Parameter Name="Leadership" Type="Int32" />
            <asp:Parameter Name="Communication" Type="Int32" />
            <asp:Parameter Name="Creativity" Type="Int32" />
            <asp:Parameter Name="Initiative" Type="Int32" />
            <asp:Parameter Name="Self_Development" Type="Int32" />
            <asp:Parameter Name="Social_Responsibility" Type="Int32" />
            <asp:Parameter Name="Language" Type="Int32" />
            <asp:Parameter Name="IT_Application" Type="Int32" />
            <asp:Parameter Name="makePublic" Type="Boolean" />
            <asp:Parameter Name="getComment" Type="Boolean" />
            <asp:Parameter Name="askForComment" Type="Boolean" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
        </SelectParameters>
        <UpdateParameters>
           <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
            <asp:Parameter Name="careerPlanning" Type="String" />
            <asp:Parameter Name="description" Type="String" />
            <asp:Parameter DbType="Date" Name="planningDate" />
            <asp:Parameter Name="Professional_Competence" Type="Int32" />
            <asp:Parameter Name="Leadership" Type="Int32" />
            <asp:Parameter Name="Communication" Type="Int32" />
            <asp:Parameter Name="Creativity" Type="Int32" />
            <asp:Parameter Name="Initiative" Type="Int32" />
            <asp:Parameter Name="Self_Development" Type="Int32" />
            <asp:Parameter Name="Social_Responsibility" Type="Int32" />
            <asp:Parameter Name="Language" Type="Int32" />
            <asp:Parameter Name="IT_Application" Type="Int32" />
            <asp:Parameter Name="makePublic" Type="Boolean" />
            <asp:Parameter Name="getComment" Type="Boolean" />
            <asp:Parameter Name="askForComment" Type="Boolean" />
            <asp:Parameter Name="original_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <div>
    
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Student/CareerForm.aspx" style="float:right;margin-right:258px;">招聘登記</asp:HyperLink>
    </div>
    <asp:Button ID="Button1" runat="server" Text="Add Planning" CssClass="blue" />
    <br />
  <br />
         <asp:GridView ID="GridViewCareer" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" 
        CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1" 
        EmptyDataText="There are no data records to display." Font-Names="Calibri" 
        ForeColor="#333333" GridLines="None" PageSize="5" 
        style="z-index: 1; left: 15px; top: 75px;  " Font-Size="Small" Width="707px" >

        
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="careerPlanning" HeaderText="Date" 
                SortExpression="careerPlanning" />
            <asp:BoundField DataField="Professional_Competence" HeaderText="Professional Competence" 
                SortExpression="Professional_Competence" />
            <asp:BoundField DataField="Leadership" HeaderText="Leadership" 
                SortExpression="Leadership" />
            <asp:BoundField DataField="Communication" 
                HeaderText="Communication" SortExpression="Communication" />
            <asp:BoundField DataField="Creativity" HeaderText="Creativity" 
                SortExpression="Creativity" />
            <asp:BoundField DataField="Initiative" HeaderText="Initiative" 
                SortExpression="Initiative" />
            <asp:BoundField DataField="Self_Development" HeaderText="Self Development" 
                SortExpression="Self_Development" />
            <asp:BoundField DataField="Social_Responsibility" 
                HeaderText="Social Responsibility" SortExpression="Social_Responsibility" />
            <asp:BoundField DataField="Language" HeaderText="Language" 
                SortExpression="Language" />
            <asp:BoundField DataField="IT_Application" HeaderText="IT Application" 
                SortExpression="IT_Application" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#0095CD" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#0095CD" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#0095CD" ForeColor="White" 
            HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" ForeColor="#333333" Font-Bold="True" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
         
    
    <br />
    <asp:Label ID="LabelDetail" runat="server" Font-Names="Berlin Sans FB" 
        Font-Size="X-Large" Text="Planning Detail" Visible="False"></asp:Label>
    <br />
    <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString4 %>" 
        SelectCommand="SELECT * FROM [CareerAttribute2]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource7" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString4 %>" 
        SelectCommand="SELECT * FROM [CareerAttribute2]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource8" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString4 %>" 
        SelectCommand="SELECT * FROM [CareerAttribute2] ORDER BY [Industry]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource9" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString4 %>" 
        SelectCommand="SELECT * FROM [CategoryWeight] WHERE ([programme] = @programme)">
        <SelectParameters>
            <asp:SessionParameter Name="programme" SessionField="programme" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource15" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString4 %>" 
        SelectCommand="SELECT distinct Industry FROM [CareerAttribute2]"></asp:SqlDataSource>
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <table class="style3">
        <tr>
            <td class="style4">
                <strong>Careers Category:</strong></td>
            <td class="style10">
                </td>
            <td>                
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" 
                    OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True">
                </asp:DropDownList>
                <br />
                <br />
                <strong>Career Match with:</strong><asp:RadioButtonList ID="RadioMatch" runat="server" AutoPostBack="True" 
                    RepeatDirection="Horizontal">
                    <asp:ListItem Value="all" Selected="True">All</asp:ListItem>
                    <asp:ListItem Value="Current_Status">Current Status</asp:ListItem>
                    <asp:ListItem Value="MPI_Attribute">Program Attribute</asp:ListItem>
                    <asp:ListItem Value="Graduation_Status">Graduation Status (Estimate)</asp:ListItem>
                </asp:RadioButtonList>

&nbsp;<asp:Label ID="MatchResultLable" runat="server" EnableViewState="False" ForeColor="Red"></asp:Label>
            </td>
            <td class="style10">
                </td>
            <td class="style4">
                
                <strong>
                <br />
                Attribute Analysis:<br />
                </strong>
                
                <asp:CheckBox ID="chkStatus" runat="server" AutoPostBack="True" 
                    Text="Current Status" />
                <asp:CheckBox ID="chkMPIattribute" runat="server" AutoPostBack="True" 
                    Text="Program Attribute" />
                <asp:CheckBox ID="chkCareer" runat="server" AutoPostBack="True" Text="Career" 
                    Checked="True" />
                <asp:DropDownList ID="DropDownCareer" runat="server" AutoPostBack="True" 
                    DataSourceID="SqlDataSource6" DataTextField="career" 
                    DataValueField="career" Visible="False">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style8">
                &nbsp;<strong><asp:ListBox ID="MatchList" 
                    runat="server" AutoPostBack="True"  DataSourceId="SqlDataSource8" DataTextField="career" DataValueField="career"
                    Height="382px" Width="562px"></asp:ListBox>
                </strong></td>

            <td class="style11">
                </td>
            <td class="style12">
            <asp:Chart ID="Chart_Total" runat="server" Width="565px" Height="382px" 
                    style="margin-top: 20px">
                                                           
                                                     <ChartAreas>
                                                            <asp:ChartArea Name="ChartArea1">
                                                               
                                                            </asp:ChartArea>
                                                           
                                                        </ChartAreas>
                                                         <Legends>
                                                             <asp:Legend Docking="Bottom" Name="Legend1">
                                                             </asp:Legend>
                                                        </Legends>
                                                           
                                                    </asp:Chart>
              </td>
        </tr>
        <tr>
            <td class="style4">
                &nbsp;</td>
            <td class="style10">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <br />
    
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString1 %>" 
        SelectCommand="SELECT * FROM [Ability]"></asp:SqlDataSource>
    
    <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString1 %>" 
        SelectCommand="SELECT * FROM [Ability]"></asp:SqlDataSource>
    
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString1 %>" 
        SelectCommand="SELECT * FROM [CareerPlanning]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource10" runat="server" 
            ConnectionString="<%$ ConnectionStrings:EPConnectionString4 %>" 
            SelectCommand="SELECT [professional], [leadership], [communication], [comprehension], [expression], [initiative], [self_enhancement], [civil_responsibility], [language], [it_application] FROM [seminarAttribute]">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource11" runat="server" 
            ConnectionString="<%$ ConnectionStrings:EPConnectionString4 %>" 
            
        SelectCommand="SELECT * FROM [Learning_Records_Correspond] WHERE ([PESS_COD] = @PESS_COD)">
            <SelectParameters>
                <asp:SessionParameter Name="PESS_COD" SessionField="pess_cod" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
         <asp:SqlDataSource ID="SqlDataSource12" runat="server" 
            ConnectionString="<%$ ConnectionStrings:EPConnectionString4 %>" 
            SelectCommand="SELECT * FROM [AbilityColor]"></asp:SqlDataSource>
          <asp:SqlDataSource ID="SqlDataSource16" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString4 %>" 
        SelectCommand="SELECT distinct Industry FROM [CareerAttribute2]">
    </asp:SqlDataSource>
          <asp:SqlDataSource ID="SqlDataSource13" runat="server" 
            ConnectionString="<%$ ConnectionStrings:EPConnectionString4 %>" 
            SelectCommand="SELECT * FROM [Learning_Records_Ability]">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource14" runat="server" 
            ConnectionString="<%$ ConnectionStrings:EPConnectionString4 %>" 
            SelectCommand="SELECT [professional], [leadership], [communication], [comprehension], [expression], [initiative], [self_enhancement], [civil_responsibility], [language], [it_application] FROM [abilityMatrix] WHERE ([pess_cod] = @pess_cod)">
            <SelectParameters>
                <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
            </SelectParameters>
        </asp:SqlDataSource>

    <br />
    </form>
</body>
</html>
