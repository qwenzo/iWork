<%@ Page Language="C#" Inherits="Default2.staffx"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>Default</title>
   
  <link href='https://fonts.googleapis.com/css?family=Roboto:300,400,700' rel='stylesheet' type='text/css'>
  <link rel="stylesheet" type="text/css" href="main.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>

		
		<style>

body{
   background-image: url("");
   }
li{
			margin-top:20px;
			marging-bottom:20px;
			margin-left:20px;
			}
h5{
			color:black;
			}
        #w{color:black;

			}


</style>
		<asp:title align="center"><h1>Staff</h1></asp:title>
	</head>
	
<body>
	<form id="form1" runat="server">
			
              <ul>
				  <li id="1">
				
                <asp:Button id="button1" runat="server" Text="check in" OnClick="checkin" BackColor="Transparent" BorderStyle="None" ForeColor="Blue"/>
            </li>

				
	    	<li id="2"> 
					         
                <asp:Button id="button2" runat="server" Text="check out" OnClick="checkout" BackColor="Transparent" BorderStyle="None" ForeColor="Blue"/>
            </li>
          
			
			  <li id="3">   
     <asp:Button runat="server" Text="attendance records" OnClick="viewARB" BackColor="Transparent" BorderStyle="None" ForeColor="Blue"/>

                    
			  </li>
				              <div class="row">
  <div class="col-xs-2">  <asp:Label ID="t1" runat="server" Text="Start Date:" Visible="false" ForeColor="Black"></asp:Label></div>
<div class="col-xs-2">	<asp:Label ID="t2" runat="server" Text="End Date:" Visible="false" ForeColor="Black"></asp:Label></div>
</div>
         <div class="row" >
    <div class="col-xs-2"><asp:TextBox id="startDate" runat="server" Visible="false"></asp:TextBox></div>
    <div class="col-xs-2"><asp:TextBox id="endDate" runat="server" Visible="false"></asp:TextBox></div>
    <div class="col-xs-6"><asp:Button id="button3" runat="server" Text="view attendance records" OnClick="ARB" Visible="false"/></div>

                    </div>  
 
                               <p>
  <asp:GridView ID="GridViewAR" runat="server">
            </asp:GridView>
        </p>
				
        <asp:Label ID="Label1" runat="server" Text="Attendance records:" ForeColor="Black" Visible="false"></asp:Label>
        <asp:GridView ID="GridView1" runat="server" autogeneratecolumns="false"  EnableEventValidation="false" EnableViewState="true" 
					ForeColor="Black" BorderColor= "Black">
             <Columns>
            <asp:BoundField DataField="date" HeaderText="date" />
            <asp:BoundField DataField="start_time" HeaderText="start time"/>
                <asp:BoundField DataField="end_time" HeaderText="end time"/>
                <asp:BoundField DataField="Duration" HeaderText="Duration"/>
                <asp:BoundField DataField="missing_Hs" HeaderText="missing hours"/>
        
            </Columns>

					  
        </asp:GridView>

 <li id="4">
          <asp:Button runat="server" Text="apply for leave request" OnClick="viewleaveR" BackColor="Transparent" BorderStyle="None" ForeColor="Blue"/>

                </li>
                                   <div class="row">
    <div class="col-xs-2"><asp:Label Class="a" ID="a1" runat="server" Text="Replacement:" Visible="false" ForeColor="Black"></asp:Label></div>
    <div class="col-xs-2"><asp:Label Class="a" ID="a2" runat="server" Text="Type:" Visible="false" ForeColor="Black"></asp:Label></div>          
    <div class="col-xs-2"><asp:Label Class="a" ID="a3" runat="server" Text="Start Date:" Visible="false" ForeColor="Black"></asp:Label></div>
    <div class="col-xs-2"><asp:Label Class="a" ID="a4" runat="server" Text="End Date:" Visible="false" ForeColor="Black"></asp:Label></div>
    
</div>
         <div class="row">
    <div class="col-xs-2"><asp:TextBox Class="a"  id="replacement" runat="server" Visible="false"></asp:TextBox></div>
    <div class="col-xs-2"><select Visible="false" id="ddt" runat="server">
  <option value="sick leave">sick leave</option>
  <option value="accidental leave">accidental leave</option>
  <option value="annual leave">annual leave</option>
