using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        Label2.Visible = false;

        Button112.Visible = false;
        TextBox1.Visible = false;

        GridView5.Visible = false;

        Button16.Visible = false;
        Button1.Visible = false;

        Label1.Visible = false;
        Label47.Visible = false;
        TextBox36.Visible = false;
        Labe99.Visible = false;
        Label27.Visible = false;
        Labe25.Visible = false;
        Labe43.Visible = false;
        Label22.Visible = false;
        TextBox11.Visible = false;
        TextBox9.Visible = false;
        Label33.Visible = false;
        Label2.Visible = false;
        TextBox22.Visible = false;
        Button112.Visible = false;
        TextBox1.Visible = false;
        TextBox23.Visible = false;
        TextBox32.Visible = false;
        Label44.Visible = false;
        TextBox33.Visible = false;
        GridViewJobsApps2.Visible = false;
        GridView5.Visible = false;
        Button111.Visible = false;
        btnProcess.Visible = false;
        Button1a.Visible = false;
        Button1b.Visible = false;
        Button3.Visible = true;
        Button5a.Visible = true;
        
        Button1.Visible = true;
        Button14.Visible = false;
       
        DropDownLista7a.Visible = false;
        Label45.Visible = false;
        TextBox34.Visible = false;
        Label46.Visible = false;
        TextBox35.Visible = false;
        Button115.Visible = false;
        GridView9.Visible = false;
        GridView8.Visible = false;
    }


    protected void Sss(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        using (SqlConnection conn = new SqlConnection(connStr))
        {

            using (SqlCommand cmd = new SqlCommand("ApplyJob"))
            {
                cmd.Connection = conn;
                conn.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                string c = company.Text;
                string d = department.Text;
                string j = Job_title.Text;
                cmd.Parameters.Add(new SqlParameter("@username",
                    Session["Username"].ToString()));
                cmd.Parameters.Add(new SqlParameter("@company", c));
                cmd.Parameters.Add(new SqlParameter("@departement", Convert.ToInt32(department.Text)));
                cmd.Parameters.Add(new SqlParameter("@Job_title", j));

                cmd.ExecuteNonQuery();
                Response.Write("done");
                conn.Close();
            }


        }
    }
    protected void upd_score3(object sender, EventArgs e)
    {
        string strname = string.Empty;

        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        foreach (GridViewRow row in GridViewJobsApps2.Rows)
        {
           
            if ((row.FindControl("REJ_JA") as RadioButton).Checked)
            {

                strname = row.Cells[3].Text;


                string consString = ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
                using (SqlConnection con = new SqlConnection(consString))
                {
                    using (SqlCommand cmd = new SqlCommand("updateScore"))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Connection = con;
                        cmd.Parameters.Add(new SqlParameter("@answer", "0"));
                        cmd.Parameters.Add(new SqlParameter("@question", Convert.ToInt32(strname)));

                        cmd.Parameters.Add(new SqlParameter("@username", Session["Username"].ToString()));
                        cmd.Parameters.Add(new SqlParameter("@company", TextBox11.Text.ToString()));
                        cmd.Parameters.Add(new SqlParameter("@Job_title", TextBox33.Text.ToString()));
                        cmd.Parameters.Add(new SqlParameter("@departement", Convert.ToInt32(TextBox22.Text)));
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                        Button1a.Visible = true;
                    }
                }
            }
            

                if ((row.FindControl("ACC_JA") as RadioButton).Checked)
            {
                strname = row.Cells[3].Text;


                string consString = ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
                using (SqlConnection con = new SqlConnection(consString))
                {
                    using (SqlCommand cmd = new SqlCommand("updateScore"))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Connection = con;
                        cmd.Parameters.Add(new SqlParameter("@answer", "1"));
                        cmd.Parameters.Add(new SqlParameter("@question", Convert.ToInt32(strname)));

                        cmd.Parameters.Add(new SqlParameter("@username", Session["Username"].ToString()));
                        cmd.Parameters.Add(new SqlParameter("@company", TextBox11.Text.ToString()));
                        cmd.Parameters.Add(new SqlParameter("@Job_title", TextBox33.Text.ToString()));
                        cmd.Parameters.Add(new SqlParameter("@departement", Convert.ToInt32(TextBox22.Text)));
                        con.Open();
                        cmd.ExecuteNonQuery();

                        con.Close();
                        Button1a.Visible = true;

                    }
                }
            }
        }
    }
    protected void btnstatus(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);
        conn.Open();
        SqlCommand cmd = new SqlCommand("ViewStatud", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@username", Session["Username"].ToString()));
        GridView2.EmptyDataText = "No Records Found";
        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        adapter.Fill(ds);
        if (ds.Tables.Count == 0)
        {
            GridView2.Visible = false;
            Response.Write("no records");
        }
        else
        {
            GridView2.DataSource = ds;
            GridView2.DataBind();
            GridView2.Visible = true;
            Button1b.Visible = false;
            Button3.Visible = true;
        }
        conn.Close();
    }
    protected void dltjob(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);
        conn.Open();
        SqlCommand cmd = new SqlCommand("DeleteApp", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@username", Session["Username"].ToString()));
        cmd.Parameters.Add(new SqlParameter("@company", TextBox11.Text.ToString()));
        cmd.Parameters.Add(new SqlParameter("@Job_title", TextBox33.Text.ToString()));
        cmd.Parameters.Add(new SqlParameter("@departement", Convert.ToInt32(TextBox22.Text)));
        cmd.ExecuteNonQuery();
        
        conn.Close();

    }

        protected void btnViews(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);
        conn.Open();
        SqlCommand cmd = new SqlCommand("view_score", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@username", Session["Username"].ToString()));
        GridView1.EmptyDataText = "no score";
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
            Button1b.Visible = true;
            foreach (GridViewRow row in GridView1.Rows)
            {
                string score = row.Cells[0].Text;
                if (score == null)
                {
                    Label47.Visible = true;

                }



            }

        }
        
        
    }

        protected void btnProcess_Click(object sender, EventArgs e)
    {
        string str = string.Empty;
        string strname = string.Empty;
        foreach (GridViewRow gvrow in GridViewJobsApps2.Rows)
        {
            CheckBox chk = (CheckBox)gvrow.FindControl("chkSelect");
            if (chk != null & chk.Checked)
            {
                str += GridViewJobsApps2.DataKeys[gvrow.RowIndex].Value.ToString() + ',';
                strname += gvrow.Cells[2].Text + ',';
            }
        }
        str = str.Trim(",".ToCharArray());
        strname = strname.Trim(",".ToCharArray());
        
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
            SqlCommand cmdTR = new SqlCommand("QapplyJ", conn2);
            cmdTR.CommandType = CommandType.StoredProcedure;
            string userId = Session["Username"].ToString();
            string username = selectedRow.Cells[0].Text.ToString(); // btgib el value bta3t el attribute ely fe position 0 y3ny msln ID PW ahmed 123 de htgblna "ahmed"
            cmdTR.Parameters.Add(new SqlParameter("@username", Session["Username"].ToString()));
            cmdTR.Parameters.Add(new SqlParameter("@company", company));
            cmdTR.Parameters.Add(new SqlParameter("@Job_title", Session["SelectedJob"].ToString()));
            cmdTR.Parameters.Add(new SqlParameter("@departement", userId));
            cmdTR.ExecuteNonQuery();
            //ppsRefresh();
            conn2.Close();

        }
    }
    protected void Acc_App2(Object sender, CommandEventArgs e)

    {
        if (e.CommandName == "Acc2")
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
            GridViewRow selectedRow = GridView3.Rows[index]; // btgib el slected row
            SqlCommand cmdTR = new SqlCommand("ChooseaJob", conn2);
            cmdTR.CommandType = CommandType.StoredProcedure;
            string userId = Session["Username"].ToString();
            string username = selectedRow.Cells[0].Text.ToString(); // btgib el value bta3t el attribute ely fe position 0 y3ny msln ID PW ahmed 123 de htgblna "ahmed"
            cmdTR.Parameters.Add(new SqlParameter("@username", Session["Username"].ToString()));
            cmdTR.Parameters.Add(new SqlParameter("@company", company));
            cmdTR.Parameters.Add(new SqlParameter("@Job_title", Session["SelectedJob"].ToString()));
            cmdTR.Parameters.Add(new SqlParameter("@departement", userId));
            cmdTR.ExecuteNonQuery();
            //ppsRefresh();
            conn2.Close();

        }
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        string c1 = company.Text;
        string d1 = department.Text;
        string j1 = Job_title.Text;
        Label22.Visible = true;
        TextBox11.Visible = true;
        Label33.Visible = true;
        TextBox22.Visible = true;
        Label44.Visible = true;
        TextBox33.Visible = true;
        Button5.Visible = false;
        Button111.Visible = true;
        btnProcess.Visible = false;
        Button1a.Visible = false;
    }
    protected void Buttondone(object sender, EventArgs e)
    {
        
        Label27.Visible = true;
        Labe99.Visible = true;
        Labe25.Visible = true;
        Labe43.Visible = true;
        TextBox23.Visible = true;
        TextBox9.Visible = true;
        TextBox32.Visible = true;
        DropDownLista7a.Visible = true;
       
        foreach (GridViewRow row in GridView3.Rows)
        {

            if ((row.FindControl("ACC_JAA") as RadioButton).Checked)
            {
                string done = row.Cells[1].Text;
                Session["done"] = done;
               
                Label27.Visible = true;
                Labe99.Visible = true;
                Labe25.Visible = true;
                Labe43.Visible = true;
                TextBox23.Visible = true;
                TextBox9.Visible = true;
                TextBox32.Visible = true;
                DropDownLista7a.Visible = true;
                Response.Write(done);
            }
            GridView3.Visible = true;
            
            Label27.Visible = true;
            Labe99.Visible = true;
            Labe25.Visible = true;
            Labe43.Visible = true;
            TextBox23.Visible = true;
            TextBox9.Visible = true;
            TextBox32.Visible = true;
            DropDownLista7a.Visible = true;
        }
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        string d = string.Empty;
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            
            DropDownList DropDownList1 = (e.Row.FindControl("dayo") as DropDownList);
            ((DropDownList)e.Row.FindControl("ddlQualification")).SelectedValue = d;
            int a = Int32.Parse(d);
        }
    }


            protected void ButtonshoseJob11(object sender, GridViewCommandEventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);
        conn.Open();
        SqlCommand cmd = new SqlCommand("ChooseaJob", conn);

        cmd.CommandType = CommandType.StoredProcedure;
        string ajob = string.Empty;
        int adepartment = 0;
        string acompany = string.Empty;
        string aday = string.Empty;

        foreach (GridViewRow row in GridView9.Rows)
        {
            ajob = row.Cells[0].Text;
            adepartment = int.Parse(row.Cells[1].Text);
            acompany = row.Cells[2].Text;

            
            
        }

        
        
        cmd.Parameters.Add(new SqlParameter("@username", Session["Username"].ToString()));

        cmd.Parameters.Add(new SqlParameter("@Job_title", ajob));
        cmd.Parameters.Add(new SqlParameter("@day_off", DropDownLista7a.Text.ToString()));
        cmd.Parameters.Add(new SqlParameter("@departement", adepartment));
        cmd.Parameters.Add(new SqlParameter("company", acompany));
        



        cmd.ExecuteNonQuery();

        conn.Close();
    }

   
        protected void ButtonshoseJob(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);
        conn.Open();
        SqlCommand cmd = new SqlCommand("ChooseaJob2", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@username", Session["Username"].ToString()));
        

        cmd.ExecuteNonQuery();
        GridView1.EmptyDataText = "no jobs";
        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        adapter.Fill(ds);

        if (ds.Tables.Count == 0)
        {
            GridView9.Visible = false;

        }
        else
        {
            GridView9.DataSource = ds;
            GridView9.DataBind();
            GridView9.Visible = true;
            DropDownLista7a.Visible = true;
            
        }
        conn.Close();
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
    protected void Buttondone2(object sender, EventArgs e)
    {
        GridView8.Visible = true;
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Update")
        {
            // Retrieve the row index
            int index = Convert.ToInt32(e.CommandArgument);

            // Retrieve the row by its index
            GridViewRow row = this.GridView8.Rows[index];

            // Get the 1st cell value from the row
            string cellValue = row.Cells[1].Text;
        }
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



        cmd.Parameters.Add(new SqlParameter("@regular", Session["Username"].ToString()));

        cmd.Parameters.Add(new SqlParameter("@task_name", task));
        cmd.Parameters.Add(new SqlParameter("@project_name", project));




        cmd.ExecuteNonQuery();

        conn.Close();

    }


    protected void Button111_Click(object sender, EventArgs e)
    {
        GridViewJobsApps2.Visible = true;
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);
        conn.Open();
        SqlCommand cmd = new SqlCommand("QapplyJ", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        //string userId = Session["Username"].ToString();
        cmd.Parameters.Add(new SqlParameter("@username", Session["Username"].ToString()));
        cmd.Parameters.Add(new SqlParameter("@company", TextBox11.Text.ToString()));
        cmd.Parameters.Add(new SqlParameter("@Job_title", TextBox33.Text.ToString()));
        cmd.Parameters.Add(new SqlParameter("@departement", Convert.ToInt32(TextBox22.Text)));
        GridViewJobsApps2.EmptyDataText = "No Records Found";
        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        adapter.Fill(ds);
        if (ds.Tables.Count == 0)
        {
            GridViewJobsApps2.Visible =false;
            Response.Write("no records");
        }
        else
        {
            GridViewJobsApps2.DataSource = ds;
            GridViewJobsApps2.DataBind();
            GridViewJobsApps2.Visible = true;
            btnProcess.Visible = true;
            Button1a.Visible = true;
        }
        conn.Close();
    }

    
}