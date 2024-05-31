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
    public partial class WebForm7 : System.Web.UI.Page
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
                BindListView1();
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
                if (FileUpload2.HasFile)
                {
                    foreach (HttpPostedFile file in FileUpload2.PostedFiles)
                    {
                        fileName = Path.GetFileName(file.FileName);
                        var encoderParams = new EncoderParameters(1);
                        encoderParams.Param[0] = new EncoderParameter(Encoder.Quality, 90L);
                        System.Drawing.Image.FromStream(file.InputStream).Save(Server.MapPath("~/images1/frame/" + fileName), ImageCodecInfo.GetImageEncoders().First(c => c.FormatID == ImageFormat.Jpeg.Guid), encoderParams);
                        System.Drawing.Image.FromStream(file.InputStream).GetThumbnailImage(420, 420, () => false, IntPtr.Zero).Save(Server.MapPath("~/images1/frame/" + fileName));
                    }
                }
                cmd.CommandText = "INSERT INTO Frame_TBL1 (FrameCategory,Frame,status,rts) VALUES('" + txtframename.Text + "','" + fileName + "',1,getdate())";


            }
            else
            {
                if (FileUpload2.HasFile)
                {
                    string fileName = "";
                    if (FileUpload2.HasFile)
                    {
                        foreach (HttpPostedFile file in FileUpload2.PostedFiles)
                        {
                            fileName = Path.GetFileName(file.FileName);
                            var encoderParams = new EncoderParameters(1);
                            encoderParams.Param[0] = new EncoderParameter(Encoder.Quality, 90L);
                            System.Drawing.Image.FromStream(file.InputStream).Save(Server.MapPath("~/images1/frame/" + fileName), ImageCodecInfo.GetImageEncoders().First(c => c.FormatID == ImageFormat.Jpeg.Guid), encoderParams);
                            System.Drawing.Image.FromStream(file.InputStream).GetThumbnailImage(420, 420, () => false, IntPtr.Zero).Save(Server.MapPath("~/images1/frame/" + fileName));
                        }
                    }
                    cmd.CommandText = "update Frame_TBL1 set FrameCategory='" + txtframename.Text + "',Frame='" + fileName + "' where id=" + hfSelectedRecord.Value + "";

                }
                else
                {
                    cmd.CommandText = "update Frame_TBL1 set FrameCategory='" + txtframename.Text + "' where id=" + hfSelectedRecord.Value + "";

                }
            }
            cmd.ExecuteNonQuery();
            BindListView1();
            con.Close();
            Image1.ImageUrl = "";

        }
        private void BindListView1()
        {

            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT * FROM Frame_TBL1";
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
        protected void Lv_Product_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "delete")
            {
                string lblid = "";
                Label label1 = (Label)e.Item.FindControl("lblid");
                if (lblid != null)
                    lblid = label1.Text;
                string Deletequery = "Delete from Frame_TBL1 WHERE [ID] = '" + lblid + "'";

                con.Open();
                SqlCommand com = new SqlCommand(Deletequery, con);
                com.ExecuteNonQuery();
                con.Close();
                BindListView1();
            }

            if (e.CommandName == "edit")
            {
                Label lblid = (Label)e.Item.FindControl("lblid");
                Label lblfcategory = (Label)e.Item.FindControl("lblfcategory");
                Label lblimage = (Label)e.Item.FindControl("lblimage");

                hfSelectedRecord.Value = lblid.Text;
                txtframename.Text = lblfcategory.Text;
                Image1.ImageUrl = "~/images1/frame/" + lblimage.Text;
                Button1.Text = "Update";

                BindListView1();
            }
            if (e.CommandName == "active")
            {
                Label label1 = (Label)e.Item.FindControl("lblid");

                SqlCommand cmd = new SqlCommand("update Frame_TBL1 set status=1 where id=" + label1.Text + "", con);
                con.Open();
                cmd.ExecuteNonQuery();
                BindListView1();
                con.Close();

            }
            if (e.CommandName == "deactive")
            {
                Label label1 = (Label)e.Item.FindControl("lblid");

                SqlCommand cmd = new SqlCommand("update Frame_TBL1 set status=0 where id=" + label1.Text + "", con);
                con.Open();
                cmd.ExecuteNonQuery();
                BindListView1();
                con.Close();

            }
        }

        protected void Lv_Product_ItemEditing(object sender, ListViewEditEventArgs e)
        {

        }

        protected void Lv_Product_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        {

        }
    }
}