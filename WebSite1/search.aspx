<%@ Page Language="C#" AutoEventWireup="true" CodeFile="search.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #Button5 {
            height: 57px;
            margin-right: 53px;
        }
        #Button3 {
            width: 186px;
        }
        #Button2 {
            width: 156px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Image onclick="window.location='search.aspx'" ID="Image4" runat="server" src="download.jpg" />
        <div style="margin-left: 1014px; width: 409px;">
            <asp:Button ID="Login" runat="server" Text="Login" OnClick="Login_Click" />
            <asp:Button ID="Register" runat="server" Text="Register" OnClick="Register_Click" />
            <asp:Button ID="Logout" runat="server" Text="Logout" OnClick="Logout_Click" AutopostBack="true" />
            <asp:Button ID="Control_panel" runat="server" Text="Control panel" OnClick="Control_panel_Click" />
        </div>
    <p>
        search by name , address or type (national / international)</p>
        <p>
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <input id="Button1" type="button" value="Search by name" runat="server" onServerClick="n" /><input id="Button2" type="button" value="Search by type" runat="server" onServerClick="t" /><input id="Button3" type="button" value="Search by address" runat="server" onServerClick="a" /><asp:Button ID="Button6" runat="server" Text="Search by KeyWord" OnClick="Button6_Click1" />
        </p>
    <p>
        &nbsp;&nbsp;&nbsp;
        <input id="Button5" type="button" value="View all Companies" runat="server" onServerClick="viewall" /><asp:Button ID="View_salaries" runat="server" OnClick="Button6_Click" Text="View Companies by avg. salaries" />
        <asp:Button ID="Search_for_specific_departement" runat="server" Text="Search for a specific departement" OnClick="Search_for_specific_departement_Click" />
        <asp:Label ID="Label1" runat="server" Text="Company :"></asp:Label>
        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        <asp:Label ID="Label2" runat="server" Text="Departement :"></asp:Label>
        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
        </p>
        <asp:GridView ID="GridView1" runat="server" Width="309px"  EnableEventValidation = "false" OnSelectedIndexChanged="GridView1_SelectedIndexChanged"  emptydatatext="No data in the data source.">
             <Columns>
             
             
               <asp:TemplateField>
  <ItemTemplate>
    <asp:Button ID="View_Info" runat="server" 
        OnCommand="View_info"
CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
      Text="View Info" />
  </ItemTemplate> 
</asp:TemplateField>
            </Columns>
		</asp:GridView>
        <input id="Hidden1" type="hidden" />
    <p>
        <asp:GridView ID="GridView2" runat="server"  emptydatatext="No data in the data source.">
        </asp:GridView>
        </p>
    </form>
    <p>
        &nbsp;</p>
    </body>
</html>
