<%@ page import ="java.sql.*" %>
<html>
<style>
table { 
}

th, td {
    text-align: left;
    padding: 8px;
}
tr:nth-child(even){background-color: #C7F5F9}
</style>
<br>
<link rel="stylesheet" href="style.css">
<body bgcolor="#E6E6FA">	<h1 align="center">Client Order Management System (COMS)</h1>	<h3 align="center">One System to Manage Clients, Orders, Payments, and Reports.</h3>
  <nav>
  <ul class="nav">
    <li><a href="home.jsp">Home</a></li>
    <li><a href="#">Client</a>
      <ul>
        <li><a href="addClient.jsp">Add Client</a></li>
		 <li><a href="updateClient.jsp">Update Client</a></li>
      </ul>
    </li>
	<li><a href="#">Subject</a>
      <ul>
        <li><a href="addSubject.jsp">Add Subject</a></li>
      </ul>
    </li>
    <li><a href="#">University</a>
      <ul>
        <li><a href="addUniversity.jsp">Add University</a></li>
      </ul>
    </li>
	<li><a href="#">Task</a>
      <ul>
        <li><a href="createTask.jsp">Create Task</a></li>
        <!--<li><a href="clientTaskUpdate.jsp">Update Task</a></li>-->
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
		<li><a href="paymentSearch.jsp">Payment Dues</a></li>
		<li><a href="totolRevenues.jsp">Total Revenues</a></li>
      </ul>
    </li>    
  </ul>
</nav>
</body>

<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

	<body>
			<form align="center" action="taskUpdateProcess.jsp">
				<table align="center" border="1">
					<tr>
						<td>TaskID</td><td><input type="text" name="taskId" value="<%out.println(session.getAttribute("TaskID"));%>"></td></td> 
					</tr>	
					
					<tr>
						<td>Subject</td>
						<td><select name="subject">
<%
   try
   {
	
   
	
		Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
			   
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/customermanagement","root", "");
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from Subject");
	
		while (rs.next()) 
		{	
			String temp=rs.getString("SubjectID");
		%>
						
						
						<option value="<%out.println(temp);%>"><%out.println(temp);%></option>
						
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
	
			   
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/customermanagement","root", "");
		Statement st1 = con.createStatement();
		ResultSet rs1 = st1.executeQuery("select * from university");
	
		while (rs1.next()) 
		{	
			String temp1=rs1.getString("University");
		%>
						
						
						<option value="<%out.println(temp1);%>"><%out.println(temp1);%></option>
						
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
						<td>Cost</td><td><input type="text" name="cost"  value="<%out.println(session.getAttribute("Cost"));%>"></td></td> 
					</tr>				
					<tr>
						<td>StartDate</td><td><input type="text" name="startDate" value="<%out.println(session.getAttribute("StartDate"));%>"></td></td> 
					</tr>
					<tr>
						<td>EndDate</td><td><input type="text" name="endDate" value="<%out.println(session.getAttribute("EndDate"));%>"></td></td> 
					</tr>
					<tr>
						<td>CustomerID</td><td><input type="text" name="customerId" value="<%out.println(session.getAttribute("CustomerID"));%>"></td></td> 
					</tr>
					
				</table>
				<button  type="submit" value="Submit">Submit</button>

			</form>
	</body>
</html>