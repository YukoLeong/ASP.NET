using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace bar_design
{
    public partial class button2pp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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

        protected void ImageButtonapic8_Click(object sender, ImageClickEventArgs e)
        {
            Response.Write("gohome");
        }


    }
    
}