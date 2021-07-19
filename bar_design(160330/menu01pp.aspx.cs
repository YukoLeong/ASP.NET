using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class menu01pp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void DarkLinkButton1_Click(object sender, EventArgs e)
    {
        redli.Attributes["class"] = "red active";
        greenli.Attributes["class"] = "green";
        orangeli.Attributes["class"] = "orange";
        blueli.Attributes["class"] = "blue";
        purpleli.Attributes["class"] = "purple";
        lightgreenli.Attributes["class"] = "lightgreen";
    }
    protected void DarkLinkButton2_Click(object sender, EventArgs e)
    {
        redli.Attributes["class"] = "red";
        greenli.Attributes["class"] = "green active";
        orangeli.Attributes["class"] = "orange";
        blueli.Attributes["class"] = "blue";
        purpleli.Attributes["class"] = "purple";
        lightgreenli.Attributes["class"] = "lightgreen";
    }

    protected void DarkLinkButton3_Click(object sender, EventArgs e)
    {
        redli.Attributes["class"] = "red";
        greenli.Attributes["class"] = "green ";
        orangeli.Attributes["class"] = "orange active";
        blueli.Attributes["class"] = "blue";
        purpleli.Attributes["class"] = "purple";
        lightgreenli.Attributes["class"] = "lightgreen";
    }
    protected void DarkLinkButton4_Click(object sender, EventArgs e)
    {
        redli.Attributes["class"] = "red";
        greenli.Attributes["class"] = "green ";
        orangeli.Attributes["class"] = "orange";
        blueli.Attributes["class"] = "blue active";
        purpleli.Attributes["class"] = "purple";
        lightgreenli.Attributes["class"] = "lightgreen";
    }

    protected void DarkLinkButton5_Click(object sender, EventArgs e)
    {
        redli.Attributes["class"] = "red";
        greenli.Attributes["class"] = "green ";
        orangeli.Attributes["class"] = "orange";
        blueli.Attributes["class"] = "blue";
        purpleli.Attributes["class"] = "purple active";
        lightgreenli.Attributes["class"] = "lightgreen";
    }

    protected void DarkLinkButton6_Click(object sender, EventArgs e)
    {
        redli.Attributes["class"] = "red";
        greenli.Attributes["class"] = "green ";
        orangeli.Attributes["class"] = "orange";
        blueli.Attributes["class"] = "blue";
        purpleli.Attributes["class"] = "purple";
        lightgreenli.Attributes["class"] = "lightgreen active";
    }


}