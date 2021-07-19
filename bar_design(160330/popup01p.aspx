<%@ Page Language="C#" AutoEventWireup="true" CodeFile="popup01p.aspx.cs" Inherits="popup01p" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="popup01style/style.min.css" rel="stylesheet" />
<%--    <link rel="stylesheet" href="layout01pppage01style/changebootstrap.css" />
    <link rel="stylesheet" href="bootstrapstyle/bootstrap-theme.min.css" />--%>

    <style>
        #content {
            margin-left: 20px;
            margin-right: 20px;
        }

        .style1 {
            width: 100%;
            /*border: 1px solid #000000;*/
        }

        .uptablestyle {
            width: 100%;
            border-color: transparent;
        }


        .style3 {
            width: 100%;
        }

        .style4 {
            width: 212px;
            height: 36px;
        }

        .style5 {
            height: 36px;
        }

        .style6 {
            width: 212px;
        }

        .midleftstyle {
            width: 150px;
        }

        .style10 {
            width: 200px;
        }
    </style>


    <script src="bootstrapstyle/bootstrap.min.js"></script>

<%--    <script type="text/javascript">
        $(document).ready(function () {
            $("#Button1").click(function () {
                return false;
            })
        });
    </script>--%>


</head>
<body>
    <form id="form1" runat="server">

        <div id="popup">
            <span class="button b-close"><span>X</span></span>
            If you can't get it up use<br />
            <span class="logo">bPopup</span>
        </div>

        <div id="popup2">
            <span class="button b-close"><span>X</span></span>
            <div class="content"></div>
        </div>

        <div id="page">

            <h1>jQuery.<span class="code-int">bPopup</span>.js</h1>

            
                <div class="example">
                    <strong>Example 1, default: </strong>
                    
                    <div class="button small pop1">Pop it up</div>




                    <%--<span class="button small pop1">Pop it up</span>--%>
                    <%--<asp:Button ID="Button1" class="button small pop1" runat="server" Text="Pop it up" />--%>
                </div>


                <span class="button small pop2 x-content" data-bpopup='<iframe width="640" height="360" src="http://www.youtube.com/embed/pPb2lIap6Es?rel=0" frameborder="0" allowfullscreen></iframe>'>Pop a video</span>

                <span class="button small pop2 x-content" data-bpopup='<img src="popup01style/dinbror.jpg" style="height:131px;width:660px" />'>Pop an image</span>

                <span class="button small pop2 x-content" data-bpopup='010010010110011000100000011110010110111101110101001000000110<br>001101100001011011100010000001101110011011110111010000100000<br>011001110110010101110100001000000110100101110100001000000111<br>010101110000001000000010110100100000011101010111001101100101<br>001000000110001001010000011011110111000001110101011100000010<br>0001'>Pop some text</span>



            <asp:Button ID="Button1" class="button small pop2 x-content" runat="server" Text="Button" />


                <span class="button small pop2 x-content" data-bpopup='
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    
                    
                    
                    
                    '>test1</span>
            


                <span class="example">
                    <strong>Example 5d, content: </strong>
                </span>


        </div>
        <%--<a class="github" href="https://github.com/dinbror/bpopup/"></a>--%>
    </form>
    <script src="popup01style/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="popup01style/jquery-1.9.1.min.js"><\/script>')</script>
    <script src="popup01style/jquery.bpopup-0.11.0.min.js"></script>
    <script src="popup01style/jquery.easing.1.3.js"></script>
    <script src="popup01style/scripting.min.js"></script>
</body>
</html>
