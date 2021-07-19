<%@ Page Language="C#" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="Student_home" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Macao Polytechnic Institute</title>
<link rel="stylesheet" href="../style.css" type="text/css" media="screen" />
<script type="text/javascript" src="../verify.js"></script>
 <style type="text/css">
      .change
        {
            color: #FFFFFF;
        }
        .change:hover
        {
            color: #FFFFFF;
        }
           .change1
        {
            /*color: #FFCC33;*/
			background: #2260B2;
			color: #FFFFFF;
			-webkit-box-shadow: 0 1px 1px rgba(0, 0, 0, .2);
			-moz-box-shadow: 0 1px 1px rgba(0, 0, 0, .2);
			box-shadow: 0 1px 1px rgba(0, 0, 0, .2);
			text-shadow: -1px 0px 7px #FFFFFF;
        }
        .change1:hover
        {
            color: Yellow;
        }
     .style1
     {
         width: 100%;
     }
     .style2
     {
         height: 15px;
     }
     .style8
     {
         height: 15px;
         width: 87px;
     }
     .style19
     {
         height: 15px;
         width: 385px;
     }
     .style20
     {
         height: 15px;
         width: 128px;
     }
     .style22
     {
         width: 193px;
     }
     .style23
     {
         width: 196px;
     }
     .style24
     {
         width: 195px;
     }
     .style26
     {
         width: 194px;
     }
     .style28
     {
         height: 15px;
         width: 98px;
     }
     .style29
     {
         height: 15px;
         width: 95px;
     }
     .style30
     {
         height: 15px;
         width: 97px;
     }
	 
	 
#menu-bar {
  width: 1011px;
  margin: 0px 0px 0px 0px;
  padding: 6px 7px 4px 6px;
  height: 30px;
  line-height: 100%;
  /*border-radius: 15px;
  -webkit-border-radius: 15px;*/
  -moz-border-radius: 15px;
  box-shadow: 0px 0px 0px #666666;
  -webkit-box-shadow: 0px 0px 0px #666666;
  -moz-box-shadow: 0px 0px 0px #666666;
  background: #4F87BD;
 /* background: linear-gradient(top,  #424242,  #000000);
  background: -ms-linear-gradient(top,  #424242,  #000000);
  background: -webkit-gradient(linear, left top, left bottom, from(#424242), to(#000000));
  background: -moz-linear-gradient(top,  #424242,  #000000);*/
  border: solid 0px #242424;
  position:relative;
}
#menu-bar li {
  margin: 0px 0px 7px 0px;
  padding: 0px 7px 3px 6px;
  float: left;
  position: relative;
  list-style: none;
}
#menu-bar a {
 /* font-weight: bold;
  font-family: arial;
  font-style: normal;*/
  font-size: 12pt;
  /*color: #FFFFFF;*/
  text-decoration: none;
  display: block;
  padding: 8px 13px 6px 13px;
  margin: 0;
  margin-bottom: 7px;
  border-radius: 18px;
  -webkit-border-radius: 18px;
  -moz-border-radius: 18px;
 /* text-shadow: -2px 3px 0px #000000;*/
}
#menu-bar li ul li a {
  margin: 0;
}
#menu-bar .active a {
  background: #2260B2;
  color: #FFFFFF;
  -webkit-box-shadow: 0 1px 1px rgba(0, 0, 0, .2);
  -moz-box-shadow: 0 1px 1px rgba(0, 0, 0, .2);
  box-shadow: 0 1px 1px rgba(0, 0, 0, .2);
 /* text-shadow: -1px 0px 7px #FFFFFF;*/
}
 #menu-bar li:hover a {
  background: #2260B2;
  color: #FFFFFF;
  -webkit-box-shadow: 0 1px 1px rgba(0, 0, 0, .2);
  -moz-box-shadow: 0 1px 1px rgba(0, 0, 0, .2);
  box-shadow: 0 1px 1px rgba(0, 0, 0, .2);
  text-shadow: -1px 0px 7px #FFFFFF;
 }
#menu-bar ul li:hover a, #menu-bar li:hover li a {
  background: none;
  border: none;
  color: #666;
  -box-shadow: none;
  -webkit-box-shadow: none;
  -moz-box-shadow: none;
}

