
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

	<body>
			<form align="center" action="updateProcessing.jsp">
				<table align="center" border="1">
				
				<tr>
					<th>CustomerID</th><th>PaymentAmount</th><th>TransactionID</th><th>PaymentDate</th>
					<th>Cost</th><th>TaskID</th><th>Status</th><th>TaskEndDate</th>
				</tr>						
					
					
						
<%@ page import ="java.sql.*" %>							
<%
   try
   {

		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/customermanagement","root", "");
		Statement st1 = con.createStatement();
		ResultSet rs1 = st1.executeQuery("Select * From   payment Order by PaymentDate Desc");
	
		while (rs1.next()) 
		{	
			String temp1=rs1.getString("CustomerID");
			String temp2=rs1.getString("PaymentAmount");	
			String temp3=rs1.getString("TransactionID");	
			String temp4=rs1.getString("PaymentDate");	
			String temp5=rs1.getString("Cost");	
			String temp6=rs1.getString("TaskID");	
			String temp7=rs1.getString("Status");	
			String temp8=rs1.getString("TaskEndDate");	
		%>
						
						
						<tr><td><%out.println(temp1);%></td><td><%out.println(temp2);%></td><td><%out.println(temp3);%></td><td><%out.println(temp4);%></td>
							<td><%out.println(temp5);%></td><td><%out.println(temp6);%></td><td><%out.println(temp7);%></td><td><%out.println(temp8);%></td>
						</tr>
						
						<%	
			
			//out.println(temp);
		} 
		
	}
catch(Exception e){       
      out.println("Something went wrong !! Please try again: "+e);       
  }   
%>							
													
						
						
					