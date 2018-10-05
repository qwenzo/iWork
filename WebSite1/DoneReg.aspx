<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DoneReg.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <div style="height: 64px; width: 1024px; margin-left: 135px">
            <asp:Label ID="Label1" runat="server" Text="Welcome To IWORK"></asp:Label>
            <br />
            <br />
            <asp:Button ID="Login" runat="server" Text="Login" OnClick="Login_Click" />
            <asp:Button ID="Back_To_main" runat="server" Text="Back to the main page" OnClick="Back_To_main_Click" />
        </div>
    </form>
</body>
</html>
