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

    }

    protected void Register2(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);
        conn.Open();
        SqlCommand cmd = new SqlCommand("Register", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@username", TextBox8.Text.ToString()));
        cmd.Parameters.Add(new SqlParameter("@password", TextBox1.Text.ToString()));
        cmd.Parameters.Add(new SqlParameter("@personal_email", TextBox2.Text.ToString()));
        cmd.Parameters.Add(new SqlParameter("@birth_date", TextBox3.Text.ToString()));
        cmd.Parameters.Add(new SqlParameter("@years_of_experience", TextBox4.Text.ToString()));
        cmd.Parameters.Add(new SqlParameter("@first_name", TextBox5.Text.ToString()));
        cmd.Parameters.Add(new SqlParameter("@middle_name", TextBox6.Text.ToString()));
        cmd.Parameters.Add(new SqlParameter("@last_name", TextBox7.Text.ToString()));
        int m = 0;
        int d = 0;
        int y = 0;
        int x = 0;
        SqlParameter count = cmd.Parameters.Add("@o", SqlDbType.Int);
        TextBox3.Text.Split('/').GetValue(1);
        count.Direction = ParameterDirection.Output;
          //(TextBox3.Text.Split('/').Length != 3)
        
        if (TextBox8.Text.ToString() == "" || TextBox1.Text.ToString() == "" || TextBox2.Text.ToString() == "" || TextBox3.Text.ToString() == "" || TextBox4.Text.ToString() == "" || TextBox5.Text.ToString() == "" || TextBox7.Text.ToString() == "")
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('you have to enter all the info')", true);
        }
        else if ( !(TextBox2.Text.ToString().Contains(".com"))  || !(TextBox2.Text.ToString().Contains("@")))
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('this email is invalid')", true);
        }
        
        else if (!(TextBox3.Text.Split('/').Length == 3) || !(int.TryParse(TextBox3.Text.Split('/')[0], out m)) || !(int.TryParse(TextBox3.Text.Split('/')[1], out d)) || !(int.TryParse(TextBox3.Text.Split('/')[2], out y))
        || !(m <= 12 && m >= 1) || !(d <= 31 && d >= 1) || !(y <= 3000 && y >= 1800))
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('invalid date you should enter date in this form MM/DD/YYYY')", true);
        }
         else if (!int.TryParse(TextBox3.Text , out x))
        {
           ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('years of experience should be a number')", true);
        }
        else 
        {
            cmd.ExecuteNonQuery();
            if (count.Value.ToString().Equals("1"))
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('this username or email is used before')", true);
            }
            else
            {
                Response.Redirect("DoneReg", true);
            }
        }
       

    }

    protected void Login_Click(object sender, EventArgs e)
    {
        Response.Redirect("login", true);
    }
}