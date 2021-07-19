<%@ Page Language="C#" AutoEventWireup="true" CodeFile="gridviewtext01.aspx.cs" Inherits="gridviewtext01" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" OnRowDataBound="GridView1_RowDataBound" >
            <Columns>
                <asp:BoundField HeaderText="CareerFormID" DataField="CareerFormID" />
                <asp:BoundField HeaderText="OrganiztionName1" DataField="OrganiztionName1" />
                <asp:BoundField HeaderText="canpost" DataField="canpost" />
            </Columns>


        </asp:GridView>
        
    </div>
    </form>
</body>
</html>
