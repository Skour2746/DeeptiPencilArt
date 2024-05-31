using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace DeeptiPencilArt.admin
{
    public partial class WebForm12 : Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DeeptiArt"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            // Insert
            InsertData(con, "John Doe", 25);

            // Update
            UpdateData(con, 1, "Updated John Doe", 26);

            // Delete
            DeleteData(con, 1);
        }

        static void InsertData(SqlConnection connection, string name, int age)
        {
            try
            {
                connection.Open();

                string query = "INSERT INTO test (Name, Age) VALUES (@Name, @Age)";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Name", name);
                    command.Parameters.AddWithValue("@Age", age);

                    command.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                // Handle exceptions
            }
            finally
            {
                connection.Close();
            }
        }

        static void UpdateData(SqlConnection connection, int id, string newName, int newAge)
        {
            try
            {
                connection.Open();

                string query = "UPDATE test SET Name = @Name, Age = @Age WHERE Id = @Id";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Id", id);
                    command.Parameters.AddWithValue("@Name", newName);
                    command.Parameters.AddWithValue("@Age", newAge);

                    command.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                // Handle exceptions
            }
            finally
            {
                connection.Close();
            }
        }

        static void DeleteData(SqlConnection connection, int id)
        {
            try
            {
                connection.Open();

                string query = "DELETE FROM test WHERE Id = @Id";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Id", id);

                    command.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                // Handle exceptions
            }
            finally
            {
                connection.Close();
            }
        }
    }
}
