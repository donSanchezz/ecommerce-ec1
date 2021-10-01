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
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace ECarRental.fontawesome
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        private const string AntiXsrfTokenKey = "__AntiXsrfToken";
        private const string AntiXsrfUserNameKey = "__AntiXsrfUserName";
        private string _antiXsrfTokenValue;
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Init(object sender, EventArgs e)
        {
            // The code below helps to protect against XSRF attacks
            var requestCookie = Request.Cookies[AntiXsrfTokenKey];
            Guid requestCookieGuidValue;
            if (requestCookie != null && Guid.TryParse(requestCookie.Value, out requestCookieGuidValue))
            {
                // Use the Anti-XSRF token from the cookie
                _antiXsrfTokenValue = requestCookie.Value;
                Page.ViewStateUserKey = _antiXsrfTokenValue;
            }
            else
            {
                // Generate a new Anti-XSRF token and save to the cookie
                _antiXsrfTokenValue = Guid.NewGuid().ToString("N");
                Page.ViewStateUserKey = _antiXsrfTokenValue;

                var responseCookie = new HttpCookie(AntiXsrfTokenKey)
                {
                    HttpOnly = true,
                    Value = _antiXsrfTokenValue
                };
                if (FormsAuthentication.RequireSSL && Request.IsSecureConnection)
                {
                    responseCookie.Secure = true;
                }
                Response.Cookies.Set(responseCookie);
            }

            Page.PreLoad += master_Page_PreLoad;
        }

        protected void master_Page_PreLoad(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Set Anti-XSRF token
                ViewState[AntiXsrfTokenKey] = Page.ViewStateUserKey;
                ViewState[AntiXsrfUserNameKey] = Context.User.Identity.Name ?? String.Empty;
            }
            else
            {
                // Validate the Anti-XSRF token
                if ((string)ViewState[AntiXsrfTokenKey] != _antiXsrfTokenValue
                    || (string)ViewState[AntiXsrfUserNameKey] != (Context.User.Identity.Name ?? String.Empty))
                {
                    throw new InvalidOperationException("Validation of Anti-XSRF token failed.");
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Unnamed_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie);

            try
            {
                //Create a sql connection
                SqlConnection con = new SqlConnection(strcon);
                //Check if the connection is open, if not, then open it.
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                //Creating the sql statement


                //Getting the items in the cart from the Session variable
                List<Vehicle> vehicles = new List<Vehicle>();
                vehicles = (List<Vehicle>)Session["cart"];

                if (vehicles != null)
                {
                    for (int i = 0; i < vehicles.Count; i++)
                    {
                        //Get the cart info to the corresponding user
                        SqlCommand check = new SqlCommand("Select * from cart where userId=@Id AND carId=@carId ", con);

                        check.Parameters.AddWithValue("@Id", Context.User.Identity.GetUserId());
                        check.Parameters.AddWithValue("@carId", vehicles[i].Id);
                        SqlDataReader reader = check.ExecuteReader();

                        //If the select statement returned null then we do an INSERT else we conduct an UPDATE 
                        if (!reader.HasRows)
                        {
                            SqlCommand cmd = new SqlCommand("INSERT INTO cart(userId, carId, quantity, total) values(@userId, @carId, @quantity, @total)", con);
                            cmd.Parameters.AddWithValue("@userId", Context.User.Identity.GetUserId());
                            cmd.Parameters.AddWithValue("@carId", vehicles[i].Id);
                            cmd.Parameters.AddWithValue("@quantity", Global.quantity[i]);
                            cmd.Parameters.AddWithValue("@total", Global.totals[i]);

                            cmd.ExecuteNonQuery();
                            reader.Close();
                        }
                        else
                        {
                            SqlCommand cmd = new SqlCommand("UPDATE cart SET quantity=@quantity, total=@total WHERE userId=@userId AND total=@prevTotal", con);
                            cmd.Parameters.AddWithValue("@userId", Context.User.Identity.GetUserId());
                            while (reader.Read())
                            {
                                cmd.Parameters.AddWithValue("@prevTotal", reader.GetInt32(4));
                                Console.Write(reader.GetInt32(4));
                            }
                            cmd.Parameters.AddWithValue("@quantity", Global.quantity[i]);
                            cmd.Parameters.AddWithValue("@total", Global.totals[i]);




                            cmd.ExecuteNonQuery();
                            reader.Close();
                        }
                    }
                }

            }
            catch (Exception ex)
            {
                Response.Write(ex);
            }

            //Clearing all application values
            Global.totals.Clear();
            Global.quantity.Clear();
            Global.Vehicles.Clear();
            Session.Remove("cart");



            Response.Redirect("Home.aspx");

        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }


    }
}