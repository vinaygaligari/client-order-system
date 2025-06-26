<%@ page import ="java.sql.*" %>
<%
try
{
	String TaskID=request.getParameter("taskId").trim();
	
	//out.println(TaskID); 
	//out.println(Password); 
	
    Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/customermanagement","root", "");
	Statement st=con.createStatement(); 
	ResultSet rs;
	rs=st.executeQuery("Select * from task where TaskID='"+TaskID+"'"); 
	if(rs.next())
	{
			
			String temp1=rs.getString("Cost"); 
			String temp2=rs.getString("StartDate");
			String temp3=rs.getString("EndDate");
			String temp4=rs.getString("CustomerID");
			//out.println(temp);
			
	%>
	
<html>
<style>
table { 
}

th, td {
    text-align: left;
    padding: 8px;
}
tr:nth-child(even){background-color: #C7F5F9}
.footer {   position: fixed;  bottom: 0;   width: 100%;  left:0;   color: red;   text-align: center; height: 60px; }
</style>

<br>
<link rel="stylesheet" href="style.css">
<body bgcolor="#E6E6FA">	<h1 align="center">Client Order Management System (COMS)</h1>	<h3 align="center">One System to Manage Clients, Orders, Payments, and Reports.</h3>
  <nav>
  <ul class="nav">
    <li><a href="home.jsp">Home</a></li>
     <li><a href="#">University</a>
      <ul>
        <li><a href="addUniversity.jsp">Add University</a></li>
      </ul>
    </li>
	<li><a href="#">Subject</a>
      <ul>
        <li><a href="addSubject.jsp">Add Subject</a></li>
      </ul>
    </li>
	<li><a href="#">Client</a>
      <ul>
        <li><a href="addClient.jsp">Add Client</a></li>
		 <li><a href="updateClient.jsp">Update Client</a></li>
      </ul>
    </li>
	<li><a href="#">Task</a>
      <ul>
        <li><a href="createTask.jsp">Create Task</a></li>
        <!--<li><a href="clientTaskUpdate.jsp">Update Task</a></li>-->
		<li><a href="deleteTask.jsp">Delete Task</a></li>
      </ul>
    </li>
    <li><a href="#">Payment</a>
      <ul>
        <li><a href="paymentSearch.jsp">Search Payment</a></li>
      </ul>
    </li>
	<li><a href="#">Report</a>
      <ul>
        <li><a href="clientList.jsp">Client List</a></li>
		<li><a href="subjectsList.jsp">Subjects List</a></li>
		<li><a href="universitiesList.jsp">Universities List</a></li>
		<li><a href="totalRevenues.jsp">Total Revenues</a></li>
		<li><a href="dues.jsp">Total Dues</a></li>
		<li><a href="paymentReport.jsp">Payment Dates</a></li>
		<li><a href="paymentSummary.jsp">Payment Table Summary</a></li>
      </ul>
	  <li><a href="login.jsp">Logout</a>
    </li>    
  </ul>
</nav>
</body>



<br>
<br>
<br>
<br>
<br>

	<body>
			<form align="center" action="taskUpdateProcess.jsp">
				<table align="center" border="1">
					
						
					<tr>
						<td>TaskID</td><td><input type="text" name="taskId" value="<%out.println(TaskID);%>"></td></td> 
					</tr>
<tr>
						<td>Subject</td>
						<td><select name="subject">
<%
   try
   {
	
   
	
		//Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
			   
		//Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/customermanagement","root", "");
		Statement st1 = con.createStatement();
		ResultSet rs1 = st1.executeQuery("select * from Subject");
	
		while (rs1.next()) 
		{	
			String temp5=rs1.getString("SubjectID");
		%>
						
						
						<option value="<%out.println(temp5);%>"><%out.println(temp5);%></option>
						
						<%	
			
			//out.println(temp);
		} 
		
	}
catch(Exception e){       
      out.println("Something went wrong !! Please try again: "+e);       
  }   
%>
							
						</td>   
					</tr>		
						

					<tr>
						<td>University</td>
						<td><select name="university">
							
<%
   try
   {
	
			   
		//Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/customermanagement","root", "");
		Statement st2 = con.createStatement();
		ResultSet rs2 = st2.executeQuery("select * from university");
	
		while (rs2.next()) 
		{	
			String temp6=rs2.getString("University");
		%>
						
						
						<option value="<%out.println(temp6);%>"><%out.println(temp6);%></option>
						
						<%	
			
			//out.println(temp);
		} 
		
	}
catch(Exception e){       
      out.println("Something went wrong !! Please try again: "+e);       
  }   
%>							
													
						</td>   
					</tr>
					<tr>
						<td>Cost</td><td><input type="text" name="cost" value="<%out.println(temp1);%>"></td></td> 
					</tr>				
					<tr>
						<td>StartDate</td><td><input type="text" name="startDate" value="<%out.println(temp2);%>"></td></td> 
					</tr>
					<tr>
						<td>EndDate</td><td><input type="text" name="endDate" value="<%out.println(temp3);%>"></td></td> 
					</tr>
					<tr>
						<td>CustomerID</td><td><input type="text" name="customerId" value="<%out.println(temp4);%>"></td></td> 
					</tr>
				
	<%
	
	}
	else
	{
			out.println("Task ID not Available in Database");
	}
}
catch(Exception e)
{
	out.println("Something went wrong !! Please try again: "+e);       
}

%>
	
				</table>
				<button  type="submit" value="Submit">Update</button>

			</form>
	</body>
</html>