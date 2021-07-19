using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class language01 : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        #region--Show/hide language link
        if (!string.IsNullOrEmpty(Convert.ToString(Session["lang"])))
        {
            if (Convert.ToString(Session["lang"]) == "en")
            {
                linkChinese.Visible = true;
                linkEnglish.Visible = false;
            }
            else
            {
                linkEnglish.Visible = true;
                linkChinese.Visible = false;
            }
        }
        else
        {
            linkChinese.Visible = false;
            linkEnglish.Visible = true;
        }
        #endregion--
    }
}