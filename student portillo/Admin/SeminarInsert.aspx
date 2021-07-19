<%@ Page Language="VB" AutoEventWireup="false" CodeFile="SeminarInsert.aspx.vb" Inherits="Operator_SeminarInsert" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link rel="stylesheet" href="../button.css" type="text/css" media="screen" />
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
        .style15
        {
            width: 251px;
        }
        .style18
        {
            width: 1359px;
        }
        .style19
        {
            width: 251px;
            height: 20px;
        }
        .style20
        {
            width: 1359px;
            height: 20px;
        }
        #ImageButton2{
            width:14%;
        }

        </style>
</head>
<body background="../images/church.gif">
    <form id="form1" runat="server">
    <div>
      <span class="style3">Seminar/Conference</span>
 <%--       <asp:LinkButton ID="Home" runat="server" CssClass="blue" 
                  style="margin-left: 132px" Font-Size="Large">Home</asp:LinkButton>--%>
    <div style="text-align:center;margin-top:-32px;padding-bottom:12px;width:1005px">
               <asp:ImageButton ID="ImageButton2" runat="server" onmouseover="this.src='../images/homeblue_hover.png'" onmouseout="this.src='../images/homeblue.png'" ImageUrl="~/images/homeblue.png" /> 
    </div>

                  <br />
                    <br />
                     <br />
                  <table class="style1">
            <tr>
                <td class="style15">
    <asp:Label ID="SemYear" runat="server" Text="Seminar Year:" Font-Size="Larger"  Font-Bold="True"></asp:Label>
   
                    <br />

                 </td>
                <td class="style18">
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:ListBox ID="yearList" runat="server" AutoPostBack="True" DataSourceID="year" 
                    DataTextField="year" DataValueField="year" Width="195px"></asp:ListBox>
                </td>
            </tr>
            <tr>
                <td class="style15">
                  <asp:Label ID="SemCategory" runat="server" Text="Seminar Category:" Font-Size="Larger"  Font-Bold="True"></asp:Label></td>
                <td class="style18">  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <asp:ListBox ID="categoryList" runat="server" Width="195px" AutoPostBack="True" 
                        DataSourceID="category" DataTextField="category" 
                        DataValueField="category"></asp:ListBox>
                </td>
            </tr>
            <tr>
                <td class="style15">
                    
                      <asp:Label ID="Topic" runat="server" Text="Seminar Topic:" Font-Size="Larger" 
                        Font-Bold="True"></asp:Label>
                   
                </td>
                <td class="style18">
        
  
                <asp:ListBox ID="TopicList" runat="server" DataSourceID="topicSrc" 
                    DataTextField="topicName" DataValueField="id" Width="420px" 
                    Height="121px" style="margin-left: 23px" AutoPostBack="True">
                </asp:ListBox>
        
  
                </td>
            </tr>
            <tr>
                <td class="style15">

                   <asp:Label ID="StuID" runat="server" Text="Student Library Number:" Font-Size="Larger" 
                        Font-Bold="True"></asp:Label></td>
                <td class="style18">
        
         <input type="hidden" id="HiddenText" runat="server" />



                                                
                    <asp:TextBox ID="StuID_txt" runat="server" style="margin-left: 25px"></asp:TextBox>



                                                
                </td>
                
            </tr>
            <tr><td class="style19">
                </td>
            <td class="style20">
   


                <asp:Button ID="Insert" runat="server" CssClass="blue" 
                    style="margin-left: 25px" Text="Insert" />
                </td>
              </tr>

              <tr><td class="style15"></td>
              
              <td class="style18">
                  <asp:Label ID="success" runat="server" ForeColor="Blue"></asp:Label>
                  <br />
                  <asp:Label ID="fail" runat="server" ForeColor="Red"></asp:Label>
                  <br />
                                 </td>
              <td></td>
             <td></td>
              </tr>
        </table>

    </div>
     <asp:SqlDataSource ID="topicSrc" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
        
        SelectCommand="SELECT distinct [topicName],id FROM [Seminar_Info] where (status=@status and COD = @COD and year([startDate])=@year and category=@category)">
        <SelectParameters>
        <asp:Parameter DefaultValue="Internal" Name="status" />
            <asp:SessionParameter Name="COD" SessionField="COD" Type="String" />
            <asp:ControlParameter ControlID="yearList" Name="year" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="categoryList" Name="category" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="category" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
        
        SelectCommand="SELECT  distinct category FROM [Seminar_Info] where (status=@status and COD = @COD and year([startDate])=@year and category != '')">
        <SelectParameters>
           <asp:Parameter DefaultValue="Internal" Name="status" />
            <asp:SessionParameter Name="COD" SessionField="COD" Type="String" />
            <asp:ControlParameter ControlID="yearList" Name="year" 
                PropertyName="SelectedValue" />
            
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="year" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
        SelectCommand="SELECT  distinct year([startDate]) as year FROM [Seminar_Info]  WHERE (status=@status and COD = @COD) ORDER BY year DESC">
       <SelectParameters>
            <asp:Parameter DefaultValue="Internal" Name="status" />
             <asp:SessionParameter Name="COD" SessionField="COD" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
  
   
     <asp:SqlDataSource ID="pescod" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                            
        SelectCommand="SELECT [PESS_COD] FROM [student_academic_info] WHERE ([PATRON_ID] = @PATRON_ID)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="StuID_txt" Name="PATRON_ID" 
                                    PropertyName="Text" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        
    <asp:SqlDataSource ID="verify" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                SelectCommand="SELECT * FROM [userGroup] WHERE ([id] = @id)">
                <SelectParameters>
                    <asp:SessionParameter Name="id" SessionField="Role_Type" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
    </form>
</body>
</html>
