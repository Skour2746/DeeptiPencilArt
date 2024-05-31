using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Configuration;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace DeeptiPencilArt
{
    public partial class Deeptipencilart : System.Web.UI.MasterPage
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DeeptiArt"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["id"] == null)
            {
                btnlogin.Visible = true;
                btnlogout.Visible = false;
                btnMlogin.Visible = true;
                btnMlogout.Visible = false;

            }
            else
            {
                btnlogin.Visible = false;
                btnlogout.Visible = true;
                btnMlogin.Visible = false;
                btnMlogout.Visible = true;
            }

            if (!IsPostBack)
            {
                BindListView();
                BindListView1();
                BindListView2();
            }
            if (Session["id"] != null)
            {
                Load_Username();
            }
        }
        private void Load_Username()
        {
            SqlCommand cmd = new SqlCommand("SELECT user_email FROM User_Registration WHERE user_email = @Username", con);
            cmd.Parameters.AddWithValue("@Username", Session["id"].ToString());

            con.Open();
            string username = Convert.ToString(cmd.ExecuteScalar());
            con.Close();
            lblUsername.Text = "Hello " + username;
            Label1.Text = "Hello " + username;

        }
        private void BindListView()
        {

            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT * FROM Company_Detail";
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    lv_address.DataSource = dt;
                    lv_address.DataBind();
                }
            }
        }

        protected void Btnlogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void Btnlogout_Click(object sender, EventArgs e)
        {
            Session.Remove("id");

            Response.Redirect("index.aspx");
        }


        private void BindListView1()
        {

            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT * FROM About";
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    lv_aside_detail.DataSource = dt;
                    lv_aside_detail.DataBind();
                }
            }
        }

        private void BindListView2()
        {

            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT * FROM Company_Detail";
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    lv_display_logo.DataSource = dt;
                    lv_display_logo.DataBind();
                }
            }
        }

        protected void btnMlogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");

        }

        protected void btnMlogout_Click(object sender, EventArgs e)
        {
            Session.Remove("id");
            Response.Redirect("index.aspx");
        }

        protected void btncart_Click(object sender, EventArgs e)
        {
            if (Session["id"] == null)
            {
                // Redirect to the login page
                Response.Redirect("Login.aspx");
            }
            else
            {
                Response.Redirect("Cart.aspx");
            }
        }

        protected void btnaccount_Click(object sender, EventArgs e)
        {
            if (Session["id"] == null)
            {
                // Redirect to the login page
                Response.Redirect("Login.aspx");
            }
            else
            {
                Response.Redirect("index.aspx");
            }
        }

        protected void btnorder_Click(object sender, EventArgs e)
        {
            if (Session["id"] == null)
            {
                // Redirect to the login page
                Response.Redirect("Login.aspx");
            }
            else
            {
                Response.Redirect("Order.aspx");
            }
        }
    }
}