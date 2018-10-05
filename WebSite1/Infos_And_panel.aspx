<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Infos_And_panel.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Image onclick="window.location='search.aspx'" ID="Image4" runat="server" src="download.jpg" />
        <div>
        </div>
        
        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" />
        <br />
       <div ><asp:Button runat="server" Text="View Info" OnClick="viewInfo" /></div>
        <div ><asp:Button ID="SM1" runat="server" Text="Staff Member Panel" OnClick="SM" /></div>
        <div ><asp:Button runat="server" Text="Edit Info" OnClick="Edit" />
            <br />
            <asp:Label ID="Label1" runat="server" Text="you can leave any field empty if you don't want to change it"></asp:Label>
        </div>
                                                                                    <p>
      
                                                                                        <asp:Label ID="passl" runat="server" Text="password"></asp:Label>
      
   <asp:TextBox id="pass" runat="server" ></asp:TextBox>                             
		                                                                                <asp:Label ID="personalel" runat="server" Text="email"></asp:Label>
		                <asp:TextBox id="personale" runat="server" ></asp:TextBox>                             
                                                                                        <asp:Label ID="birthdatel" runat="server" Text="birth date"></asp:Label>
                        <asp:TextBox id="birthdate" runat="server" ></asp:TextBox>                        
                                                                                        <asp:Label ID="expel" runat="server" Text="experience"></asp:Label>
                        <asp:TextBox id="expe" runat="server" ></asp:TextBox>                      
                                                                                        <asp:Label ID="firstNl" runat="server" Text="first name"></asp:Label>
                        <asp:TextBox id="firstN" runat="server" ></asp:TextBox>                            
                                                                                        <asp:Label ID="middleNl" runat="server" Text="middle name"></asp:Label>
                        <asp:TextBox id="middleN" runat="server" ></asp:TextBox>                            
                                                                                        <asp:Label ID="lastNl" runat="server" Text="last name "></asp:Label>
                        <asp:TextBox id="lastN" runat="server" ></asp:TextBox>                            
                        <asp:Button ID="EditF" runat="server" Text="edit" OnClick="editInfo" />

        </p>
                
        <asp:Label ID="labelx" runat="server" Text="Info :" ForeColor="Black" ></asp:Label>
        <asp:GridView ID="GridViewx" runat="server" autogeneratecolumns="false"  EnableEventValidation="false" EnableViewState="true" 
                    ForeColor="Black" BorderColor= "Black" >
             <Columns>
            <asp:BoundField DataField="username" HeaderText="username" />
            <asp:BoundField DataField="password" HeaderText="password"/>
                <asp:BoundField DataField="personal_email" HeaderText="personal email"/>
                <asp:BoundField DataField="birth_date" HeaderText="birth date"/>
                <asp:BoundField DataField="years_of_experience" HeaderText="years of experiance"/>
                <asp:BoundField DataField="first_name" HeaderText="first name "/>
                <asp:BoundField DataField="middle_name" HeaderText="middle name "/>
                <asp:BoundField DataField="last_name" HeaderText="last name"/>
                <asp:BoundField DataField="age" HeaderText="age"/>
        
            </Columns>

                      
        </asp:GridView>
       
    </form>
</body>
</html>
