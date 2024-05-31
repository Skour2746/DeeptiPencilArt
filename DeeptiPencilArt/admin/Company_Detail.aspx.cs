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
    public partial class WebForm6 : System.Web.UI.Page
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
                if (FileUpload1.HasFile)
                {
                    foreach (HttpPostedFile file in FileUpload1.PostedFiles)
                    {
                        fileName = Path.GetFileName(file.FileName);
                        var encoderParams = new EncoderParameters(1);
                        encoderParams.Param[0] = new EncoderParameter(Encoder.Quality, 90L);
                        System.Drawing.Image.FromStream(file.InputStream).Save(Server.MapPath("~/images1/comapny_detail/" + fileName), ImageCodecInfo.GetImageEncoders().First(c => c.FormatID == ImageFormat.Jpeg.Guid), encoderParams);
                        System.Drawing.Image.FromStream(file.InputStream).GetThumbnailImage(300, 300, () => false, IntPtr.Zero).Save(Server.MapPath("~/images1/comapny_detail/" + fileName));
                    }
                }
                cmd.CommandText = "INSERT INTO Company_Detail (Comapany_Name,Company_logo,Company_Address,Company_Contact_Number,Company_googleMap_link,Company_Email,Opening_time,status,rts) VALUES('" + txtcompanyname.Text + "','" + fileName + "','" + txtcompanyaddress.Text + "','" + txtcontactnumber.Text + "','" + txtmaplink.Text + "','" + txtemail.Text + "','" + txtopeningtime.Text + "',1,getdate())";
                BindListView1();
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
                            System.Drawing.Image.FromStream(file.InputStream).Save(Server.MapPath("~/images1/comapny_detail/" + fileName), ImageCodecInfo.GetImageEncoders().First(c => c.FormatID == ImageFormat.Jpeg.Guid), encoderParams);
                            System.Drawing.Image.FromStream(file.InputStream).GetThumbnailImage(300, 300, () => false, IntPtr.Zero).Save(Server.MapPath("~/images1/comapny_detail/" + fileName));
                        }
                    }
                    cmd.CommandText = "update Company_Detail set Comapany_Name='" + txtcompanyname.Text + "',Company_logo='" + fileName + "',Company_Address='" + txtcompanyaddress.Text + "',Company_Contact_Number='" + txtcontactnumber.Text + "',Company_googleMap_link='" + txtmaplink.Text + "',Company_Email='" + txtemail.Text + "',Opening_time='" + txtopeningtime.Text + "' where id=" + hfSelectedRecord.Value + "";

                }
                else
                {
                    cmd.CommandText = "update Company_Detail set Comapany_Name='" + txtcompanyname.Text + "',Company_Address='" + txtcompanyaddress.Text + "',Company_Contact_Number='" + txtcontactnumber.Text + "',Company_googleMap_link='" + txtmaplink.Text + "',Company_Email='" + txtemail.Text + "', Opening_time='" + txtopeningtime.Text + "' where id=" + hfSelectedRecord.Value + "";

                }
            }

            cmd.ExecuteNonQuery();
            BindListView1();
            con.Close();
            txtcompanyname.Text = "";
            txtcompanyaddress.Text = "";
            txtcontactnumber.Text = "";
            txtmaplink.Text = "";
            txtemail.Text = "";
            Image1.ImageUrl = "";
            txtopeningtime.Text = "";
        }


        private void BindListView1()
        {

            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT * FROM Company_Detail";
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    lv_Product.DataSource = dt;
                    lv_Product.DataBind();
                }
            }
        }
        protected void Lv_Product_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "edit")
            {
                Label lblid = (Label)e.Item.FindControl("lblid");
                Label lblcompanyname = (Label)e.Item.FindControl("lblcompanyname");
                Label lblcompanylogo = (Label)e.Item.FindControl("lblcompanylogo");
                Label lblcompanyaddress = (Label)e.Item.FindControl("lblcompanyaddress");
                Label lblcontactnumber = (Label)e.Item.FindControl("lblcontactnumber");
                Label lblcompanygooglelink = (Label)e.Item.FindControl("lblcompanygooglelink");
                Label lblcompanyemail = (Label)e.Item.FindControl("lblcompanyemail");
                Label lblopeningtime = (Label)e.Item.FindControl("lblopeningtime");

                hfSelectedRecord.Value = lblid.Text;
                txtcompanyname.Text = lblcompanyname.Text;
                Image1.ImageUrl = "~/images1/company_detail/" + lblcompanylogo.Text;
                txtcompanyaddress.Text = lblcompanyaddress.Text;
                txtcontactnumber.Text = lblcontactnumber.Text;
                txtmaplink.Text = lblcompanygooglelink.Text;
                txtemail.Text = lblcompanyemail.Text;
                txtopeningtime.Text = lblopeningtime.Text;

                Button1.Text = "Update";
            }
            if (e.CommandName == "active")
            {
                Label label1 = (Label)e.Item.FindControl("lblid");

                SqlCommand cmd = new SqlCommand("update Company_Detail set status=1 where id=" + label1.Text + "", con);
                con.Open();
                cmd.ExecuteNonQuery();
                BindListView1();
                con.Close();

            }
            if (e.CommandName == "deactive")
            {
                Label label1 = (Label)e.Item.FindControl("lblid");

                SqlCommand cmd = new SqlCommand("update Company_Detail set status=0 where id=" + label1.Text + "", con);
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