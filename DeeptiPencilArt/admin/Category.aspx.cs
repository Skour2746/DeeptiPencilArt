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

namespace DeeptiPencilArt.admin
{
    public partial class WebForm1 : System.Web.UI.Page
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
                BindListView();
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            if (Button1.Text == "Submit")
            {
                string fileName = "";
                if (FileUpload1.HasFile)
                {
                    foreach (HttpPostedFile file in FileUpload1.PostedFiles)
                    {
                        fileName = Path.GetFileName(file.FileName);
                        var encoderParams = new EncoderParameters(1);
                        encoderParams.Param[0] = new EncoderParameter(Encoder.Quality, 90L);
                        System.Drawing.Image.FromStream(file.InputStream).Save(Server.MapPath("~/images1/category/" + fileName), ImageCodecInfo.GetImageEncoders().First(c => c.FormatID == ImageFormat.Jpeg.Guid), encoderParams);
                        System.Drawing.Image.FromStream(file.InputStream).GetThumbnailImage(300, 400, () => false, IntPtr.Zero).Save(Server.MapPath("~/images1/category/" + fileName));
                    }
                }
                cmd.CommandText = "INSERT INTO Category (CategoryName,image,status,rts) VALUES('" + txt_Category.Text + "','" + fileName + "',1,getdate())";


            }
            else
            {
                if (FileUpload1.HasFile)
                {
                    string fileName = "";
                    if (FileUpload1.HasFile)
                    {
                        foreach (HttpPostedFile file in FileUpload1.PostedFiles)
                        {
                            fileName = Path.GetFileName(file.FileName);
                            var encoderParams = new EncoderParameters(1);
                            encoderParams.Param[0] = new EncoderParameter(Encoder.Quality, 90L);
                            System.Drawing.Image.FromStream(file.InputStream).Save(Server.MapPath("~/images1/category/" + fileName), ImageCodecInfo.GetImageEncoders().First(c => c.FormatID == ImageFormat.Jpeg.Guid), encoderParams);
                            System.Drawing.Image.FromStream(file.InputStream).GetThumbnailImage(300, 400, () => false, IntPtr.Zero).Save(Server.MapPath("~/images1/category/" + fileName));
                        }
                    }
                    cmd.CommandText = "update Category set CategoryName='" + txt_Category.Text + "', image='" + fileName + "' where id=" + hfSelectedRecord.Value + "";

                }
                else
                {
                    cmd.CommandText = "update Category set CategoryName='" + txt_Category.Text + "' where id=" + hfSelectedRecord.Value + "";

                }
            }

            cmd.ExecuteNonQuery();
            BindListView();
            con.Close();
            txt_Category.Text = "";
            Image1.ImageUrl = "";
        }


        private void BindListView()
        {

            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT * FROM Category";
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

        protected void Lv_category_ItemCommand(object sender, ListViewCommandEventArgs e)
        {

            if (e.CommandName == "delete")
            {
                string lblid = "";
                Label label1 = (Label)e.Item.FindControl("lblid");
                if (lblid != null)
                    lblid = label1.Text;
                string Deletequery = "Delete from Category WHERE [ID] = '" + lblid + "'";

                con.Open();
                SqlCommand com = new SqlCommand(Deletequery, con);
                com.ExecuteNonQuery();
                con.Close();
                BindListView();
            }
            if (e.CommandName == "edit")
            {
                Label lblid = (Label)e.Item.FindControl("lblid");
                Label lblCategoryName = (Label)e.Item.FindControl("lblCategoryName");
                Label lblimage = (Label)e.Item.FindControl("lblimage");

                hfSelectedRecord.Value = lblid.Text;
                txt_Category.Text = lblCategoryName.Text;
                Image1.ImageUrl = "~/images1/category/" + lblimage.Text;

                Button1.Text = "Update";

                BindListView();
            }
            if (e.CommandName == "active")
            {
                Label label1 = (Label)e.Item.FindControl("lblid");

                SqlCommand cmd = new SqlCommand("update Category set status=1 where id=" + label1.Text + "", con);
                con.Open();
                cmd.ExecuteNonQuery();
                BindListView();
                con.Close();

            }
            if (e.CommandName == "deactive")
            {
                Label label1 = (Label)e.Item.FindControl("lblid");

                SqlCommand cmd = new SqlCommand("update Category set status=0 where id=" + label1.Text + "", con);
                con.Open();
                cmd.ExecuteNonQuery();
                BindListView();
                con.Close();

            }
        }

        protected void Lv_category_ItemEditing(object sender, ListViewEditEventArgs e)
        {

        }


        protected void Lv_category_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        {

        }
    }
}