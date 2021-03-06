using ECarRental.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ECarRental
{
    public partial class Cart : System.Web.UI.Page
    {
      
        protected void Page_Load(object sender, EventArgs e)
        {
            
            Session["cart"] = Global.Vehicles;
            List<Vehicle> vehicles = new List<Vehicle>();
            vehicles = (List<Vehicle>)Session["cart"];

          
            GridView1.DataSource = vehicles;
            GridView1.DataBind();
            int count = GridView1.Rows.Count;

            //Check to see if the cart was previously cleared and displays a message accordingly
            if (count == 0 && Global.CartCleared == 0)
            {
                this.ClientScript.RegisterStartupScript(this.GetType(), "Info", "swal('Empty Cart!', 'Your cart is empty, go back and continue shopping', 'info');", true);
                Button3.Attributes["disabled"] = "disabled";
                Button2.Attributes["disabled"] = "disabled";
            }

            if (Global.CartCleared == 1)
                {
                    this.ClientScript.RegisterStartupScript(this.GetType(), "Success", "swal('Order Completed!', 'Your order has been completed', 'success');", true);
                    Global.CartCleared = 0;
                }
            

            

            

            //Looping through the Grid View and Assigning the Count value and Total value
            for (int i = 0; i < count; i++)
            {
                TextBox txtBox = (TextBox)GridView1.Rows[i].Cells[0].FindControl("TextBox1");
                Label label = (Label)GridView1.Rows[i].Cells[0].FindControl("Label7");


                txtBox.Text = Global.quantity[i].ToString();

                label.Text = Global.totals.ElementAt(i).ToString();

            }

            //Item count labels
            Label11.Text = Global.Vehicles.Count().ToString();
            Label8.Text = Global.Vehicles.Count().ToString();

            CalSubTotal();
            CalGrandTotal();


        }

        protected void minusClicked(object sender, EventArgs e)
        {
            int index = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;
            TextBox txtBox = (TextBox)GridView1.Rows[index].Cells[0].FindControl("TextBox1");

            //Decrementing the count value
            Global.quantity[index] -= 1;

            if (Global.quantity[index] == 0)
            {
                binClicked(sender, e);
            }
    
            //Setting count value to the text Box
            txtBox.Text = Global.quantity[index].ToString();
            ViewState["cartVals"] = Global.quantity;

            int value = Global.quantity[index];

            //Calling the methods to recalculate and update all values on the page
            CalcTotal(value, sender, e);
            CalSubTotal();
            CalGrandTotal();
        }

        protected void plusClicked(object sender, EventArgs e)
        {
            int index = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;
            TextBox txtBox = (TextBox)GridView1.Rows[index].Cells[0].FindControl("TextBox1");

            //incrementing the count value
            Global.quantity[index] += 1;


            //Setting the count value
            txtBox.Text = Global.quantity[index].ToString();
            ViewState["cartVals"] = Global.quantity;
            int value = Global.quantity[index];

            //Calling the methods to recalculate and update all values on the page
            CalcTotal(value, sender, e);
            CalSubTotal();
            CalGrandTotal();
        }

        protected void binClicked(object sender, EventArgs e)
        {
            int index = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;
            Label label = (Label)GridView1.Rows[index].Cells[0].FindControl("Label10");

            int id = Int32.Parse(label.Text);

            //Retrieve Vehicle's index in the gloval variabls vehicles, based on the row that was selected via button
            int index1 = Global.Vehicles.FindIndex(x => x.Id == id);


            //Remove items from Vehicles and Total
            Global.Vehicles.RemoveAt(index1);
            Global.totals.RemoveAt(index1);
            Global.quantity.RemoveAt(index1);
            Response.Redirect(Request.RawUrl);
        }

        protected void CalcTotal(int quantity, object sender, EventArgs e)
        {
            int index = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;
            Label label = (Label)GridView1.Rows[index].Cells[0].FindControl("Label7");
            Label price = (Label)GridView1.Rows[index].Cells[0].FindControl("Label3");

            label.Text = (quantity * Int32.Parse(price.Text)).ToString();


            Global.totals[index] = Int32.Parse(label.Text);

        }

        protected void CalSubTotal()
        {
            //Looping through each Total in the Global variable Total and adding them
            int count = GridView1.Rows.Count;
            int subTotal = 0;
            for (int i = 0; i < count; i++)
            {
                int val = Global.totals[i];
                subTotal += val;
            }
            Label5.Text = subTotal.ToString();
        }

        protected void CalGrandTotal()
        {
            string val = DropDownList1.SelectedValue;
            Label6.Text = (Int32.Parse(Label5.Text) + Int32.Parse(val)).ToString();
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            CalGrandTotal();
        }

        protected void Checkout_Click(object sender, EventArgs e)
        {

            if (Global.Vehicles.Count != 0)
            {
                //Setting this variable to true so when the page is reloaded it checks and displays a cart was cleared message
                Global.CartCleared = 1;

                //Clears all the global variables and empties the cart
                Global.Vehicles.Clear();
                Global.quantity.Clear();
                Global.totals.Clear();
            }
            else
            {
                this.ClientScript.RegisterStartupScript(this.GetType(), "Error", "swal('Empty Cart!', 'Your cart is empty, go back and continue shopping', 'error');", true);
            }


            Response.Redirect(Request.RawUrl);


        }
    }
}