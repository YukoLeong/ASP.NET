<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Preview.aspx.cs" Inherits="Admin_Preview" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Preview</title>
    <link  href="../button.css" rel="stylesheet" />
    <style>
        body
        {
            margin-top:0;
            background: url(../images/bg-blue.jpg);
        }
        #wrapper1
        {
            width: 80%;
            min-height: 950px;
            margin-left: auto;
            margin-right: auto;
			margin-top: 0px;
        }
        
        #content1
        { 
            background-color:#fff;
            min-height:1024px;
            padding-left: 5px;
            padding-right: 5px;
            border-left:solid 1px #CCC;
            border-right:solid 1px #CCC;
        }
        #notice{	
			width: 348px;			
			
			min-height: 320px;			
			overflow:auto;		
			border: solid #CCC 1px;
			border-radius: 30px;
			-moz-border-radius: 30px;
			-webkit-border-radius: 30px;
			margin: 0% 0 1% 2%;	
			box-shadow: 0px 5px 8px #888;			
		}

        h2 {
			margin: 10px 0px 0px 15px;
			color: #FCC20B;
			font-style: italic;
		}
        #content{
            display:block;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="wrapper1">
            <div id="content1">
                <br />
                <div id="notice">
                    <h2>
                        <asp:Label ID="lb_notices" runat="server" Text="<%$ Resources:Resource, sip_notices %>"></asp:Label></h2>
                    <div style="padding: 5px 5px 5px 0px; font-size: 7pt;">
                        <asp:Literal ID="lit_notice" runat="server"></asp:Literal>
                    </div>
                </div>
                <div style="padding: 5px 5px 5px 28px;">
                     <asp:Button ID="btn_save" runat="server" Text="Save" CssClass="blue" OnClick="btn_save_Click" style="width:200px"/>
                  <asp:Button ID="btn_back" runat="server" Text="Back" CssClass="blue" OnClick="btn_back_Click" style="width:200px"/>
                    </div>
            </div>
            <br />
            <br />
          
        </div>
        
    </form>
</body>
</html>
