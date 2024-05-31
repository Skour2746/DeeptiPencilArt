using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Configuration;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DeeptiPencilArt
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DeeptiArt"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindListView4();
                BindListView();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into User_Enquiry(user_name,user_email,user_number,user_message,rts) values ('" + txtname.Text + "','" + txtemail.Text + "','" + txtnumber.Text + "','" + txtpara.Text + "',getdate())", con);
            cmd.ExecuteNonQuery();
            con.Close();


            string r1 = "Enquiry";
            string r2 = txtname.Text;
            string r3 = txtemail.Text;
            string r4 = txtnumber.Text;
            string r5 = txtpara.Text;



            SmtpSection smtpSection = (SmtpSection)ConfigurationManager.GetSection("system.net/mailSettings/smtp");
            using (MailMessage mm = new MailMessage(smtpSection.From, "goswamivikash078@gmail.com"))
            {
                mm.Subject = r1;
                mm.Body = "Name: " + r2 + "<br />" + "Email: " + r3 + "<br />" + "Contact-Number: " + r4 + "<br />" + "Message: " + r5;
                mm.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient
                {
                    Host = smtpSection.Network.Host,
                    EnableSsl = smtpSection.Network.EnableSsl
                };
                NetworkCredential networkCred = new NetworkCredential(smtpSection.Network.UserName, smtpSection.Network.Password);
                smtp.UseDefaultCredentials = smtpSection.Network.DefaultCredentials;
                smtp.Credentials = networkCred;
                smtp.Port = smtpSection.Network.Port;
                smtp.Send(mm);

            }



            txtname.Text = "";
            txtemail.Text = "";
            txtnumber.Text = "";
            txtpara.Text = "";
        }


        private void BindListView4()
        {

            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT * FROM Company_Detail where status=1";
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    lv_contact.DataSource = dt;
                    lv_contact.DataBind();
                }
            }
        }
        private void BindListView()
        {

            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT * FROM Company_Detail where status=1";
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    lv_Map.DataSource = dt;
                    lv_Map.DataBind();
                }
            }
        }
    }
}