<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ImageMultiSaveToDb2.aspx.cs" Inherits="ImageMultiSaveToDb2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .fileUpload {
            width: 255px;
            font-size: 11px;
            color: #000000;
            border: solid;
            border-width: 1px;
            border-color: #7f9db9;
            height: 17px;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div id="fileUploadarea">
                <asp:FileUpload ID="FileUpload1" runat="server" CssClass="fileUpload" /><br />
            </div>
            <br />
            <div>
                <input style="display: block;" id="btnAddMoreFiles" type="button" value="Add more images" onclick="AddMoreImages();" /><br />
                <asp:Button ID="Button1" runat="server" Text="Upload"/>
            </div>
        </div>
        <script language="javascript" type="text/javascript">
            function AddMoreImages() {
                if (!document.getElementById && !document.createElement)
                    return false;
                var fileUploadarea = document.getElementById("fileUploadarea");
                if (!fileUploadarea)
                    return false;
                var newLine = document.createElement("br");
                fileUploadarea.appendChild(newLine);
                var newFile = document.createElement("input");
                newFile.type = "file";
                newFile.setAttribute("class", "fileUpload");

                if (!AddMoreImages.lastAssignedId)
                    AddMoreImages.lastAssignedId = 2;
                newFile.setAttribute("id", "FileUpload" + AddMoreImages.lastAssignedId);
                newFile.setAttribute("name", "FileUpload" + AddMoreImages.lastAssignedId);
                if (AddMoreImages.lastAssignedId > 6) {
                    alert("You can't add more than 6 images with a single puzzle");
                    return false;
                }
                var div = document.createElement("div");
                div.appendChild(newFile);
                div.setAttribute("id", "div" + AddMoreImages.lastAssignedId);
                fileUploadarea.appendChild(div);
                AddMoreImages.lastAssignedId++;
            }
        </script>
    </form>
</body>
</html>