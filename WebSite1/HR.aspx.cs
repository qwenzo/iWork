using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class _Default : Page
{
    protected void AddNewJx(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("AddNewJobHR", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        string RAJ = RoleAJ.Text;
        string JAJ = JobAJ.Text;
        string SDAJ = ShortDAJ.Text;
        String DDAJ = DetailedDAJ.Text;
        int MEAJ = Convert.ToInt32(MinEAJ.Text);
        int SAJ = Convert.ToInt32(SalaryAJ.Text);
        String DAJ = DeadlineAJ.Text;
        int VAJ = Convert.ToInt32(VacanciesAJ.Text);
        int WHAJ = Convert.ToInt32(WorkingHAJ.Text);

        cmd.Parameters.Add(new SqlParameter("@HR", Session["Username"].ToString()));
        cmd.Parameters.Add(new SqlParameter("@Role", RAJ));
        cmd.Parameters.Add(new SqlParameter("@Job", JAJ));
        cmd.Parameters.Add(new SqlParameter("@short_description", SDAJ));
        cmd.Parameters.Add(new SqlParameter("@detailed_description", DDAJ));
        cmd.Parameters.Add(new SqlParameter("@min_experience", MEAJ));
        cmd.Parameters.Add(new SqlParameter("@salary", SAJ));
        cmd.Parameters.Add(new SqlParameter("@deadline", DAJ));
        cmd.Parameters.Add(new SqlParameter("@no_of_vacancies", VAJ));
        cmd.Parameters.Add(new SqlParameter("@working_hours", WHAJ));

        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
    }

    protected void AddNewQJ(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("AddNewQJ", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        string JobT = Job_titleAJQ.Text;
        string q =questionAJQ.Text;
        //String a = answer.Text;
        int x = Convert.ToInt32(answerAJQ.Text);
        cmd.Parameters.Add(new SqlParameter("@HR", Session["Username"].ToString()));
        cmd.Parameters.Add(new SqlParameter("@Job_title", JobT));
        cmd.Parameters.Add(new SqlParameter("@question", q));
        cmd.Parameters.Add(new SqlParameter("@answer", x));
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
    }

    protected void viewJob(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("viewJob", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        string JobT = Job_titleVJ.Text;
        cmd.Parameters.Add(new SqlParameter("@user_name", Session["Username"].ToString()));
        cmd.Parameters.Add(new SqlParameter("@title", JobT));
        conn.Open();
        cmd.ExecuteNonQuery();
        GridViewJobs.EmptyDataText = "No Records Found";
        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        adapter.Fill(ds);
        if (ds.Tables.Count == 0)
        {
            GridViewJobs.Visible = false;
            Response.Write("no records");
        }
        else
        {
            GridViewJobs.DataSource = ds;
            GridViewJobs.DataBind();
            GridViewJobs.Visible = true;
        }
        conn.Close();
    }

    protected void editJob(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);
        conn.Open();
        SqlCommand cmd = new SqlCommand("editJob", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        string JobT = Job_titleE.Text;
        string shortD = Short_descriptionE.Text;
        string detailedD = Detailed_descriptionE.Text;
        int minE = Convert.ToInt32(min_experianceE.Text);
        cmd.Parameters.Add(new SqlParameter("@user_name", Session["Username"].ToString()));
        cmd.Parameters.Add(new SqlParameter("@title", JobT));
        cmd.Parameters.Add(new SqlParameter("@short_description", shortD));
        cmd.Parameters.Add(new SqlParameter("@detailed_description", detailedD));
        cmd.Parameters.Add(new SqlParameter("@min_experiance", minE));
        cmd.ExecuteNonQuery();
        conn.Close();
    }

    protected void viewApplication(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("viewApplication", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        string JobT = Job_titleVA.Text;
        cmd.Parameters.Add(new SqlParameter("@user_name", Session["Username"].ToString()));
        cmd.Parameters.Add(new SqlParameter("@Job_title", JobT));
        conn.Open();
        cmd.ExecuteNonQuery();
        GridViewApplication.EmptyDataText = "No Records Found";
        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        adapter.Fill(ds);
        if (ds.Tables.Count == 0)
        {
            GridViewApplication.Visible = false;
            Response.Write("no records");
        }
        else
        {
            GridViewApplication.DataSource = ds;
            GridViewApplication.DataBind();
            GridViewApplication.Visible = true;
        }
        conn.Close();
    }

    protected void AccApp(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);
        conn.Open();
        SqlCommand cmd = new SqlCommand("AcceptOrRejectApp", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        string JobT = Job_titleVA.Text;
        string JobSeeker = string.Empty;
        foreach (GridViewRow row in GridViewApplication.Rows)
        {
            JobSeeker = row.Cells[3].Text;
        }
        cmd.Parameters.Add(new SqlParameter("@user_name", Session["Username"].ToString()));
        cmd.Parameters.Add(new SqlParameter("@job_seeker", JobSeeker));
        cmd.Parameters.Add(new SqlParameter("@job", JobT));
        cmd.Parameters.Add(new SqlParameter("@hr_response", "Accept"));
        cmd.ExecuteNonQuery();
        conn.Close();
    }

    protected void RejApp(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);
        conn.Open();
        SqlCommand cmd = new SqlCommand("AcceptOrRejectApp", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        string JobT = Job_titleVA.Text;
        string JobSeeker = string.Empty;
        foreach (GridViewRow row in GridViewApplication.Rows)
        {
            JobSeeker = row.Cells[3].Text;
        }
        cmd.Parameters.Add(new SqlParameter("@user_name", Session["Username"].ToString()));
        cmd.Parameters.Add(new SqlParameter("@job_seeker", JobSeeker));
        cmd.Parameters.Add(new SqlParameter("@job", JobT));
        cmd.Parameters.Add(new SqlParameter("@hr_response", "Reject"));
        cmd.ExecuteNonQuery();
        conn.Close();
    }

    protected void PostAnn(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("PostAnn", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        string TiPA = TitlePA.Text;
        string TyPA = TypePA.Text;
        string DPA = DescriptionPA.Text;

        cmd.Parameters.Add(new SqlParameter("@user_name", Session["Username"].ToString()));
        cmd.Parameters.Add(new SqlParameter("@title", TiPA));
        cmd.Parameters.Add(new SqlParameter("@type", TyPA));
        cmd.Parameters.Add(new SqlParameter("@description", DPA));
        
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
    }

    protected void viewRequests(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("viewRequests", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@user_name", Session["Username"].ToString()));
        conn.Open();
        cmd.ExecuteNonQuery();
        GridViewRequests0.EmptyDataText = "No Records Found";
        GridViewRequests1.EmptyDataText = "No Records Found";
        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        adapter.Fill(ds);
        if (ds.Tables.Count == 0)
        {
            GridViewRequests0.Visible = false;
            GridViewRequests1.Visible = false;
            Response.Write("no records");
        }
        if (ds.Tables.Count == 2)
        {
            GridViewRequests0.DataSource = ds.Tables[0];
            GridViewRequests0.DataBind();
            GridViewRequests0.Visible = true;

            GridViewRequests1.DataSource = ds.Tables[1];
            GridViewRequests1.DataBind();
            GridViewRequests1.Visible = true;
        }
        if (ds.Tables.Count == 1)
        {
            if(GridViewRequests0.Rows[0].Cells[0] == null)
            {
                GridViewRequests1.DataSource = ds.Tables[1];
                GridViewRequests1.DataBind();
                GridViewRequests1.Visible = true;
            }
            if (GridViewRequests1.Rows[0].Cells[0] == null)
            {
                GridViewRequests0.DataSource = ds.Tables[1];
                GridViewRequests0.DataBind();
                GridViewRequests0.Visible = true;
            }

        }

        conn.Close();
    }

    protected void AccReq0(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);
        conn.Open();
        SqlCommand cmd = new SqlCommand("AcceptOrRejectreq", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        string start_date = string.Empty;
        string applicant = string.Empty;
        foreach (GridViewRow row in GridViewRequests0.Rows)
        {
            start_date = row.Cells[0].Text;
            applicant = row.Cells[1].Text;
        }
            cmd.Parameters.Add(new SqlParameter("@user_name", Session["Username"].ToString()));
        cmd.Parameters.Add(new SqlParameter("@start_date", start_date));
        cmd.Parameters.Add(new SqlParameter("@applicant", applicant));
        cmd.Parameters.Add(new SqlParameter("@hr_response", "accepted"));
        cmd.ExecuteNonQuery();
        conn.Close();
    }

    protected void RejReq0(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);
        conn.Open();
        SqlCommand cmd = new SqlCommand("AcceptOrRejectreq", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        string start_date = string.Empty;
        string applicant = string.Empty;
        foreach (GridViewRow row in GridViewRequests0.Rows)
        {
            start_date = row.Cells[0].Text;
            applicant = row.Cells[1].Text;
        }
        cmd.Parameters.Add(new SqlParameter("@user_name", Session["Username"].ToString()));
        cmd.Parameters.Add(new SqlParameter("@start_date", start_date));
        cmd.Parameters.Add(new SqlParameter("@applicant", applicant));
        cmd.Parameters.Add(new SqlParameter("@hr_response", "rejected"));
        cmd.ExecuteNonQuery();
        conn.Close();
    }

    protected void AccReq1(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);
        conn.Open();
        SqlCommand cmd = new SqlCommand("AcceptOrRejectreq", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        string start_date = string.Empty;
        string applicant = string.Empty;
        foreach (GridViewRow row in GridViewRequests1.Rows)
        {
            start_date = row.Cells[0].Text;
            applicant = row.Cells[1].Text;
        }
        cmd.Parameters.Add(new SqlParameter("@user_name", Session["Username"].ToString()));
        cmd.Parameters.Add(new SqlParameter("@start_date", start_date));
        cmd.Parameters.Add(new SqlParameter("@applicant", applicant));
        cmd.Parameters.Add(new SqlParameter("@hr_response", "accepted"));
        cmd.ExecuteNonQuery();
        conn.Close();
    }

    protected void RejReq1(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);
        conn.Open();
        SqlCommand cmd = new SqlCommand("AcceptOrRejectreq", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        string start_date = string.Empty;
        string applicant = string.Empty;
        foreach (GridViewRow row in GridViewRequests1.Rows)
        {
            start_date = row.Cells[0].Text;
            applicant = row.Cells[1].Text;
        }
        cmd.Parameters.Add(new SqlParameter("@user_name", Session["Username"].ToString()));
        cmd.Parameters.Add(new SqlParameter("@start_date", start_date));
        cmd.Parameters.Add(new SqlParameter("@applicant", applicant));
        cmd.Parameters.Add(new SqlParameter("@hr_response", "rejected"));
        cmd.ExecuteNonQuery();
        conn.Close();
    }

    protected void viewAttendance(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("ViewallRecordsHR", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        DateTime FVA = Convert.ToDateTime(FromVA.Text);
        DateTime TVA = Convert.ToDateTime(toVA.Text);
        string EVA = EmpVA.Text;

        cmd.Parameters.Add(new SqlParameter("@user_name", Session["Username"].ToString()));
        cmd.Parameters.Add(new SqlParameter("@from", FVA));
        cmd.Parameters.Add(new SqlParameter("@to", TVA));
        cmd.Parameters.Add(new SqlParameter("@e", EVA));
        conn.Open();
        cmd.ExecuteNonQuery();
        GridViewAttendance.EmptyDataText = "No Records Found";
        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        adapter.Fill(ds);
        if (ds.Tables.Count == 0)
        {
            GridViewAttendance.Visible = false;
            Response.Write("no records");
        }
        else
        {
            GridViewAttendance.DataSource = ds;
            GridViewAttendance.DataBind();
            GridViewAttendance.Visible = true;
        }
        conn.Close();
    }

    protected void viewMonth(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("VieweachMonthHR", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        string SVM = StaffVM.Text;
        string YVM = YearVM.Text;

        cmd.Parameters.Add(new SqlParameter("@Staff", SVM));
        cmd.Parameters.Add(new SqlParameter("@HR", Session["Username"].ToString()));
        cmd.Parameters.Add(new SqlParameter("@year", YVM));
        conn.Open();
        cmd.ExecuteNonQuery();
        GridViewMonths.EmptyDataText = "No Records Found";
        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        adapter.Fill(ds);
        if (ds.Tables.Count == 0)
        {
            GridViewMonths.Visible = false;
            Response.Write("no records");
        }
        else
        {
            GridViewMonths.DataSource = ds;
            GridViewMonths.DataBind();
            GridViewMonths.Visible = true;
        }
        conn.Close();
    }

    protected void viewTop(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("ViewTop", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        string MVT = MonthVT.Text;

        cmd.Parameters.Add(new SqlParameter("@HR", Session["Username"].ToString()));
        cmd.Parameters.Add(new SqlParameter("@month", MVT));
        conn.Open();
        cmd.ExecuteNonQuery();
        GridViewTop.EmptyDataText = "No Records Found";
        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        adapter.Fill(ds);
        if (ds.Tables.Count == 0)
        {
            GridViewTop.Visible = false;
            Response.Write("no records");
        }
        else
        {
            GridViewTop.DataSource = ds;
            GridViewTop.DataBind();
            GridViewTop.Visible = true;
        }
        conn.Close();
    }
}
