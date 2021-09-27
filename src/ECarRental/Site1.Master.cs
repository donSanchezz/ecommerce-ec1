using ECarRental.Model;
using Microsoft.AspNet.Identity.Owin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;

namespace ECarRental.fontawesome
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "Func()", true);

            if (IsPostBack)
            {
                Name.Text = Context.User.Identity.GetUserName();
            }

           

        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }

       
    }
}