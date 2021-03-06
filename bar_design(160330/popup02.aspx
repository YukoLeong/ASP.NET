<%@ Page Language="C#" AutoEventWireup="true" CodeFile="popup02.aspx.cs" Inherits="popup02" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.1.5/angular.min.js"></script>
    <script src="http://angular-ui.github.io/bootstrap/ui-bootstrap-tpls-0.6.0.js" type="text/javascript"></script>
    <script src="http://m-e-conroy.github.io/angular-dialog-service/javascripts/dialogs.min.js" type="text/javascript"></script>




    <style>
        .modal {
            display: block;
        }

        /* Custom dialog/modal headers */

        .dialog-header-error {
            background-color: #d2322d;
        }

        .dialog-header-wait {
            background-color: #428bca;
        }

        .dialog-header-notify {
            background-color: #eeeeee;
        }

        .dialog-header-confirm {
            background-color: #333333;
        }

            .dialog-header-error span, .dialog-header-error h4,
            .dialog-header-wait span, .dialog-header-wait h4,
            .dialog-header-confirm span, .dialog-header-confirm h4 {
                color: #ffffff;
            }

        /* Ease Display */

        .pad {
            padding: 25px;
        }
    </style>




</head>
<body ng-controller="dialogServiceTest" class="pad">
    <form id="form1" runat="server">
        <h2>Bootstrap 3 & AngularJS Dialog/Modals</h2>
        <br />
        <p>
            Demostration of my Angular-Dialog-Service module. Which can be found on Github: <a href="https://github.com/m-e-conroy/angular-dialog-service">https://github.com/m-e-conroy/angular-dialog-service</a><br />
        </p>
        <div class="row">
            <div class="col-md-12">
                <button class="btn btn-danger" ng-click="launch('error')">Error Dialog</button>

                <button class="btn btn-primary" ng-click="launch('wait')">Wait Dialog</button>

                <button class="btn btn-default" ng-click="launch('notify')">Notify Dialog</button>

                <button class="btn btn-success" ng-click="launch('confirm')">Confirm Dialog</button>

                <button class="btn btn-warning" ng-click="launch('create')">Custom Dialog</button>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-12">
                <p>
                    <span class="text-info">From Confirm Dialog</span>: {{confirmed}}
                </p>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-12">
                <p>
                    <span class="text-info">Your Name</span>: {{name}}
                </p>
            </div>
        </div>
        <br />
        <p>
            <a href="http://michaeleconroy.blogspot.com/2013/10/redux-creating-application-dialog.html" target="_top"><strong>View My Blog Post</strong>: Redux: Creating an Application Dialog Service using AngularJS, Twitter Bootstrap & Angular UI-Bootstrap</a>
        </p>

    </form>
</body>
</html>
