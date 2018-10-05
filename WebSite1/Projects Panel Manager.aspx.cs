using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Globalization;

public partial class Default2 : System.Web.UI.Page
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


            CP.Visible = false;
            PN.Visible = false;
            P_ED.Visible = false;
            end_date_p.Visible = false;
            P_SD.Visible = false;
            start_date_p.Visible = false;
            name_project.Visible = false;
            Projects_list.Visible = false;
            Regs_list.Visible = false;
            Assign.Visible = false;
            Projects_remove.Visible = false;
            DropDownList2.Visible = false;
            Remove.Visible = false;
            //Tasks_Define
            Comment_Tasks.Visible = false;
            Comment_Tasks_Text.Visible = false;
            deadline_Tasks.Visible = false;
            deadline_Tasks_Text.Visible = false;
            desc_Tasks.Visible = false;
            desc_Tasks_Text.Visible = false;
            name_Tasks.Visible = false;
            name_Tasks_Text.Visible = false;
            Projects_Tasks.Visible = false;
            Regs_Task.Visible = false;
            Assign_Tasks.Visible = false;
            Assign_Tasks_reg.Visible = false;
            //replace_regs
            replace.Visible = false;
            Projects_replace.Visible = false;
           Regular_works.Visible = false;
            Regular_new.Visible = false;
            Tasks_replace.Visible = false;
            //Tasks_Projects
            View_Tasks_projects.Visible = false;
            TextBox1.Visible = false;
            View_Tasks_Button.Visible = false;
            GridStatusFixed.Visible = false;
            GridStatus.Visible = false;
            Status.Visible = false;
            New_date.Visible = false;
            New_date_Box.Visible = false;
            Button4 . Visible = false;


            string constr = ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("GET_ALL_Projects_Manager"))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    string userId = Session["Username"].ToString();
                    cmd.Parameters.Add(new SqlParameter("@manager", userId));
                    cmd.Connection = con;
                    con.Open();
                    Projects_list.DataSource = cmd.ExecuteReader();
                    Projects_list.DataTextField = "name";
                    Projects_list.DataValueField = "name";
                    Projects_list.DataBind();
                    con.Close();
                    con.Open();
                    Projects_remove.DataSource = cmd.ExecuteReader();
                    Projects_remove.DataTextField = "name";
                    Projects_remove.DataValueField = "name";
                    Projects_remove.DataBind();
                    con.Close();
                    con.Open();
                    Projects_Tasks.DataSource = cmd.ExecuteReader();
                    Projects_Tasks.DataTextField = "name";
                    Projects_Tasks.DataValueField = "name";
                    Projects_Tasks.DataBind();
                    con.Close();
                    con.Open();
                    Projects_replace.DataSource = cmd.ExecuteReader();
                    Projects_replace.DataTextField = "name";
                    Projects_replace.DataValueField = "name";
                    Projects_replace.DataBind();
                    con.Close();
                    con.Open();
                    View_Tasks_projects.DataSource = cmd.ExecuteReader();
                    View_Tasks_projects.DataTextField = "name";
                    View_Tasks_projects.DataValueField = "name";
                    View_Tasks_projects.DataBind();
                    con.Close();
                }
                using (SqlCommand cmd = new SqlCommand("GET_ALL_REGS_Manager"))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    string userId = Session["Username"].ToString();
                    cmd.Parameters.Add(new SqlParameter("@manager", userId));
                    cmd.Connection = con;
                    con.Open();
                    Regs_list.DataSource = cmd.ExecuteReader();
                    Regs_list.DataTextField = "username";
                    Regs_list.DataValueField = "username";
                    Regs_list.DataBind();
                    con.Close();
                }
            }

            Projects_remove.Items.Insert(0, new ListItem("--Select a Project--", "0"));
            Projects_list.Items.Insert(0, new ListItem("--Select a Project--", "0"));
            Projects_Tasks.Items.Insert(0, new ListItem("--Select a Project--", "0"));
            View_Tasks_projects.Items.Insert(0, new ListItem("--Select a Project--", "0"));
            Projects_replace.Items.Insert(0, new ListItem("--Select a Project--", "0"));
            Regs_list.Items.Insert(0, new ListItem("--Select a Regular Employee--", "0"));
            Projects_list.Items[0].Selected = true;
            Projects_replace.Items[0].Selected = true;
            Projects_remove.Items[0].Selected = true;
            Projects_Tasks.Items[0].Selected = true;
            View_Tasks_projects.Items[0].Selected = true;
            Regs_list.Items[0].Selected = true;
            Session["SelectedProjectAssign"] = Projects_list.SelectedValue.ToString();
            Session["SelectedProjectAssign_remove"] = Projects_remove.SelectedValue.ToString();
            Session["SelectedProjectAssign_Tasks"] = Projects_Tasks.SelectedValue.ToString();
            Session["SelectedProjectAssign_replace"] = Projects_replace.SelectedValue.ToString();
            Session["SelectedProject_view_tasks"] = View_Tasks_projects.SelectedValue.ToString();
            Session["SelectedRegAssign"] = Regs_list.SelectedValue.ToString();
        }
    }

    protected void View_Tasks_Projects_Trans(object sender, EventArgs e)
    {
        View_Tasks_projects.ClearSelection();
        CP.Visible = false;
        PN.Visible = false;
        P_ED.Visible = false;
        end_date_p.Visible = false;
        P_SD.Visible = false;
        start_date_p.Visible = false;
        name_project.Visible = false;
        Projects_list.Visible = false;
        Regs_list.Visible = false;
        Assign.Visible = false;
        Projects_remove.Visible = false;
        DropDownList2.Visible = false;
        Remove.Visible = false;
        //Tasks_Define
        Comment_Tasks.Visible = false;
        Comment_Tasks_Text.Visible = false;
        deadline_Tasks.Visible = false;
        deadline_Tasks_Text.Visible = false;
        desc_Tasks.Visible = false;
        desc_Tasks_Text.Visible = false;
        name_Tasks.Visible = false;
        name_Tasks_Text.Visible = false;
        Projects_Tasks.Visible = false;
        Regs_Task.Visible = false;
        Assign_Tasks.Visible = false;
        Assign_Tasks_reg.Visible = false;
        //replace_regs
        replace.Visible = false;
        Projects_replace.Visible = false;
        Regular_works.Visible = false;
        Regular_new.Visible = false;
        Tasks_replace.Visible = false;
        //Tasks_Projects
        View_Tasks_projects.Visible = true;
        TextBox1.Visible = true;
        View_Tasks_Button.Visible = true;
        Status.Visible = true;
        New_date.Visible = false;
        New_date_Box.Visible = false;
        Button4.Visible = false;
        GridStatus.Visible = false;
        GridStatusFixed.Visible = false;
    }

    protected void Tasks_projects_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["SelectedProject_view_tasks"] = View_Tasks_projects.SelectedValue.ToString();
       

    }

    protected void View_Button_Tasks_project(object sender, EventArgs e)
    {
       // Response.Write(TextBox1.Text.ToString());
        if (View_Tasks_projects.SelectedValue.Equals("0") || TextBox1.Text == "")
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('you have to select a Project and a status')", true);
        }
      // else if ( TextBox1.Text.ToString()!="Assigned"  || TextBox1.Text.ToString()!="Open" || TextBox1.Text.ToString()!="Closed" || TextBox1.Text.ToString() !="Fixed")
       // {
        //    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('you can only search for Assigned,Open,Closed and Fixed status ')", true);
       // }
       else if (TextBox1.Text != "Fixed")
        {
            
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            SqlCommand cmd = new SqlCommand("ViewTasksstatus", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            string userId = Session["Username"].ToString();
            cmd.Parameters.Add(new SqlParameter("@manager", userId));
            cmd.Parameters.Add(new SqlParameter("@project_name", Session["SelectedProject_view_tasks"]));
            cmd.Parameters.Add(new SqlParameter("@status", TextBox1.Text.ToString()));
            GridStatus.EmptyDataText = "No Records Found";
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            adapter.Fill(ds);
            if (ds.Tables.Count == 0)
            {
                GridStatus.Visible = false;
                 GridStatusFixed.Visible = false;
                 Response.Write("no records");
            }
            else
            {
                GridStatus.DataSource = ds;
                GridStatus.DataBind();
                GridStatus.Visible = true;
                GridStatusFixed.Visible = false;
            }
            conn.Close();
        }

        else if (TextBox1.Text == "Fixed")
        {
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            SqlCommand cmd = new SqlCommand("ViewTasksstatus", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            string userId = Session["Username"].ToString();
            cmd.Parameters.Add(new SqlParameter("@manager", userId));
            cmd.Parameters.Add(new SqlParameter("@project_name", Session["SelectedProject_view_tasks"]));
            cmd.Parameters.Add(new SqlParameter("@status", TextBox1.Text.ToString()));
            GridStatus.EmptyDataText = "No Records Found";
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            adapter.Fill(ds);
            if (ds.Tables.Count == 0)
            {
                GridStatus.Visible = false;
                GridStatusFixed.Visible = false;
                Response.Write("no records");
            }
            else
            {
                GridStatusFixed.DataSource = ds;
                GridStatusFixed.DataBind();
                GridStatusFixed.Visible = true;
                GridStatus.Visible = false;
            }
            conn.Close();
        }


    }

    protected void Acc_Task(Object sender, CommandEventArgs e)
    {
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
            GridViewRow selectedRow = GridStatusFixed.Rows[index];
            SqlCommand cmdTR = new SqlCommand("ReviewTaskAccept", conn2);
            cmdTR.CommandType = CommandType.StoredProcedure;
            string userId = Session["Username"].ToString();
            string task = selectedRow.Cells[0].Text.ToString();
            cmdTR.Parameters.Add(new SqlParameter("@manager", userId));
            cmdTR.Parameters.Add(new SqlParameter("@project_name", Session["SelectedProject_view_tasks"]));
            cmdTR.Parameters.Add(new SqlParameter("@task_name", task));
            cmdTR.ExecuteNonQuery();
            Tasks_Refresh();
            conn2.Close();

        }
    }

    protected void Tasks_Refresh()
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);
        conn.Open();
        SqlCommand cmd = new SqlCommand("ViewTasksstatus", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        string userId = Session["Username"].ToString();
        cmd.Parameters.Add(new SqlParameter("@manager", userId));
        cmd.Parameters.Add(new SqlParameter("@project_name", Session["SelectedProject_view_tasks"]));
        cmd.Parameters.Add(new SqlParameter("@status", TextBox1.Text.ToString()));
        GridStatus.EmptyDataText = "No Records Found";
        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        adapter.Fill(ds);
        if (ds.Tables.Count == 0)
        {
            GridStatus.Visible = false;
            GridStatusFixed.Visible = false;
        }
        else
        {
            GridStatusFixed.DataSource = ds;
            GridStatusFixed.DataBind();
            GridStatusFixed.Visible = true;
            GridStatus.Visible = false;
            New_date.Visible = false;
            New_date_Box.Visible = false;
            Button4.Visible = false;
        }
        conn.Close();
    }

    protected void Tasks_Refresh_Reject()
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);
        conn.Open();
        SqlCommand cmd = new SqlCommand("ViewTasksstatus", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        string userId = Session["Username"].ToString();
        cmd.Parameters.Add(new SqlParameter("@manager", userId));
        cmd.Parameters.Add(new SqlParameter("@project_name", Session["SelectedProject_view_tasks"]));
        cmd.Parameters.Add(new SqlParameter("@status", TextBox1.Text.ToString()));
        GridStatus.EmptyDataText = "No Records Found";
        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        adapter.Fill(ds);
        if (ds.Tables.Count == 0)
        {
            GridStatus.Visible = false;
            GridStatusFixed.Visible = false;
        }
        else
        {
            GridStatusFixed.DataSource = ds;
            GridStatusFixed.DataBind();
            GridStatusFixed.Visible = true;
            GridStatus.Visible = false;
        }
        conn.Close();
    }



    protected void Rej_Task(Object sender, CommandEventArgs e)
    {
        New_date.Visible = true;
        New_date_Box.Visible = true;
        Button4.Visible = true;
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('you have to provide a new deadline to completely Reject ')", true);
        int index = Convert.ToInt32(e.CommandArgument);
        GridViewRow selectedRow = GridStatusFixed.Rows[index];
        Session["SelectedProject_view_tasks_Reject"] = selectedRow.Cells[0].Text.ToString();
    }

    protected void final_reject(Object sender, EventArgs e)
    {
        int m = 0;
        int d = 0;
        int y = 0;
       
       
        if (New_date_Box.Text.ToString() == "")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('you have to provide a new deadline to completely Reject ')", true);
            }
        else if (!(New_date_Box.Text.Split('/').Length == 3) || !(int.TryParse(New_date_Box.Text.Split('/')[0], out m)) || !(int.TryParse(New_date_Box.Text.Split('/')[1], out d)) || !(int.TryParse(New_date_Box.Text.Split('/')[2], out y))
        || !(m <= 12 && m >= 1) || !(d <= 31 && d >= 1) || !(y <= 3000 && y >= 1800))
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('invalid date you should enter date in this form MM/DD/YYYY')", true);
        }
        else
            {
                string connStr1 = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
                SqlConnection conn2 = new SqlConnection(connStr1);
                conn2.Open();
                SqlCommand cmdTR = new SqlCommand("ReviewTaskReject", conn2);
                cmdTR.CommandType = CommandType.StoredProcedure;
                string userId = Session["Username"].ToString();
                cmdTR.Parameters.Add(new SqlParameter("@manager", userId));
                cmdTR.Parameters.Add(new SqlParameter("@project_name", Session["SelectedProject_view_tasks"]));
                cmdTR.Parameters.Add(new SqlParameter("@task_name", Session["SelectedProject_view_tasks_Reject"] ));
                cmdTR.Parameters.Add(new SqlParameter("@deadline", New_date_Box.Text));
                cmdTR.ExecuteNonQuery();
                Tasks_Refresh();
                conn2.Close();
            }

    }





    protected void Assign_reg_Project(object sender, EventArgs e)
    {
        if (Session["SelectedProjectAssign"].ToString() == "0")
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('you have to select a Project')", true);
        else if (Session["SelectedRegAssign"].ToString() == "0")
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('you have to select a regular employee to be assigned ')", true);
        else
        {
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            SqlCommand cmd = new SqlCommand("MAssignReg", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            string userId = Session["Username"].ToString();
            cmd.Parameters.Add(new SqlParameter("@manager", userId));
            cmd.Parameters.Add(new SqlParameter("@reg", Session["SelectedRegAssign"].ToString()));
            cmd.Parameters.Add(new SqlParameter("@project_name", Session["SelectedProjectAssign"].ToString()));

            SqlParameter count = cmd.Parameters.Add("@out", SqlDbType.Int);
            count.Direction = ParameterDirection.Output;
            if (Session["SelectedRegAssign"] == "0" || Session["SelectedProjectAssign"] == "0")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('you have to provide info')", true);
            }
            else
            {
                cmd.ExecuteNonQuery();
                if (count.Value.ToString().Equals("1"))
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('this regular employee has two projects Assigned to him')", true);

                }
               else if (count.Value.ToString().Equals("2"))
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('this regular employee is already assigned to this project')", true);

                }
                else
                {

                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Done !')", true);
                }
            }
        }


    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["SelectedProjectAssign"] = Projects_list.SelectedValue.ToString();

    }

    protected void replace_reg_main(object sender, EventArgs e)
    {
        Projects_replace.ClearSelection();
        Regular_works.ClearSelection();
        Regular_new.ClearSelection();
        Tasks_replace.ClearSelection();

        CP.Visible = false;
        PN.Visible = false;
        P_ED.Visible = false;
        end_date_p.Visible = false;
        P_SD.Visible = false;
        start_date_p.Visible = false;
        name_project.Visible = false;
        Projects_list.Visible = false;
        Regs_list.Visible = false;
        Assign.Visible = false;
        Projects_remove.Visible = false;
        DropDownList2.Visible = false;
        Remove.Visible = false;
        //Tasks_Define
        Comment_Tasks.Visible = false;
        Comment_Tasks_Text.Visible = false;
        deadline_Tasks.Visible = false;
        deadline_Tasks_Text.Visible = false;
        desc_Tasks.Visible = false;
        desc_Tasks_Text.Visible = false;
        name_Tasks.Visible = false;
        name_Tasks_Text.Visible = false;
        Projects_Tasks.Visible = false;
        Regs_Task.Visible = false;
        Assign_Tasks.Visible = false;
        Assign_Tasks_reg.Visible = false;
        //replace_regs
        replace.Visible = false;
        Projects_replace.Visible = true;
        Regular_works.Visible = false;
        Regular_new.Visible = false;
        Tasks_replace.Visible = false;

        View_Tasks_projects.Visible = false;
        TextBox1.Visible = false;
        View_Tasks_Button.Visible = false;
        Status.Visible = false;
        New_date.Visible = false;
        New_date_Box.Visible = false;
        Button4.Visible = false;
        GridStatus.Visible = false;
        GridStatusFixed.Visible = false;


    }

    protected void Projects_replace_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["SelectedProjectAssign_replace"] = Projects_replace.SelectedValue.ToString();
        replace.Visible = true;
        string constr = ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("GET_ALL_REGS_Manager_assigned_project"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                string userId = Session["Username"].ToString();
                cmd.Parameters.Add(new SqlParameter("@manager", userId));
                cmd.Parameters.Add(new SqlParameter("@project_name", Session["SelectedProjectAssign_replace"].ToString()));
                cmd.Connection = con;
                con.Open();
                Regular_works.DataSource = cmd.ExecuteReader();
                Regular_works.DataTextField = "regular_employee";
                Regular_works.DataValueField = "regular_employee";
                Regular_works.DataBind();
                con.Close();
            }
            Regular_works.Items.Insert(0, new ListItem("--Select a Regular Employee to be replaced--", "0"));
            //DropDownList2.Items[0].Selected = true; // recheck
            Session["SelectedRegAssignreplace_works"] = Regular_works.SelectedValue.ToString();
            Regular_works.Visible = true;

        }
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("GET_ALL_REGS_Manager_assigned_project"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                string userId = Session["Username"].ToString();
                cmd.Parameters.Add(new SqlParameter("@manager", userId));
                cmd.Parameters.Add(new SqlParameter("@project_name", Session["SelectedProjectAssign_replace"].ToString()));
                cmd.Connection = con;
                con.Open();
                Regular_new.DataSource = cmd.ExecuteReader();
                Regular_new.DataTextField = "regular_employee";
                Regular_new.DataValueField = "regular_employee";
                Regular_new.DataBind();
                con.Close();
            }
            Regular_new.Items.Insert(0, new ListItem("--Select a new Regular Employee --", "0"));
            //DropDownList2.Items[0].Selected = true; // recheck
            Session["SelectedRegAssignreplace_new"] = Regular_new.SelectedValue.ToString();
            Regular_new.Visible = true;

        }

        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("Get_ALL_Tasks"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                string userId = Session["Username"].ToString();
                cmd.Parameters.Add(new SqlParameter("@manager", userId));
                cmd.Parameters.Add(new SqlParameter("@project_name", Session["SelectedProjectAssign_replace"].ToString()));
                cmd.Connection = con;
                con.Open();
                Tasks_replace.DataSource = cmd.ExecuteReader();
                Tasks_replace.DataTextField = "name";
                Tasks_replace.DataValueField = "name";
                Tasks_replace.DataBind();
                con.Close();
            }
            Tasks_replace.Items.Insert(0, new ListItem("--Select a Task--", "0"));
            //DropDownList2.Items[0].Selected = true; // recheck
            Session["SelectedRegAssignreplace_Task"] = Tasks_replace.SelectedValue.ToString();
            Tasks_replace.Visible = true;

        }

    }

    protected void reg_works_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["SelectedRegAssignreplace_works"] = Regular_works.SelectedValue.ToString();

    }

    protected void reg_new_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["SelectedRegAssignreplace_new"] = Regular_new.SelectedValue.ToString();

    }

    protected void tasks_replace_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["SelectedRegAssignreplace_Task"] = Tasks_replace.SelectedValue.ToString();

    }

    protected void Replace(object sender, EventArgs e)
    {
        string constr = ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("ChangeRegInTask"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                string userId = Session["Username"].ToString();
                cmd.Parameters.Add(new SqlParameter("@manager", userId));
                cmd.Parameters.Add(new SqlParameter("@project_name", Session["SelectedProjectAssign_replace"].ToString()));
                cmd.Parameters.Add(new SqlParameter("@reg", Session["SelectedRegAssignreplace_works"].ToString()));
                cmd.Parameters.Add(new SqlParameter("@reg2", Session["SelectedRegAssignreplace_new"].ToString()));
                cmd.Parameters.Add(new SqlParameter("@task_name", Session["SelectedRegAssignreplace_Task"].ToString()));
                SqlParameter count = cmd.Parameters.Add("@out", SqlDbType.Int);
                count.Direction = ParameterDirection.Output;
                cmd.Connection = con;
                con.Open();
     
                if (Session["SelectedRegAssignreplace_Task"].Equals("0") || Session["SelectedRegAssignreplace_works"].Equals("0") || Session["SelectedRegAssignreplace_new"].Equals("0"))
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('you have to enter all the infos')", true);
                  
                }
                else if (Session["SelectedRegAssignreplace_new"].ToString() == (Session["SelectedRegAssignreplace_works"].ToString()))
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('you cant assign the same reglar')", true);
                }
                else
                {
                    cmd.ExecuteNonQuery();
                
                     if (count.Value.ToString().Equals("1"))
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('this regular employee is not assigned or the second reular employee is not working in this project')", true);
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('"+ Session["SelectedRegAssignreplace_works"]+" just got replaced by " + Session["SelectedRegAssignreplace_new"]+"')", true);
                    }
                }


                con.Close();
            }
        }

    }






    protected void View_Projects_Tasks(object sender, EventArgs e)
    {
        Projects_Tasks.ClearSelection();
        Regs_Task.ClearSelection();
        Session["SelectedProjectAssign"] = Projects_list.SelectedValue.ToString();
        CP.Visible = false;
        PN.Visible = false;
        P_ED.Visible = false;
        end_date_p.Visible = false;
        P_SD.Visible = false;
        start_date_p.Visible = false;
        name_project.Visible = false;
        Projects_list.Visible = false;
        Regs_list.Visible = false;
        Assign.Visible = false;
        Projects_remove.Visible = false;
        DropDownList2.Visible = false;
        Remove.Visible = false;
        Projects_Tasks.Visible = true;
        replace.Visible = false;
        Projects_replace.Visible = false;
        Regular_works.Visible = false;
        Regular_new.Visible = false;
        Tasks_replace.Visible = false;
        View_Tasks_projects.Visible = false;
        TextBox1.Visible = false;
        View_Tasks_Button.Visible = false;
        Status.Visible = false;
        New_date.Visible = false;
        New_date_Box.Visible = false;
        Button4.Visible = false;
        GridStatus.Visible = false;
        GridStatusFixed.Visible = false;



    }

    protected void Tasks_Define_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["SelectedProjectAssign_Tasks"] = Projects_Tasks.SelectedValue.ToString();
        // CP.Visible = false;
        // PN.Visible = false;
        //P_ED.Visible = false;
        //end_date_p.Visible = false;
        //P_SD.Visible = false;
        //start_date_p.Visible = false;
        //name_project.Visible = false;
        //Projects_list.Visible = true;
        //Regs_list.Visible = false;
        //Assign.Visible = false;
        //Projects_remove.Visible = false;
        //Remove.Visible = false;
        Comment_Tasks.Visible = true;
        Comment_Tasks_Text.Visible = true;
        deadline_Tasks.Visible = true;
        deadline_Tasks_Text.Visible = true;
        desc_Tasks.Visible = true;
        desc_Tasks_Text.Visible = true;
        name_Tasks.Visible = true;
        name_Tasks_Text.Visible = true;
        Projects_Tasks.Visible = true;
        Regs_Task.Visible = false;
        Assign_Tasks.Visible = false;
        Assign_Tasks.Visible = true;
        Regs_Task.Visible = true;
        Assign_Tasks_reg.Visible = true;
        GridStatus.Visible = false;
        GridStatusFixed.Visible = false;
        string constr = ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("select_regs_Project"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                string userId = Session["Username"].ToString();
                cmd.Parameters.Add(new SqlParameter("@manager", userId));
                cmd.Parameters.Add(new SqlParameter("@project_name", Session["SelectedProjectAssign_Tasks"].ToString()));
                cmd.Connection = con;
                con.Open();
                Regs_Task.DataSource = cmd.ExecuteReader();
                Regs_Task.DataTextField = "regular_employee";
                Regs_Task.DataValueField = "regular_employee";
                Regs_Task.DataBind();
                con.Close();
            }
            Regs_Task.Items.Insert(0, new ListItem("--Select a Regular Employee--", "0"));
            //DropDownList2.Items[0].Selected = true; // recheck
            Session["SelectedRegAssign_tasks"] = Regs_Task.SelectedValue.ToString();


        }




    }

    
    protected void assign_Tasks_Reg(object sender, EventArgs e)
    {
        string constr = ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd1 = new SqlCommand("defineaTask"))
            {
                int m = 0;
                int d = 0;
                int y = 0;
                string userId = Session["Username"].ToString();
                cmd1.CommandType = CommandType.StoredProcedure;
                con.Open();
                cmd1.Parameters.Add(new SqlParameter("@manager", userId));

                cmd1.Parameters.Add(new SqlParameter("@project_name", Session["SelectedProjectAssign_Tasks"].ToString()));
                cmd1.Parameters.Add(new SqlParameter("@task_name", name_Tasks_Text.Text.ToString()));
                cmd1.Parameters.Add(new SqlParameter("@deadline", deadline_Tasks_Text.Text.ToString()));
                cmd1.Parameters.Add(new SqlParameter("@description", desc_Tasks_Text.Text.ToString()));
                cmd1.Parameters.Add(new SqlParameter("@comment", Comment_Tasks_Text.Text.ToString()));
                cmd1.Connection = con;
                SqlParameter count = cmd1.Parameters.Add("@out", SqlDbType.Int);
                count.Direction = ParameterDirection.Output;
                Session["Selected_task"] = name_Tasks_Text.Text.ToString();


                  if (name_Tasks_Text.Text.ToString() == "" || deadline_Tasks_Text.Text == "" || desc_Tasks_Text.Text == "" || Comment_Tasks_Text.Text == "" || Session["SelectedRegAssign_tasks"].ToString().Equals("0"))
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('you have to enter infos including the regular to be assigned')", true);
                }
                else if (!(deadline_Tasks_Text.Text.Split('/').Length == 3) || !(int.TryParse(deadline_Tasks_Text.Text.Split('/')[0], out m)) || !(int.TryParse(deadline_Tasks_Text.Text.Split('/')[1], out d)) || !(int.TryParse(deadline_Tasks_Text.Text.Split('/')[2], out y))
       || !(m <= 12 && m >= 1) || !(d <= 31 && d >= 1) || !(y <= 3000 && y >= 1800))
                {
                 
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('invalid date you should enter date in this form MM/DD/YYYY')", true);
                }
                else { 

                cmd1.ExecuteNonQuery(); // UPDATE EL TABLE DEINITION
                    if (count.Value.ToString().Equals("1"))
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('already exists before')", true);
                    }

                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + name_Tasks_Text.Text + "just got created" + "')", true);
                    }
                }              
                con.Close();
            }
        }


        //       
        string constr2 = ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        using (SqlConnection con1 = new SqlConnection(constr2))
        {
            using (SqlCommand cmd2 = new SqlCommand("AssignRegTask"))
            {
                
               
                if (Session["SelectedRegAssign_tasks"].ToString().Equals("0") || name_Tasks_Text.Text.ToString() == "" || deadline_Tasks_Text.Text == "" || desc_Tasks_Text.Text == "" || Comment_Tasks_Text.Text == "")
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('you have to enter a regular to be assigned or some field is missing')", true);
                }

                else
                {
                    
                    string userId = Session["Username"].ToString();
                    cmd2.CommandType = CommandType.StoredProcedure;
                    con1.Open();
                    cmd2.Parameters.Add(new SqlParameter("@manager", userId));
                    cmd2.Parameters.Add(new SqlParameter("@project_name", Session["SelectedProjectAssign_Tasks"].ToString()));
                    cmd2.Parameters.Add(new SqlParameter("@task_name", Session["Selected_task"]));
                    cmd2.Parameters.Add(new SqlParameter("@reg", Session["SelectedRegAssign_tasks"].ToString()));
                    cmd2.Connection = con1;
                    SqlParameter count = cmd2.Parameters.Add("@out", SqlDbType.Int);
                    count.Direction = ParameterDirection.Output;
                    cmd2.ExecuteNonQuery();
                    if (count.Value.ToString().Equals("1"))
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('this regular employee is already assigned to this task')", true);

                    }
                   
                }

                con1.Close();
            }
        }

    }

    protected void Regs_Task_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["SelectedRegAssign_tasks"] = Regs_Task.SelectedValue.ToString();
    }

        protected void Remove_Projects_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["SelectedProjectAssign_remove"] = Projects_remove.SelectedValue.ToString();
        //CP.Visible = false;
        //PN.Visible = false;
        //P_ED.Visible = false;
        //end_date_p.Visible = false;
        //P_SD.Visible = false;
        //start_date_p.Visible = false;
        //name_project.Visible = false;
        //Projects_list.Visible = true;
        //Regs_list.Visible = false;
        //Assign.Visible = false;
        //Projects_remove.Visible = true;
        //Remove.Visible = true;
       
            string constr = ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("GET_ALL_REGS_Manager_assigned_project"))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    string userId = Session["Username"].ToString();
                    cmd.Parameters.Add(new SqlParameter("@manager", userId));
                    cmd.Parameters.Add(new SqlParameter("@project_name", Session["SelectedProjectAssign_remove"] .ToString()));
                    cmd.Connection = con;
                    con.Open();
                    DropDownList2.DataSource = cmd.ExecuteReader();
                    DropDownList2.DataTextField = "regular_employee";
                    DropDownList2.DataValueField = "regular_employee";
                    DropDownList2.DataBind();
                    con.Close();
                }
            DropDownList2.Items.Insert(0, new ListItem("--Select a Regular Employee--", "0"));
            //DropDownList2.Items[0].Selected = true; // recheck
                Session["SelectedRegAssignRemove"] = DropDownList2.SelectedValue.ToString();
            refresh_List_regs_remove();


        }
        DropDownList2.Visible = true;


    }

    protected void Refresh_remove_list()
    {
        string constr = ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("GET_ALL_REGS_Manager_assigned_project"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                string userId = Session["Username"].ToString();
                cmd.Parameters.Add(new SqlParameter("@manager", userId));
                cmd.Parameters.Add(new SqlParameter("@project_name", Session["SelectedProjectAssign_remove"].ToString()));
                cmd.Connection = con;
                con.Open();
                DropDownList2.DataSource = cmd.ExecuteReader();
                DropDownList2.DataTextField = "regular_employee";
                DropDownList2.DataValueField = "regular_employee";
                DropDownList2.DataBind();
                con.Close();
            }
            DropDownList2.Items.Insert(0, new ListItem("--Select a Regular Employee--", "0"));
            //DropDownList2.Items[0].Selected = true; // recheck
            Session["SelectedRegAssignRemove"] = DropDownList2.SelectedValue.ToString();


        }
    }

    protected void Remove_Projects_regs_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["SelectedRegAssignRemove"] = DropDownList2.SelectedValue.ToString();
        //CP.Visible = false;
        //PN.Visible = false;
        //P_ED.Visible = false;
        //end_date_p.Visible = false;
        //P_SD.Visible = false;
        //start_date_p.Visible = false;
        //name_project.Visible = false;
        //Projects_list.Visible = false;
        //Regs_list.Visible = false;
        //Assign.Visible = false;
        //Projects_remove.Visible = true;
        //Remove.Visible = true;
        //DropDownList2.Visible = true;
        DropDownList2.DataBind();


    }
    protected void remove_reg_Trans(object sender, EventArgs e)
    {
        Projects_remove.ClearSelection();
        DropDownList2.ClearSelection();

        CP.Visible = false;
        PN.Visible = false;
        P_ED.Visible = false;
        end_date_p.Visible = false;
        P_SD.Visible = false;
        start_date_p.Visible = false;
        name_project.Visible = false;
        Projects_list.Visible = false;
        Regs_list.Visible = false;
        Assign.Visible = false;
        Projects_remove.Visible = true;
        DropDownList2.Visible = false;
        Remove.Visible = true;
        //Tasks_define
        Comment_Tasks.Visible = false;
        Comment_Tasks_Text.Visible = false;
        deadline_Tasks.Visible = false;
        deadline_Tasks_Text.Visible = false;
        desc_Tasks.Visible = false;
        desc_Tasks_Text.Visible = false;
        name_Tasks.Visible = false;
        name_Tasks_Text.Visible = false;
        Projects_Tasks.Visible = false;
        Regs_Task.Visible = false;
        Assign_Tasks.Visible = false;
        Assign_Tasks_reg.Visible = false;

        replace.Visible = false;
        Projects_replace.Visible = false;
        Regular_works.Visible = false;
        Regular_new.Visible = false;
        Tasks_replace.Visible = false;

        View_Tasks_projects.Visible = false;
        TextBox1.Visible = false;
        View_Tasks_Button.Visible = false;
        Status.Visible = false;
        New_date.Visible = false;
        New_date_Box.Visible = false;
        Button4.Visible = false;
        GridStatus.Visible = false;
        GridStatusFixed.Visible = false;
    }

    protected void Remove_reg_Project(object sender, EventArgs e)
    {
        string constr = ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd1 = new SqlCommand("removeRegularProject"))
            {
                string userId = Session["Username"].ToString();
                cmd1.CommandType = CommandType.StoredProcedure;
                con.Open();
                cmd1.Parameters.Add(new SqlParameter("@manager", userId));
                cmd1.Parameters.Add(new SqlParameter("@reg", Session["SelectedRegAssignRemove"].ToString()));
                cmd1.Parameters.Add(new SqlParameter("@project_name", Session["SelectedProjectAssign_remove"].ToString()));
                cmd1.Connection = con;
                SqlParameter count = cmd1.Parameters.Add("@out", SqlDbType.Int);
                count.Direction = ParameterDirection.Output;

                DropDownList2.DataBind();
                
                if(Session["SelectedRegAssignRemove"]=="0" || Session["SelectedProjectAssign_remove"] == "0")
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('you have to select a projct an a reg')", true);
                }
                else {
                    cmd1.ExecuteNonQuery();
                    if (count.Value.ToString().Equals("1"))
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('this regular employee has Assigned Tasks to this project')", true);
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + Session["SelectedRegAssignRemove"] + "just got removed from " + Session["SelectedProjectAssign_remove"].ToString() + "')", true);
                    }
                    Refresh_remove_list();
                }
                    con.Close();
            }
        }

        }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["SelectedRegAssign"] = Regs_list.SelectedValue.ToString();
        //CP.Visible = false;
        //PN.Visible = false;
        //P_ED.Visible = false;
        //end_date_p.Visible = false;
        //P_SD.Visible = false;
        //start_date_p.Visible = false;
        //name_project.Visible = false;
        //Projects_list.Visible = false;
        //Regs_list.Visible = false;
        //Assign.Visible = false;
        //Projects_remove.Visible = true;
        //DropDownList2.Visible = true;
        //Remove.Visible = true;

    }
    protected void Assign_regular_Trans(object sender, EventArgs e)
    {
        Projects_list.ClearSelection();
        Regs_list.ClearSelection();
        CP.Visible = false;
        PN.Visible = false;
        P_ED.Visible = false;
        end_date_p.Visible = false;
        P_SD.Visible = false;
        start_date_p.Visible = false;
        name_project.Visible = false;
        Projects_list.Visible = true;
        Regs_list.Visible = true;
        Assign.Visible = true;
        Projects_remove.Visible = false;
        DropDownList2.Visible = false;
        Remove.Visible = false;
        //Tasks_define
        Comment_Tasks.Visible = false;
        Comment_Tasks_Text.Visible = false;
        deadline_Tasks.Visible = false;
        deadline_Tasks_Text.Visible = false;
        desc_Tasks.Visible = false;
        desc_Tasks_Text.Visible = false;
        name_Tasks.Visible = false;
        name_Tasks_Text.Visible = false;
        Projects_Tasks.Visible = false;
        Regs_Task.Visible = false;
        Assign_Tasks.Visible = false;
        Assign_Tasks_reg.Visible = false;

        replace.Visible = false;
        Projects_replace.Visible = false;
        Regular_works.Visible = false;
        Regular_new.Visible = false;
        Tasks_replace.Visible = false;

        //Tasks_Projects
        View_Tasks_projects.Visible = false;
        TextBox1.Visible = false;
        View_Tasks_Button.Visible = false;
        Status.Visible = false;
        New_date.Visible = false;
        New_date_Box.Visible = false;
        Button4.Visible = false;
        GridStatus.Visible = false;
        GridStatusFixed.Visible = false;
    }
    protected void Create_a_new_project(object sender, EventArgs e)
    {
        int m = 0;
        int d = 0;
        int y = 0;

        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);
        conn.Open();
        SqlCommand cmd = new SqlCommand("newproject", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        string userId = Session["Username"].ToString();
        cmd.Parameters.Add(new SqlParameter("@manager", userId));
        cmd.Parameters.Add(new SqlParameter("@name", PN.Text.ToString()));
        cmd.Parameters.Add(new SqlParameter("@start_date", P_SD.Text.ToString()));
        cmd.Parameters.Add(new SqlParameter("@end_date", P_ED.Text.ToString()));
        SqlParameter count = cmd.Parameters.Add("@out", SqlDbType.Int);
        count.Direction = ParameterDirection.Output;
      
        if (PN.Text == "" || P_SD.Text.ToString() == "" || P_ED.Text.ToString() == "")
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('You have to enter all the info ')", true);
        }

        else if (!(P_SD.Text.Split('/').Length == 3) || !(int.TryParse(P_SD.Text.Split('/')[0], out m)) || !(int.TryParse(P_SD.Text.Split('/')[1], out d)) || !(int.TryParse(P_SD.Text.Split('/')[2], out y))
        || !(m <= 12 && m >= 1) || !(d <= 31 && d >= 1) || !(y <= 3000 && y >= 1800))
        {
          
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('invalid date you should enter date in this form MM/DD/YYYY')", true);
        }
        else if (!(P_ED.Text.Split('/').Length == 3) || !(int.TryParse(P_ED.Text.Split('/')[0], out m)) || !(int.TryParse(P_ED.Text.Split('/')[1], out d)) || !(int.TryParse(P_ED.Text.Split('/')[2], out y))
        || !(m <= 12 && m >= 1) || !(d <= 31 && d >= 1) || !(y <= 3000 && y >= 1800))
        {
          
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('invalid date you should enter date in this form MM/DD/YYYY')", true);
        }
         else if (DateTime.Parse(P_SD.Text) > DateTime.Parse(P_ED.Text))

        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('end date should be after the start date')", true);
        }

        else
        {
            cmd.ExecuteNonQuery();
            if (count.Value.ToString().Equals("1"))
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('there is already a project with these info, please try to change it')", true);
            }

            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('your project have been created ')", true);
                using (SqlConnection con = new SqlConnection(connStr))
                {
                    using (SqlCommand cmd1 = new SqlCommand("GET_ALL_Projects_Manager"))
                    {
                        cmd1.CommandType = CommandType.StoredProcedure;

                        cmd1.Parameters.Add(new SqlParameter("@manager", userId));
                        cmd1.Connection = con;
                        con.Open();
                        Projects_list.DataSource = cmd1.ExecuteReader();
                        Projects_list.DataTextField = "name";
                        Projects_list.DataValueField = "name";
                        Projects_list.DataBind();
                        con.Close();
                        con.Open();
                        Projects_remove.DataSource = cmd1.ExecuteReader();
                        Projects_remove.DataTextField = "name";
                        Projects_remove.DataValueField = "name";
                        Projects_remove.DataBind();
                        con.Close();
                    }
                    using (SqlCommand cmd2 = new SqlCommand("GET_ALL_REGS_Manager"))
                    {
                        cmd2.CommandType = CommandType.StoredProcedure;

                        cmd2.Parameters.Add(new SqlParameter("@manager", userId));
                        cmd2.Connection = con;
                        con.Open();
                        Regs_list.DataSource = cmd2.ExecuteReader();
                        Regs_list.DataTextField = "username";
                        Regs_list.DataValueField = "username";
                        Regs_list.DataBind();
                        con.Close();
                    }
                }

                Projects_remove.Items.Insert(0, new ListItem("--Select a Project--", "0"));
                Projects_list.Items.Insert(0, new ListItem("--Select a Project--", "0"));
                Regs_list.Items.Insert(0, new ListItem("--Select a Regular Employee--", "0"));
                Projects_list.Items[0].Selected = true;
                Projects_remove.Items[0].Selected = true;
                Regs_list.Items[0].Selected = true;
                Session["SelectedProjectAssign"] = Projects_list.SelectedValue.ToString();
                Session["SelectedProjectAssign_remove"] = Projects_remove.SelectedValue.ToString();
                Session["SelectedRegAssign"] = Regs_list.SelectedValue.ToString();
            }
        }
        conn.Close();

    }
    protected void Create_project(object sender, EventArgs e)
    {
        CP.Visible = true;
        PN.Visible = true;
        P_ED.Visible = true;
        end_date_p.Visible = true;
        P_SD.Visible = true;
        start_date_p.Visible = true;
        name_project.Visible = true;
        Projects_list.Visible = false;
        Regs_list.Visible = false;
        Assign.Visible = false;
        Projects_remove.Visible = false;
        DropDownList2.Visible = false;
        Remove.Visible = false;
        //Tasks_define
        Comment_Tasks.Visible = false;
        Comment_Tasks_Text.Visible = false;
        deadline_Tasks.Visible = false;
        deadline_Tasks_Text.Visible = false;
        desc_Tasks.Visible = false;
        desc_Tasks_Text.Visible = false;
        name_Tasks.Visible = false;
        name_Tasks_Text.Visible = false;
        Projects_Tasks.Visible = false;
        Regs_Task.Visible = false;
        Assign_Tasks.Visible = false;
        Assign_Tasks_reg.Visible = false;

        replace.Visible = false;
        Projects_replace.Visible = false;
        Regular_works.Visible = false;
        Regular_new.Visible = false;
        Tasks_replace.Visible = false;

        //Tasks_Projects
        View_Tasks_projects.Visible = false;
        TextBox1.Visible = false;
        View_Tasks_Button.Visible = false;
        Status.Visible = false;
        New_date.Visible = false;
        New_date_Box.Visible = false;
        Button4.Visible = false;
        GridStatus.Visible = false;
        GridStatusFixed.Visible = false;
    }
    protected void refresh_List_regs_remove()
    {
        Projects_remove.ClearSelection();
        DropDownList2.ClearSelection();

        CP.Visible = false;
        PN.Visible = false;
        P_ED.Visible = false;
        end_date_p.Visible = false;
        P_SD.Visible = false;
        start_date_p.Visible = false;
        name_project.Visible = false;
        Projects_list.Visible = false;
        Regs_list.Visible = false;
        Assign.Visible = false;
        Projects_remove.Visible = true;
        DropDownList2.Visible = true;
        Remove.Visible = true;
        //Tasks_define
        Comment_Tasks.Visible = false;
        Comment_Tasks_Text.Visible = false;
        deadline_Tasks.Visible = false;
        deadline_Tasks_Text.Visible = false;
        desc_Tasks.Visible = false;
        desc_Tasks_Text.Visible = false;
        name_Tasks.Visible = false;
        name_Tasks_Text.Visible = false;
        Projects_Tasks.Visible = false;
        Regs_Task.Visible = false;
        Assign_Tasks.Visible = false;
        Assign_Tasks_reg.Visible = false;

        replace.Visible = false;
        Projects_replace.Visible = false;
        Regular_works.Visible = false;
        Regular_new.Visible = false;
        Tasks_replace.Visible = false;

        //Tasks_Projects
        View_Tasks_projects.Visible = false;
        TextBox1.Visible = false;
        View_Tasks_Button.Visible = false;
        Status.Visible = false;
        New_date.Visible = false;
        New_date_Box.Visible = false;
        Button4.Visible = false;
        GridStatus.Visible = false;
        GridStatusFixed.Visible = false;
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
         Response.Redirect("search", true);

    }

    protected void Control_panel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Infos_And_panel", true);
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("ManagerMain", true);
    }

   
}