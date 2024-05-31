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

namespace DeeptiPencilArt
{
    public partial class Register : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DeeptiArt"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected bool IsEmailAlreadyRegistered(string email)
        {
            con.Open();

            // Create a SQL command to check for an existing email address.
            string query = "SELECT COUNT(*) FROM User_Registration WHERE user_email ='" + txtuseremail.Text + "' ";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@Email", email);

            // Execute the command and get the count of rows returned.
            int count = (int)command.ExecuteScalar();
            con.Close();
            // If count is greater than 0, the email address already exists.
            return count > 0;

        }

        protected void Register_Click(object sender, EventArgs e)
        {
            string email = txtuseremail.Text.Trim();
            if (IsEmailAlreadyRegistered(email))
            {
                Label1.Text = "Email address is already registered.";
                return;
            }
            else
            {
                using (SqlCommand cmd = new SqlCommand("INSERT INTO User_Registration (user_name, user_email, user_contact, user_pass, status,rts) VALUES ('" + txtusername.Text + "', '" + txtuseremail.Text + "','" + txtusercontact.Text + "','" + txtuserpassword.Text + "', 1,getdate())"))
                {
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }

            }

            Response.Redirect("Login.aspx");

            txtusername.Text = "";
            txtuseremail.Text = "";
            txtusercontact.Text = "";
            txtuserpassword.Text = "";


        }
    }
}