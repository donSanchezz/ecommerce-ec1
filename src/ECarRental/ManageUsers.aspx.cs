﻿using ECarRental.Model;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ECarRental
{
    public partial class ManageUsers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var userId = Context.User.Identity.GetUserId();

            if (!Context.User.Identity.IsAuthenticated)
            {
                Response.Redirect("~/Home.aspx");
            }
            if (!manager.IsInRole(userId, "Admin"))
            {
                Response.Redirect("~/Home.aspx");
            }
            getUserInfo();
        }

        protected void getUserInfo()
        {
            try
            {
                //Create a sql connection
                SqlConnection con = new SqlConnection(Global.strcon);
                //Check if the connection is open, if not, then open it.
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                try
                {
                    SqlCommand cmd = new SqlCommand("Select FirstName, LastName, Address, Email, Username FROM AspNetUsers WHERE Id=@Id", con);

                    cmd.Parameters.AddWithValue("@Id", Context.User.Identity.GetUserId());
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            FName.Text = reader.GetString(0);
                            LName.Text = reader.GetString(1);
                            Address.Text = reader.GetString(2);
                            Email.Text = reader.GetString(3);
                            Username.Text = reader.GetString(4);
                        }
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
    }
}