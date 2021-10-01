using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ECarRental.Model;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;

namespace ECarRental
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //RegisterHyperLink.NavigateUrl = "Register";
            //// Enable this once you have account confirmation enabled for password reset functionality
            ////ForgotPasswordHyperLink.NavigateUrl = "Forgot";
            //OpenAuthLogin.ReturnUrl = Request.QueryString["ReturnUrl"];
            //var returnUrl = HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
            //if (!String.IsNullOrEmpty(returnUrl))
            //{
            //    RegisterHyperLink.NavigateUrl += "?ReturnUrl=" + returnUrl;
            //}
        }

        protected void LogIn(object sender, EventArgs e)
        {
            if (IsValid)
            {
                // Validate the user password
                var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
                var signinManager = Context.GetOwinContext().GetUserManager<ApplicationSignInManager>();

                // This doen't count login failures towards account lockout
                // To enable password failures to trigger lockout, change to shouldLockout: true
                ApplicationUser signedUser = manager.FindByEmail(Email.Text);
                var result = signinManager.PasswordSignIn(signedUser.UserName, Password.Text, RememberMe.Checked, shouldLockout: false);


                switch (result)
                {
                    case SignInStatus.Success:
                        try
                        {
                            //Create a sql connection
                            SqlConnection con = new SqlConnection(Global.strcon);
                            //Check if the connection is open, if not, then open it.
                            if (con.State == ConnectionState.Closed)
                            {
                                con.Open();
                            }

                            //Creating the sql statement


                            //Getting the items in the cart from the Session variable
                            




                            SqlCommand cmd = new SqlCommand("Select * from cart where userId=@Id ", con);
                            cmd.Parameters.AddWithValue("@Id", signedUser.Id);
                            SqlDataReader reader = cmd.ExecuteReader();
                            if (reader.HasRows)
                            {
                                while (reader.Read())
                                {
                                    Global.quantity.Add(reader.GetInt32(3));
                                    Global.totals.Add(reader.GetInt32(4));
                                    SqlCommand prodInfo = new SqlCommand("Select * from cars where Id=@Id ", con);
                                    prodInfo.Parameters.AddWithValue("@Id", reader.GetInt32(2));
                                    SqlDataReader newReader = prodInfo.ExecuteReader();
                                    if (newReader.HasRows)
                                    {
                                        while (newReader.Read())
                                        {
                                            Vehicle veh = new Vehicle(newReader.GetInt32(0), newReader.GetString(1), newReader.GetString(2), newReader.GetInt32(4), newReader.GetString(3), newReader.GetString(5));
                                            Global.Vehicles.Add(veh);
                                        }
                                    }
                                    else
                                    {
                                        Console.WriteLine("No rows found.");
                                    }
                                    Session["cart"] = Global.Vehicles;
                                    newReader.Close();
                                }
                            }
                            else
                            {
                                Console.WriteLine("No rows found.");
                            }
                            reader.Close();

                        }
                        catch (Exception ex)
                        {
                            Response.Write(ex);
                        }
                        Response.Redirect("Home.aspx");
                        break;
                    case SignInStatus.LockedOut:
                        Response.Redirect("/Account/Lockout");
                        break;
                    case SignInStatus.RequiresVerification:
                        Response.Redirect(String.Format("/Account/TwoFactorAuthenticationSignIn?ReturnUrl={0}&RememberMe={1}",
                                                        Request.QueryString["ReturnUrl"],
                                                        RememberMe.Checked),
                                          true);
                        break;
                    case SignInStatus.Failure:
                    default:
                        FailureText.Text = "Invalid login attempt";
                        ErrorMessage.Visible = true;
                        break;
                }
            }
        }
    }
}