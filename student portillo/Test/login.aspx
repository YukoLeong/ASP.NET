<%@ Page Language="VB" AutoEventWireup="false" CodeFile="login.aspx.vb" Inherits="login" %>

 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" href="style.css" type="text/css" media="screen" />
<link rel="stylesheet" href="login.css" type="text/css" media="screen" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Macao Polytechnic Institute</title>

<script type="text/javascript" src="remFunction.js"></script>



    <style type="text/css">
        .style1
        {
            font-family: "Berlin Sans FB";
        }
        .style2
        {
            font-size: x-large;
        }
        .style3
        {
            font-size: large;
			padding-right: 10px;
        }
    </style>



</head>

<body>

<label>
</label>

<div id="wrapper">
<div id="login"> 


<form id="form" name="form" method="post" action="verify.aspx" onsubmit="if (this.remen.checked) toMem(this);">
<div id="formcore">
<span>Name:&nbsp;<input type="text" name="Name" id="Name" />
</span>


<span>Password: &nbsp;<input type="password" name="Password" id="Password" />
</span>
 <label> Remember Me&nbsp; <input type="checkbox" name="remen" id="remen" /></label>

<span>
    <input type="button" name="reset" id="reset" value="Reset" 
        onclick="delMem(this)" class="white" /></span>
        &nbsp
<span><input type="submit" name="send" id="send" value="Login" class="white" />
</span>
</div>
 </form>

<script type="text/javascript" language="javascript">
    document.form.Name.value = readCookie("Name");
    document.form.Password.value = readCookie("Password");
</script>
    </div>
    
	<div id="header">
    
	 
    
 </div>
	<!--div id="menu">
		
	</div-->

	

	<div id="content">
    
    
    <p class="style3">Welcome to Macao Polytechnic Institute e-Portfolio System!</p>
        <span class="style1">
        <p class="style3">MPI e-Portfolio system is a platform for students to collect their works and extracurricular activities. Students can plan their MPI attributes in each of academic year and make progress with instructors' advices.</p>
        <p class="style3"><span class="style1">We encourage students to actively participate in e-Portfolio system. It will assist students to ideally achieve the attributes of MPI graduates. </span></p>
        </span>
       </p>

   
<div id="seticon">
</div>   
	</div>

	

</div>
<div id="footer">
		<div id="footer-valid">
		 <div style="display:block;">
			Address: R. de Luís Gonzaga Gomes, Macao 
			Tel: (853) 2857 8722 Fax: (853) 2830 8801 <br/><br/>
			Copyright &copy; <script type="text/javascript">
				var dt = new Date();
				document.write(dt.getFullYear() ); 
			</script> Macao Polytechnic Institute. All Rights Reserved.   
			</div>
		</div>
	</div>
</body>
</html>


