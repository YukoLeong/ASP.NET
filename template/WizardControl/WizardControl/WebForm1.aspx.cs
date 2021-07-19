using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WizardControl
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = TextBox1.Text;
            Label2.Text = TextBox2.Text;
            Label3.Text = DropDownList1.SelectedValue;
            Label4.Text = TextBox3.Text;
            Label5.Text = TextBox4.Text;
        }

        protected void Wizard1_FinishButtonClick(object sender, WizardNavigationEventArgs e)
        {
            //if (e.NextStepIndex == 2)
            //{
            //    Label1.Text = TextBox1.Text;
            //    Label2.Text = TextBox2.Text;
            //    Label3.Text = DropDownList1.SelectedValue;
            //    Label4.Text = TextBox3.Text;
            //    Label5.Text = TextBox4.Text;
            //}
        }
    }
}