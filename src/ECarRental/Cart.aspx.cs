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
        private int counter = 1;
        protected void Page_Load(object sender, EventArgs e)
        {
            

            Session["cart"] = Global.Vehicles;
            List<Vehicle> vehicles = new List<Vehicle>();
            vehicles = (List<Vehicle>)Session["cart"];


            GridView1.DataSource = vehicles;
            GridView1.DataBind();

            int count = GridView1.Rows.Count;
            for (int i = 0; i < count; i++)
            {
                TextBox txtBox = (TextBox)GridView1.Rows[i].Cells[0].FindControl("TextBox1");
                Label label = (Label)GridView1.Rows[i].Cells[0].FindControl("Label7");

                if (Global.map.ContainsKey(i))
                {
                    txtBox.Text = Global.map[i].ToString();
                }

                if (Global.totals.ContainsKey(i))
                {
                    label.Text = Global.totals[i].ToString();
                }

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

            if (Global.map.ContainsKey(index))
            {
                Global.map[index] -= 1;
            }
            else
            {
                Global.map.Add(index, counter - 1);
            }

            txtBox.Text = Global.map[index].ToString();
            ViewState["cartVals"] = Global.map;
            int value = Global.map[index];
            Console.WriteLine(value);

            CalcTotal(value, sender, e);
            CalSubTotal();
            CalGrandTotal();
        }

        protected void plusClicked(object sender, EventArgs e)
        {
            int index = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;
            TextBox txtBox = (TextBox)GridView1.Rows[index].Cells[0].FindControl("TextBox1");

            if (Global.map.ContainsKey(index))
            {
                Global.map[index] += 1;
            }else
            {
                Global.map.Add(index, counter + 1);
            }

            txtBox.Text = Global.map[index].ToString();
            ViewState["cartVals"] = Global.map;
            int value = Global.map[index];
            Console.WriteLine(value);

            CalcTotal(value, sender, e);
            CalSubTotal();
            CalGrandTotal();
        }

        protected void binClicked(object sender, EventArgs e)
        {
            int index = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;
            Label label = (Label)GridView1.Rows[index].Cells[0].FindControl("Label10");
            int id = Int32.Parse(label.Text);

            int index1 = Global.Vehicles.FindIndex(x => x.Id == id);
            Global.Vehicles.RemoveAt(index1);
            Global.totals.Remove(index1);
            Response.Redirect(Request.RawUrl);
        }

        protected void CalcTotal (int quantity, object sender, EventArgs e)
        {
            int index = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;
            Label label = (Label)GridView1.Rows[index].Cells[0].FindControl("Label7");
            Label price = (Label)GridView1.Rows[index].Cells[0].FindControl("Label3");

            label.Text = (quantity * Int32.Parse(price.Text)).ToString();

            if (Global.totals.ContainsKey(index))
            {
                Global.totals[index] = Int32.Parse(label.Text);
            }
            else
            {
                Global.totals.Add(index, Int32.Parse(label.Text));
            }
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
            Label6.Text = (Int32.Parse(Label5.Text) +Int32.Parse(val)).ToString();
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            CalGrandTotal();
        }
    }
}