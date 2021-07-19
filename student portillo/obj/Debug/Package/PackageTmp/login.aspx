<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="login.aspx.vb" Inherits="ep.login" %>

    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" href="style.css" type="text/css" media="screen" />
<link rel="stylesheet" href="login.css" type="text/css" media="screen" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Macao Polytechnic Institute</title>

<script type="text/javascript" src="remFunction.js"></script>



</head>

<body>

<label>
</label>

<div id="wrapper">
<div id="login"> 


<form id="form" name="form" method="post" action="verify.aspx" onsubmit="if (this.remen.checked) toMem(this);">
<div id="formcore">
<span>Name:<input type="text" name="Name" id="Name" />
</span>


<span>Password:<input type="password" name="Password" id="Password" />
</span>
<span>RememberMe&nbsp<input type="checkbox" name="remen" id="remen" />
</span>
<span>
    <input type="button" name="reset" id="reset" value="reset" 
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
	<div id="menu">
		
	</div>

	<div id="sidebar">
		<iframe id="Iframe1" frameborder="no" name="I1" scrolling="no" 
            src="item/Link.aspx" height="165px">
            </iframe>
	</div>

	<div id="content">
    
    
 <p style="font-size: large; font-weight: bolder">Welcome to Macao Polytechnic Institute!</p>

   
<div id="seticon">
</div>   
	</div>

	<div id="footer">
		<div id="footer-valid">
			
		</div>
	</div>

</div>

</body>
</html>


