<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ProgramCourse.aspx.vb" Inherits="Student_ProgramCourse" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
     <link rel="stylesheet" href="../button.css" type="text/css" media="screen" />
  <link rel="stylesheet" href="../teachGrid.css" type="text/css" media="screen" />
  	<link rel="stylesheet" type="text/css" href="../resources/demo.css"/>

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
            font-size: xx-large;
               width: 132px;
           }
           .style11
           {
               font-family: "Berlin Sans FB";
               font-size: xx-large;
               width: 133px;
           }
           .style16
           {
               width: 219px;
           }
           .style17
           {
               font-family: "Berlin Sans FB";
               font-size: xx-large;
               width: 219px;
           }
		   .title
           {
            font-family: "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", sans-serif; 
            font-size:28px;
           }
          #wrapper
          {
            width: 1100px;
            min-height:950px;
            margin-left: auto;
            margin-right: auto;
            background-color:White;
            border-left: solid black 1px;
            border-right: solid black 1px;
          }
        
          #content
          {
            min-height:900px;
            margin-left: 5px;
            margin-right: 5px;
          }
        </style>
</head>
<body background="../images/bg-blue.jpg">
<script type="text/javascript">

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
     <div id="wrapper">
    <div id="content">
	<br />
	<br />
    <div>
      <span class="title">Subject Ability Management</span>
          <asp:Button ID="home" runat="server" Text="Home" 
            style="font-size:Large; margin-left:115px;" CssClass="blue"/>
              <br /><br />
         <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
               <table class="style5">
            <tr>
                <td class="style6">
                    <asp:Button ID="addAbility" runat="server" Text="Add Subject Ability" 
                        CssClass="blue" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
                   <tr>
                       <td class="style6">
                           <asp:Label ID="Label1" runat="server" Text="Program Name:" 
                             ></asp:Label>
                       </td>
                       <td>
                           <asp:ListBox ID="ListBox1" runat="server" 
                               Width="727px" AutoPostBack="True"></asp:ListBox>
                       </td>
                   </tr>
                   <tr>
                       <td class="style6">
                           <asp:Label ID="Label2" runat="server" Text="Subject Year:" 
                               ></asp:Label>
                       </td>
                       <td>
                           <asp:ListBox ID="ListBox2" runat="server" AutoPostBack="True" Width="220px">
                           </asp:ListBox>
                       </td>
                   </tr>
                   <tr>
                       <td>
                           <asp:Label ID="Label3" runat="server" Text="Subject:" 
                               ></asp:Label>
                       </td>
                       <td class="style10">
                           <asp:ListBox ID="ListBox3" runat="server" DataSourceID="SqlDataSource2" 
                               DataTextField="subject" DataValueField="SUBJECT_CODE" Width="722px" 
                               Height="166px">
                           </asp:ListBox>
                       </td>
                   </tr>
            <tr>
                <td class="style7">
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" SelectCommand="SELECT distinct SUBJECT_CODE, [SUBJECT_CODE]+'  '+[SUBJECT_CH]+'  '+[SUBJECT_EN] AS subject FROM [academic_result_info]
where SUBSTRING(SUBJECT_CODE,5,1) =@year and PROGRAM_COMPOSITE_CODE=@code">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ListBox2" Name="year" 
                                PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="ListBox1" Name="code" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td class="style8">
                    <asp:Button ID="SearchBtn" runat="server" Text="Search" CssClass="blue" />
                </td>
            </tr>
        </table>
                     <asp:Label ID="code" runat="server" Text="Subject Code:" 
                            ForeColor="Black" style="font-size:larger;margin-left:0px;" 
                    Font-Bold="True" Visible="False"  ></asp:Label>&nbsp
            <asp:Label ID="subCode" runat="server"></asp:Label>
                <br />  <br /> 
                <asp:Label ID="cname" runat="server" Text="Subject Chinese Name:" 
                            style="font-size:larger;margin-left:0px;" Font-Bold="True" 
                    ForeColor="Black" Visible="False"  ></asp:Label>&nbsp
            <asp:Label ID="subcname" runat="server"></asp:Label>
                <br /> <br />
                   <asp:Label ID="pname" runat="server" Text="Subject English Name:" 
                            style="font-size:larger;margin-left:0px;" Font-Bold="True" 
                    ForeColor="Black" Visible="False"  ></asp:Label>&nbsp
            <asp:Label ID="subpname" runat="server"></asp:Label>
                <br /> <br />

        <asp:GridView ID="GridViewAbility" runat="server" AutoGenerateColumns="False" 
                    GridLines="Horizontal" BorderStyle="None" CssClass="GridViewStyle" 
                    DataKeyNames="id" EmptyDataText="There are no data records to display.">
                    <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                    <Columns>
                        <asp:BoundField DataField="ability" HeaderText="Program Ability" >
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                    CommandName="Delete"  OnClientClick="DelMessage();" Text="Delete"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle CssClass="GridViewHeaderStyle" />
                    <RowStyle CssClass="GridViewRowStyle" />
                </asp:GridView>
       </asp:View>
            <asp:View ID="View2" runat="server">
        <br />  <br />
      <table class="style5">
                    <tr>
                        <td class="style16">
                            <asp:Label ID="Label4" runat="server" Text="Program Name:" 
                              ></asp:Label>
                           
                        </td>
                        <td class="style11">
                            <asp:ListBox ID="ListBox4" runat="server" 
                                Width="749px" AutoPostBack="True"></asp:ListBox>
                            </td>
                    </tr>
                    <tr>
                        <td class="style16">
                            <asp:Label ID="Label5" runat="server" 
                                Text="Program Ability:"></asp:Label>
                        </td>
                        <td class="style11">
                            <asp:ListBox ID="ListBox7" runat="server" Width="316px" 
                                DataSourceID="SqlDataSource3" DataTextField="ability" 
                                DataValueField="id" AutoPostBack="True">
                            </asp:ListBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style16">
                            <asp:Label ID="Label6" runat="server" 
                                Text="Subject Year:"></asp:Label>
                        </td>
                        <td class="style11">
                            <asp:ListBox ID="ListBox5" runat="server" Width="220px" AutoPostBack="True">
                            </asp:ListBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style16">
                            <asp:Label ID="Label7" runat="server" Text="Subject:" 
                                ></asp:Label>
                        </td>
                        <td>
                            <asp:ListBox ID="ListBox6" runat="server" DataSourceID="SqlDataSource4" 
                                DataTextField="subject" DataValueField="SUBJECT_CODE" Width="745px" 
                                Height="166px">
                            </asp:ListBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style17">
                            <asp:Button ID="backBtn" runat="server" Text="Back" CssClass="blue" />
                        </td>
                        <td>
                            <asp:Button ID="abilityIns" runat="server" Text="Insert" CssClass="blue" />
                        </td>
                    </tr>
                </table>
                

     </asp:View>
        </asp:MultiView>
    
        </div>
     
        
   
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
        
        SelectCommand="SELECT * FROM [program_info] WHERE ([SIMPLIFY_CODE] = @SIMPLIFY_CODE)">
        <SelectParameters>
            <asp:SessionParameter Name="SIMPLIFY_CODE" SessionField="programForAbility" 
                Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
     
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
        SelectCommand="SELECT [id],[ability] FROM [ProgramAbility] WHERE ([program_code] = @program_code)">
        <SelectParameters>
            <asp:ControlParameter ControlID="ListBox4" Name="program_code" 
                PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" SelectCommand="SELECT distinct  [SUBJECT_CODE],[SUBJECT_CODE]+'  '+[SUBJECT_CH]+'  '+[SUBJECT_EN] AS subject FROM [academic_result_info]
where SUBSTRING(SUBJECT_CODE,5,1) =@year and PROGRAM_COMPOSITE_CODE=@code">
        <SelectParameters>
            <asp:ControlParameter ControlID="ListBox5" Name="year" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="ListBox4" Name="code" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
      <asp:hiddenfield ID="delmsg" runat="server"></asp:hiddenfield>
     </div>
     </div>
    </form>
</body>
</html>
