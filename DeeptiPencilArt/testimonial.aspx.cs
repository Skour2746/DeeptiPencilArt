using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace DeeptiPencilArt
{
    public partial class WebForm9 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DeeptiArt"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.BindListView1();
            }
        }

        private void BindListView1()
        {

            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "SELECT * FROM comment where status=1";
            cmd.Connection = con;
            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
            {
                DataTable dt = new DataTable();
                sda.Fill(dt);
                lv_testimonial.DataSource = dt;
                lv_testimonial.DataBind();
            }
        }


        protected void ListView1_PagePropertiesChanging(object sender, System.Web.UI.WebControls.PagePropertiesChangingEventArgs e)
        {
            (lv_testimonial.FindControl("DataPager1") as DataPager).SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            this.BindListView1();
        }


        private List<double> GetRatingsForPlace(int placeId)
        {

            List<double> ratings = new List<double>();

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DeeptiArt"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("SELECT rating FROM comment WHERE P_id ='" + Request.QueryString["listing_cid"] + "'", con);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    double rating = Convert.ToDouble(reader["rating"]);
                    ratings.Add(rating);
                }
                reader.Close();
                con.Close();
            }


            return ratings;

        }



        protected string RenderControlToString(Control control)
        {
            StringBuilder sb = new StringBuilder();
            StringWriter sw = new StringWriter(sb);
            HtmlTextWriter htmlWriter = new HtmlTextWriter(sw);
            control.RenderControl(htmlWriter);
            return sb.ToString();
        }
        protected string GetStarIcons(int rating)
        {
            StringBuilder starHtml = new StringBuilder();
            for (int i = 1; i <= rating; i++)
            {
                starHtml.Append("<i class='fas fa-star'></i> ");
            }
            return starHtml.ToString();
        }



        protected void Lv_testimonial_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                int placeId = Convert.ToInt32(Request.QueryString["listing_cid"]);

                List<double> ratings = GetRatingsForPlace(placeId);

                double avgRating = ratings.Any() ? ratings.Average() : 0;
                int numStars = (int)Math.Round(avgRating);
                string starHtml = "";
                for (int i = 0; i < numStars; i++)
                {
                    starHtml += "<i class='fas fa-star'></i> ";
                }



                Label ratingLabel = (Label)e.Item.FindControl("ratingLabel");
                double rating = Convert.ToDouble(DataBinder.Eval(e.Item.DataItem, "rating"));

                // Set the rating label text
                ratingLabel.Text = GetStarIcons((int)Math.Round(rating));
            }

        }
    }
}