using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class ImageViewTest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        FileUpload1.SaveAs(MapPath("~/ImageTest/" + FileUpload1.FileName));
        Image1.ImageUrl = "~/ImageTest/" + FileUpload1.FileName;
    }
}