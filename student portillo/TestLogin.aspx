<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TestLogin.aspx.cs" Inherits="TestLogin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>

    <form id="form" name="form" method="post" action="verifyStaff.aspx" onsubmit="if (this.remen.checked) toMem(this);">

<span>Name:&nbsp;<input type="text" name="Name" id="Name" />
</span>
<span>Password: &nbsp;<input type="password" name="Password" id="Password" />
</span>
 <label> Remember Me&nbsp; <input type="checkbox" name="remen" id="remen" /></label>

<span>
    <input type="button" name="reset" id="reset" value="Reset" 
        onclick="delMem(this)" class="white" /></span>
        &nbsp
<span><!--input type="submit" name="send" id="send" value="Login" class="white" onclick="return send_onclick()" /-->
<input type="submit" name="send" id="send" value="Login" class="white" />
</span>

 </form>
   
</body>
</html>
