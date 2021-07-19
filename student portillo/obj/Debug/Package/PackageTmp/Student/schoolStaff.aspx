<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="schoolStaff.aspx.vb" Inherits="ep.schoolStaff" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<style>

#butten{height:30px;}
.icon{ 
height:143px;
width:143px;
}
#seicon{ float:left}
#item1{ 
background:url(images/porfile.png);
}
#item2{ 
background:url(images/penning.png);
}#item3{ 
background:url(images/record.png);
}
#item4{ 
background:url(images/commu.png);
}
#item5{ 
background:url(images/work.png);
}
#item6{ 
background:url(images/meg.png);
}
#item7{ 
background:url(images/attu.png);
}
#item8{ 
background:url(images/seami.png);
}
#item9{ 
background:url(images/User.png);
}

#seticon .monthebox{float: left; margin:10px 12px 10px 10px; }
.text{
	text-align:center; 
	text-shadow:#666; 
	font-size:16px;
	height:2px;
	color:#000;
	
	}
	
a:hover #item1 {
background:url(images/porfilehover.png) no-repeat center center;
	}
	
a:hover #item2 {
background:url(images/penninghover.png) no-repeat center center;
	}

a:hover #item3 {
background:url(images/recordhover.png) no-repeat center center;
	}

a:hover #item4 {
background:url(images/commuhover.png) no-repeat center center;
	}
	
a:hover #item5 {
background:url(images/workhover.png) no-repeat center center;
	}
	
a:hover #item6 {
background:url(images/meghover.png) no-repeat center center;
	}

a:hover #item7 {
background:url(images/penninghover.png) no-repeat center center;
	}
a:hover #item8 {
background:url(images/penninghover.png) no-repeat center center;
	}
a:hover #item9 {
background:url(images/penninghover.png) no-repeat center center;
	}	
#butten { width:476px; height:25px;
text-align:center;
font-size:16px;

 line-height:20px;
 }






/*#english {background-color:#F69;
margin:0px;}*/

</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Macao Polytechnic Institute</title>
<link rel="stylesheet" href="../style.css" type="text/css" media="screen" />


</head>

<body>

    <form id="form1" runat="server">

<div id="wrapper">

	<div id="header">
	 
	</div>

	<div id="menu">
		<ul>
			<li><a href="#">Home</a></li>
			<li><a href="#">e-Potfolio</a></li>
			<li><a href="#">Academic</a></li>
			<li><a href="#">Job matching/College Countring</a></li>
			<li><a href="#">System</a></li>
            <li><asp:LinkButton ID="LinkButton1" runat="server">Log Out</asp:LinkButton></li>
		</ul>
	</div>

	<div id="sidebar">
	<iframe ID="Iframe1" frameborder="no" name="I1" scrolling="no" src="../item/Link.aspx">
            </iframe>
	</div>

	<div id="content">
    
    
 

   
<div id="seticon">


<div class=monthebox>
<a href="studentProfile.aspx">
<div id=item1 class="icon"></div>
<div class="text">Student Profile</div>
</a>
</div>

<div class=monthebox>
<a href="Career.aspx">
<div id=item2 class="icon"></div>
<div class="text">
Career Planning</div>
</a>
</div>

<div class=monthebox>
<a href="Learning.aspx">
<div id=item3 class="icon"></div>
<div class="text">Learning Records</div>
</a>
</div>

<div class=monthebox>
<a href="Community.aspx">
<div id=item4 class="icon"></div>
<div class="text">Community Service</div>
</a>
</div>

<div class=monthebox>
<a href="studentWorks.aspx">
<div id=item5 class="icon"></div>
<div class="text">Student Works</div>
</a>
</div>



<div class=monthebox>
<a href="StudentAtribute.aspx">
<div id=item8 class="icon"></div>
<div class="text">learning Record Attribute<asp:SqlDataSource ID="SqlDataSource1" 
        runat="server" ConnectionString="<%$ ConnectionStrings:EPConnectionString1 %>" 
        SelectCommand="SELECT [PESS_COD] FROM [student_academic_info] WHERE ([STUDENT_ID] = @STUDENT_ID)">
    <SelectParameters>
        <asp:QueryStringParameter Name="STUDENT_ID" QueryStringField="studentid" />
    </SelectParameters>
    </asp:SqlDataSource>
    </div>
</a>
</div>     

     
	</div>   
	</div>

	<div id="footer">
		<div id="footer-valid">
		
		</div>
	</div>

</div>

    </form>

</body>
</html>
