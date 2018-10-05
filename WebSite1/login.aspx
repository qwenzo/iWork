<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #Text1 {
            width: 134px;
            margin-left: 12px;
        }
        #Text2 {
            width: 137px;
            margin-left: 15px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Image onclick="window.location='search.aspx'" ID="Image4" runat="server" src="download.jpg" />
        <div style="height: 22px">
            
            <asp:Label ID="Label3" runat="server" Text="Username:"></asp:Label>
            
            <asp:TextBox ID="UN" runat="server" Width="125px"></asp:TextBox></div>
        <p>
            <asp:Label ID="Label2" runat="server" Text="Password:" ></asp:Label>
            <asp:TextBox ID="PASS" runat="server" TextMode="Password" Width="125px"></asp:TextBox>
    <p>
        <asp:Button ID="btn_login" runat="server" Text="Login" onclick="LOG"/></p>
    <p>
        &nbsp;</p>
    </form>
    </body>
</html>
