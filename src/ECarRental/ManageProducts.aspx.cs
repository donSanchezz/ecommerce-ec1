using ECarRental.Model;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ECarRental
{
    public partial class ManageProducts : System.Web.UI.Page
    {
        public static string prevFilename = "";
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
        }

        protected void Delete_Clicked(object sender, EventArgs e)
        {
            int index = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;
            string id = GridView1.Rows[index].Cells[0].Text;
            Image img = (Image)GridView1.Rows[index].Cells[0].FindControl("Image1");



            try
            {  //Create a sql connection
                SqlConnection con = new SqlConnection(Global.strcon);
                //Check if the connection is open, if not, then open it.
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("Delete from cars where id=@id", con);
                cmd.Parameters.AddWithValue("@id", Int32.Parse(id));
                cmd.ExecuteNonQuery();

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }

            string filename = Path.GetFileName(img.ImageUrl);
            string path = Server.MapPath("car_inv/" + filename);
            FileInfo file = new FileInfo(path);
            if (file.Exists)//check file exsit or not  
            {
                file.Delete();
            }

            Response.Redirect(Request.RawUrl);

        }

        protected void Add_Clicked(object sender, EventArgs e)
        {
            try
            {
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.SaveAs(Server.MapPath("car_inv/" + filename));

                string filepath = "~/car_inv/" + filename;
                string name = Name.Text.Trim();
                string description = Description.Text.Trim();
                string category = Category.Text.Trim();
                int price = Int32.Parse(Price.Text.Trim());

                try
                {  //Create a sql connection
                    SqlConnection con = new SqlConnection(Global.strcon);
                    //Check if the connection is open, if not, then open it.
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("INSERT INTO cars(name, description, category, price, image) values(@name, @description, @category, @price, @filepath)", con);
                    cmd.Parameters.AddWithValue("@name", name);
                    cmd.Parameters.AddWithValue("@description", description);
                    cmd.Parameters.AddWithValue("@category", category);
                    cmd.Parameters.AddWithValue("@price", price);
                    cmd.Parameters.AddWithValue("@filepath", filepath);
                    cmd.ExecuteNonQuery();

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

            Response.Redirect(Request.RawUrl);
        }


        protected void Update_Clicked(object sender, EventArgs e)
        {
            try
            {
                string name = Name.Text.Trim();
                string description = Description.Text.Trim();
                string category = Category.Text.Trim();
                int price = Int32.Parse(Price.Text.Trim());

                try
                {  //Create a sql connection
                    SqlConnection con = new SqlConnection(Global.strcon);
                    //Check if the connection is open, if not, then open it.
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("UPDATE cars SET name=@name, description=@description, category=@category, price=@price, image=@filepath WHERE id=@id", con);
                    cmd.Parameters.AddWithValue("@id", Int32.Parse(ProductID.Text));
                    cmd.Parameters.AddWithValue("@name", name);
                    cmd.Parameters.AddWithValue("@description", description);
                    cmd.Parameters.AddWithValue("@category", category);
                    cmd.Parameters.AddWithValue("@price", price);
                    if (FileUpload1.HasFile)
                    {
                        //Upload new image 
                        string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                        FileUpload1.SaveAs(Server.MapPath("car_inv/" + filename));
                        string filepath = "~/car_inv/" + filename;

                        //Delete old image
                        string path = Server.MapPath("car_inv/" + Path.GetFileName(prevFilename));
                        FileInfo file = new FileInfo(path);
                        if (file.Exists)//check file exsit or not  
                        {
                            file.Delete();
                        }

                        cmd.Parameters.AddWithValue("@filepath", filepath);
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@filepath", prevFilename);
                    }
                    cmd.ExecuteNonQuery();

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

            Response.Redirect(Request.RawUrl);
        }


        protected void Edit_Clicked(object sender, EventArgs e)
        {
            int index = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;
            string id = GridView1.Rows[index].Cells[0].Text;
            //Label prodId = (Label)GridView1.Rows[index].Cells[0].FindControl("ProductID");
            //Label name = (Label)GridView1.Rows[index].Cells[0].FindControl("Name");
            //Label category = (Label)GridView1.Rows[index].Cells[0].FindControl("Category");
            //Label price = (Label)GridView1.Rows[index].Cells[0].FindControl("Price");
            //Label description = (Label)GridView1.Rows[index].Cells[0].FindControl("Description");
            //Image img = (Image)GridView1.Rows[index].Cells[0].FindControl("Image1");

            try
            {  //Create a sql connection
                SqlConnection con = new SqlConnection(Global.strcon);
                //Check if the connection is open, if not, then open it.
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("Select * from cars where id=@id", con);
                cmd.Parameters.AddWithValue("@id", id);
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        ProductID.Text = reader.GetInt32(0).ToString();
                        Name.Text = reader.GetString(1);
                        Description.Text = reader.GetString(2);
                        Category.Text = reader.GetString(3);
                        Price.Text = reader.GetInt32(4).ToString();
                        prevFilename = reader.GetString(5);
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
                Console.WriteLine(ex);
            }
        }
    }
}