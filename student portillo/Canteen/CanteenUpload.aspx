<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CanteenUpload.aspx.cs" Inherits="Canteen_CanteenUpload" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="jqueryuistyle/jquery-1.11.1.js"></script>
    <script src="jqueryuistyle/jquery-ui.js"></script>
    <link href="jqueryuistyle/jquery-ui.css" rel="stylesheet" />

    <style>
        #wrapper {
            width: 100%;
            height: 100vh; /*div高度等於畫面高度*/
            background: url(layout50style/body_bg.gif) repeat left top;
            /*min-width: 960px;*/
            /*min-height:900px;*/
        }

        #middle_wrap {
            background: url(layout50style/content_visual.png) no-repeat top center;
            /*min-height: 384px;*/
            width: 100%;
            /*            position: relative;
            float: left;*/
        }

        .divborder {
            width: 961px;
            background-color: white;
            margin: auto; /*置中*/
            height: 990px;
            border-right: 1px solid #CDDCB1;
            border-left: 1px solid #CDDCB1;
        }

        #Image1 {
            width: 479px;
            float: left;
            margin-left: 1px;
            height: 191px;
        }

        #Image2 {
            width: 479px;
            height: 191px;
        }

        #listofuploadedfiles {
            position: fixed;
            top: 500px;
        }

    </style>

    <script type="text/javascript">
        $(document).ready(function () {
            //var image1 = $('#Image1');
            //image1.attr("ImageUrl", "~/Uploads/activities-256.png");
            //$('#Image1').attr("ImageUrl", "~/Uploads/activities-256.png");

            <%--var image1 = document.getElementById("<%= Image1.ClientID %>");

            $(image1).find("img").attr('src', '2.png');--%>

            //var arrimage = ["Image1", "Image2", "Image3", "Image4", "Image5"];
            //$('#arrimage[0]').attr("src", "Uploads/activities-256.png");
            <%-- $("#<%=arrimage[0].ClientID%>").attr('src', 'Uploads/activities-256.png');--%>
            <%--$("#<%=Image1.ClientID%>").attr('src', 'Uploads/activities-256.png');--%>



            $("#btnUpload").click(function () {
                var files = $("#FileUpload1")[0].files;
                var listofuploadedfiles = $('#listofuploadedfiles');

                //var image1 = $('#Image1');
                //var image2 = $('#Image2');

                //$('Image1').attr("ImageUrl", "~/Uploads/activities-256.png");

                if (files.length > 0) {
                    var formData = new FormData();
                    for (var i = 0; i < files.length; i++) {
                        formData.append(files[i].name, files[i]);

                        listofuploadedfiles.append("<br/>" + files[i].name);

                    }

                    var progressbarLabel = $('#progressBar-label');
                    var progressbarDiv = $('#progressbar');


                    if ($('#RadioButton1').is(':checked')) {
                        $.ajax({
                            url: 'UploadHandler.ashx',
                            method: 'post',
                            data: formData,
                            contentType: false,
                            processData: false,
                            success: function () {
                                progressbarLabel.text('上傳完成');
                                progressbarDiv.fadeOut(2000);
                            },
                            error: function (err) {
                                alert(err.statusText);
                            }
                        });
                    }

                    if ($('#RadioButton2').is(':checked')) {
                        $.ajax({
                            url: 'UploadHandler2.ashx',
                            method: 'post',
                            data: formData,
                            contentType: false,
                            processData: false,
                            success: function () {
                                progressbarLabel.text('上傳完成');
                                progressbarDiv.fadeOut(2000);
                            },
                            error: function (err) {
                                alert(err.statusText);
                            }
                        });
                    }

                    progressbarLabel.text('上傳中...');
                    progressbarDiv.progressbar({
                        value: false
                    }).fadeIn(500);

                }
            });

        });
    </script>


</head>
<body style="margin: 0px; padding: 0px">
    <form id="form1" runat="server">
        <div id="wrapper">
            <div id="middle_wrap">
                <div class="divborder">
                    <asp:Image ID="Image1" runat="server" ImageUrl="layout50style/canteen1.jpg" />
                    <asp:Image ID="Image2" runat="server" ImageUrl="layout50style/canteen2.jpg" />

                    <br />
                    <p style="margin-left: 10px">食堂餐單上傳系統</p>
                    <br />

                    <fieldset style="width: 300px; margin-left: 310px">
                        <legend><b>選擇食堂</b></legend>
                        <asp:RadioButton ID="RadioButton1" Text="明德食堂" runat="server" Checked="true" GroupName="G" />
                        <asp:RadioButton ID="RadioButton2" Text="匯智食堂" runat="server" GroupName="G" />
                    </fieldset>
                    <br />

                    <div style="margin-left: 300px">

                        <%--選擇檔案 :--%>
                        <asp:FileUpload ID="FileUpload1" runat="server" AllowMultiple="true" />
                        <br />
                        <br />

                        <input type="button" id="btnUpload" value="上傳檔案" />
                        <%--<input type="button" id="btnUpload2" value="上傳檔案" />--%>
                        <br />
                        <br />
                        <div style="width: 350px">
                            <div id="progressbar" style="position: relative; display: none">
                                <span style="position: absolute; left: 35%; top: 20%" id="progressBar-label">上傳中...
                                </span>
                            </div>
                        </div>
                        <br />
                        <br />
                        <asp:Label ID="listofuploadedfiles" Style="color: #0094ff" runat="server" Text="上傳完成列表:" />
                        <br />
                        <br />
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
