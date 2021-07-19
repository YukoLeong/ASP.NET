<%@ Page Language="C#" AutoEventWireup="true" CodeFile="radiobutton02.aspx.cs" Inherits="radiobutton02" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <style>
        body {
            /*font-family: sans-serif;
            font-weight: 800;*/
        }

        /** {
            box-sizing: border-box;
        }*/

        /*.radio,
        .checkbox {
            position: absolute;
            width: 50%;
            height: 100%;
        }*/

        .radio h1,
        .checkbox h1 {
            text-align: center;
            color: #aaa;
            margin-top: 30px;
            font-size: 12px;
            font-weight: 400;
        }

        .checkbox {
            left: 50%;
            border-left: 1px solid #b5b5b5;
        }

        .radio .switch {
            font-family: sans-serif; /*from body*/
            font-weight: 800; /*from body*/
            position: absolute;
            top: 50%;
            left: 50%;
            width: 150px;
            height: 50px;
            text-align: center;
            margin: -30px 0 0 -75px;
            background: #4cd964;
            transition: all 0.2s ease;
            border-radius: 25px;
        }

            .radio .switch span {
                position: absolute;
                width: 20px;
                height: 4px;
                top: 50%;
                left: 50%;
                margin: -2px 0px 0px -4px;
                background: #fff;
                display: block;
                transform: rotate(-45deg);
                transition: all 0.2s ease;
            }

                .radio .switch span:after {
                    content: "";
                    display: block;
                    position: absolute;
                    width: 4px;
                    height: 12px;
                    margin-top: -8px;
                    background: #fff;
                    transition: all 0.2s ease;
                }

        .radio input[type=radio] {
            display: none;
        }

        .radio .switch label {
            cursor: pointer;
            color: rgba(0,0,0,0.2);
            width: 60px;
            line-height: 50px;
            transition: all 0.2s ease;
        }

        .radio label[for=yes] {
            position: absolute;
            left: 0px;
            height: 20px;
        }

        .radio label[for=no] {
            position: absolute;
            right: 0px;
        }

        .radio #no:checked ~ .switch {
            background: #ff3b30;
        }

            .radio #no:checked ~ .switch span {
                background: #fff;
                margin-left: -8px;
            }

                .radio #no:checked ~ .switch span:after {
                    background: #fff;
                    height: 20px;
                    margin-top: -8px;
                    margin-left: 8px;
                }

        .radio #yes:checked ~ .switch label[for=yes] {
            color: #fff;
        }

        .radio #no:checked ~ .switch label[for=no] {
            color: #fff;
        }

        .checkbox label {
            position: absolute;
            top: 50%;
            left: 50%;
            width: 150px;
            line-height: 50px;
            text-align: center;
            transform: translate(-50%, -50%);
            background-color: #ff3b30;
            transition: all 0.2s ease;
            border-radius: 25px;
            cursor: pointer;
        }

            .checkbox label:after,
            .checkbox label:before {
                transition: all 0.1s linear;
                content: "";
                display: block;
                position: absolute;
                width: 20px;
                height: 4px;
                top: 50%;
                left: 50%;
                background: #fff;
            }

            .checkbox label:after {
                margin: -2px 0px 0px -10px;
                transform: rotate(-45deg);
            }

            .checkbox label:before {
                margin: -2px 0px 0px -10px;
                transform: rotate(45deg);
            }

            .checkbox label span {
                display: inline-block;
                width: 50%;
                float: left;
                color: rgba(255,255,255,0.9);
                text-shadow: 0px -1px 0px rgba(0,0,0,0.1);
            }

                .checkbox label span:first-child {
                    color: rgba(0,0,0,0.2);
                    cursor: pointer;
                }

                .checkbox label span:last-child {
                    cursor: default;
                }

        .checkbox input[type=checkbox] {
            display: none;
        }

        .checkbox #switch:checked ~ label {
            background-color: #4cd964;
        }

            .checkbox #switch:checked ~ label:after {
                margin: -2px 0px 0px -6px;
                width: 18px;
            }

            .checkbox #switch:checked ~ label:before {
                width: 11px;
                margin: 0px 0px 0px -10px;
            }

            .checkbox #switch:checked ~ label span:first-child {
                color: rgba(255,255,255,0.9);
                cursor: default;
            }

            .checkbox #switch:checked ~ label span:last-child {
                color: rgba(0,0,0,0.2);
                cursor: pointer;
            }
    </style>

    <script src="jquery01style/jquery-1.11.1.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $('#yes').click(function () {
                //alert("you click yes");
                $("#TextBox1").val('1');

                var enterdata = document.getElementById("TextBox1").value;
                $.ajax({
                    type: "GET",
                    url: "radiobutton02WebService.asmx/SyncData",
                    contentType: "application/json charset=utf-8",
                    dataType: "json",
                    data: { 'data': enterdata },
                    success: function (response) {

                    },
                    failure: function (response) {
                        alert(response.d);
                    }
                });

            });
            $('#no').click(function () {
                //alert("you click no");
                $("#TextBox1").val('0');

                var enterdata = document.getElementById("TextBox1").value;
                $.ajax({
                    type: "GET",
                    url: "radiobutton02WebService.asmx/SyncData",
                    contentType: "application/json charset=utf-8",
                    dataType: "json",
                    data: { 'data': enterdata },
                    success: function (response) {

                    },
                    failure: function (response) {
                        alert(response.d);
                    }
                });

            });
        });
    </script>


</head>
<body>
    <form id="form1" runat="server">
        <div class="radio">
<%--            <input type="radio" name="rdo" id="yes" checked />
            <input type="radio" name="rdo" id="no" />--%>
            <asp:Literal ID="Literal1" runat="server"></asp:Literal>
            <div class="switch">
                <label for="yes">Yes</label>
                <label for="no">No</label>
                <span></span>
                <br />
                <br />
                <br />
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </div>
            
        </div>

        
    </form>
</body>
</html>
