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
    public partial class WebForm2 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DeeptiArt"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindListView1();
                CalculateTotal_Click();

            }
        }

        private void BindListView1()
        {

            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "select Product.Product_Name,Product.image,Frame_TBL1.Frame, Product.Price,Cart.* from Cart inner join Product on Cart.Painting_id=Product.id inner join Frame_TBL1 on Cart.Frame_id=Frame_TBL1.id where Customer_id='" + Session["id"] + "'";
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    lv_Cart.DataSource = dt;
                    lv_Cart.DataBind();
                }
            }


        }
        protected void CalculateTotal_Click()
        {
            int total = 0;

            foreach (ListViewItem item in lv_Cart.Items)
            {
                // Retrieve controls for price and quantity
                if (item.FindControl("lblPrice") is Label lblPrice && item.FindControl("lblqty") is Label lblqty)
                {
                    int price = Convert.ToInt32(lblPrice.Text);
                    int quantity = Convert.ToInt32(lblqty.Text);

                    total += price * quantity;
                }
            }

            lblTotal.Text = "Total: Rs. " + total.ToString("0.00") + " /-";
        }

        protected void Lv_Cart_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "delete")
            {
                string lblid = "";
                Label label1 = (Label)e.Item.FindControl("lblid");
                if (lblid != null)
                    lblid = label1.Text;
                string Deletequery = "Delete from Cart WHERE [ID] = '" + lblid + "'";

                con.Open();
                SqlCommand com = new SqlCommand(Deletequery, con);
                com.ExecuteNonQuery();
                con.Close();
                BindListView1();
                CalculateTotal_Click();
            }
        }

        protected void Lv_Cart_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        {

        }


        protected void Button2_Click(object sender, EventArgs e)
        {
            if (Session["id"] == null)
            {
                // Redirect to the login page
                Response.Redirect("Login.aspx");
            }
            else
            {
                Response.Redirect("Shipping.aspx");
            }
        }
    }
}