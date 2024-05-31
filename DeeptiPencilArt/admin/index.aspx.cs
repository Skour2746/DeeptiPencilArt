using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DeeptiPencilArt.admin
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DeeptiArt"].ConnectionString);

        public static string Product_count = "";
        public static string Registration_count = "";
        public static string Enquiry_Count = "";
        public static string Pending_Comments = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
                Count();
                Count1();
                Count2();
                Count3();

            }

        }

        public void Count()
        {
            con.Open();
            SqlCommand cmd2 = new SqlCommand("SELECT COUNT(id) from Product", con);
            Product_count = cmd2.ExecuteScalar().ToString();
            con.Close();
        }
        public void Count1()
        {
            con.Open();
            SqlCommand cmd2 = new SqlCommand("SELECT COUNT(id) from User_Registration", con);
            Registration_count = cmd2.ExecuteScalar().ToString();
            con.Close();
        }
        public void Count2()
        {
            con.Open();
            SqlCommand cmd2 = new SqlCommand("SELECT COUNT(id) from User_Enquiry", con);
            Enquiry_Count = cmd2.ExecuteScalar().ToString();
            con.Close();
        }
        public void Count3()
        {
            con.Open();
            SqlCommand cmd2 = new SqlCommand("SELECT COUNT(id) from comment where status=0", con);
            Pending_Comments = cmd2.ExecuteScalar().ToString();
            con.Close();
        }
    }
}