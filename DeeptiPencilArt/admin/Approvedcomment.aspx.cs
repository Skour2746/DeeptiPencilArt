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
using System.Web.UI.WebControls;

namespace DeeptiPencilArt.admin
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DeeptiArt"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["id"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
                BindComments();
            }
        }
        private void BindComments()
        {
            SqlCommand cmd = new SqlCommand("SELECT * FROM comment where status=1", con);
            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
            {
                DataTable dt = new DataTable();
                sda.Fill(dt);
                lv_comment.DataSource = dt;
                lv_comment.DataBind();
            }
        }

        private List<double> GetRatingsForPlace(int placeId)
        {
            List<double> ratings = new List<double>();
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select rating from comment where P_id = '" + Request.QueryString["listing_cid"] + "' and status=1", con);
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    double rating = Convert.ToDouble(reader["rating"]);
                    ratings.Add(rating);
                }
                reader.Close();
                con.Close();
            }
            //reviewcount.InnerText = "Total Reviews : " + ratings.Count.ToString();
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
                starHtml.Append("<i class='fa fa-star'></i> ");
            }
            return starHtml.ToString();
        }


        protected void Lv_comment_ItemDataBound(object sender, ListViewItemEventArgs e)
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

                //        // Set the rating label text
                ratingLabel.Text = GetStarIcons((int)Math.Round(rating));
            }
        }
    }
}