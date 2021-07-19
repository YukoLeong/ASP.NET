<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ProgramAbility.aspx.vb" Inherits="Student_ProgramAbility" %>

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
        }
           .style11
           {
               font-family: "Berlin Sans FB";
               font-size: xx-large;
               width: 133px;
           }
           .style12
           {
               width: 169px;
           }
           .style13
           {
               font-family: "Berlin Sans FB";
               font-size: xx-large;
               width: 169px;
           }
           .style14
           {
               width: 169px;
               height: 63px;
           }
           .style15
           {
               height: 63px;
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
       <span class="title">Program Ability Management</span>
       <asp:Button ID="home" runat="server" Text="Home" 
            style="font-size:Large; margin-left:115px;" CssClass="blue"/>
              <br /><br />
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
           
               <table class="style5">
            <tr>
                <td class="style6">
                    <asp:Button ID="addAbility" runat="server" Text="Add Program Ability" 
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
                               Width="727px"></asp:ListBox>
                       </td>
                   </tr>
            <tr>
                <td class="style7">
                </td>
                <td class="style8">
                    <asp:Button ID="SearchBtn" runat="server" Text="Search" CssClass="blue" />
                </td>
            </tr>
        </table>
    
       
   
                <asp:GridView ID="GridViewAbility" runat="server" AutoGenerateColumns="False" 
                    Width="1024px" BorderStyle="None" CssClass="GridViewStyle" 
                    GridLines="Horizontal" DataKeyNames="id" 
                    EmptyDataText="There are no data records to display.">
                    <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                    <Columns>
                        <asp:TemplateField HeaderText="Program Ability">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ability") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("ability") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                                    CommandName="Update" Text="Update"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                    CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                    CommandName="Edit" Text="Edit"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                    CommandName="Delete" OnClientClick="DelMessage();" Text="Delete"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle CssClass="GridViewHeaderStyle" />
                    <PagerStyle BackColor="White" HorizontalAlign="Center" />
                    <RowStyle CssClass="GridViewRowStyle" />
                </asp:GridView>

            </asp:View>
            <asp:View ID="View2" runat="server">
            <br />  <br />
                <table class="style5">
                    <tr>
                        <td class="style12">
                            <asp:Label ID="Label2" runat="server" Text="Program Name:" 
                               ></asp:Label>
                           
                        </td>
                        <td class="style11">
                            <asp:ListBox ID="ListBox2" runat="server" DataSourceID="SqlDataSource1" 
                                DataTextField="PROGRAM_COMPOSITE_EN" DataValueField="SIMPLIFY_CODE" 
                                Width="749px"></asp:ListBox>
                            </td>
                    </tr>
                    <tr>
                        <td class="style14" >
                            <asp:Label ID="Label3" runat="server" Text="Program Ability:" 
                                ></asp:Label>
                        </td>
                        <td class="style15">
                            <asp:TextBox ID="ability" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                   
                    <tr>
                        <td class="style13">
                        
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
    <asp:hiddenfield ID="delmsg" runat="server"></asp:hiddenfield>
     </div>
     </div>
    </form>
</body>
</html>
