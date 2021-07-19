using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class session01 : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Request["lang"]))
        {
            Session["lang"] = Request["lang"];
        }
        string lang = Convert.ToString(Session["lang"]);
        string culture = string.Empty;
        if (lang.ToLower().CompareTo("en") == 0 || string.IsNullOrEmpty(culture))
        {
            ImageButtonapic8.ImageUrl = "~/button02style/bbb/cpic5.png";
            ImageButtonapic1.ImageUrl = "~/button02style/bbb/spic1.png";
            ImageButtonapic2.ImageUrl = "~/button02style/bbb/spic2.png";
            ImageButtonapic3.ImageUrl = "~/button02style/bbb/spic3.png";
            ImageButtonapic4.ImageUrl = "~/button02style/bbb/spic4.png";
            ImageButtonapic5.ImageUrl = "~/button02style/bbb/spic5.png";
            ImageButtonapic6.ImageUrl = "~/button02style/bbb/spic6.png";
            ImageButtonapic7.ImageUrl = "~/button02style/bbb/spic7.png";
        }
        if (lang.ToLower().CompareTo("zh") == 0)
        {
            ImageButtonapic8.ImageUrl = "~/button02style/ccc/homec.png";
            ImageButtonapic1.ImageUrl = "~/button02style/ccc/ccca1.png";
            ImageButtonapic2.ImageUrl = "~/button02style/ccc/ccca2.png";
            ImageButtonapic3.ImageUrl = "~/button02style/ccc/ccca3.png";
            ImageButtonapic4.ImageUrl = "~/button02style/ccc/ccca4.png";
            ImageButtonapic5.ImageUrl = "~/button02style/ccc/ccca5.png";
            ImageButtonapic6.ImageUrl = "~/button02style/ccc/ccca6.png";
            ImageButtonapic7.ImageUrl = "~/button02style/ccc/ccca7.png";
        }

    }


    protected void ImageButtonapic1_Click(object sender, ImageClickEventArgs e)
    {
        ImageButtonapic1.CssClass = "aimgactive";
        ImageButtonapic2.CssClass = "aimg";
        ImageButtonapic3.CssClass = "aimg";
        ImageButtonapic4.CssClass = "aimg";
        ImageButtonapic5.CssClass = "aimg";
        ImageButtonapic6.CssClass = "aimg";
        ImageButtonapic7.CssClass = "aimg";
    }

    protected void ImageButtonapic2_Click(object sender, ImageClickEventArgs e)
    {
        ImageButtonapic1.CssClass = "aimg";
        ImageButtonapic2.CssClass = "aimgactive";
        ImageButtonapic3.CssClass = "aimg";
        ImageButtonapic4.CssClass = "aimg";
        ImageButtonapic5.CssClass = "aimg";
        ImageButtonapic6.CssClass = "aimg";
        ImageButtonapic7.CssClass = "aimg";
    }

    protected void ImageButtonapic3_Click(object sender, ImageClickEventArgs e)
    {
        ImageButtonapic1.CssClass = "aimg";
        ImageButtonapic2.CssClass = "aimg";
        ImageButtonapic3.CssClass = "aimgactive";
        ImageButtonapic4.CssClass = "aimg";
        ImageButtonapic5.CssClass = "aimg";
        ImageButtonapic6.CssClass = "aimg";
        ImageButtonapic7.CssClass = "aimg";
    }

    protected void ImageButtonapic4_Click(object sender, ImageClickEventArgs e)
    {
        ImageButtonapic1.CssClass = "aimg";
        ImageButtonapic2.CssClass = "aimg";
        ImageButtonapic3.CssClass = "aimg";
        ImageButtonapic4.CssClass = "aimgactive";
        ImageButtonapic5.CssClass = "aimg";
        ImageButtonapic6.CssClass = "aimg";
        ImageButtonapic7.CssClass = "aimg";
    }

    protected void ImageButtonapic5_Click(object sender, ImageClickEventArgs e)
    {
        ImageButtonapic1.CssClass = "aimg";
        ImageButtonapic2.CssClass = "aimg";
        ImageButtonapic3.CssClass = "aimg";
        ImageButtonapic4.CssClass = "aimg";
        ImageButtonapic5.CssClass = "aimgactive";
        ImageButtonapic6.CssClass = "aimg";
        ImageButtonapic7.CssClass = "aimg";
    }

    protected void ImageButtonapic6_Click(object sender, ImageClickEventArgs e)
    {
        ImageButtonapic1.CssClass = "aimg";
        ImageButtonapic2.CssClass = "aimg";
        ImageButtonapic3.CssClass = "aimg";
        ImageButtonapic4.CssClass = "aimg";
        ImageButtonapic5.CssClass = "aimg";
        ImageButtonapic6.CssClass = "aimgactive";
        ImageButtonapic7.CssClass = "aimg";
    }

    protected void ImageButtonapic7_Click(object sender, ImageClickEventArgs e)
    {
        ImageButtonapic1.CssClass = "aimg";
        ImageButtonapic2.CssClass = "aimg";
        ImageButtonapic3.CssClass = "aimg";
        ImageButtonapic4.CssClass = "aimg";
        ImageButtonapic5.CssClass = "aimg";
        ImageButtonapic6.CssClass = "aimg";
        ImageButtonapic7.CssClass = "aimgactive";
    }


}