</select></div>
    <div class="col-xs-2"><asp:TextBox Class="a" id="start_Date" runat="server" Visible="false"></asp:TextBox></div>
    <div class="col-xs-2"><asp:TextBox Class="a" id="end_Date" runat="server" Visible="false"></asp:TextBox></div>
    <div class="col-xs-4"><asp:Button Class="a" id="a5" runat="server" Text="submit leave request" OnClick="leaveR" Visible="false"/></div>

                    </div>

				
                    <li>
    <asp:Button runat="server" Text="apply for bussiness trip request" OnClick="viewtripR" BackColor="Transparent" BorderStyle="None" ForeColor="Blue"/>

                </li>

                              <div class="row">
    <div class="col-xs-2"><asp:Label ID="b1" runat="server" Text="Replacement:" Visible="false" ForeColor="Black"></asp:Label></div>
    <div class="col-xs-2"><asp:Label ID="b2" runat="server" Text="Destination:" Visible="false" ForeColor="Black"></asp:Label></div>
    <div class="col-xs-2"><asp:Label ID="b3" runat="server" Text="Purpose:" Visible="false" ForeColor="Black"></asp:Label></div>
    <div class="col-xs-2"><asp:Label ID="b4" runat="server" Text="Start Date:" Visible="false" ForeColor="Black"></asp:Label></div>
    <div class="col-xs-2"><asp:Label ID="b5" runat="server" Text="End Date:" Visible="false" ForeColor="Black"></asp:Label></div>


</div>
         <div class="row">
    <div class="col-xs-2"><asp:TextBox id="replacement2" runat="server" Visible="false"></asp:TextBox></div>
    <div class="col-xs-2"><asp:TextBox id="destination" runat="server" Visible="false"></asp:TextBox></div>
    <div class="col-xs-2"><asp:TextBox id="purpose" runat="server" Visible="false"></asp:TextBox></div>
    <div class="col-xs-2"><asp:TextBox id="s_Date" runat="server" Visible="false"></asp:TextBox></div>
    <div class="col-xs-2"><asp:TextBox id="e_Date" runat="server" Visible="false"></asp:TextBox></div>
    <div class="col-xs-2"><asp:Button id="b6" runat="server" Text="submit bussiness trip request" OnClick="tripR" Visible="false"/></div>

                    </div> 


				
				
                <li id="5">
	<div class="col-xs-2"><asp:Button runat="server" Text="view requests status" OnClick="VS" BackColor="Transparent" BorderStyle="None" ForeColor="Blue"/></div>
                       
                </li>
			
                



                                               <p>
  <asp:GridView ID="GridViewVS" runat="server" >
            </asp:GridView>
        </p>
                
        <asp:Label ID="Label2" runat="server" Text="requests status :" ForeColor="Black" Visible="false"></asp:Label>
        <asp:GridView ID="GridView2" runat="server" autogeneratecolumns="false"  EnableEventValidation="false" EnableViewState="true" 
                    ForeColor="Black" BorderColor= "Black" Visible="false">
             <Columns>
            <asp:BoundField DataField="request_date" HeaderText="request date" />
            <asp:BoundField DataField="start_date" HeaderText="start date"/>
                <asp:BoundField DataField="end_date" HeaderText="request_date"/>
                <asp:BoundField DataField="manager_response" HeaderText="manager response"/>
                <asp:BoundField DataField="hr_response" HeaderText="hr response"/>
        
            </Columns>

                      
        </asp:GridView>


        <li id="6">
	  <asp:Button runat="server" Text="Delete processing requests" OnClick="viewDeleteAR" BackColor="Transparent" BorderStyle="None" ForeColor="Blue"/>

		
				</li>
                            <div class="row">
    <div class="col-xs-2"><asp:Label ID="fDate" runat="server" Text="From Date:" Visible="false" ForeColor="Black" ></asp:Label></div>
