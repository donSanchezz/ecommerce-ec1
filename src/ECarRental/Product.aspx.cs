using ECarRental.Model;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ECarRental
{
    public partial class Product : System.Web.UI.Page
    {
        //string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;


        protected void Page_Load(object sender, EventArgs e)
        {
          
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //Getting the product detail per the row index of the button clicked
            int index = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;
            Label name = (Label)GridView1.Rows[index].Cells[1].FindControl("Label1");
            Label category = (Label)GridView1.Rows[index].Cells[1].FindControl("Label2");
            Label price = (Label)GridView1.Rows[index].Cells[1].FindControl("Label3");
            int newPrice = Convert.ToInt32(price.Text.ToString());
            Label description = (Label)GridView1.Rows[index].Cells[1].FindControl("Label4");
            Image image = (Image)GridView1.Rows[index].Cells[1].FindControl("Image1");
            int id = (int)GridView1.DataKeys[index]["id"];

            //Creating a new instance of a vehicle with the product detail
            Vehicle newVeh = new Vehicle(id, name.Text, description.Text, newPrice, category.Text, image.ImageUrl);


            //Check if the item already exists  
            if (Global.Vehicles.Find(x => x.Id == newVeh.Id) == null)
            {
                Global.Vehicles.Add(newVeh);
                Global.totals.Add(newPrice);
                Global.quantity.Add(1);
                this.ClientScript.RegisterStartupScript(this.GetType(), "Success", "swal('Item Added!', 'This item has been added to your cart', 'success');", true);
            }
            else
            {
                this.ClientScript.RegisterStartupScript(this.GetType(), "Error", "swal('Oops!', 'This item already belongs to your cart', 'error');", true);

            }








        }
    }
}