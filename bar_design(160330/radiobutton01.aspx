<%@ Page Language="C#" AutoEventWireup="true" CodeFile="radiobutton01.aspx.cs" Inherits="radiobutton01" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <%--http://cssdeck.com/labs/radio-button-checkbox--%>

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
            font-family: sans-serif;        /*from body*/
            font-weight: 800;               /*from body*/
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
</head>
<body>
    <form id="form1" runat="server">
        <div class="radio">
            <%--<h1>Input[type="radio"]</h1>--%>
                <input type="radio" name="rdo" id="yes" checked />
                <input type="radio" name="rdo" id="no" />
                <div class="switch">
                    <label for="yes">Yes</label>
                    <label for="no">No</label>
                    <span></span>
                </div>
        </div>
<%--        <div class="checkbox">
            <h1>Input[type="checkbox"]</h1>
            <form action="">
                <input type="checkbox" id="switch" checked />
                <label for="switch">
                    <span>Yes</span>
                    <span>No</span>
                </label>
            </form>
        </div>--%>
    </form>
</body>
</html>
