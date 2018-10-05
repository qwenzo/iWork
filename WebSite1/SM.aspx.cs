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
        string username = Session["Username"].ToString();

    }

    //1
    protected void checkin(object sender, EventArgs args)
    {
        string username = Session["Username"].ToString();
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString);
        SqlCommand cmd = new SqlCommand("Checkin", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@username", username));
        Response.Write("checked in successfully");
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();


    }
    //2
    protected void checkout(object sender, EventArgs args)
    {
        string username = Session["Username"].ToString();
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString);
        SqlCommand cmd = new SqlCommand("Checkout", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@username", username));
        Response.Write("checked out successfully");

        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

    }
    //3
    protected void viewARB(object sender, EventArgs args)
    {
        if (t1.Visible == false)
        {
            t1.Visible = true;
            t2.Visible = true;
            startDate.Visible = true;
            endDate.Visible = true;
            button3.Visible = true;
        }
        else if (t1.Visible == true)
        {
            t1.Visible = false;
            t2.Visible = false;
            startDate.Visible = false;
            endDate.Visible = false;
            button3.Visible = false;
        }
    }
    protected void ARB(object sender, EventArgs args)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString);
        conn.Open();
        SqlCommand cmd = new SqlCommand("ViewallRecords", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        String startD = startDate.Text;
        String endD = endDate.Text;
        if (DateTime.TryParse(startD, out DateTime M) == false || DateTime.TryParse(endD, out DateTime N) == false)
        {
            ClientScript.RegisterStartupScript(GetType(), "hwa", "alert('the date should be in the formate MM/DD/YY');", true);
        }
        else
        {
            string username = Session["Username"].ToString();
            cmd.Parameters.Add(new SqlParameter("@username", username));
            cmd.Parameters.Add(new SqlParameter("@from", startD));
            cmd.Parameters.Add(new SqlParameter("@to", endD));

            GridView1.EmptyDataText = "No Records Found";

            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            adapter.Fill(ds);
            if (ds.Tables.Count == 0)
            {
                GridView1.Visible = false;
                Label1.Text = "there is no records for that username";
                Label1.Visible = true;

            }
            else
            {
                Label1.Visible = true;
                GridView1.DataSource = ds;
                GridView1.DataBind();
                GridView1.Visible = true;

            }
        }

        conn.Close();
    }
    //4
    protected void viewleaveR(object sender, EventArgs args)
    {
        if (a1.Visible == false)
        {
            a1.Visible = true;
            a2.Visible = true;
            a3.Visible = true;
            a4.Visible = true;
            a5.Visible = true;
            replacement.Visible = true;
            ddt.Visible = true;
            start_Date.Visible = true;
            end_Date.Visible = true;
        }
        else
        if (a1.Visible == true)
        {
            a1.Visible = false;
            a2.Visible = false;
            a3.Visible = false;
            a4.Visible = false;
            a5.Visible = false;
            replacement.Visible = false;
            ddt.Visible = false;
            start_Date.Visible = false;
            end_Date.Visible = false;
        }
    }
    protected void leaveR(object sender, EventArgs args)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString);
        SqlCommand cmd = new SqlCommand("apply_for_leave_request", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        String repl = replacement.Text;
        string Type = ddt.Value; ;
        string sd = start_Date.Text;
        string ed = end_Date.Text;
        if (DateTime.TryParse(sd, out DateTime M) == false || DateTime.TryParse(ed, out DateTime N) == false)
        {
            ClientScript.RegisterStartupScript(GetType(), "hwa", "alert('the date should be in the formate MM/DD/YY');", true);
        }
        else
        {
            string username = Session["Username"].ToString();
            cmd.Parameters.Add(new SqlParameter("@username", username));
            cmd.Parameters.Add(new SqlParameter("@replacement", repl));
            cmd.Parameters.Add(new SqlParameter("@type", Type));
            cmd.Parameters.Add(new SqlParameter("@start_date", sd));
            cmd.Parameters.Add(new SqlParameter("@end_date", ed));
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }
    }
    protected void viewtripR(object sender, EventArgs args)
    {
        if (b1.Visible == false)
        {
            b1.Visible = true;
            b2.Visible = true;
            b3.Visible = true;
            b4.Visible = true;
            b5.Visible = true;
            b6.Visible = true;
            replacement2.Visible = true;
            destination.Visible = true;
            purpose.Visible = true;
            s_Date.Visible = true;
            e_Date.Visible = true;
        }
        else
            if (b1.Visible == true)
        {
            b1.Visible = false;
            b2.Visible = false;
            b3.Visible = false;
            b4.Visible = false;
            b5.Visible = false;
            b6.Visible = false;
            replacement2.Visible = false;
            destination.Visible = false;
            purpose.Visible = false;
            s_Date.Visible = false;
            e_Date.Visible = false;
        }

    }
    protected void tripR(object sender, EventArgs args)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString);
        SqlCommand cmd = new SqlCommand("apply_requests_business_trip", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        string repl = replacement2.Text;
        string destination1 = destination.Text;
        string purpos = purpose.Text;
        string std = s_Date.Text;
        string end = e_Date.Text;
        if (DateTime.TryParse(std, out DateTime M) == false || DateTime.TryParse(end, out DateTime N) == false)
        {
            ClientScript.RegisterStartupScript(GetType(), "hwa", "alert('the date should be in the formate MM/DD/YY');", true);
        }
        else
        {
            string username = Session["Username"].ToString();
            cmd.Parameters.Add(new SqlParameter("@username", username));
            cmd.Parameters.Add(new SqlParameter("@replacement", repl));
            cmd.Parameters.Add(new SqlParameter("@destination", destination1));
            cmd.Parameters.Add(new SqlParameter("@purpose", purpos));
            cmd.Parameters.Add(new SqlParameter("@start_date", std));
            cmd.Parameters.Add(new SqlParameter("@end_date", end));
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }
    }
    //5

    protected void VS(object sender, EventArgs args)
    {
        string username = Session["Username"].ToString();
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString);
        conn.Open();
        SqlCommand cmd = new SqlCommand("ViewAllStatusRs", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@username", username));
        GridView2.EmptyDataText = "No Records Found";

        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        adapter.Fill(ds);

        if (ds.Tables.Count == 0)
        {
            GridView2.Visible = false;
            Label2.Text = "there is no records for that username";
            Label2.Visible = true;


        }
        else
        {
            GridView2.DataSource = ds;
            GridView2.DataBind();
            if (GridView2.Visible == true)
            {
                Label2.Visible = false;
                GridView2.Visible = false;
            }
            else if (GridView2.Visible == false)
            {
                GridView2.Visible = true;
                Label2.Visible = true;
            }

        }


        conn.Close();
    }
    //6
    protected void viewDeleteAR(object sender, EventArgs args)
    {
        if (fDate.Visible == false)
        {
            fDate.Visible = true;
            fromDate.Visible = true;
            deleteb.Visible = true;
        }
        else if (fDate.Visible == true)
        {
            fDate.Visible = false;
            fromDate.Visible = false;
            deleteb.Visible = false;
        }
    }
    protected void DeleteAR(object sender, EventArgs args)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString);
        SqlCommand cmd = new SqlCommand("DeleteReq", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        string fromD = fromDate.Text;
        if (DateTime.TryParse(fromD, out DateTime M) == false)
        {
            ClientScript.RegisterStartupScript(GetType(), "hwa", "alert('the date should be in the formate MM/DD/YY');", true);
        }
        else
        {
            string username = Session["Username"].ToString();
            cmd.Parameters.Add(new SqlParameter("@username", username));
            cmd.Parameters.Add(new SqlParameter("@from", fromD));
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }
    }

    protected void viewsendEmail(object sender, EventArgs args)
    {
        if (c1.Visible == false)
        {
            c1.Visible = true;
            c2.Visible = true;
            c3.Visible = true;
            c4.Visible = true;
            subject.Visible = true;
            body.Visible = true;
            recipient.Visible = true;
        }
        else if (c1.Visible == true)
        {
            c1.Visible = false;
            c2.Visible = false;
            c3.Visible = false;
            c4.Visible = false;
            subject.Visible = false;
            body.Visible = false;
            recipient.Visible = false;
        }
    }
    protected void sendEmail(object sender, EventArgs args)
    {
        string username = Session["Username"].ToString();
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString);
        SqlCommand cmd = new SqlCommand("SendEmail", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        string s = subject.Text;
        string b = body.InnerText;
        string r = recipient.Text;
        cmd.Parameters.Add(new SqlParameter("@username", username));
        cmd.Parameters.Add(new SqlParameter("@subject", s));
        cmd.Parameters.Add(new SqlParameter("@body", b));
        cmd.Parameters.Add(new SqlParameter("@recipient", r));
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

    }
    protected void checkEmail(object sender, EventArgs args)
    {
        string username = Session["Username"].ToString();
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString);
        conn.Open();
        SqlCommand cmd = new SqlCommand("ViewEmails", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@username", username));
        GridViewe.EmptyDataText = "No Records Found";

        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        adapter.Fill(ds);
        if (ds.Tables.Count == 0)
        {
            GridViewe.Visible = false;
            Label3.Text = "there is no records for that username";
            Label3.Visible = true;

        }
        else
        {
            Label3.Visible = true;
            GridViewe.DataSource = ds;
            GridViewe.DataBind();
            if (GridViewe.Visible == true)
            {
                Label3.Visible = false;
                GridViewe.Visible = false;
            }
            else if (GridViewe.Visible == false)
            {
                GridViewe.Visible = true;
                Label3.Visible = true;
            }

        }


        conn.Close();

    }
    protected void replybutton(object sender, CommandEventArgs e)
    {
        breply.Visible = true;
        bodyr.Visible = true;
        int index = Convert.ToInt32(e.CommandArgument);
        GridViewRow selectedRow = GridViewe.Rows[index];
        string email = selectedRow.Cells[0].Text.ToString();
        Session["emaile"] = email;

    }


    protected void replyEmail(object sender, EventArgs args)
    {
        string username = Session["Username"].ToString();
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString);
        SqlCommand cmd = new SqlCommand("replySE", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        string s = subject.Text;
        string body1 = bodyr.InnerText;
        int x = Convert.ToInt32(Session["emaile"]);
        cmd.Parameters.Add(new SqlParameter("@recp", username));
        cmd.Parameters.Add(new SqlParameter("@body", body1));
        cmd.Parameters.Add(new SqlParameter("@email", x));
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

    }

    protected void viewA(object sender, EventArgs args)
    {
        string username = Session["Username"].ToString();
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString);
        conn.Open();
        SqlCommand cmd = new SqlCommand("ViewAnnouncements", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@username", username));
        GridView4.EmptyDataText = "there are no announcements for now";
        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        adapter.Fill(ds);
        if (ds.Tables.Count == 0)
        {
            GridView4.Visible = false;
            Label4.Text = "there are no announcements for now";
            Label4.Visible = true;

        }
        else
        {
            Label4.Visible = true;
            GridView4.DataSource = ds;
            GridView4.DataBind();
            if (GridView4.Visible == true)
            {
                Label4.Visible = false;
                GridView4.Visible = false;
            }
            else if (GridView4.Visible == false)
            {
                GridView4.Visible = true;
                Label4.Visible = true;
            }
        }


        conn.Close();

    }




}