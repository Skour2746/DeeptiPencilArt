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
    public partial class WebForm11 : System.Web.UI.Page
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
                BindListView1();
                BindListView2();
            }
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
                    ddcategory.DataSource = dt;
                    ddcategory.DataBind();
                }
            }
        }
        private void BindListView2()
        {

            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT * FROM SubCategory where CategoryId='" + ddcategory.SelectedValue + "' and status=1";
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    ddsubcategory.DataSource = dt;
                    ddsubcategory.DataBind();
                }
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
                        System.Drawing.Image.FromStream(file.InputStream).Save(Server.MapPath("~/images1/product/" + fileName), ImageCodecInfo.GetImageEncoders().First(c => c.FormatID == ImageFormat.Jpeg.Guid), encoderParams);
                        System.Drawing.Image.FromStream(file.InputStream).GetThumbnailImage(400, 400, () => false, IntPtr.Zero).Save(Server.MapPath("~/images1/product/" + fileName));
                    }
                }
                cmd.CommandText = "INSERT INTO Product (Category_id,SubCategoryId,image,Product_Name,Product_Description,Price,status,rts) VALUES('" + ddcategory.SelectedValue + "','"+ ddsubcategory.SelectedValue + "','" + fileName + "','" + txtproductname.Text.Replace("'", "''") + "','" + txtproductdesc.Text.Replace("'", "''") + "','" + txtprice.Text.Replace("'", "''") + "',1,getdate())";
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
                            System.Drawing.Image.FromStream(file.InputStream).Save(Server.MapPath("~/images1/product/" + fileName), ImageCodecInfo.GetImageEncoders().First(c => c.FormatID == ImageFormat.Jpeg.Guid), encoderParams);
                            System.Drawing.Image.FromStream(file.InputStream).GetThumbnailImage(300, 300, () => false, IntPtr.Zero).Save(Server.MapPath("~/images1/product/" + fileName));
                        }
                    }
                    cmd.CommandText = "update Product set Category_id='" + ddcategory.SelectedValue + "', SubCategoryId='"+ ddsubcategory.SelectedValue + "',image='" + fileName + "', Product_Name='" + txtproductname.Text.Replace("'", "''") + "',Product_Description='" + txtproductdesc.Text.Replace("'", "''") + "', Price='" + txtprice.Text.Replace("'", "''") + "' where id=" + hfSelectedRecord.Value + "";
                    BindListView1();
                }
                else
                {
                    cmd.CommandText = "update Product set Category_id='" + ddcategory.SelectedValue + "', SubCategoryId='"+ ddsubcategory.SelectedValue + "', Product_Name='" + txtproductname.Text.Replace("'", "''") + "',Product_Description='" + txtproductdesc.Text.Replace("'", "''") + "', Price='" + txtprice.Text.Replace("'", "''") + "' where id=" + hfSelectedRecord.Value + "";
                    BindListView1();
                }

            }

            cmd.ExecuteNonQuery();
            BindListView1();
            con.Close();
            Image1.ImageUrl = "";
            txtproductname.Text = "";
            txtproductdesc.Text = "";
        }

        private void BindListView1()
        {

            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT * FROM Product";
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

        protected void Lv_Product_ItemEditing(object sender, ListViewEditEventArgs e)
        {

        }

        protected void Lv_Product_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "delete")
            {
                string lblid = "";
                Label label1 = (Label)e.Item.FindControl("lblid");
                if (lblid != null)
                    lblid = label1.Text;
                string Deletequery = "Delete from Product WHERE [ID] = '" + lblid + "'";

                con.Open();
                SqlCommand com = new SqlCommand(Deletequery, con);
                com.ExecuteNonQuery();
                con.Close();
                BindListView1();
            }
            if (e.CommandName == "edit")
            {
                Label lblid = (Label)e.Item.FindControl("lblid");
                Label lblcategoryid = (Label)e.Item.FindControl("lblcategoryid");
                Label lblSubCategories = (Label)e.Item.FindControl("lblSubCategory");
                Label lblimage = (Label)e.Item.FindControl("lblimage");
                Label lblproductname = (Label)e.Item.FindControl("lblproductname");
                Label lblproductdesc = (Label)e.Item.FindControl("lblproductdesc");
                Label lblprice = (Label)e.Item.FindControl("lblprice");



                hfSelectedRecord.Value = lblid.Text;
                ddcategory.Text = lblcategoryid.Text;
                ddsubcategory.Text = lblSubCategories.Text;
                Image1.ImageUrl = "~/images1/product/" + lblimage.Text;
                txtproductname.Text = lblproductname.Text;
                txtproductdesc.Text = lblproductdesc.Text;
                txtprice.Text = lblprice.Text;
                Button1.Text = "Update";

                BindListView1();
            }
            if (e.CommandName == "active")
            {
                Label label1 = (Label)e.Item.FindControl("lblid");

                SqlCommand cmd = new SqlCommand("update Product set status=1 where id=" + label1.Text + "", con);
                con.Open();
                cmd.ExecuteNonQuery();
                BindListView1();
                con.Close();

            }
            if (e.CommandName == "deactive")
            {
                Label label1 = (Label)e.Item.FindControl("lblid");

                SqlCommand cmd = new SqlCommand("update Product set status=0 where id=" + label1.Text + "", con);
                con.Open();
                cmd.ExecuteNonQuery();
                BindListView1();
                con.Close();

            }
        }

        protected void Lv_Product_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        {

        }

        protected void Ddcategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindListView2();
        }
    }
}