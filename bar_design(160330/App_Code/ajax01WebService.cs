using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;


//ajax01用

[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
[System.ComponentModel.ToolboxItem(false)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class ajax01WebService : System.Web.Services.WebService {

    [WebMethod]
    public string test01()
    {
        return "Hello World";
    }


    [WebMethod]

    public string test02(string name)
    {
        return "Hello World " + name + Environment.NewLine + "The Current Time is: " + DateTime.Now.ToString();
        //return name;
    }
    
}
