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
        //edit
        Label1.Visible = false;
        passl.Visible = false;
        personalel.Visible = false;
        birthdatel.Visible = false;
        expel.Visible = false;
        firstNl.Visible = false;
        middleNl.Visible = false;
        lastNl.Visible = false;
        pass.Visible = false;
        personale.Visible = false;
        birthdate.Visible = false;
        expe.Visible = false;
        firstN.Visible = false;
        middleN.Visible = false;
        lastN.Visible = false;
        EditF.Visible = false;
        //view
        labelx.Visible = false;
        GridViewx.Visible = false;

        SM1.Visible = true;


        if (Session["log_in"].ToString().Equals("1"))
        {
            Button3.Text = "Job Seeker Panel";
        }
        else if (Session["log_in"].ToString().Equals("2"))
        {
            Button3.Text = "HR Panel";
        }
        else if (Session["log_in"].ToString().Equals("3"))
        {
            Button3.Text = "Regular Employee Panel";
        }
        else if (Session["log_in"].ToString().Equals("4"))
        {
            Button3.Text = "Manager Panel";
        }
    }

    protected void viewInfo(object sender, EventArgs args)
    {
        //edit
        Label1.Visible = false;
        passl.Visible = false;
        personalel.Visible = false;
        birthdatel.Visible = false;
        expel.Visible = false;
        firstNl.Visible = false;
        middleNl.Visible = false;
        lastNl.Visible = false;
        pass.Visible = false;
        personale.Visible = false;
        birthdate.Visible = false;
        expe.Visible = false;
        firstN.Visible = false;
        middleN.Visible = false;
        lastN.Visible = false;
        EditF.Visible = false;
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString);
        conn.Open();
        SqlCommand cmd = new SqlCommand("info", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@user_name", Session["Username"]));
        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        adapter.Fill(ds);
       
            labelx.Visible = true;
            GridViewx.DataSource = ds;
            GridViewx.DataBind();
            GridViewx.Visible = true;




        conn.Close();

    }

    protected void editInfo(object sender, EventArgs args)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString);
        SqlCommand cmd = new SqlCommand("Edit_Info", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        String passw = pass.Text;
        String pe = personale.Text;
        String birthd = birthdate.Text;
        String exp = expe.Text;
        String fn = firstN.Text;
        String mn = middleN.Text;
        String ln = lastN.Text;
        cmd.Parameters.Add(new SqlParameter("@username", Session["Username"]));
        cmd.Parameters.Add(new SqlParameter("@password", passw));
        cmd.Parameters.Add(new SqlParameter("@personal_email", pe));
        cmd.Parameters.Add(new SqlParameter("@birth_date", birthd));
        cmd.Parameters.Add(new SqlParameter("@years_of_experience", exp));
        cmd.Parameters.Add(new SqlParameter("@first_name", fn));
        cmd.Parameters.Add(new SqlParameter("@middle_name", mn));
        cmd.Parameters.Add(new SqlParameter("@last_name", ln));
        SqlParameter count = cmd.Parameters.Add("@out", SqlDbType.Int);
        count.Direction = ParameterDirection.Output;
        conn.Open();
        cmd.ExecuteNonQuery();
        if (count.Value.ToString().Equals("1"))
        {

        }
        conn.Close();


    }

 

    protected void Button3_Click(object sender, EventArgs e)
    {
        if (Session["log_in"].ToString() == "1")
        {
            Response.Redirect("jsreg", true);
        }
        else if (Session["log_in"].ToString() == "2")
        {
            Response.Redirect("HR", true);
        }
        else if (Session["log_in"].ToString() == "3")
        {
            Response.Redirect("regular", true);
        }
        else if (Session["log_in"].ToString() == "4")
        {
            Response.Redirect("ManagerMain", true);
        }
       
    }



    protected void Edit(object sender, EventArgs e)
    {
        //edit
        Label1.Visible = true;
        passl.Visible = true;
        personalel.Visible = true;
        birthdatel.Visible = true;
        expel.Visible = true;
        firstNl.Visible = true;
        middleNl.Visible = true;
        lastNl.Visible = true;
        pass.Visible = true;
         personale.Visible = true; 
        birthdate.Visible = true; 
        expe.Visible = true; 
        firstN.Visible = true;
        middleN.Visible = true;
        lastN.Visible = true;
        EditF.Visible = true;
        //view
        labelx.Visible = false;
        GridViewx.Visible = false;
    }

    protected void SM(object sender, EventArgs e)
    {
        Response.Redirect("SM", true);
    }
}