#menu-bar li:hover > ul {
  display: block;
}
#menu-bar ul {
  background: #FFFFFF;
  /*background: linear-gradient(top,  #FFFFFF,  #CFCFCF);
  background: -ms-linear-gradient(top,  #FFFFFF,  #CFCFCF);
  background: -webkit-gradient(linear, left top, left bottom, from(#FFFFFF), to(#CFCFCF));
  background: -moz-linear-gradient(top,  #FFFFFF,  #CFCFCF);*/
  display: none;
  margin: 0;
  padding: 0;
  width: 120%;
  position: absolute;
  top: 32px;
  left: 0;
  border: solid 1px #B4B4B4;
  border-radius: 10px;
  /*-webkit-border-radius: 10px;
  -moz-border-radius: 10px;
  -webkit-box-shadow: 2px 2px 3px #222121;
  -moz-box-shadow: 2px 2px 3px #222121;
  box-shadow: 2px 2px 3px #222121;*/
}
#menu-bar ul li {
  float: none;
  margin: 0;
  padding: 0;
}
#menu-bar ul a {
  padding:10px 0px 10px 15px;
  color:#424242 !important;
  font-size:11pt;
  font-style:normal;
  /*font-family:arial;*/
  font-weight: normal;
 /* text-shadow: 2px 2px 3px #FFFFFF;*/
}
#menu-bar ul a:hover {
  background: #4F87BD !important;
  color: #FFFFFF !important;
   font-size: 12pt;
   border-radius: 0;
  -webkit-border-radius: 0;
  -moz-border-radius: 0;
  /*text-shadow: 2px 2px 3px #FFFFFF;*/
}
#menu-bar ul li:first-child > a {
  border-top-left-radius: 10px;
  -webkit-border-top-left-radius: 10px;
  -moz-border-radius-topleft: 10px;
  border-top-right-radius: 10px;
  -webkit-border-top-right-radius: 10px;
  -moz-border-radius-topright: 10px;
}
#menu-bar ul li:last-child > a {
  border-bottom-left-radius: 10px;
  -webkit-border-bottom-left-radius: 10px;
  -moz-border-radius-bottomleft: 10px;
  border-bottom-right-radius: 10px;
  -webkit-border-bottom-right-radius: 10px;
  -moz-border-radius-bottomright: 10px;
}
#menu-bar:after {
  content: ".";
  display: block;
  clear: both;
  visibility: hidden;
  line-height: 0;
  height: 0;
}
#menu-bar {
  display: inline-block;
}
  html[xmlns] #menu-bar {
  display: block;
}
* html #menu-bar {
  height: 1%;
}
	 
	 
	 
     </style>
</head>

<body>

    <form id="form1" runat="server">

<div id="wrapper">

		<div id="headerStd">
	  <div style="padding-right:5px;text-align:right;padding-top: 8px;">
		Hello, <asp:Label ID="Label2" runat="server" style="color:blue;"></asp:Label>
		<asp:Label ID="Label3" runat="server" style="color:blue;"></asp:Label> |
		<asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">Sign Out</asp:LinkButton>
	</div>
	 <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/logo_transp_v2003.gif"
	 style="margin-top: 30px;margin-left: 0px;"  OnClick="ImageButton1_Click" />
      
        <div style="padding-top:114px;">
	  
        &nbsp;    
           
        &nbsp; 
         
      </div>
	 
	</div>
	
	
	
<div>
	<ul id="menu-bar">
   <li><asp:LinkButton ID="LinkButton5" runat="server" 
		cssclass="change1"  onclick="LinkButton5_Click">My Favorites</asp:LinkButton>
  <ul>
   <li><asp:LinkButton ID="LinkButton8" runat="server" 
		cssclass="change" onclick="LinkButton8_Click" >Time Table</asp:LinkButton></li>
   <li><asp:LinkButton ID="LinkButton7" runat="server" 
		cssclass="change" onclick="LinkButton7_Click" >Student Record</asp:LinkButton></li>
   <li><asp:LinkButton ID="LinkButton6" runat="server" 
		cssclass="change" onclick="LinkButton6_Click" >Finance</asp:LinkButton></li>
   </ul>
 </li>
 <li> <asp:LinkButton ID="LinkButton4" runat="server" onclick="LinkButton4_Click" 
		cssclass="change" >Others</asp:LinkButton></li>
		<li> <asp:LinkButton ID="LinkButton2" runat="server" cssclass="change" 
		onclick="LinkButton2_Click">e-Portfolio</asp:LinkButton></li>
		<li><asp:LinkButton ID="LinkButton3" runat="server" cssclass="change" 
		   onclick="LinkButton3_Click">Academic Navigator</asp:LinkButton></li>
		
		
		</li>
		
					<!--	
 <li><a href="#">Products</a>
  <ul>
   <li><a href="#">Products Sub Menu 1</a></li>
   <li><a href="#">Products Sub Menu 2</a></li>
   <li><a href="#">Products Sub Menu 3</a></li>
   <li><a href="#">Products Sub Menu 4</a></li>
  </ul>
 </li>
 <li><a href="#">Services</a>
  <ul>
   <li><a href="#">Services Sub Menu 1</a></li>
   <li><a href="#">Services Sub Menu 2</a></li>
   <li><a href="#">Services Sub Menu 3</a></li>
   <li><a href="#">Services Sub Menu 4</a></li>
  </ul>
 </li>
