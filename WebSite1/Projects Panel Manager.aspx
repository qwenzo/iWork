<%@ Page Language="C#" AutoEventWireup="true" EnableViewState="true"  CodeFile="Projects Panel Manager.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1 {
            height: 711px;
        }
    </style>
</head>
<body style="height: 638px">
    <form id="form1" runat="server">
        <asp:Image onclick="window.location='search.aspx'" ID="Image4" runat="server" src="download.jpg" />
         <div style="margin-left: 1014px; width: 409px;">
            <asp:Button ID="Login" runat="server" Text="Login" OnClick="Login_Click" />
            <asp:Button ID="Register" runat="server" Text="Register" OnClick="Register_Click" />
            <asp:Button ID="Logout" runat="server" Text="Logout" OnClick="Logout_Click" AutopostBack="true" />
            <asp:Button ID="Control_panel" runat="server" Text="Control panel" OnClick="Control_panel_Click" />
        </div>
        <div>
                    <asp:Button ID="CrtProject" runat="server" Text="Create a new project" Width="224px"  OnClick="Create_project" />
        <asp:Button ID="Button2" runat="server" Text="Assign Regular Employee to work on a project" OnClick="Assign_regular_Trans" Width="306px" />
                    <asp:Button ID="Remove_Reg" runat="server" Text="Remove Regular Employee from a project" OnClick="remove_reg_Trans" />
                    <div style="height: 31px; margin-left: 921px">
                    <asp:Button ID="Button1" runat="server" Text="Back to the main manager page" style="margin-left: 414px" OnClick="Button1_Click" />
                    </div>
                    <asp:Button ID="Task" runat="server" Text="Define a new Task" OnClick="View_Projects_Tasks"/>
                    <asp:Button ID="Button3" runat="server" Text="Replace Regular Employee on a task" OnClick="replace_reg_main" />
                    <asp:Button ID="View_Tasks_of_projects" runat="server" Text="View Tasks of a project" OnClick="View_Tasks_Projects_Trans"/>
                    <br />
                    <br />
                    <asp:DropDownList ID="View_Tasks_projects" runat="server" onselectedindexchanged="Tasks_projects_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:Label ID="Status" runat="server" Text="Status:"></asp:Label>:<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    <asp:Button ID="View_Tasks_Button" runat="server" Text="View" OnClick="View_Button_Tasks_project"  AutoPostBack ="true" />
                    <asp:Label ID="New_date" runat="server" Text="New deadline:"></asp:Label>
                    <asp:TextBox ID="New_date_Box" runat="server"  ></asp:TextBox>
                    <asp:Button ID="Button4" runat="server" Text="Reject" OnClick="final_reject" />

                    <br /><asp:GridView ID="GridStatusFixed" runat="server" autogeneratecolumns="false"  EnableEventValidation="false" EnableViewState="true">
                <Columns>
                 <asp:BoundField DataField="name"  HeaderText="name"/>
            <asp:BoundField DataField="deadline" HeaderText="deadline" />
            <asp:BoundField DataField="description" HeaderText="description"/>
                <asp:BoundField DataField="regular_employee" HeaderText="regular_employee"/>
                 <asp:TemplateField>
  <ItemTemplate>
    <asp:Button ID="ACC_JA" runat="server" 
      CommandName="Acc" OnCommand="Acc_Task"
CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
      Text="Accept" AutoPostBack="true"/>
  </ItemTemplate> 
</asp:TemplateField>
               <asp:TemplateField>
  <ItemTemplate>
    <asp:Button ID="REJ_JA" runat="server" 
      CommandName="Rej"  OnCommand="Rej_Task"
CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
      Text="Reject" />
  </ItemTemplate> 
</asp:TemplateField>
            </Columns>
            </asp:GridView>
            <asp:GridView ID="GridStatus" runat="server" >
            </asp:GridView>
                    <br />
        <asp:Label ID="name_project" runat="server" Text="project name"></asp:Label>
