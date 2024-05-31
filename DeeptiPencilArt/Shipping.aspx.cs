using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DeeptiPencilArt
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DeeptiArt"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            BindListView();
            BindListView2();
            CalculateTotal_Click();
        }


        public void BindListView()
        {
            con.Open();
            using (SqlDataAdapter sda = new SqlDataAdapter("select Product.Product_Name,Product.image,Frame_TBL1.Frame, Product.Price,Cart.* from Cart inner join Product on Cart.Painting_id=Product.id inner join Frame_TBL1 on Cart.Frame_id=Frame_TBL1.id where Customer_id='" + Session["id"] + "' ", con))
            {
                DataTable dt = new DataTable();
                sda.Fill(dt);
                ListView1.DataSource = dt;
                ListView1.DataBind();
            }
            con.Close();
        }

        public void BindListView2()
        {
            con.Open();
            using (SqlDataAdapter sda = new SqlDataAdapter("select * from Shipping_tbl where Order_id='" + Session["id"] + "' ", con))
            {
                DataTable dt = new DataTable();
                sda.Fill(dt);
                lv_address.DataSource = dt;
                lv_address.DataBind();
            }
            con.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            foreach (ListViewItem item in ListView1.Items)
            {
                string lblid1 = "";

                if (item.FindControl("lblid") is Label lblid)
                {
                    lblid1 = lblid.Text;
                }
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into Shipping_tbl(Order_id,Name,Email,Contact,Address,State,City,PinCode,Order_note,status,rts) values ('" + lblid1 + "', '" + txtname.Text + "','" + txtemail.Text + "','" + txtcontact.Text + "','" + txtaddress.Text + "','" + txtstate.Text + "','" + txtcity.Text + "','" + txtpincode.Text + "','" + txtOrderNote.Text + "',1,getdate())", con);
                cmd.ExecuteNonQuery();
                con.Close();
                con.Close();
            }


        }
        protected void CalculateTotal_Click()
        {
            decimal total = 0;

            foreach (ListViewItem item in ListView1.Items)
            {
                // Retrieve controls for price and quantity
                if (item.FindControl("lblPrice") is Label lblPrice && item.FindControl("lblqty") is Label lblqty)
                {
                    decimal price = Convert.ToDecimal(lblPrice.Text);
                    int quantity = Convert.ToInt32(lblqty.Text);

                    total += price * quantity;
                }
            }

            lblTotal.Text = "Total: Rs. " + total.ToString("0.00") + " /-";
        }
    }
}