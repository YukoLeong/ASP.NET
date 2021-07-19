<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ImageViewTest2.aspx.cs" Inherits="ImageViewTest2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <script type="text/javascript">
         $('#FileUpload1').change(function () {
         //$(document).on('change', '#FileUpload1', function () {
             $("#Button1").click()
         });
         
     </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Image ID="Image1" runat="server" Width="300" Height="300" />
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
        </div>
    </form>
</body>
</html>
