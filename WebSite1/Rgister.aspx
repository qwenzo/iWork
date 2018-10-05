<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Rgister.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Image onclick="window.location='search.aspx'" ID="Image4" runat="server" src="download.jpg" />
         <div style="margin-left: 1014px; width: 409px;">
            <asp:Button ID="Login" runat="server" Text="Login" OnClick="Login_Click" />
            
        </div>
        <asp:Label ID="Label4" runat="server" Text="Welcome to iWork"></asp:Label>
        <br />
        <asp:Label ID="Label1" runat="server" Text="Username : "></asp:Label>

        <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>

        <br />
        <asp:Label ID="password" runat="server" Text="password : "></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="email" runat="server" Text="email :"></asp:Label>
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="birth_date" runat="server" Text="birth date : "></asp:Label>
        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="years_of_experience" runat="server" Text="years of experience : "></asp:Label>
        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="first_name" runat="server" Text="first name :"></asp:Label>
        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="middle_name" runat="server" Text="middle name : "></asp:Label>
        <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="last_name" runat="server" Text="last name : "></asp:Label>
        <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
       
        <br />
        <asp:Button ID="Register" runat="server" Text="Register" OnClick="Register2" />
        <div>
        </div>
    </form>
</body>
</html>
