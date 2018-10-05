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
       
    }

    protected void LOG(object sender, EventArgs e)
    { 
        
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);
        SqlCommand cmd = new SqlCommand("Login", conn);
        cmd.Connection = conn;
        cmd.CommandType = CommandType.StoredProcedure;
        string username = UN.Text;
        string password = PASS.Text;
        cmd.Parameters.Add(new SqlParameter("@user_name", username));
        cmd.Parameters.Add(new SqlParameter("@password", password));
        //SqlParameter pass = cmd.Parameters.Add("@password", SqlDbType.VarChar, 50);
        //pass.Value = password;
        // output parm
        SqlParameter count = cmd.Parameters.Add("@o", SqlDbType.Int);
        count.Direction = ParameterDirection.Output;  
        conn.Open();
        cmd.ExecuteNonQuery();
        Session["log_in"] = count.Value.ToString();
        conn.Close();

         if (count.Value.ToString().Equals("4") || count.Value.ToString().Equals("3") || count.Value.ToString().Equals("2") || count.Value.ToString().Equals("1")  )
        {
            //this is how you store data to session variable.
            Session["Username"] = username;
            Response.Write("Passed");
             Response.Redirect("Infos_And_panel", true);
        }
        else
        {
            Response.Write("Failed");
        }
        
    }
}