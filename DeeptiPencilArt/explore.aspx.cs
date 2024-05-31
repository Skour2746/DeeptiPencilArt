using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DeeptiPencilArt
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DeeptiArt"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.BindListView1();
                

                // Load categories into the category DropDownList
                ddlCategories.DataSource = GetCategoriesFromDatabase();
                ddlCategories.DataTextField =   "CategoryName";
                ddlCategories.DataValueField = "CategoryID";
                ddlCategories.DataBind();

                // Load all items into the ListView initially
                lv_explore.DataSource = GetAllItemsFromDatabase();
                lv_explore.DataBind();



                if (Request.QueryString.Count == 0)
                {
                    BindListView1();
                  
                }
                else
                {
                    BindListViewQuery();
                }
            }

        }
        private void BindListView1()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "SELECT * FROM Product where status=1";
            cmd.Connection = con;
            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
            {
                DataTable dt = new DataTable();
                sda.Fill(dt);
                lv_explore.DataSource = dt;
                lv_explore.DataBind();
            }
        }


        private void BindListViewQuery()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "SELECT * FROM Product where Category_id='" + Request.QueryString["product_id"] + "' and status=1";
            cmd.Connection = con;
            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
            {
                DataTable dt = new DataTable();
                sda.Fill(dt);
                lv_explore.DataSource = dt;
                lv_explore.DataBind();
            }
        }

        

        protected void Lv_explore_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            (lv_explore.FindControl("DataPager1") as DataPager).SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            this.BindListView1();
        }

        protected void ddlCategories_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlCategories.SelectedValue == "0")
            {
                con.Open();
                using (SqlDataAdapter sda = new SqlDataAdapter("select * from Product where status=1", con))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    lv_explore.DataSource = dt;
                    lv_explore.DataBind();
                }
                con.Close();
            }
            else
            {

                int selectedCategoryID = Convert.ToInt32(ddlCategories.SelectedValue);

                // Load subcategories based on the selected category
                ddlSubcategories.DataSource = GetSubcategoriesForCategory(selectedCategoryID);
                ddlSubcategories.DataTextField = "SubcategoryName";
                ddlSubcategories.DataValueField = "SubcategoryID";
                ddlSubcategories.DataBind();

                // Load items for the selected category and subcategory into ListView
                int selectedSubcategoryID = Convert.ToInt32(ddlSubcategories.SelectedValue);
                lv_explore.DataSource = GetItemsByCategoryAndSubcategory(selectedCategoryID, selectedSubcategoryID);
                lv_explore.DataBind();
            }
          
        }



        protected List<Subcategory> GetSubcategoriesForCategory(int categoryID)
        {
            List<Subcategory> subcategories = new List<Subcategory>();

            string connectionString = ConfigurationManager.ConnectionStrings["DeeptiArt"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT id, SubCategory FROM SubCategory WHERE CategoryID = @CategoryId";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@CategoryId", categoryID);
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Subcategory subcategory = new Subcategory
                            {
                                SubcategoryID = Convert.ToInt32(reader["id"]),
                                SubcategoryName = reader["SubCategory"].ToString()
                            };
                            subcategories.Add(subcategory);
                        }
                    }
                }
            }
            return subcategories;
        }

        // Placeholder method to retrieve categories from the database
        protected List<Category> GetCategoriesFromDatabase()
        {
            List<Category> categories = new List<Category>();

            string connectionString = ConfigurationManager.ConnectionStrings["DeeptiArt"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT id, CategoryName FROM Category";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Category category = new Category
                            {
                                CategoryID = Convert.ToInt32(reader["id"]),
                                CategoryName = reader["CategoryName"].ToString()
                            };
                            categories.Add(category);
                        }
                    }
                }
            }
            return categories;
        }

        // Placeholder method to retrieve all items from the database
        protected List<Item> GetAllItemsFromDatabase()
        {
            List<Item> items = new List<Item>();

            string connectionString = ConfigurationManager.ConnectionStrings["DeeptiArt"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM Product";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Item item = new Item
                            {
                                id = Convert.ToInt32(reader["id"]),
                                image = reader["image"].ToString(),
                                Product_Name = reader["Product_Name"].ToString(),
                                Product_Description = reader["Product_Description"].ToString(),
                                CategoryID = Convert.ToInt32(reader["Category_id"]),
                                SubcategoryID = Convert.ToInt32(reader["SubCategoryId"])
                            };
                            items.Add(item);
                        }
                    }
                }
            }
            return items;
        }


        protected List<Item> GetItemsByCategoryAndSubcategory(int categoryID, int subcategoryID)
        {
            List<Item> items = new List<Item>();

            string connectionString = ConfigurationManager.ConnectionStrings["DeeptiArt"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM Product WHERE Category_id = @CategoryID AND SubCategoryId = @SubcategoryID";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@CategoryID", categoryID);
                    command.Parameters.AddWithValue("@SubcategoryID", subcategoryID);

                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Item item = new Item
                            {
                                id = Convert.ToInt32(reader["id"]),
                                image = reader["image"].ToString(),
                                Product_Name = reader["Product_Name"].ToString(),
                                Product_Description = reader["Product_Description"].ToString(),
                                CategoryID = Convert.ToInt32(reader["Category_id"]),
                                SubcategoryID = Convert.ToInt32(reader["SubCategoryId"])
                            };
                            items.Add(item);
                        }
                    }
                }
            }
            return items;
        }


        private void LoadListViewData(int categoryID, int subcategoryID)
        {
            lv_explore.DataSource = GetItemsByCategoryAndSubcategory(categoryID, subcategoryID);
            lv_explore.DataBind();
        }

        protected void ddlSubcategories_SelectedIndexChanged(object sender, EventArgs e)
        {
            int selectedCategoryID = Convert.ToInt32(ddlCategories.SelectedValue);
            int selectedSubcategoryID = Convert.ToInt32(ddlSubcategories.SelectedValue);

            // Load items for the selected category and subcategory into ListView
            LoadListViewData(selectedCategoryID, selectedSubcategoryID);
        }




        //private void dropdownCfilter()
        //{
        //    SqlCommand cmd = new SqlCommand();
        //    cmd.CommandText = "SELECT * FROM Category where status=1";
        //    cmd.Connection = con;
        //    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
        //    {
        //        DataTable dt = new DataTable();
        //        sda.Fill(dt);
        //        ddlCategoryFilter.DataSource = dt;
        //        ddlCategoryFilter.DataBind();
        //    }
        //}

        //private void dropdownSubCategoryfilter()
        //{
        //    SqlCommand cmd = new SqlCommand();
        //    cmd.CommandText = "SELECT * FROM SubCategory where CategoryId='"+ ddlCategoryFilter.SelectedValue + "' and status=1";
        //    cmd.Connection = con;
        //    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
        //    {
        //        DataTable dt = new DataTable();
        //        sda.Fill(dt);
        //        ddlSubCategory.DataSource = dt;
        //        ddlSubCategory.DataBind();
        //    }
        //}


        //private void dropdownSubCategoryfilter11()
        //{
        //    SqlCommand cmd = new SqlCommand();
        //    cmd.CommandText = "SELECT * FROM Product where SubCategoryId='" + ddlSubCategory.SelectedValue + "' and status=1";
        //    cmd.Connection = con;
        //    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
        //    {
        //        DataTable dt = new DataTable();
        //        sda.Fill(dt);
        //        lv_explore.DataSource = dt;
        //        lv_explore.DataBind();
        //    }
        //}

        //private void dropdownSubCategoryfilter1111()
        //{
        //    SqlCommand cmd = new SqlCommand();
        //    cmd.CommandText = "SELECT * FROM Product where CategoryId='" + ddlCategoryFilter.SelectedValue + "' and status=1";
        //    cmd.Connection = con;
        //    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
        //    {
        //        DataTable dt = new DataTable();
        //        sda.Fill(dt);
        //        lv_explore.DataSource = dt;
        //        lv_explore.DataBind();
        //    }
        //}

        //protected void ddlCategoryFilter_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    dropdownSubCategoryfilter();
        //}
    }
}