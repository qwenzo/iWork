<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManagerMain.aspx.cs" Inherits="ManagerMain" EnableViewState="true" %>

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
            <asp:Button ID="Register" runat="server" Text="Register" OnClick="Register_Click" />
            <asp:Button ID="Logout" runat="server" Text="Logout" OnClick="Logout_Click" AutopostBack="true" />
            <asp:Button ID="Control_panel" runat="server" Text="Control panel" OnClick="Control_panel_Click" />
        </div>
        <div>
        </div>
        <asp:Button ID="Button1" runat="server" Height="32px" style="margin-left: 18px" Text="View Requests" Width="155px" OnClick="VR" />
        <asp:Button ID="Button4" runat="server" style="margin-left: 45px; margin-top: 0px" Text="View Job Applications" OnClick="JA" Width="185px" />
        <asp:Label ID="Label4" runat="server" Text="Choose a Job "></asp:Label>
        <asp:DropDownList ID="DropDownList1" runat="server" Height="24px" style="margin-left: 7px" Width="226px"  onselectedindexchanged="DropDownList1_SelectedIndexChanged">
        </asp:DropDownList>
        <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="View Info" Width="69px" />
        <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text="Projects Panel" />
        
        <br />
        <p>

        <asp:Label ID="Label3" runat="server" Text="Reason of disapproval :"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" Height="16px" style="margin-left: 15px" Width="128px"></asp:TextBox>
            <asp:Button ID="Button3" runat="server" Text="Enter" onclick="enterReason"/>
        </p>
        <p>
            <asp:Label ID="job_info" runat="server" Text="job info"></asp:Label>
        </p>
        <p>
            <asp:GridView ID="GridViewJobsApps" runat="server">
              
            </asp:GridView>
        </p>
        <p>
            <asp:Label ID="job_seekers" runat="server" Text="Applications"></asp:Label>
        </p>
        <p>
            <asp:GridView ID="GridViewJobsApps2" runat="server" autogeneratecolumns="false"  EnableEventValidation="false" EnableViewState="true">
                <Columns>
                 <asp:BoundField DataField="job_seeker"  HeaderText="job_seeker"/>
            <asp:BoundField DataField="hr_response" HeaderText="hr_response" />
            <asp:BoundField DataField="manager_response" HeaderText="manager_response"/>
                <asp:BoundField DataField="score" HeaderText="score"/>
                 <asp:TemplateField>
  <ItemTemplate>
    <asp:Button ID="ACC_JA" runat="server" 
      CommandName="Acc" OnCommand="Acc_App"
CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
      Text="Accept" />
  </ItemTemplate> 
</asp:TemplateField>
               <asp:TemplateField>
  <ItemTemplate>
    <asp:Button ID="REJ_JA" runat="server" 
      CommandName="Rej"  OnCommand="Rej_App"
CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
      Text="Reject" />
  </ItemTemplate> 
</asp:TemplateField>
            </Columns>
            </asp:GridView>
        </p>
        <asp:Label ID="Label1" runat="server" Text="Leave Requests:"></asp:Label>
        <asp:GridView ID="GridView1" runat="server" autogeneratecolumns="false"  EnableEventValidation="false" EnableViewState="true">
             <Columns>
                 <asp:BoundField DataField="start_date"  HeaderText="start_date"/>
            <asp:BoundField DataField="applicant" HeaderText="applicant" />
            <asp:BoundField DataField="end_date" HeaderText="end_date"/>
                <asp:BoundField DataField="request_date" HeaderText="request_date"/>
                <asp:BoundField DataField="total_days" HeaderText="total_days"/>
                <asp:BoundField DataField="hr_response" HeaderText="hr_response"/>
                <asp:BoundField DataField="manager_response" HeaderText="manager_response"/>
                <asp:BoundField DataField="manager_reason" HeaderText="manager_reason"/>
                <asp:BoundField DataField="hr_employee" HeaderText="hr_employee"/>
                <asp:BoundField DataField="manager" HeaderText="manager"/>
                <asp:BoundField DataField="type" HeaderText="type"/>
                 <asp:TemplateField>
  <ItemTemplate>
    <asp:Button ID="ACC1" runat="server" 
      CommandName="Acc" OnCommand="Acc_Command"
CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
      Text="Accept" />
  </ItemTemplate> 
</asp:TemplateField>
               <asp:TemplateField>
  <ItemTemplate>
    <asp:Button ID="REJ1" runat="server" 
      CommandName="Rej" OnCommand="Rej_Command"
CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
      Text="Reject" />
  </ItemTemplate> 
</asp:TemplateField>
            </Columns>

        </asp:GridView>
        <asp:Label ID="Label2" runat="server" Text="BussinessTrip Requests:"></asp:Label>
        <asp:GridView ID="GridView2" runat="server" autogeneratecolumns="false"
       Width="360px"  EnableEventValidation="false" EnableViewState="true" >
            <Columns>
                 <asp:BoundField DataField="start_date"  HeaderText="start_date"/>
            <asp:BoundField DataField="applicant" HeaderText="applicant" />
            <asp:BoundField DataField="end_date" HeaderText="end_date"/>
                <asp:BoundField DataField="request_date" HeaderText="request_date"/>
                <asp:BoundField DataField="total_days" HeaderText="total_days"/>
                <asp:BoundField DataField="hr_response" HeaderText="hr_response"/>
                <asp:BoundField DataField="manager_response" HeaderText="manager_response"/>
                <asp:BoundField DataField="manager_reason" HeaderText="manager_reason"/>
                <asp:BoundField DataField="hr_employee" HeaderText="hr_employee"/>
                <asp:BoundField DataField="manager" HeaderText="manager"/>
                <asp:BoundField DataField="destination" HeaderText="destination"/>
                <asp:BoundField DataField="purpose" HeaderText="purpose"/>

                           <asp:TemplateField>
  <ItemTemplate>
    <asp:Button ID="ACC2" runat="server" 
      CommandName="Acc" OnCommand="Acc_Command"
CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
      Text="Accept" />
  </ItemTemplate> 

</asp:TemplateField>
                <asp:TemplateField>
  <ItemTemplate>
    <asp:Button ID="REJ2" runat="server" 
      CommandName="Rej" 
CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
      Text="Reject"  OnCommand="Rej_Command" />
  </ItemTemplate> 
</asp:TemplateField>
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
