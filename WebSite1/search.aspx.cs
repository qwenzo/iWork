using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System;
using System.Drawing;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["log_in"] != null && (Session["log_in"] !="5" ))
        {
            Register.Visible = false;
            Login.Visible = false;
            Logout.Visible = true;
            Control_panel.Visible = true;
        }
        else
        {
            Register.Visible = true;
            Logout.Visible = false;
            Login.Visible = true;
            Control_panel.Visible = false;
        }

     
    }

  

    public void t(object sender, EventArgs e)
    {
        GridView1.Columns[0].Visible = true;
        GridView2.Visible = false;
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);
        conn.Open();
        SqlCommand cmd = new SqlCommand("SearchByType", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        string name = TextBox2.Text;
        cmd.Parameters.Add(new SqlParameter("@type", name));
        GridView1.EmptyDataText = "No Records Found";
        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        adapter.Fill(ds);
        if (ds.Tables.Count == 0)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('please enter either natiional or international')", true);
        }
        else
        {
            GridView1.DataSource = ds;
            GridView1.DataBind();
            GridView1.Visible = true;
        }
        conn.Close();

    }

    public void a(object sender, EventArgs e)
    {
        GridView1.Columns[0].Visible = true;
        GridView2.Visible = false;
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);
        conn.Open();
        SqlCommand cmd = new SqlCommand("SearchByadd", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        string name = TextBox2.Text;
        cmd.Parameters.Add(new SqlParameter("@address", name));
        GridView1.EmptyDataText = "No Records Found";
        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        adapter.Fill(ds);
        if (ds.Tables.Count == 0)
        {
            GridView1.Visible = false;
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('no records with such an address')", true);
        }
        else
        {
            GridView1.DataSource = ds;
            GridView1.DataBind();
            GridView1.Visible = true;
        }
        conn.Close();

    }

    public void n(object sender, EventArgs e)
    {
        GridView1.Columns[0].Visible = true;
        GridView2.Visible = false;
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);
        conn.Open();
        SqlCommand cmd = new SqlCommand("SearchByName", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        string name = TextBox2.Text;
        cmd.Parameters.Add(new SqlParameter("@name", name));
        GridView1.EmptyDataText = "No Records Found";
        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        adapter.Fill(ds);
        if (ds.Tables.Count == 0)
        {
            GridView1.Visible = false;
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('no records with such a name')", true);
        }
        else
        {
            GridView1.DataSource = ds;
            GridView1.DataBind();
            GridView1.Visible = true;
        }
        conn.Close();


    }

    public void viewall(object sender, EventArgs e)
    {
        GridView1.Columns[0].Visible = true;
        GridView2.Visible = false;
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);
        conn.Open();
        SqlCommand cmd = new SqlCommand("ALLCompanies_by_type", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        GridView1.EmptyDataText = "No Records Found";
        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        adapter.Fill(ds);
        if (ds.Tables.Count == 0)
        {
            GridView1.Visible = false;
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('no records ')", true);
        }
        else
        {
            GridView1.DataSource = ds;
            GridView1.DataBind();
            GridView1.Visible = true;
        }
        conn.Close();


    }



    protected void Button6_Click(object sender, EventArgs e)
    {
        GridView1.Columns[0].Visible = false;
        GridView2.Visible = false;
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);
        conn.Open();
        SqlCommand cmd = new SqlCommand("Avgsalaries", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        GridView1.EmptyDataText = "No Records Found";
        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        adapter.Fill(ds);
        if (ds.Tables.Count == 0)
        {
            GridView1.Visible = false;
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('no records ')", true);
        }
        else
        {
            GridView1.DataSource = ds;
            GridView1.DataBind();
            GridView1.Visible = true;
        }
        conn.Close();

    }

    protected void Button6_Click1(object sender, EventArgs e)
    {
        GridView1.Columns[0].Visible = false;
        GridView2.Visible = false;
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);
        conn.Open();
        SqlCommand cmd = new SqlCommand("SearchbyKW", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        string name = TextBox2.Text;
        cmd.Parameters.Add(new SqlParameter("@Keyword", name));
        GridView1.EmptyDataText = "No Records Found";
        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        adapter.Fill(ds);
        if (ds.Tables.Count == 0)
        {
            GridView1.Visible = false;
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('no records ')", true);
        }
        else
        {
            GridView1.DataSource = ds;
            GridView1.DataBind();
            GridView1.Visible = true;
        }
        conn.Close();

    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void View_info(Object sender, CommandEventArgs e)
    {
        

            int index = Convert.ToInt32(e.CommandArgument); 
            string connStr1 = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
            SqlConnection conn2 = new SqlConnection(connStr1);
            conn2.Open();
           
            GridViewRow selectedRow = GridView1.Rows[index]; // btgib el slected row
            SqlCommand cmdTR = new SqlCommand("DCinfo", conn2);
            cmdTR.CommandType = CommandType.StoredProcedure;
            string comp_id = selectedRow.Cells[1].Text.ToString();
            cmdTR.Parameters.Add(new SqlParameter("@Company", comp_id));
        conn2.Close();
        conn2.Open();
        GridView1.EmptyDataText = "No Records Found";
        GridView2.EmptyDataText = "No Records Found";
        SqlDataAdapter adapter = new SqlDataAdapter(cmdTR);
        DataSet ds = new DataSet();
        adapter.Fill(ds);
        if (ds.Tables.Count == 0)
        {
            GridView1.Visible = false;
            GridView2.Visible = false;
            Response.Write("no records");
        }
        else
        {
            GridView1.Columns[0].Visible = false;
            GridView1.DataSource = ds;
            GridView1.DataBind();
            GridView2.Visible = true;
            GridView2.DataSource = ds.Tables[1];
            GridView2.DataBind();
            GridView2.Visible = true;
        }

        conn2.Close();



    }

    protected void Search_for_specific_departement_Click(object sender, EventArgs e)
    {
        GridView1.Columns[0].Visible = false;
        if (TextBox3.Text=="" || TextBox4.Text == "" )
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('you have to enter all the info')", true);
        }
        else
        {
            GridView1.Columns[0].Visible = false;
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
            SqlConnection conn2 = new SqlConnection(connStr);
            SqlCommand cmdTR = new SqlCommand("CompanyDepartementJV", conn2);
            cmdTR.CommandType = CommandType.StoredProcedure;
            cmdTR.Parameters.Add(new SqlParameter("@Company", TextBox3.Text));
            cmdTR.Parameters.Add(new SqlParameter("@departement", TextBox4.Text));
            conn2.Close();
            conn2.Open();
            GridView1.EmptyDataText = "No Records Found";
            GridView2.EmptyDataText = "No Records Found";
            SqlDataAdapter adapter = new SqlDataAdapter(cmdTR);
            DataSet ds = new DataSet();
            adapter.Fill(ds);
            if (ds.Tables.Count == 0)
            {
                GridView1.Visible = false;
                GridView2.Visible = false;
                Response.Write("no records");
            }
            else if (ds.Tables.Count == 1)
            {
                GridView1.DataSource = ds.Tables[0];
                GridView1.DataBind();
                GridView1.Visible = true;
                GridView2.Visible = false;
            }
            else 
            {
                GridView1.DataSource = ds;
                GridView1.DataBind();
                GridView2.Visible = true;
                GridView2.DataSource = ds.Tables[1];
                GridView2.DataBind();
                GridView2.Visible = true;
            }

            conn2.Close();

        }
    }

    protected void Login_Click(object sender, EventArgs e)
    {
        Response.Redirect("login", true);
    }

    protected void Register_Click(object sender, EventArgs e)
    {
        Response.Redirect("Rgister", true);
    }

    protected void Logout_Click(object sender, EventArgs e)
    {
        Session["log_in"] = "5";
        Register.Visible = true;
        Logout.Visible = false;
        Login.Visible = true;
        Control_panel.Visible = false;
       // Response.Redirect("search", true);

    }

    protected void Control_panel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Infos_And_panel", true);
    }
}