﻿using System;
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
    public partial class WebForm4 : System.Web.UI.Page
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
                if (FileUpload2.HasFile)
                {
                    foreach (HttpPostedFile file in FileUpload2.PostedFiles)
                    {
                        fileName = Path.GetFileName(file.FileName);
                        var encoderParams = new EncoderParameters(1);
                        encoderParams.Param[0] = new EncoderParameter(Encoder.Quality, 90L);
                        System.Drawing.Image.FromStream(file.InputStream).Save(Server.MapPath("~/images1/About/" + fileName), ImageCodecInfo.GetImageEncoders().First(c => c.FormatID == ImageFormat.Jpeg.Guid), encoderParams);
                        System.Drawing.Image.FromStream(file.InputStream).GetThumbnailImage(500, 500, () => false, IntPtr.Zero).Save(Server.MapPath("~/images1/About/" + fileName));
                    }
                }
                cmd.CommandText = "INSERT INTO About (image,Heading,about,Opening_time,Visit,status,rts) VALUES('" + fileName + "','" + txtheading.Text + "','" + txtpara.Text + "','" + txtopeningtime.Text + "','" + txtvisit.Text + "',1,getdate())";


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
                            System.Drawing.Image.FromStream(file.InputStream).Save(Server.MapPath("~/images1/About/" + fileName), ImageCodecInfo.GetImageEncoders().First(c => c.FormatID == ImageFormat.Jpeg.Guid), encoderParams);
                            System.Drawing.Image.FromStream(file.InputStream).GetThumbnailImage(500, 500, () => false, IntPtr.Zero).Save(Server.MapPath("~/images1/About/" + fileName));
                        }
                    }
                    cmd.CommandText = "update About set image='" + fileName + "',Heading='" + txtheading.Text + "',about='" + txtpara.Text + "',Opening_time='" + txtopeningtime.Text + "',Visit='" + txtvisit.Text + "' where id=" + hfSelectedRecord.Value + "";

                }
                else
                {
                    cmd.CommandText = "update About set Heading='" + txtheading.Text + "',about='" + txtpara.Text + "',Opening_time='" + txtopeningtime.Text + "',Visit='" + txtvisit.Text + "' where id=" + hfSelectedRecord.Value + "";

                }
            }

            cmd.ExecuteNonQuery();
            BindListView();
            con.Close();

            Image1.ImageUrl = "";
            txtheading.Text = "";
            txtpara.Text = "";
            txtopeningtime.Text = "";
            txtvisit.Text = "";
        }


        private void BindListView()
        {

            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT * FROM About";
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    lv_about.DataSource = dt;
                    lv_about.DataBind();

                }
            }
        }

        protected void Lv_about_ItemCommand(object sender, ListViewCommandEventArgs e)
        {

            //if (e.CommandName == "delete")
            //{
            //    string lblid = "";
            //    Label label1 = (Label)e.Item.FindControl("lblid");
            //    if (lblid != null)
            //        lblid = label1.Text;
            //    string Deletequery = "Delete from Category WHERE [ID] = '" + lblid + "'";

            //    con.Open();
            //    SqlCommand com = new SqlCommand(Deletequery, con);
            //    com.ExecuteNonQuery();
            //    con.Close();
            //    BindListView();
            //}


            if (e.CommandName == "edit")
            {
                Label lblid = (Label)e.Item.FindControl("lblid");
                Label lblimage = (Label)e.Item.FindControl("lblimage");
                Label lblheading = (Label)e.Item.FindControl("lblheading");
                Label lblabout = (Label)e.Item.FindControl("lblabout");
                Label lblopeningtime = (Label)e.Item.FindControl("lblopeningtime");
                Label lblvisit = (Label)e.Item.FindControl("lblvisit");

                hfSelectedRecord.Value = lblid.Text;
                Image1.ImageUrl = "~/images1/About/" + lblimage.Text;
                txtheading.Text = lblheading.Text;
                txtpara.Text = lblabout.Text;
                txtopeningtime.Text = lblopeningtime.Text;
                txtvisit.Text = lblvisit.Text;


                Button1.Text = "Update";

                BindListView();
            }
            if (e.CommandName == "active")
            {
                Label label1 = (Label)e.Item.FindControl("lblid");

                SqlCommand cmd = new SqlCommand("update About set status=1 where id=" + label1.Text + "", con);
                con.Open();
                cmd.ExecuteNonQuery();
                BindListView();
                con.Close();

            }
            if (e.CommandName == "deactive")
            {
                Label label1 = (Label)e.Item.FindControl("lblid");

                SqlCommand cmd = new SqlCommand("update About set status=0 where id=" + label1.Text + "", con);
                con.Open();
                cmd.ExecuteNonQuery();
                BindListView();
                con.Close();

            }
        }

        protected void Lv_about_ItemEditing(object sender, ListViewEditEventArgs e)
        {

        }
    }
}