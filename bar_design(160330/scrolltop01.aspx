<%@ Page Language="C#" AutoEventWireup="true" CodeFile="scrolltop01.aspx.cs" Inherits="scrolltop01" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        #back-to-top {
            position: fixed;
            bottom: 40px;
            right: 40px;                        /*put to right*/
            z-index: 9999;
            width: 32px;
            height: 32px;
            text-align: center;
            line-height: 30px;
            background: #f5f5f5;              /*button color*/
            color: #444;
            cursor: pointer;
            border: 0;
            border-radius: 2px;
            text-decoration: none;
            transition: opacity 0.2s ease-out;
            opacity: 0;
        }

            #back-to-top:hover {
                background: #e9ebec;
            }

            #back-to-top.show {
                opacity: 1;
            }

        #content {
            height: 2000px;
        }
    </style>
    <script src="jquery01style/jquery-1.11.1.js"></script>
    <script>
        $(document).ready(function () {
            if ($('#back-to-top').length) {
                var scrollTrigger = 100, // px
                    backToTop = function () {
                        var scrollTop = $(window).scrollTop();
                        if (scrollTop > scrollTrigger) {
                            $('#back-to-top').addClass('show');
                        } else {
                            $('#back-to-top').removeClass('show');
                        }
                    };
                backToTop();
                $(window).on('scroll', function () {
                    backToTop();
                });
                $('#back-to-top').on('click', function (e) {
                    e.preventDefault();
                    $('html,body').animate({
                        scrollTop: 0
                    }, 700);
                });
            }
        });
    </script>


</head>
<body>
    <form id="form1" runat="server">
        <div id="content">Scroll &darr;</div>
        <a href="#" id="back-to-top" title="Back to top">&uarr;</a>




    </form>



</body>


</html>