&nbsp;<asp:TextBox ID="PN" runat="server" Width="197px"></asp:TextBox>
        <br />
        <asp:Label ID="start_date_p" runat="server" Text="start date"></asp:Label>
        <asp:TextBox ID="P_SD" runat="server" Width="194px" style="margin-left: 27px"></asp:TextBox>
        <br />
        <asp:Label ID="end_date_p" runat="server" Text="end date"></asp:Label>
        <asp:TextBox ID="P_ED" runat="server" Width="194px" style="margin-left: 30px"></asp:TextBox>
        <asp:Button ID="CP" runat="server" Text="Create" OnClick="Create_a_new_project" />
        </div>
        <br />
        <asp:DropDownList ID="Projects_list" runat="server" onselectedindexchanged="DropDownList1_SelectedIndexChanged">
        </asp:DropDownList>
        <asp:DropDownList ID="Regs_list" runat="server" onselectedindexchanged="DropDownList2_SelectedIndexChanged">
        </asp:DropDownList>
        <asp:Button ID="Assign" runat="server" Text="Assign" OnClick="Assign_reg_Project" AutoPostBack ="true" />
        <br />
        <br />
        <asp:DropDownList ID="Projects_remove" runat="server" onselectedindexchanged="Remove_Projects_SelectedIndexChanged" AutoPostBack ="true">
        </asp:DropDownList>
        <asp:DropDownList ID="DropDownList2" runat="server"  onselectedindexchanged="Remove_Projects_regs_SelectedIndexChanged" AutoPostBack ="true">
        </asp:DropDownList>
        <asp:Button ID="Remove" runat="server" Text="Remove" OnClick="Remove_reg_Project" />
        <br />
        <br />
        <asp:DropDownList ID="Projects_Tasks" runat="server" AutoPostBack ="true" onselectedindexchanged="Tasks_Define_SelectedIndexChanged">
        </asp:DropDownList>
        <br />
        <br />
        <asp:Label ID="name_Tasks" runat="server" Text="name"></asp:Label>
        <asp:TextBox ID="name_Tasks_Text" runat="server" style="margin-left: 36px"></asp:TextBox>
        <br />
        <asp:Label ID="deadline_Tasks" runat="server" Text="deadline"></asp:Label>
        <asp:TextBox ID="deadline_Tasks_Text" runat="server" style="margin-left: 18px"></asp:TextBox>
        <br />
        <asp:Label ID="desc_Tasks" runat="server" Text="description"></asp:Label>
        <asp:TextBox ID="desc_Tasks_Text" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Comment_Tasks" runat="server" Text="Comment"></asp:Label>
        <asp:TextBox ID="Comment_Tasks_Text" runat="server" style="margin-left: 9px"></asp:TextBox>
        <br />
        <asp:Label ID="Assign_Tasks" runat="server" Text="Assign regular Employee to This Task"></asp:Label>
        <br />
        <asp:DropDownList ID="Regs_Task" runat="server" onselectedindexchanged="Regs_Task_SelectedIndexChanged" AutoPostBack ="true">
        </asp:DropDownList>
        <asp:Button ID="Assign_Tasks_reg" runat="server" Text="Assign & Define" OnClick="assign_Tasks_Reg"/>
        <br />
        <br />
        <asp:DropDownList ID="Projects_replace" runat="server" onselectedindexchanged="Projects_replace_SelectedIndexChanged" AutoPostBack ="true" >
        </asp:DropDownList>
        <asp:DropDownList ID="Regular_works" runat="server" onselectedindexchanged="reg_works_SelectedIndexChanged">
        </asp:DropDownList>
        <asp:DropDownList ID="Regular_new" runat="server" onselectedindexchanged="reg_new_SelectedIndexChanged">
        </asp:DropDownList>
        <asp:DropDownList ID="Tasks_replace" runat="server" onselectedindexchanged="tasks_replace_SelectedIndexChanged">
        </asp:DropDownList>
        <asp:Button ID="replace" runat="server" Text="Replace" OnClick ="Replace" />
        <br />
        <br />
        <br />
    </form>
</body>
</html>
