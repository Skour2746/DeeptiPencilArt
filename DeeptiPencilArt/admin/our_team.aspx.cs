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
    public partial class WebForm8 : System.Web.UI.Page
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
                        System.Drawing.Image.FromStream(file.InputStream).Save(Server.MapPath("~/images1/our_team/" + fileName), ImageCodecInfo.GetImageEncoders().First(c => c.FormatID == ImageFormat.Jpeg.Guid), encoderParams);
                        System.Drawing.Image.FromStream(file.InputStream).GetThumbnailImage(300, 300, () => false, IntPtr.Zero).Save(Server.MapPath("~/images1/our_team/" + fileName));
                    }
                }
                cmd.CommandText = "INSERT INTO our_team (image,Emp_name,position,status,rts) VALUES('" + fileName + "','" + txtteamname.Text + "','" + txteamposition.Text + "',1,getdate())";
                BindListView1();
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
                            System.Drawing.Image.FromStream(file.InputStream).Save(Server.MapPath("~/images1/our_team/" + fileName), ImageCodecInfo.GetImageEncoders().First(c => c.FormatID == ImageFormat.Jpeg.Guid), encoderParams);
                            System.Drawing.Image.FromStream(file.InputStream).GetThumbnailImage(300, 300, () => false, IntPtr.Zero).Save(Server.MapPath("~/images1/our_team/" + fileName));
                        }
                    }
                    cmd.CommandText = "update our_team set image='" + fileName + "',Emp_name='" + txtteamname.Text + "',position='" + txteamposition.Text + "' where id=" + hfSelectedRecord.Value + "";

                }
                else
                {
                    cmd.CommandText = "update our_team set Emp_name='" + txtteamname.Text + "',position='" + txteamposition.Text + "' where id=" + hfSelectedRecord.Value + "";

                }
            }

            cmd.ExecuteNonQuery();
            BindListView1();
            con.Close();
            Image1.ImageUrl = "";
            txtteamname.Text = "";
            txteamposition.Text = "";
        }


        private void BindListView1()
        {

            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT * FROM our_team";
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    lv_team.DataSource = dt;
                    lv_team.DataBind();
                }
            }
        }
        protected void Lv_Product_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "edit")
            {
                Label lblid = (Label)e.Item.FindControl("lblid");
                Label lblimage = (Label)e.Item.FindControl("lblimage");
                Label lblempname = (Label)e.Item.FindControl("lblempname");
                Label lblposition = (Label)e.Item.FindControl("lblposition");


                hfSelectedRecord.Value = lblid.Text;
                Image1.ImageUrl = "~/images1/our_team/" + lblimage.Text;
                txtteamname.Text = lblempname.Text;
                txteamposition.Text = lblposition.Text;


                Button1.Text = "Update";
            }
            if (e.CommandName == "active")
            {
                Label label1 = (Label)e.Item.FindControl("lblid");

                SqlCommand cmd = new SqlCommand("update our_team set status=1 where id=" + label1.Text + "", con);
                con.Open();
                cmd.ExecuteNonQuery();
                BindListView1();
                con.Close();

            }
            if (e.CommandName == "deactive")
            {
                Label label1 = (Label)e.Item.FindControl("lblid");

                SqlCommand cmd = new SqlCommand("update our_team set status=0 where id=" + label1.Text + "", con);
                con.Open();
                cmd.ExecuteNonQuery();
                BindListView1();
                con.Close();

            }

        }

        protected void Lv_Product_ItemEditing(object sender, ListViewEditEventArgs e)
        {

        }
    }
}