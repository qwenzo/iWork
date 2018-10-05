using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
public partial class Default3 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
        Label2.Visible = false;
       
        Button112.Visible = false;
        TextBox1.Visible = false;
        
        GridView5.Visible = false;

        Button16.Visible = true;
        Button1.Visible = true;
        

       

    }
    protected void Buttonlviewlist(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);
        conn.Open();
        SqlCommand cmd = new SqlCommand("viewproject", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@regular", Session["Username"].ToString()));
        cmd.ExecuteNonQuery();
        GridView1.EmptyDataText = "no project";
        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        adapter.Fill(ds);

        if (ds.Tables.Count == 0)
        {
            GridView5.Visible = false;

        }
        else
        {
            GridView5.DataSource = ds;
            GridView5.DataBind();
            GridView5.Visible = true;



        }
        conn.Close();
    }
    protected void Buttondonee(object sender, EventArgs e)
    {
        Label2.Visible = true;
        TextBox1.Visible = true;
        Button112.Visible = true;
    }
    protected void Buttonlviewtask(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);
        conn.Open();
        SqlCommand cmd = new SqlCommand("viewtask", conn);

        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@regular", Session["Username"].ToString()));
        cmd.Parameters.Add(new SqlParameter("@project_name", TextBox1.Text.ToString()));
        cmd.ExecuteNonQuery();
        GridView1.EmptyDataText = "no tasks";
        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        adapter.Fill(ds);

        if (ds.Tables.Count == 0)
        {
            GridView6.Visible = false;

        }
        else
        {
            GridView6.DataSource = ds;
            GridView6.DataBind();
            GridView6.Visible = true;



        }
        conn.Close();
    }
    protected void bfixed2(object sender, EventArgs e)
    {

        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);
        conn.Open();
        SqlCommand cmd = new SqlCommand("ﬁnalizingTask", conn);

        cmd.CommandType = CommandType.StoredProcedure;
        string project = string.Empty;
        string task = string.Empty;
        foreach (GridViewRow row in GridView6.Rows)
        {
            task = row.Cells[0].Text;
            project = row.Cells[1].Text;

        }



        cmd.Parameters.Add(new SqlParameter("@regular", Session["Username"].ToString()));

        cmd.Parameters.Add(new SqlParameter("@task_name", task));
        cmd.Parameters.Add(new SqlParameter("@project_name", project));




        cmd.ExecuteNonQuery();

        conn.Close();

    }
    protected void bassign2(object sender, EventArgs e)
    {

        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);
        conn.Open();
        SqlCommand cmd = new SqlCommand("updateAssign", conn);

        cmd.CommandType = CommandType.StoredProcedure;
        string project = string.Empty;
        string task = string.Empty;
        foreach (GridViewRow row in GridView6.Rows)
        {
            task = row.Cells[0].Text;
            project = row.Cells[1].Text;

        }



        cmd.Parameters.Add(new SqlParameter("@regular", "Ahmed_Khaled121"));

        cmd.Parameters.Add(new SqlParameter("@task_name", task));
        cmd.Parameters.Add(new SqlParameter("@project_name", project));




        cmd.ExecuteNonQuery();

        conn.Close();

    }

}