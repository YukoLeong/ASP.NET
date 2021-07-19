<%@ Page Language="C#" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="home" %>

<%@ Register src="controls/app-header.ascx" tagname="apphead" tagprefix="uc1" %>
<%@ Register src="controls/app-footer.ascx" tagname="appfoot" tagprefix="uc3" %>

<!--DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"-->
<!DOCTYPE html />


<html >
    <head >
        <title>Local Students Recruitment</title>
        <meta name="viewport" content="width=device-width" />
        <link rel="stylesheet"href="styles/mobiappl.min.css" />
        <link rel="stylesheet"href="styles/jquery.mobile.icons.min.css" /> 
        <link rel="stylesheet"href="styles/jquery.mobile.structure-1.4.3.min.css" />  
        <link rel="stylesheet"href="styles/custom.css" />         
        <script type="text/javascript" src="scripts/jquery-1.11.1.min.js"></script>
        <script type="text/javascript" src="scripts/jquery.mobile-1.4.3.min.js"></script>
        <script type="text/javascript" src="scripts/common/change-lang.js"></script>
        <script type="text/javascript" src="scripts/common/normal-function.js"></script>
        <script type="text/javascript">
            $(document).on('pageinit', '#homePage', function () {
                $('#appHeader_changeLangBtn').on('tap', function () {
                    Lang.currentLang = changePageLang('#appHeader_changeLangBtn', Lang.currentLang);
                });
            });
        </script>
        <style type="text/css">
        .icon-button
        {
            height:100px;
        }            
        .icon-button p
        {
            margin-top:2px;
            margin-bottom:2px;
            font-size:13px;
            verflow: visible;
            text-overflow: clip;
            white-space: normal;
        }
        .icon-button img
        {
            width:70px;
            height:70px;            
        }
        </style>
    </head>

    <body>
       <div data-role = "page" id="homePage" runat="server">
            <uc1:apphead ID="appHeader" runat="server" />
                <div class="ui-bar-b" style="text-align:center;" runat="server" >                    
                        <p runat="server"  data-xid="local-recurit">Local Students Recruitment</p>                  
                </div>            
            <div data-role = "content" runat="server">

                <div runat="server" class=" ui-grid-a ">
                      <div class="ui-block-a " runat="server">                           
                            <a href="#" data-role="button" class="icon-button" runat="server" >
                                <img src="images/calendar.jpg" />
                                <p runat="server" data-xid="important-date">Important Dates</p>
                            </a>                               
                           
                      </div>
                      <div class="ui-block-b icon-button"  runat="server" >                           
                            <a href="#" data-role="button" class="icon-button" runat="server">
                                <img src="images/cert.jpg" />
                                <p runat="server" data-xid="prog-offered" >Programmes Offered</p>
                            </a>                               
                           
                      </div>

                      <div class="ui-block-a "  >                           
                            <a href="#" data-role="button" class="icon-button" runat="server">
                                <img src="images/checklist.jpg" />
                                <p runat="server" data-xid="admission-require" >Admission Requirement</p>
                            </a>                               
                           
                      </div>
                      <div class="ui-block-b "  >                           
                            <a href="local.aspx" data-ajax="false" data-role="button"  class="icon-button" runat="server">
                                <img src="images/form.jpg" />
                                <p runat="server" data-xid="online-appl" >XXOnline Application</p>
                            </a>                               
                           
                      </div>
                </div>
                            <a href="#" data-role="button"  class="icon-button">
                                <img src="images/question.jpg" />
                                <p >Q & A</p>
                            </a>      
                
            </div>


            <uc3:appfoot ID="appFooter" runat="server" />
       </div>
        
    </body>


</html>
