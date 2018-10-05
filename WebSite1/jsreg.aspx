<%@ Page Language="C#" AutoEventWireup="true" CodeFile="jsreg.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
 <form id="form1" runat="server">
     <asp:Image onclick="window.location='search.aspx'" ID="Image4" runat="server" src="download.jpg" />
    <div>
    
        <asp:Label ID="lbl_company" runat="server" Text="company: "></asp:Label>
    
        <asp:TextBox ID="company" runat="server"></asp:TextBox>
   
    
        <br />

         <asp:Label ID="Lbl_department" runat="server" Text="department: "></asp:Label>
    
        <asp:TextBox ID="department" runat="server"></asp:TextBox>
        <br />

    
    </div>
     <asp:Label ID="lbl_Job_title" runat="server" Text="Job_title: "></asp:Label>
     <asp:TextBox ID="Job_title" runat="server"></asp:TextBox>
     <br />
     <asp:Button runat="server" Text="apply" OnClick="Sss" ></asp:Button>
     
     <asp:Label ID="Label1" runat="server" Text="tet"></asp:Label>
     <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="show questions" Width="135px" />



     <br />
     <br />



     <br />



         <asp:Button ID="Button16" Text="view my projects" runat="server"
             Font-Bold="true" onclick="Buttonlviewlist" />
         <asp:Button ID="Button5a" Text="view accepted jobs  " runat="server"
             Font-Bold="true" onclick="ButtonshoseJob" />
         <asp:Button ID="Button1" Text="view my tasks" runat="server"
             Font-Bold="true" onclick="Buttondonee" />
         <asp:Button ID="Button3" Text="delete job application  " runat="server"
             Font-Bold="true" onclick="dltjob" />
      <p>
     <asp:Label ID="Label22" runat="server" Text="company: "></asp:Label>
    
        <asp:TextBox ID="TextBox11" runat="server"></asp:TextBox>
           
     <br />
         <asp:Label ID="Label33" runat="server" Text="department: "></asp:Label>
    
        <asp:TextBox ID="TextBox22" runat="server"></asp:TextBox>
        <br />
      <asp:Label ID="Label44" runat="server" Text="Job_title: "></asp:Label>
     <asp:TextBox ID="TextBox33" runat="server" ></asp:TextBox>
     <p>
     <br /><asp:Button ID="Button111" runat="server" OnClick="Button111_Click" Text="View" />
     <asp:GridView ID="GridViewJobsApps2" runat="server"   EnableViewState="true">
                <Columns>
                    

                 <asp:TemplateField>
  <ItemTemplate>
    <asp:RadioButton ID="ACC_JA" runat="server" GroupName ="productDB"
      CommandName="Acc" OnCommand="Acc_App"
CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
      Text="YES" />
      
  </ItemTemplate> 
</asp:TemplateField>
               <asp:TemplateField>
  <ItemTemplate>
    <asp:RadioButton ID="REJ_JA" runat="server" GroupName ="productDB"
        
      CommandName="Rej"  OnCommand="Rej_App"
CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
      Text="NO" />
  </ItemTemplate> 
</asp:TemplateField>
            </Columns>
            </asp:GridView>
         <asp:Button ID="btnProcess" Text="submit" runat="server"
             Font-Bold="true" onclick="upd_score3" />
         <asp:Button ID="Button1a" Text="view score" runat="server"
             Font-Bold="true" onclick="btnViews" />
         <br />
         <asp:Button ID="Button1b" Text="view your status " runat="server"
             Font-Bold="true" onclick="btnstatus" /><br />
         <br />
         <br />
          <asp:Label ID="Label2" runat="server" Text="enter project name: "></asp:Label>
    
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
   
    
         <asp:Button ID="Button112" Text="done" runat="server"
             Font-Bold="true" onclick="Buttonlviewtask" />
   
    
        <p>
          <asp:Label ID="Label45" runat="server" Text="enter project name: "></asp:Label>
    
        <asp:TextBox ID="TextBox34" runat="server"></asp:TextBox>
   
    
         <p>
          <asp:Label ID="Label46" runat="server" Text="enter task name: "></asp:Label>
    
        <asp:TextBox ID="TextBox35" runat="server"></asp:TextBox>
   
    
         <asp:Button ID="Button115" Text="done" runat="server"
             Font-Bold="true" onclick="Buttonlviewtask" />
   
    
        <br />
         <br />
          <asp:Button ID="Button14" Text="done" runat="server"
             Font-Bold="true" onclick="Buttondone" />
         <br />
         <asp:GridView ID="GridView1" runat="server" autogeneratecolumns="false"  EnableEventValidation="false" EnableViewState="false" EmptyDataText="No records Found">
                <Columns>
                <asp:BoundField DataField="score" HeaderText="score"/>
                 
            </Columns>
            </asp:GridView>
      <asp:Label ID="Label47" runat="server" Text="your score equal 0 "></asp:Label>
     <p>
         <asp:GridView ID="GridView2" runat="server" autogeneratecolumns="false"  EnableEventValidation="false" EnableViewState="false">
                <Columns>
                
                    <asp:BoundField DataField="manager_response" HeaderText="manager_response"/>
                    <asp:BoundField DataField="score" HeaderText="score"/>


                 
            </Columns>
            </asp:GridView>
         <asp:Label ID="Label27" runat="server" Text="company: "></asp:Label>
    
        <asp:TextBox ID="TextBox23" runat="server"></asp:TextBox>
           
     <br />
          
          <asp:Label ID="Labe99" runat="server" Text="role: "></asp:Label>
    
        <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
           
    
           
     <br />
          
         <asp:Label ID="Labe25" runat="server" Text="department: "></asp:Label>
    
        <asp:TextBox ID="TextBox32" runat="server"></asp:TextBox>
         <asp:GridView ID="GridView3" runat="server" autogeneratecolumns="false"  EnableEventValidation="false" EnableViewState="false">
                <Columns>
                <asp:BoundField DataField="job" HeaderText="aceepted jobs"/>
                 <asp:TemplateField>
  <ItemTemplate>
    <asp:RadioButton ID="ACC_JAA" runat="server" GroupName ="productDB"
      CommandName="Acc2" OnCommand="Acc_App2"
CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
      Text="" />
      
  </ItemTemplate> 
</asp:TemplateField>
             
            </Columns>
            </asp:GridView>
         &nbsp;<asp:GridView ID="GridView4" runat="server" autogeneratecolumns="false"  EnableEventValidation="false" EnableViewState="false">
                <Columns>
                <asp:BoundField DataField="score" HeaderText="score"/>
                 
            </Columns>
            </asp:GridView>
         <asp:GridView ID="GridView5" runat="server" autogeneratecolumns="False"  EnableEventValidation="false" EnableViewState="False" >
             <Columns>
                 <asp:BoundField DataField="start_date" HeaderText="start_date" SortExpression="start_date" />
                 
                 
                 <asp:BoundField DataField="manager" HeaderText="manager" SortExpression="manager" />
                 <asp:BoundField DataField="end_date" HeaderText="end_date" SortExpression="end_date" />
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
        <asp:GridView ID="GridView8" runat="server" autogeneratecolumns="False"  EnableEventValidation="false" EnableViewState="False" DataSourceID="SqlDataSource2">
                <Columns>
                <asp:BoundField DataField="project_name" HeaderText="project_name" SortExpression="project_name"/>
                 
                    <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                    <asp:BoundField DataField="deadline" HeaderText="deadline" SortExpression="deadline" />
                    <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" />
                    <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
                    
                    <asp:BoundField DataField="manager" HeaderText="manager" SortExpression="manager" />
                    <asp:ButtonField ButtonType="Button" CommandName="Update" Text="Fixed" />
 
                 
            </Columns>
            </asp:GridView>
             <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Server=LENOVO-PC\SQLEXPRESS01; Database=WSLapv1; Trusted_Connection=Yes; " SelectCommand="ﬁnalizingTask" UpdateCommand="SELECT [project_name], [name], [deadline], [status], [description], [regular_employee], [manager] FROM [Tasks]" SelectCommandType="StoredProcedure">
                 <SelectParameters>
                     <asp:Parameter Name="regular" Type="String" />
                     <asp:Parameter Name="task_name" Type="String" />
                     <asp:Parameter Name="project_name" Type="String" />
                 </SelectParameters>
             </asp:SqlDataSource>
             

         <p>
             &nbsp;<p>
          <asp:Label ID="Labe43" runat="server" Text="choose your dayoff: "></asp:Label>
          <asp:DropDownList ID="DropDownLista7a" runat="server"    >
  <asp:ListItem>Saturday</asp:ListItem>
  <asp:ListItem>Sunday</asp:ListItem>
  <asp:ListItem>Monday</asp:ListItem>
  <asp:ListItem>Tuesday</asp:ListItem>
             <asp:ListItem>Wednesday</asp:ListItem>
             <asp:ListItem>Thursday</asp:ListItem>
</asp:DropDownList>
         <p>
             

         <asp:GridView ID="GridView9" runat="server" autogeneratecolumns="False"  EnableEventValidation="false" OnRowCommand="ButtonshoseJob11"   >
                <Columns>

                <asp:BoundField DataField="job" HeaderText="aceepted jobs"/>
                 <asp:BoundField DataField="department" HeaderText="department"/>
                    <asp:BoundField DataField="company" HeaderText="company"/>
             
                    <asp:ButtonField ButtonType="Button" CommandName="ai7aga" Text="choose" />
                    
                     

             
            </Columns>
            </asp:GridView>
             

         <p>
    
        <asp:TextBox ID="TextBox36" runat="server"></asp:TextBox>
         </p>
             

         </form>


</body>
</html>

