using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DeeptiPencilArt;

namespace DeeptiPencilArt
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DeeptiArt"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindListView();
                BindListView1();
                BindListView2();
                BindListView3();
            }

        }
        public void BindListView()
        {
            con.Open();
            using (SqlDataAdapter sda = new SqlDataAdapter("select top 3 * from Product", con))
            {
                DataTable dt = new DataTable();
                sda.Fill(dt);
                lv_about_gallery.DataSource = dt;
                lv_about_gallery.DataBind();
            }
            con.Close();
        }
        public void BindListView1()
        {
            con.Open();
            using (SqlDataAdapter sda = new SqlDataAdapter("select top 3 * from Product", con))
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
            using (SqlDataAdapter sda = new SqlDataAdapter("select top 3 * from our_team", con))
            {
                DataTable dt = new DataTable();
                sda.Fill(dt);
                lv_our_team1.DataSource = dt;
                lv_our_team1.DataBind();
            }
            con.Close();
        }
        public void BindListView3()
        {
            con.Open();
            using (SqlDataAdapter sda = new SqlDataAdapter("select * from About where status=1", con))
            {
                DataTable dt = new DataTable();
                sda.Fill(dt);
                lv_about_detail.DataSource = dt;
                lv_about_detail.DataBind();
            }
            con.Close();
        }
    }
}