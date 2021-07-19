<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Example01.aspx.cs" Inherits="multiview.Example01" %>

<!DOCTYPE html>
<script runat="server">
    protected void butSubmit_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = int.Parse(HiddenField1.Value);
    }
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Demo</title>

    <script language="javascript" type="text/ecmascript">
        function OnClientClick(ServerControID, IndexControlID, Index) {
            var objDemo = document.getElementById(ServerControID);
            if (objDemo) {
                document.getElementById(IndexControlID).value = Index;
                objDemo.click();
            }
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                <asp:View ID="View1" runat="server">
                    <span style="color: #ff0000; background-color: #33ccff"><strong>Hi, I am View 1</strong></span>
                </asp:View>
                <asp:View ID="View2" runat="server">
                    <strong><span style="color: background; background-color: #99ff00">Hi, I am View 2</span></strong>
                </asp:View>
            </asp:MultiView>
        </div>
        <asp:HiddenField ID="HiddenField1" runat="server" />
        <input id="btnShow1" type="button" value="Show View 1" onclick="OnClientClick('butSubmit', 'HiddenField1', '0')" />
        <input id="btnShow2" type="button" value="Show View 2" onclick="OnClientClick('butSubmit', 'HiddenField1', '1')" />
        <div style="display: none">
            <asp:Button ID="butSubmit" runat="server" OnClick="butSubmit_Click" Text="Submit" />
        </div>
    </form>
</body>
</html>
