using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;


public partial class ManagerMain : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["log_in"] != null)
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
            TextBox1.Visible = false;
            Label3.Visible = false;
            Label1.Visible = false;
            Label2.Visible = false;
            Button3.Visible = false;
            DropDownList1.Visible = false;
            Button5.Visible = false;
            Label4.Visible = false;
            GridViewJobsApps.Visible = false;
            GridViewJobsApps2.Visible = false;
            job_info.Visible = false;
            job_seekers.Visible = false;
            string reason = TextBox1.Text;
            string constr = ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("getJobsOfDepartements"))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    string userId = Session["Username"].ToString();
                    cmd.Parameters.Add(new SqlParameter("@Manager", userId));
                    cmd.Connection = con;
                    con.Open();
                    DropDownList1.DataSource = cmd.ExecuteReader();
                    DropDownList1.DataTextField = "title";
                    DropDownList1.DataValueField = "title";
                    DropDownList1.DataBind();
                    con.Close();
                }
            }
            Session["SelectedJob"] = DropDownList1.SelectedValue.ToString();
            DropDownList1.Items.Insert(0, new ListItem("--Select a Job--", "0"));
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {

    }

    protected void VRRefresh()
    {
        //LR
        TextBox1.Visible = false;
        Label3.Visible = false;
        Button3.Visible = false;
        Label1.Visible = true;
        Label2.Visible = true;
        GridViewJobsApps2.Visible = false;
        job_info.Visible = false;
        job_seekers.Visible = false;
        DropDownList1.Visible = false;
        Button5.Visible = false;
        Label4.Visible = false;
        GridViewJobsApps.Visible = false;
        job_info.Visible = false;
        job_seekers.Visible = false;
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);
        conn.Open();
        SqlCommand cmd = new SqlCommand("ViewReqsManager_LR", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        string userId = Session["Username"].ToString();
        cmd.Parameters.Add(new SqlParameter("@username", userId));
        GridView1.EmptyDataText = "No Records Found";
        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        adapter.Fill(ds);
        if (ds.Tables.Count == 0)
        {
            GridView1.Visible = false;
        }
        else
        {
            GridView1.DataSource = ds;
            GridView1.DataBind();
            GridView1.Visible = true;
        }
        conn.Close();
        //TR
        string connStr1 = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn2 = new SqlConnection(connStr1);
        conn2.Open();
        SqlCommand cmdTR = new SqlCommand("ViewReqsManager_TR", conn2);
        cmdTR.CommandType = CommandType.StoredProcedure;
        cmdTR.Parameters.Add(new SqlParameter("@username", userId));
        GridView2.EmptyDataText = "No Records Found";
        SqlDataAdapter adapter1 = new SqlDataAdapter(cmdTR);
        DataSet ds1 = new DataSet();
        adapter1.Fill(ds1);
        if (ds.Tables.Count == 0)
        {
            GridView2.Visible = false;
        }
        else
        {
            GridView2.DataSource = ds1;
            GridView2.DataBind();
            GridView2.Visible = true;
        }
        conn2.Close();
    }

    protected void VR(object sender, EventArgs e)
    {
        //LR
        TextBox1.Visible = false;
        Label3.Visible = false;
        Button3.Visible = false;
        Label1.Visible = true;
        Label2.Visible = true;
        Button5.Visible = false;
        Label4.Visible = false;
        DropDownList1.Visible = false;
        GridViewJobsApps.Visible = false;
        GridViewJobsApps2.Visible = false;
        job_info.Visible = false;
        job_seekers.Visible = false;

        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);
        conn.Open();
        SqlCommand cmd = new SqlCommand("ViewReqsManager_LR", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        string userId = Session["Username"].ToString();
        cmd.Parameters.Add(new SqlParameter("@username", userId));
        GridView1.EmptyDataText = "No Records Found";
        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        adapter.Fill(ds);
        if (ds.Tables.Count == 0)
        {
            GridView1.Visible = false;
        }
        else
        {
            GridView1.DataSource = ds;
            GridView1.DataBind();
            GridView1.Visible = true;
        }
        conn.Close();
        //TR
        string connStr1 = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn2 = new SqlConnection(connStr1);
        conn2.Open();
        SqlCommand cmdTR = new SqlCommand("ViewReqsManager_TR", conn2);
        cmdTR.CommandType = CommandType.StoredProcedure;
        cmdTR.Parameters.Add(new SqlParameter("@username", userId));
        GridView2.EmptyDataText = "No Records Found";
        SqlDataAdapter adapter1 = new SqlDataAdapter(cmdTR);
        DataSet ds1 = new DataSet();
        adapter1.Fill(ds1);
        if (ds.Tables.Count == 0)
        {
            GridView2.Visible = false;
        }
        else
        {
            GridView2.DataSource = ds1;
            GridView2.DataBind();
            GridView2.Visible = true;
        }
        conn2.Close();
    }
    protected void Acc_Command(Object sender, CommandEventArgs e)
    {
        TextBox1.Visible = false;
        Label3.Visible = false;
        Button3.Visible = false;
        Label1.Visible = true;
        Label2.Visible = true;
        if (e.CommandName == "Acc")
        {
            // Convert the row index stored in the CommandArgument
            // property to an Integer.
            int index = Convert.ToInt32(e.CommandArgument);


            // Get the last name of the selected author from the appropriate
            // cell in the GridView control.
            string connStr1 = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
            SqlConnection conn2 = new SqlConnection(connStr1);
            conn2.Open();
            // GridViewRow selectedRow = GridView2.Rows[index];
            GridViewRow selectedRow = GridView2.Rows[index];
            SqlCommand cmdTR = new SqlCommand("AcceptetanceManagerReq", conn2);
            cmdTR.CommandType = CommandType.StoredProcedure;
            string userId = Session["Username"].ToString();
            string date = selectedRow.Cells[0].Text.ToString();
            string username = selectedRow.Cells[1].Text.ToString();
            cmdTR.Parameters.Add(new SqlParameter("@username", username));
            cmdTR.Parameters.Add(new SqlParameter("@from", date));
            cmdTR.Parameters.Add(new SqlParameter("@manager", userId));
            cmdTR.ExecuteNonQuery();
            VRRefresh();
            conn2.Close();

        }
    }

    protected void Rej_Command(Object sender, CommandEventArgs e)
    {
        Label1.Visible = true;
        Label2.Visible = true;
        TextBox1.Visible = true;
        Label3.Visible = true;
        Button3.Visible = true;



        if (e.CommandName == "Rej")
        {
            // Convert the row index stored in the CommandArgument
            // property to an Integer.
            int index = Convert.ToInt32(e.CommandArgument);


            // Get the last name of the selected author from the appropriate
            // cell in the GridView control.
            string connStr1 = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
            SqlConnection conn2 = new SqlConnection(connStr1);
            conn2.Open();
            // GridViewRow selectedRow = GridView2.Rows[index];
            GridViewRow selectedRow = GridView2.Rows[index];
            //  SqlCommand cmdTR = new SqlCommand("AcceptetanceManagerReq", conn2);
            // cmdTR.CommandType = CommandType.StoredProcedure;
            string userId = Session["Username"].ToString();
            string date = selectedRow.Cells[0].Text.ToString();
            string username = selectedRow.Cells[1].Text.ToString();

            Session["DateReq"] = date;
            Session["userReq"] = username;

            //cmdTR.Parameters.Add(new SqlParameter("@username", username));
            //cmdTR.Parameters.Add(new SqlParameter("@from", date));
            //cmdTR.Parameters.Add(new SqlParameter("@manager", userId));
            //cmdTR.ExecuteNonQuery();
            conn2.Close();

        }
    }



    protected void JA(object sender, EventArgs e)
    {
        DropDownList1.ClearSelection();
        Label1.Visible = false;
        Label2.Visible = false;
        TextBox1.Visible = false;
        Label3.Visible = false;
        Button3.Visible = false;
        DropDownList1.Visible = true;
        Button5.Visible = true;
        Label4.Visible = true;
        GridView1.Visible = false;
        GridView2.Visible = false;



    }

    protected void enterReason(object sender, EventArgs e)
    {
        Label1.Visible = true;
        Label2.Visible = true;
        TextBox1.Visible = true;
        Label3.Visible = true;
        Button3.Visible = true;
        string reason = TextBox1.Text;
        if (reason == null || reason == "")
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('You have to provide a reason ')", true);
        }
        else
        {
            string connStr1 = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
            SqlConnection conn2 = new SqlConnection(connStr1);
            conn2.Open();
            // GridViewRow selectedRow = GridView2.Rows[index];
            SqlCommand cmdTR = new SqlCommand("ManagerReqRejection", conn2);
            cmdTR.CommandType = CommandType.StoredProcedure;
            string userId = Session["Username"].ToString();
            cmdTR.Parameters.Add(new SqlParameter("@username", Session["userReq"].ToString()));
            cmdTR.Parameters.Add(new SqlParameter("@from", Session["DateReq"].ToString()));
            cmdTR.Parameters.Add(new SqlParameter("@manager", userId));
            cmdTR.Parameters.Add(new SqlParameter("@manager_reason", reason));
            cmdTR.ExecuteNonQuery();
            VRRefresh();
            conn2.Close();
        }
    }

    public void HiddenField1_ValueChanged(Object sender, EventArgs e)
    {



    }
    public void HiddenField2_ValueChanged(Object sender, EventArgs e)
    {



    }



      
  
    protected void Button5_Click(object sender, EventArgs e)
    {
        Label1.Visible = false;
        Label2.Visible = false;
        TextBox1.Visible = false;
        Label3.Visible = false;
        Button3.Visible = false;
        DropDownList1.Visible = true;
        Button5.Visible = true;
        Label4.Visible = true;
        GridViewJobsApps2.Visible = true;
        job_info.Visible = true;
        job_seekers.Visible = true;

        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);
        conn.Open();
        SqlCommand cmd = new SqlCommand("ViewApps", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        string userId = Session["Username"].ToString();
        cmd.Parameters.Add(new SqlParameter("@manager", userId));
        cmd.Parameters.Add(new SqlParameter("@Job_title", Session["SelectedJob"].ToString()));
        GridViewJobsApps.EmptyDataText = "No Records Found";
        GridViewJobsApps2.EmptyDataText = "No Records Found";
        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        adapter.Fill(ds);
        //GridViewJobsApps.DataSource = ds.Tables[0].DefaultView;

        if (ds.Tables.Count == 0)
        {
            GridViewJobsApps.Visible = false;
            GridViewJobsApps2.Visible = false;
            job_info.Visible = false;
            job_seekers.Visible = false;
            Response.Write("no records");
        }
        else
        {
            GridViewJobsApps.DataSource = ds;
            GridViewJobsApps.DataBind();
            GridViewJobsApps.Visible = true;
            GridViewJobsApps2.DataSource = ds.Tables[1];
            GridViewJobsApps2.DataBind();
            GridViewJobsApps2.Visible = true;
        }

        conn.Close();
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["SelectedJob"] = DropDownList1.SelectedItem.Value;
        Label1.Visible = false;
        Label2.Visible = false;
        TextBox1.Visible = false;
        Label3.Visible = false;
        Button3.Visible = false;
        DropDownList1.Visible = true;
        Button5.Visible = true;
        Label4.Visible = true;
        GridViewJobsApps.Visible = false;
        GridViewJobsApps2.Visible = false;
        job_info.Visible = false;
        job_seekers.Visible = false;
    }

    protected void Acc_App(Object sender, CommandEventArgs e)
    {
        if (e.CommandName == "Acc")
        {
            // Convert the row index stored in the CommandArgument
            // property to an Integer.
            int index = Convert.ToInt32(e.CommandArgument); // bta5od el index bta3 el row lazm CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" tb2a mwgoodh fel button fel html
            // Get the last name of the selected author from the appropriate
            // cell in the GridView control.
            string connStr1 = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
            SqlConnection conn2 = new SqlConnection(connStr1);
            conn2.Open();
            // GridViewRow selectedRow = GridView2.Rows[index];
            GridViewRow selectedRow = GridViewJobsApps2.Rows[index]; // btgib el slected row
            SqlCommand cmdTR = new SqlCommand("AccJApp", conn2);
            cmdTR.CommandType = CommandType.StoredProcedure;
            string userId = Session["Username"].ToString();
            string username = selectedRow.Cells[0].Text.ToString(); // btgib el value bta3t el attribute ely fe position 0 y3ny msln ID PW ahmed 123 de htgblna "ahmed"
            cmdTR.Parameters.Add(new SqlParameter("@username", username));
            cmdTR.Parameters.Add(new SqlParameter("@job", Session["SelectedJob"].ToString()));
            cmdTR.Parameters.Add(new SqlParameter("@manager", userId));
            cmdTR.ExecuteNonQuery();
            AppsRefresh();
            conn2.Close();

        }


    }
    protected void Rej_App(Object sender, CommandEventArgs e)
    {
        if (e.CommandName == "Rej")
        {
            // Convert the row index stored in the CommandArgument
            // property to an Integer.
            int index = Convert.ToInt32(e.CommandArgument);


            // Get the last name of the selected author from the appropriate
            // cell in the GridView control.
            string connStr1 = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
            SqlConnection conn2 = new SqlConnection(connStr1);
            conn2.Open();
            // GridViewRow selectedRow = GridView2.Rows[index];
            GridViewRow selectedRow = GridViewJobsApps2.Rows[index];
            SqlCommand cmdTR = new SqlCommand("RejJApp", conn2);
            cmdTR.CommandType = CommandType.StoredProcedure;
            string userId = Session["Username"].ToString();
            string username = selectedRow.Cells[0].Text.ToString();
            cmdTR.Parameters.Add(new SqlParameter("@username", username));
            cmdTR.Parameters.Add(new SqlParameter("@job", Session["SelectedJob"].ToString()));
            cmdTR.Parameters.Add(new SqlParameter("@manager", userId));
            cmdTR.ExecuteNonQuery();
            AppsRefresh();
            conn2.Close();

        }


    }

    protected void AppsRefresh()
    {
        Label1.Visible = false;
        Label2.Visible = false;
        TextBox1.Visible = false;
        Label3.Visible = false;
        Button3.Visible = false;
        DropDownList1.Visible = true;
        Button5.Visible = true;
        Label4.Visible = true;
        GridViewJobsApps2.Visible = true;
        job_info.Visible = true;
        job_seekers.Visible = true;

        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);
        conn.Open();
        SqlCommand cmd = new SqlCommand("ViewApps", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        string userId = Session["Username"].ToString();
        cmd.Parameters.Add(new SqlParameter("@manager", userId));
        cmd.Parameters.Add(new SqlParameter("@Job_title", Session["SelectedJob"].ToString()));
        GridViewJobsApps.EmptyDataText = "No Records Found";
        GridViewJobsApps2.EmptyDataText = "No Records Found";
        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        adapter.Fill(ds);

        if (ds.Tables.Count == 0)
        {
            GridViewJobsApps.Visible = false;
            Response.Write("no records");
        }
        else
        {
            GridViewJobsApps.DataSource = ds;
            GridViewJobsApps.DataBind();
            GridViewJobsApps.Visible = true;
            GridViewJobsApps2.DataSource = ds.Tables[1];
            GridViewJobsApps2.DataBind();
            GridViewJobsApps2.Visible = true;
        }

        conn.Close();
    }

    protected void Button6_Click(object sender, EventArgs e)
    {
        Response.Redirect("Projects Panel Manager", true);
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
         Response.Redirect("search", true);

    }

    protected void Control_panel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Infos_And_panel", true);
    }
}