<%@ Page Language="VB" AutoEventWireup="false" CodeFile="SeminarMark.aspx.vb" Inherits="Operator_SeminarMark" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
         .style5
        {
            font-family: "Berlin Sans FB";
            font-size: xx-large;
        }
        .style6
        {
            width: 100%;
        }
        .style7
        {
        }
        .style10
        {
            width: 84px;
        }
    </style>
    <link rel="stylesheet" href="../button.css" type="text/css" media="screen" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
   
                    <asp:Panel ID="Panel1" runat="server" Height="280px" 
        Width="240px">
        <asp:Label ID="Label1" runat="server" ForeColor="Blue"></asp:Label>
        <br />
        <asp:Label ID="Label4" runat="server" ForeColor="Red"></asp:Label>
        <br />
        <asp:Label ID="Label3" runat="server" Font-Bold="True" 
            Font-Size="Larger" Text="Seminar Information"></asp:Label>
                        <table class="style6">
                            <tr>
                                <td class="style7" colspan="2">
                                    <asp:DetailsView ID="DetailsView1" runat="server" 
                                        AutoGenerateRows="False" DataSourceID="SqlDataSource2" 
                                        Height="50px" Width="232px" DataKeyNames="id">
                                        <Fields>
                                            <asp:BoundField DataField="topicName" HeaderText="Topic Name:" 
                                                SortExpression="topicName" />
                                            <asp:BoundField DataField="category" HeaderText="Category:" 
                                                SortExpression="category" />
                                            <asp:BoundField DataField="startDate" HeaderText="Date:" 
                                                SortExpression="startDate" />
                                            <asp:BoundField DataField="duration" HeaderText="Duration:" 
                                                SortExpression="duration" />
                                            <asp:BoundField DataField="organizer" HeaderText="Organizer:" 
                                                SortExpression="organizer" />
                                        </Fields>
                                    </asp:DetailsView>
                                </td>
                            </tr>
                            <tr>
                                <td class="style10">
                                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Large" 
                                        Text="Card NO:"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox1" runat="server" style="margin-bottom: 0px" 
                                        Width="119px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style10">
                                    &nbsp;</td>
                                <td>
                                    <asp:Button ID="Button1" runat="server" 
                                        style="margin-left: 0px" Text="insert" />
                                </td>
                            </tr>
                        </table>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:EPConnectionString4 %>" 
                            SelectCommand="SELECT [PESS_COD] FROM [student_academic_info] WHERE ([card_snr] = @card_snr)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="TextBox1" Name="card_snr" PropertyName="Text" 
                                    Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                     
                        <asp:HiddenField ID="key" runat="server" />
    </asp:Panel>
     </div>
           </form>
        
</body>
</html>
