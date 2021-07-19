<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ImageMultiSaveToDb4.aspx.cs" Inherits="ImageMultiSaveToDb4" %>

<!DOCTYPE html>

<%--插件: jQuery MultiFile--%>
<%--http://www.fyneworks.com/jquery/multifile/--%>
<%--可預覧圖片可上傳--%>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Preview | MultiFile Test</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/themes/smoothness/jquery-ui.css" />
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css" />
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" />
    <link href="ImageMultiSaveToDb4style/docs.css" rel="stylesheet" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="http://prismjs.com/themes/prism.css" />
    <script src="http://prismjs.com/prism.js"></script>

</head>
<body>
    <form id="form1" runat="server">
        <div style="margin-left:40px">
            <br /><br /><br />
            <asp:FileUpload name="files[]" type="file" multiple="multiple"  class="multi with-preview" ID="FileUpload1" runat="server" AllowMultiple="true" />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Upload" OnClick="Button1_Click"/>
            <asp:Label ID="lblSuccess" runat="server" ForeColor="Green" />
            <script>
                $(function () {
                    // invoke plugin
                    $('#our-test').MultiFile({
                        onFileChange: function () {
                            console.log('TEST CHANGE:', this, arguments);
                        }
                    });
                });
            </script>

            <!--// plugin-specific resources //-->
            <script src="ImageMultiSaveToDb4style/jquery.form.js"></script>
            <script src="ImageMultiSaveToDb4style/jquery.MetaData.js"></script>
            <script src="ImageMultiSaveToDb4style/jquery.MultiFile.js"></script>
        </div>
    </form>
</body>
</html>