</div>
                    <div class="row">
                <div class="col-xs-2"><asp:TextBox id="fromDate" runat="server" Visible="false"></asp:TextBox></div>
                <div class="col-xs-6"><asp:Button id="deleteb" runat="server" Text="Delete" OnClick="DeleteAR" Visible="false"/></div>
                       </div>




				
    <li id="7">
	  <asp:Button runat="server" Text="New Email" OnClick="viewsendEmail" BackColor="Transparent" BorderStyle="None" ForeColor="Blue"/>

		
				</li>
                            <div class="row">
                     
    <div class="col-xs-2"><asp:Label ID="c1" runat="server" Text="subject:" Visible="false" ForeColor="Black" ></asp:Label></div>
    <div class="col-xs-2"><asp:Label ID="c2" runat="server" Text="body:" Visible="false" ForeColor="Black" ></asp:Label></div>
    <div class="col-xs-2"><asp:Label ID="c3" runat="server" Text="recipient:" Visible="false" ForeColor="Black" ></asp:Label></div>

    
                    </div>
                    <div class="row">
                        <div class="col-xs-2"><asp:TextBox id="subject" runat="server" Visible="false"></asp:TextBox></div>                             
                        <div class="col-xs-2"><textarea id="body" cols="20" rows="2" runat="server" Visible="false"></textarea></div>
                        <div class="col-xs-2"><asp:TextBox id="recipient" runat="server" Visible="false"></asp:TextBox></div>
                        <div class="col-xs-2"><asp:Button id="c4" runat="server" Text="send" OnClick="sendEmail" Visible="false"/></div>

                    </div>



				
                <li id="8">
     <asp:Button runat="server" Text="Mail" OnClick="checkEmail" BackColor="Transparent" BorderStyle="None" ForeColor="Blue"/>


				</li>
				
                         <p>
  <asp:GridView ID="GridViewER" runat="server">
            </asp:GridView>
        </p>
                   
        <asp:Label ID="Label3" runat="server" Text="Emails recieved :" ForeColor="Black" Visible="false"></asp:Label>
        <asp:GridView ID="GridViewe" runat="server" autogeneratecolumns="false"  EnableEventValidation="false" EnableViewState="true" 
                    ForeColor="Black" BorderColor= "Black" Visible="false">
             <Columns>
                      
                <asp:BoundField DataField="serial_number" HeaderText="serial_number" />
                <asp:BoundField DataField="recipient" HeaderText="recipient" />
                <asp:BoundField DataField="subject" HeaderText="subject"/>
                <asp:BoundField DataField="date" HeaderText="date"/>
                <asp:BoundField DataField="body" HeaderText="body"/>
                <asp:BoundField DataField="sender" HeaderText="sender"/>

						  <asp:TemplateField ShowHeader="False">
            <ItemTemplate>
                <asp:Button ID="Buttonx" runat="server" Text="reply" OnCommand="replybutton" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"/>
            </ItemTemplate>
        </asp:TemplateField>
        
            </Columns>

                      
        </asp:GridView>
					<div class="row">
                            <br>
					<div class="col-xs-2"><textarea id="bodyr" cols="20" rows="2" runat="server" Visible="false" ></textarea></div>
		                    <div class="col-xs-2"><asp:Button id="breply" runat="server" Text="send reply" OnClick="replyEmail" Visible="false"/></div>
                            </div>
							
                <li id="10">
			<div ><asp:Button runat="server" Text="View Announcements" OnClick="viewA" BackColor="Transparent" BorderStyle="None" ForeColor="Blue"/></div>

				</li>
                                                                               <p>
                  <asp:GridView ID="GridViewVA" runat="server">
            </asp:GridView>
        </p>
                
        <asp:Label ID="Label4" runat="server" Text="Announcements :" ForeColor="Black" Visible="false"></asp:Label>
        <asp:GridView ID="GridView4" runat="server" autogeneratecolumns="false"  EnableEventValidation="false" EnableViewState="true" 
                    ForeColor="Black" BorderColor= "Black" Visible="false">
             <Columns>
            <asp:BoundField DataField="date" HeaderText="date" />
            <asp:BoundField DataField="title" HeaderText="title"/>
                <asp:BoundField DataField="hr_employee" HeaderText="hr employee"/>
                <asp:BoundField DataField="type" HeaderText="type"/>
                <asp:BoundField DataField="description" HeaderText="description"/>
        
            </Columns>

                      
        </asp:GridView>


				
                     
				
			 </ul>





			
                <footer class="container">
  <div class="row">
     <p class="col-sm-4" id="w" >&copy; staff 2017</p>
    <ul class="col-sm-8">
    <li class="col-sm-1"><img src="https://s3.amazonaws.com/codecademy-content/projects/make-a-website/lesson-4/twitter.svg"></li>
  <li class="col-sm-1"> <img src="https://s3.amazonaws.com/codecademy-content/projects/make-a-website/lesson-4/facebook.svg">
</li>
  <li class="col-sm-1"><img src="https://s3.amazonaws.com/codecademy-content/projects/make-a-website/lesson-4/instagram.svg"></li>
  <li class="col-sm-1"> <img src="https://s3.amazonaws.com/codecademy-content/projects/make-a-website/lesson-4/medium.svg"></li>
    </ul>
    </div>
  </footer>
			
		</form>
</body>
</html>
