<%@ Page Language="C#" AutoEventWireup="true" CodeFile="regular.aspx.cs" Inherits="Default3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Image onclick="window.location='search.aspx'" ID="Image4" runat="server" src="download.jpg" />
        <div>



         <asp:Button ID="Button16" Text="view my projects" runat="server"
             Font-Bold="true" onclick="Buttonlviewlist" />
         <asp:Button ID="Button1" Text="view my tasks" runat="server"
             Font-Bold="true" onclick="Buttondonee" />
            <br />
            <asp:Label ID="Label2" runat="server" Text="enter project name: "></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <asp:Button ID="Button112" runat="server" Font-Bold="true" onclick="Buttonlviewtask" Text="done" />
            <br />
            <asp:GridView ID="GridView5" runat="server" autogeneratecolumns="False" EnableEventValidation="false" EnableViewState="False">
                <Columns>
                    <asp:BoundField DataField="start_date" HeaderText="start_date" SortExpression="start_date" />
                    <asp:BoundField DataField="manager" HeaderText="manager" SortExpression="manager" />
                    <asp:BoundField DataField="end_date" HeaderText="end_date" SortExpression="end_date" />
                </Columns>
            </asp:GridView>
         <asp:GridView ID="GridView1" runat="server" autogeneratecolumns="false"  EnableEventValidation="false" EnableViewState="false" EmptyDataText="No records Found">
                <Columns>
                <asp:BoundField DataField="score" HeaderText="score"/>
                 
            </Columns>
            </asp:GridView>
        <asp:GridView ID="GridView6" runat="server" autogeneratecolumns="False"  EnableEventValidation="false" EnableViewState="true">
             <Columns>
                 <asp:BoundField DataField="name" HeaderText="name"  />
                 
                 
                 <asp:BoundField DataField="project_name" HeaderText="project_name"  />
                 
                 <asp:BoundField DataField="deadline" HeaderText="deadline"  />
                 <asp:BoundField DataField="status" HeaderText="status"  />
                 <asp:BoundField DataField="description" HeaderText="description"  />
                 <asp:BoundField DataField="manager" HeaderText="manager"  />
                 
                 
                                     <asp:TemplateField>
  <ItemTemplate>
    <asp:Button ID="buttonx" runat="server" CommandName="bfixed2"
       OnCommand="bfixed2"
CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
      Text="fixed" />
      
  </ItemTemplate> 
</asp:TemplateField>
                 <asp:TemplateField>
  <ItemTemplate>
    <asp:Button ID="buttony" runat="server" CommandName="bassign2"
       OnCommand="bassign2"
CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
      Text="assigned" />
      
  </ItemTemplate> 
</asp:TemplateField>
             </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
