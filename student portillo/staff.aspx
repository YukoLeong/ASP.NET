<%@ Page Language="VB" AutoEventWireup="false" CodeFile="staff.aspx.vb" Inherits="staff" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" href="style.css" type="text/css" media="screen" />
<link rel="stylesheet" href="login.css" type="text/css" media="screen" />
<link rel="stylesheet" href="Styles/bootstrap-theme.css" type="text/css" />
<link rel="stylesheet" href="Styles/bootstrap.css" type="text/css"  />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Macao Polytechnic Institute</title>

<script type="text/javascript" src="remFunction.js"></script>


    <style type="text/css">
        .style1
        {
            font-family: "Berlin Sans FB";
			font-size: 14px;
        }
        .style2
        {
            font-size: 16px;
        }
        .style3
        {
			font-family: "Berlin Sans FB";
            font-size: 14px;
			font-weight: bold;
			padding-right: 10px;
        }
		.style4{
			font-family:PMingLiU;		  
			font-weight: bold;
			padding-right: 10px;
		}
    </style>



</head>

<body>

<label>
</label>

<div id="wrapper_login_staff">
<!--
<div id="login"> 


<form id="form" name="form" method="post" action="verifyStaff.aspx" onsubmit="if (this.remen.checked) toMem(this);" style="display:none;">
<div id="formcore" >
<span>Name:&nbsp;<input type="text" name="Name" id="Name" />
</span>


<span>Password: &nbsp;<input type="password" name="Password" id="Password" />
</span>
 <label> Remember Me&nbsp; <input type="checkbox" name="remen" id="remen" /></label>

<span>
    <input type="button" name="reset" id="reset" value="Reset" 
        onclick="delMem(this)" class="white" /></span>
        &nbsp
<span><input type="submit" name="send" id="send" value="Login" class="white" onclick="return send_onclick()" />
</span>
</div>
 </form>

<script type="text/javascript" language="javascript">
    document.form.Name.value = readCookie("Name");
    document.form.Password.value = readCookie("Password");
</script>
    </div>
	-->
    
	<div id="headerTeacher">
    
	 
    
 </div>
	<!--div id="menu">
		
	</div-->

	

	<div id="login_content_staff">
    
    
    <p class="style3">Welcome to Macao Polytechnic Institute Academic Information Platform!</p>
        <span class="style1">
        <p class="style1">MPI Academic Information Platform is a platform for Instructors to collect their student works and extracurricular activities. Students can plan their MPI attributes in each of academic year and make progress with instructors' advices.</p>
        <p class="style1">We encourage Instructors to actively participate in Academic Information Platform. It will assist students to ideally achieve the attributes of MPI graduates. </p>
       
     <br><br>
		<p class="style4">歡迎來到澳門理工學院的學術資訊平台！</p>

		<p class="style4">理工學院的學術資訊平台，讓老師收集學生的作品及成績和課外活動的平台。導師能根據數據並作跟進。</p>

		<p class="style4">我們鼓勵老師們積極參與並使用學術資訊平台。它將幫助學生理想地實現理工畢業生的特質。</p>
        </span>

   	</div>
<div class="sidebar_staff">
	<form id="form1" runat="server">

		<div style="padding-left:5px;">
		<br/><br/>
		<p>For your own safety!</p>
		<p>Please login via our (CAS) Central Authentication Service by clicking the login button below!</p>
		<br/><br/>
		<p>為了您的安全！</p>
		<p>請點擊以下登錄按鈕，通過我們的（CAS）認證服務中心登錄！</p><br/>
		<asp:Button ID="Button1" runat="server" Text="Log in" CssClass="btn btn-warning"
		Font-Size="Medium" />
		<div style="padding-left:3px;padding-top:25px;">
		<a href="https://www.geotrust.com/">
		<img src="images/geotrust-ssl.gif"/></a>
		<br/>
		<br/>
		<a href="https://www.facebook.com/pages/%E6%BE%B3%E9%96%80%E7%90%86%E5%B7%A5%E5%AD%B8%E9%99%A2-Macao-Polytechnic-Institute-%E5%AE%98%E6%96%B9Official/139795602742434">
		<img src="images/facebook.gif" style="width:32px;height:32px;"/></a>
		<a href="ipm.xml" ><img src="images/rss.gif" style="width:32px;height:32px;"/></a>
		</div>
		</div>

	</form>

</div>   


	

</div>
<div id="footer">
		<div id="footer-valid">
		 <div style="display:block;">
			Address: R. de Luís Gonzaga Gomes, Macao 
			Tel: (853) 2857 8722 Fax: (853) 2830 8801 <br/><br/>
			Copyright &copy; <script type="text/javascript">
			                     var dt = new Date();
			                     document.write(dt.getFullYear());
			                     function send_onclick() {

			                     }

            </script> Macao Polytechnic Institute. All Rights Reserved.   
			</div>
		</div>
	</div>
</body>
</html>


