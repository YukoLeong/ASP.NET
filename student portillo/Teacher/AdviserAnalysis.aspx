<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdviserAnalysis.aspx.cs" Inherits="Teacher_AdviserAnalysis" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Adviser Analysis</title>
    <style type="text/css">
        .style1
        {
            font-family: "Berlin Sans FB";
            font-size: xx-large;
        }
        #TextArea1
        {
            height: 110px;
            width: 562px;
        }
        #TextAreaDescription
        {
            height: 128px;
            width: 567px;
        }
        .style9
        {
            height: 30px;
        }
        .SelectList
        {
            font-family: "Berlin Sans FB";
        }
        .style10
        {
            color: #FF0000;
        }
    </style>
<link rel="stylesheet" href="../button.css" type="text/css" media="screen" />
</head>
<body background="../images/message_board_background.gif" >
    <form id="form1" runat="server">
    <div style="height: 842px; text-align: left">    
        <div>    
        <span class="style1">Adviser Analysis</span>
              <asp:LinkButton ID="LinkButton1" runat="server" CssClass="blue" 
                  style="margin-left: 232px" Font-Size="Large" 
                PostBackUrl="~/Teacher/home.aspx">Home</asp:LinkButton>
        </div>
        <br />    
        <br />
        <table class="SelectList">
          <tr>
           <td class="style9">      <span class="style10"><strong>*</strong></span>      <asp:DropDownList ID="YearDdList" runat="server" AutoPostBack="True" 
                        onselectedindexchanged="YearDdList_SelectedIndexChanged" 
                   ValidationGroup="Vgrp1">
                        <asp:ListItem>--Select Year--</asp:ListItem>
                        </asp:DropDownList>
           </td>
           <td class="style9">
                  &nbsp;<span class="style10"><strong>*</strong></span><asp:DropDownList ID="ProgrammeDdList" runat="server" AutoPostBack="True" 
                      onselectedindexchanged="ProgrammeDdList_SelectedIndexChanged" 
                      ValidationGroup="Vgrp1">
                  </asp:DropDownList>
           </td>
           <td class="style9">
                         <asp:DropDownList ID="CourseDdList" runat="server">
            <asp:ListItem>--Select Course--</asp:ListItem>
                  </asp:DropDownList> </td>        

           <td class="style9">
           <asp:CheckBox ID="gpaChkBox" runat="server" Checked="True" 
            Text="GPA below 1.5" />
           </td>
           <td class="style9">
                   <asp:CheckBox ID="failChkBox" runat="server" Checked="True" 
            oncheckedchanged="failChkBox_CheckedChanged" Text="Over 3 failed subjects" />
           </td>
           <td class="style9">
                   <asp:Button ID="searchButton" runat="server" onclick="searchButton_Click" 
            Text="Search"  CssClass="blue" ValidationGroup="Vgrp1" />
           </td>
          </tr>
        </table>
        
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="YearDdList" InitialValue="--Select Year--" 
            ErrorMessage="Please Select Year!" Font-Bold="True" ForeColor="Red" 
            SetFocusOnError="True" ValidationGroup="Vgrp1"></asp:RequiredFieldValidator>
        
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ControlToValidate="ProgrammeDdList" ErrorMessage="Please Select Programme!" 
            Font-Bold="True" ForeColor="Red" InitialValue="--Select Programme--" 
            ValidationGroup="Vgrp1"></asp:RequiredFieldValidator>
            <br />
        <asp:Label ID="NoResultLabel" runat="server" EnableViewState="False"></asp:Label>
        <div Font-Size="Small">
     <asp:GridView ID="ResultGrid" runat="server" AllowPaging="True" CellPadding="4" 
        Font-Italic="False" Font-Size="Small"  ForeColor="#333333" GridLines="None" 
        onpageindexchanging="ResultGrid_PageIndexChanging" PageSize="50" 
            AllowSorting="True" onsorting="ResultGrid_Sorting" autogeneratecolumns="False" >
                <Columns>
        <asp:boundfield datafield="REMARK DATE"              
            headertext="Date" ItemStyle-Width = "120" >
<ItemStyle Width="120px"></ItemStyle>
                    </asp:boundfield>
          <asp:boundfield datafield="STUDENT_ID"              
            headertext="Student Id" ItemStyle-Width = "100" >
<ItemStyle Width="100px"></ItemStyle>
                    </asp:boundfield>
          <asp:boundfield datafield="Student Name"              
            headertext="Student Name" ItemStyle-Width = "200" >
<ItemStyle Width="200px"></ItemStyle>
                    </asp:boundfield>
          <asp:boundfield datafield="GPA"              
            headertext="GPA" ItemStyle-Width = "100">
<ItemStyle Width="100px"></ItemStyle>
                    </asp:boundfield>
          <asp:boundfield datafield="Subject"              
            headertext="Subject" ItemStyle-Width = "300" >
<ItemStyle Width="300px"></ItemStyle>
                    </asp:boundfield>
          <asp:HyperLinkField DataTextField="Remark Title" DataNavigateUrlFields="rid,subject_code,teacher_code,teacher_name,student_id" DataNavigateUrlFormatString="~/Teacher/RdRedirect.aspx?rid={0}&ccode={1}&tcode={2}&tname={3}&sid={4}"
            HeaderText="Remark Title" ItemStyle-Width = "150" Target="_blank" >
                    <ControlStyle ForeColor="Blue" />
<ItemStyle Width="150px"></ItemStyle>
                    </asp:HyperLinkField>
    </Columns>
        <AlternatingRowStyle BackColor="White" />
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                <HeaderStyle BackColor="#0095CD" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#0095CD" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    </div>
    </div>

    <br />
    <br />

    

    </form>

    </body>
</html>
