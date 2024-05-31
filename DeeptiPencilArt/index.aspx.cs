using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DeeptiPencilArt
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DeeptiArt"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindListView1();
                BindListView2();
                BindListView3();
                //BindListView4();
                BindListView5();
            }


        }
        private void BindListView1()
        {

            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT * FROM Category where status=1";
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    lv_category.DataSource = dt;
                    lv_category.DataBind();
                }
            }
        }

        private void BindListView2()
        {

            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT top 3 * FROM Product where status=1";
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    lv_image.DataSource = dt;
                    lv_image.DataBind();
                }
            }
        }

        private void BindListView3()
        {

            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT top 3 * FROM Product where status=1";
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    lv_image1.DataSource = dt;
                    lv_image1.DataBind();
                }
            }
        }
        //private void BindListView4()
        //{

        //    using (SqlCommand cmd = new SqlCommand())
        //    {
        //        cmd.CommandText = "SELECT top 6 * FROM Product where status=1";
        //        cmd.Connection = con;
        //        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
        //        {
        //            DataTable dt = new DataTable();
        //            sda.Fill(dt);
        //            lv_pdetail.DataSource = dt;
        //            lv_pdetail.DataBind();
        //        }
        //    }
        //}
        private void BindListView5()
        {

            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT * FROM About where status=1";
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    lv_about_detail.DataSource = dt;
                    lv_about_detail.DataBind();
                }
            }
        }



    }
}