-->
</ul>
	
	</div>
	
	
   
       <div id='content'>
       <div id='seticon'>
       
       
       
       
           <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="4">
               <asp:View ID="View1" runat="server">
            
				<asp:Literal ID="Literal2" runat="server"></asp:Literal>

				<asp:Literal ID="Literal5" runat="server"></asp:Literal>

				<asp:Literal ID="Literal3" runat="server"></asp:Literal>

				<asp:Literal ID="Literal9" runat="server"></asp:Literal>
                          
               </asp:View>
			   
			   
               <asp:View ID="View2" runat="server">

    
   
                                <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                          
                                <asp:Literal ID="Literal4" runat="server"></asp:Literal>
                        
                               <asp:Literal ID="Literal10" runat="server"></asp:Literal>
                          
                                 
                              <asp:Literal ID="Literal11" runat="server"></asp:Literal>
                        
                              
                               <asp:Literal ID="Literal18" runat="server"></asp:Literal>

                                 <asp:Literal ID="Literal7" runat="server"></asp:Literal>
                          
                                <asp:Literal ID="Literal8" runat="server"></asp:Literal>
                           
                                <asp:Literal ID="Literal19" runat="server"></asp:Literal>
                           
                               <asp:Literal ID="Literal12" runat="server"></asp:Literal>
                       
                               <asp:Literal ID="Literal13" runat="server"></asp:Literal>
                     
                              <asp:Literal ID="Literal36" runat="server"></asp:Literal>
                              <asp:Literal ID="Literal6" runat="server"></asp:Literal>
                          
                              <asp:Literal ID="Literal14" runat="server"></asp:Literal>
                          
                               <asp:Literal ID="Literal15" runat="server"></asp:Literal>
                      
                               <asp:Literal ID="Literal16" runat="server"></asp:Literal>
                          
                               <asp:Literal ID="Literal17" runat="server"></asp:Literal>
                         
                            
 
               </asp:View>
                  <asp:View ID="View3" runat="server">
     
    
                                <asp:Literal ID="Literal20" runat="server"></asp:Literal>
						
                              <asp:Literal ID="Literal41" runat="server"></asp:Literal>
                          
                                <asp:Literal ID="Literal21" runat="server"></asp:Literal>
                        
                               <asp:Literal ID="Literal30" runat="server"></asp:Literal>
                          
                                 <asp:Literal ID="Literal31" runat="server"></asp:Literal>
                           
                               <asp:Literal ID="Literal32" runat="server"></asp:Literal>
                           
                                 <asp:Literal ID="Literal33" runat="server"></asp:Literal>
                           
                                <asp:Literal ID="Literal38" runat="server"></asp:Literal>
                          
                                <asp:Literal ID="Literal39" runat="server"></asp:Literal>
                          
                               <asp:Literal ID="Literal40" runat="server"></asp:Literal>
                          

               </asp:View>
      <asp:View ID="View4" runat="server">

                <asp:Literal ID="Literal22" runat="server"></asp:Literal>
                          
           </asp:View>
        <asp:View ID="View5" runat="server">

				<asp:Literal ID="Literal23" runat="server"></asp:Literal>

				<asp:Literal ID="Literal24" runat="server"></asp:Literal>

				<asp:Literal ID="Literal25" runat="server"></asp:Literal>

				<asp:Literal ID="Literal34" runat="server"></asp:Literal>

				<asp:Literal ID="Literal26" runat="server"></asp:Literal>
                 
          
        
           </asp:View>
       <asp:View ID="View6" runat="server">

				<asp:Literal ID="Literal27" runat="server"></asp:Literal>

				<asp:Literal ID="Literal28" runat="server"></asp:Literal>

				<asp:Literal ID="Literal29" runat="server"></asp:Literal>

       
          
          
           </asp:View>
               <asp:View ID="View7" runat="server">


               </asp:View>
         
           </asp:MultiView>
           
       
       
   </div>
   </div>
     
	<div>
		<div>
		    <asp:HiddenField ID="index" runat="server" />
		 <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                SelectCommand="SELECT * FROM [userGroup] WHERE ([id] = @id)">
                <SelectParameters>
                    <asp:SessionParameter Name="id" SessionField="Role_Type" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
	
              <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                
                SelectCommand="SELECT COUNT( *) as new FROM [AdvisoryRemark] WHERE (([status] = @status) AND ([ALUN_NUMERO] = @ALUN_NUMERO)AND ([ALUN_NUMERO_SEQ] = @ALUN_NUMERO_SEQ) )">
                <SelectParameters>
                    <asp:Parameter DefaultValue="Unread" Name="status" Type="String" />
                    <asp:SessionParameter Name="ALUN_NUMERO" SessionField="ALUN_NUMERO" 
                        DefaultValue="" />
                    <asp:SessionParameter Name="ALUN_NUMERO_SEQ" SessionField="ALUN_NUMERO_SEQ" />
                </SelectParameters>
            </asp:SqlDataSource>
					
		</div>
	</div>



</div>
<div id="footer">
		<div id="footer-valid">
			 Copyright &copy; <script type="text/javascript">
				var dt = new Date();
				document.write(dt.getFullYear() ); 
			</script> Macao Polytechnic Institute. All Rights Reserved.    
		</div>
	</div>
    </form>

</body>
</html>