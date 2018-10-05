<%@ Page Title="Home Page" Language="C#"  AutoEventWireup="true" CodeFile="HR.aspx.cs" Inherits="_Default" %>


<!DOCTYPE HTML>
<html>
    <head runat="server">
        <title runat="server" align="center">HR</title>
    </head>
    <body>
        <form id="form1" runat="server">
            <asp:Image onclick="window.location='search.aspx'" ID="Image4" runat="server" src="download.jpg" />
            <div>
                <asp:TextBox ID="RoleAJ" runat="server" >Role</asp:TextBox>
                <asp:TextBox ID="JobAJ" runat="server" >Job</asp:TextBox>
                <asp:TextBox ID="ShortDAJ" runat="server" >Short Description</asp:TextBox>
                <asp:TextBox ID="DetailedDAJ" runat="server" >Detailed Description</asp:TextBox>
                <asp:TextBox ID="MinEAJ" runat="server" >Minimum Years Of Experience</asp:TextBox>
                <asp:TextBox ID="SalaryAJ" runat="server" >Salary</asp:TextBox>
                <asp:TextBox ID="DeadlineAJ" runat="server" >Deadline</asp:TextBox>
                <asp:TextBox ID="VacanciesAJ" runat="server" >Number Of Vacancies</asp:TextBox>
                <asp:TextBox ID="WorkingHAJ" runat="server" >Working Hours</asp:TextBox>
                <asp:Button runat="server" ID="HR11" Text="Add Job" OnClick="AddNewJx" />
            </div>
            <div>
                <asp:TextBox ID="Job_titleAJQ" runat="server" >Job Title</asp:TextBox>
                 <asp:TextBox ID="questionAJQ" runat="server" >Question</asp:TextBox>
                 <asp:TextBox ID="answerAJQ" runat="server" >Answer</asp:TextBox>
                <asp:Button runat="server" ID="HR12" Text="Add Question" OnClick="AddNewQJ" />
            </div>
            <div>
             <asp:TextBox ID="Job_titleVJ" runat="server" >Job Title</asp:TextBox>
             <asp:Button runat="server" ID="HR21" Text="View Job" OnClick="viewJob" />
            </div>
            <asp:GridView ID="GridViewJobs" runat="server" autogeneratecolumns="false"  EnableEventValidation="false" EnableViewState="true">
                <Columns>
                 <asp:BoundField DataField="title"  HeaderText="title"/>
                 <asp:BoundField DataField="department" HeaderText="department" />
                 <asp:BoundField DataField="company" HeaderText="company"/>
                 <asp:BoundField DataField="short_description" HeaderText="short_description"/>
                 <asp:BoundField DataField="detailed_description" HeaderText="detailed_description"/>
                 <asp:BoundField DataField="min_experience" HeaderText="min_experience"/>
                 <asp:BoundField DataField="salary" HeaderText="salary"/>
                 <asp:BoundField DataField="deadline" HeaderText="deadline"/>
                 <asp:BoundField DataField="no_of_vacancies" HeaderText="no_of_vacancies"/>
                 <asp:BoundField DataField="working_hours" HeaderText="working_hours"/>

                 <asp:TemplateField>
  
</asp:TemplateField>
            </Columns>
            </asp:GridView>
            <div>
                <asp:TextBox ID="Job_titleE" runat="server" >Job Title</asp:TextBox>
                 <asp:TextBox ID="Short_descriptionE" runat="server" >Short Description</asp:TextBox>
                 <asp:TextBox ID="Detailed_descriptionE" runat="server" >Detailed Description</asp:TextBox>
                 <asp:TextBox ID="min_experianceE" runat="server" >Minimum Years Of Experience</asp:TextBox>
                <asp:Button runat="server" ID="HR22" Text="editJob" OnClick="editJob" />
            </div>
             <div>
             <asp:TextBox ID="Job_titleVA" runat="server" >Job Title</asp:TextBox>
             <asp:Button runat="server" ID="HR34" Text="View Application" OnClick="viewApplication" />
            </div>
            <asp:GridView ID="GridViewApplication" runat="server" autogeneratecolumns="false"  EnableEventValidation="false" EnableViewState="true">
                <Columns>
                 <asp:BoundField DataField="job"  HeaderText="job"/>
                 <asp:BoundField DataField="department" HeaderText="department" />
                 <asp:BoundField DataField="company" HeaderText="company"/>
                 <asp:BoundField DataField="job_seeker" HeaderText="job_seeker"/>
                 <asp:BoundField DataField="hr_response" HeaderText="hr_response"/>
                 <asp:BoundField DataField="manager_response" HeaderText="manager_response"/>
                 <asp:BoundField DataField="score" HeaderText="score"/>
                 <asp:BoundField DataField="deadline" HeaderText="deadline"/>
                 <asp:BoundField DataField="detailed_description" HeaderText="detailed_description"/>
                 <asp:BoundField DataField="min_experience" HeaderText="min_experience"/>
                 <asp:BoundField DataField="no_of_vacancies" HeaderText="no_of_vacancies"/>
                 <asp:BoundField DataField="salary" HeaderText="salary"/>
                 <asp:BoundField DataField="short_description" HeaderText="short_description"/>

                 <asp:TemplateField>

                     <ItemTemplate>
    <asp:Button ID="ACC_JA" runat="server" 
      CommandName="Acc" OnCommand="AccApp"
CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
      Text="Accept" />
  </ItemTemplate> 
</asp:TemplateField>
               <asp:TemplateField>
  <ItemTemplate>
    <asp:Button ID="REJ_JA" runat="server" 
      CommandName="Rej"  OnCommand="RejApp"
CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
      Text="Reject" />
  </ItemTemplate>
  
</asp:TemplateField>
            </Columns>
            </asp:GridView>

            <div>
                <asp:TextBox ID="TitlePA" runat="server" >Title</asp:TextBox>
                 <asp:TextBox ID="TypePA" runat="server" >Type</asp:TextBox>
                 <asp:TextBox ID="DescriptionPA" runat="server" >Description</asp:TextBox>
                <asp:Button runat="server" ID="HR5" Text="Post Announcement" OnClick="PostAnn" />
            </div>
            <div>
                <asp:Button runat="server" ID="HR67" Text="View Requests" OnClick="viewRequests" />
            </div>
            <asp:GridView ID="GridViewRequests0" runat="server" autogeneratecolumns="false"  EnableEventValidation="false" EnableViewState="true">
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
    <asp:Button ID="ACC_Req0" runat="server" 
      CommandName="AccReq0" OnCommand="AccReq0"
CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
      Text="Accept" />
  </ItemTemplate> 
</asp:TemplateField>
               <asp:TemplateField>
  <ItemTemplate>
    <asp:Button ID="REJ_Req0" runat="server" 
      CommandName="RejReq0"  OnCommand="RejReq0"
CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
      Text="Reject" />
  </ItemTemplate>
  
</asp:TemplateField>
            </Columns>
            </asp:GridView>

            <asp:GridView ID="GridViewRequests1" runat="server" autogeneratecolumns="false"  EnableEventValidation="false" EnableViewState="true">
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
    <asp:Button ID="ACC_Req1" runat="server" 
      CommandName="AccReq1" OnCommand="AccReq1"
CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
      Text="Accept" />
  </ItemTemplate> 
</asp:TemplateField>
               <asp:TemplateField>
  <ItemTemplate>
    <asp:Button ID="REJ_Req1" runat="server" 
      CommandName="RejReq1"  OnCommand="RejReq1"
CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
      Text="Reject" />
  </ItemTemplate>
  
</asp:TemplateField>
            </Columns>
            </asp:GridView>

            <div>
             <asp:TextBox ID="FromVA" runat="server" >From</asp:TextBox>
             <asp:TextBox ID="toVA" runat="server" >To</asp:TextBox>
             <asp:TextBox ID="EmpVA" runat="server" >Employee</asp:TextBox>
             <asp:Button runat="server" ID="HR8" Text="View Attendance" OnClick="viewAttendance" />
            </div>
            <asp:GridView ID="GridViewAttendance" runat="server" autogeneratecolumns="false"  EnableEventValidation="false" EnableViewState="true">
                <Columns>
                 <asp:BoundField DataField="date"  HeaderText="date"/>
                 <asp:BoundField DataField="start_time" HeaderText="start_time" />
                 <asp:BoundField DataField="end_time" HeaderText="end_time"/>
                 <asp:BoundField DataField="duration" HeaderText="duration"/>
                 <asp:BoundField DataField="missing_Hs" HeaderText="missing_Hs"/>

                 <asp:TemplateField>
  
</asp:TemplateField>
            </Columns>
            </asp:GridView>
            <div>
                <asp:TextBox ID="StaffVM" runat="server" >Employee</asp:TextBox>
                <asp:TextBox ID="YearVM" runat="server" >Year</asp:TextBox>
                <asp:Button runat="server" ID="HR9" Text="View Months" OnClick="viewMonth" />
            </div>
            <asp:GridView ID="GridViewMonths" runat="server" autogeneratecolumns="false"  EnableEventValidation="false" EnableViewState="true">
                <Columns>
                 <asp:BoundField DataField="total_hours"  HeaderText="total_hours"/>

                 <asp:TemplateField>
  
</asp:TemplateField>
            </Columns>
            </asp:GridView>

             <div>
                <asp:TextBox ID="MonthVT" runat="server" >Month</asp:TextBox>
                <asp:Button runat="server" ID="HR10" Text="View Top" OnClick="viewTop" />
            </div>
            <asp:GridView ID="GridViewTop" runat="server" autogeneratecolumns="false"  EnableEventValidation="false" EnableViewState="true">
                <Columns>
                 <asp:BoundField DataField="Staff"  HeaderText="Staff"/>
                 <asp:BoundField DataField="Month"  HeaderText="Month"/>
                 <asp:BoundField DataField="Total_Hours"  HeaderText="Total_Hours"/>
                 <asp:TemplateField>
  
</asp:TemplateField>
            </Columns>
            </asp:GridView>

        </form>
    </body>
</html>