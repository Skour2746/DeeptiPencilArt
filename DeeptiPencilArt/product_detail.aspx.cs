using AjaxControlToolkit;
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
    public partial class WebForm7 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DeeptiArt"].ConnectionString);


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindListView1();
                BindListView2();
                Bigds();
                Bigds1();

            }
            if (Request.QueryString["listing_cid"] == null)
            {
                Response.Redirect("explore.aspx");
            }



        }
        private void BindListView1()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "SELECT * FROM Product where id='" + Request.QueryString["listing_cid"] + "'";
            cmd.Connection = con;
            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
            {
                DataTable dt = new DataTable();
                sda.Fill(dt);
                ListView1.DataSource = dt;
                ListView1.DataBind();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            if (Session["id"] == null)
            {
                // Redirect to the login page
                Response.Redirect("Login.aspx");
            }

            else
            {
                con.Open();
                string fileName = "";
                if (FileUpload1.HasFile)
                {
                    foreach (HttpPostedFile file in FileUpload1.PostedFiles)
                    {
                        fileName = Path.GetFileName(file.FileName);
                        var encoderParams = new EncoderParameters(1);
                        encoderParams.Param[0] = new EncoderParameter(System.Drawing.Imaging.Encoder.Quality, 90L);
                        System.Drawing.Image.FromStream(file.InputStream).Save(Server.MapPath("~/images1/commenter/" + fileName), ImageCodecInfo.GetImageEncoders().First(c => c.FormatID == ImageFormat.Jpeg.Guid), encoderParams);
                        System.Drawing.Image.FromStream(file.InputStream).GetThumbnailImage(200, 200, () => false, IntPtr.Zero).Save(Server.MapPath("~/images1/commenter/" + fileName));

                    }
                }
                SqlCommand cmd = new SqlCommand("insert into comment(P_id,image,rating,c_name,comment,status,rts) values ('" + Request.QueryString["listing_cid"] + "','" + fileName + "','" + Rating1 + "','" + txtname.Text + "','" + txtcomment.Text + "',0,getdate())", con);
                cmd.ExecuteNonQuery();
                con.Close();
                foreach (ListViewItem item in ListView1.Items)
                {
                    if (item.FindControl("lblcart") is Label lblcart)
                    {
                        lblcart.Text = "Item is added to cart";
                    }
                }
                    BindListView2();
                txtname.Text = "";
                txtcomment.Text = "";
             }
        }

        private void BindListView2()
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT * FROM comment where P_id='" + Request.QueryString["listing_cid"] + "' and status=1";
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    lv_comment.DataSource = dt;
                    lv_comment.DataBind();
                }
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
                starHtml.Append("<i class='fas fa-star'></i> ");
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




        private List<double> GetRatingsForPlace1(int placeId1)
        {
            List<double> ratings1 = new List<double>();
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select rating from comment where P_id = '" + Request.QueryString["listing_cid"] + "' and status=1", con);
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    double rating = Convert.ToDouble(reader["rating"]);
                    ratings1.Add(rating);
                }
                reader.Close();
                con.Close();
            }
            //reviewcount.InnerText = "Total Reviews : " + ratings.Count.ToString();
            return ratings1;
        }

        protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                int placeId1 = Convert.ToInt32(Request.QueryString["listing_cid"]);

                List<double> ratings = GetRatingsForPlace(placeId1);

                double avgRating1 = ratings.Any() ? ratings.Average() : 0;
                int numStars1 = (int)Math.Round(avgRating1);
                string starHtml1 = "";
                for (int i = 0; i < numStars1; i++)
                {
                    starHtml1 += "<i class='fas fa-star'></i> ";
                }
                Label Label2 = (Label)e.Item.FindControl("Label2");
                Label2.Text = starHtml1;
                Label Label3 = (Label)e.Item.FindControl("Label3");
                Label3.Text = "( " + ratings.Count.ToString() + " Reviews )";
            }
        }



        private void Bigds()
        {

            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT * FROM Frame_TBL1 where status=1";
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    lv_frames.DataSource = dt;
                    lv_frames.DataBind();
                }
            }
        }
        private void Bigds1()
        {

            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT * FROM Product where id='" + Request.QueryString["listing_cid"] + "'";
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    lv_frame_desc.DataSource = dt;
                    lv_frame_desc.DataBind();
                }
            }
        }



        protected void Button2_Click(object sender, EventArgs e)
        {

            string qty = "";
            string drpd = "";
            string FID = "";
            foreach (ListViewItem item in ListView1.Items)
            {
                if (item.FindControl("quantityTextBox") is TextBox quantityTextBox)
                {
                    qty = quantityTextBox.Text;
                }
                if (item.FindControl("selectedFID") is TextBox selectedFID)
                {
                    FID = selectedFID.Text;
                }

                if (item.FindControl("DropDownList1") is DropDownList DropDownList1)
                {
                    drpd = DropDownList1.SelectedValue;
                }
            }

            if (Session["id"] == null)
            {
                // Redirect to the login page
                Response.Redirect("Login.aspx");
            }
            else
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into Cart(Customer_id,Painting_id,Frame_id,Quantity,Size,status,rts) values ('" + Session["id"] + "','" + Request.QueryString["listing_cid"] + "','" + FID + "', '" + qty + "','" + drpd + "',1,getdate())", con);
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }

        protected void Rating1_Changed()
        {

        }
    }
}