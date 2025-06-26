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
				<table align="center" border="1">
				<tr><th>CustomerID</th><th>TaskID</th><th>Cost</th><th>PaymentAmount</th><th>PaymentDue</th><th>PaymentDate</th></tr>	
					
<%@ page import ="java.sql.*" %>

<%	
   try
   {
       	Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
			   
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/customermanagement","root", "");
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("SELECT * FROM payment Order by PaymentDate Desc");
		int x=0; 
		int y=0; 
		int z=0; 
		int min=100000;
		int max=0; 
		int result1=0; 
		int result2=0; 
		int due=0; 
		int finalDue=0; 
			while (rs.next()) 
			{	
				
				String TaskID1=rs.getString("TaskID");
				//out.println("success");
				String Cost1=rs.getString("Cost");
				String PaymentAmount1=rs.getString("PaymentAmount");
				String CustomerID1=rs.getString("CustomerID"); 
				String PaymentDate1=rs.getString("PaymentDate");
				
				//out.println(TaskID1);
				result1 = Integer.parseInt(Cost1);
				x=x+result1;

				result2 = Integer.parseInt(PaymentAmount1);
				y=y+result2;
				due=result1-result2; 
					
				
					finalDue=due+finalDue; 
					//out.println("success");
				%>
				<tr><td><%out.println(CustomerID1);%></td><td><%out.println(TaskID1);%></td><td><%out.println(Cost1);%></td><td><%out.println(PaymentAmount1);%></td><td><%out.println(due);%></td><td><%out.println(PaymentDate1);%></td></tr>		
				<%
				
			} 
			
	%>
		<tr><th></th><th></th><th>TotalCost</th><th>TotalPaymentAmt</th><th>TotalPaymentDue</th><th></th></tr>
		<tr><th></th><th></th><th><%out.println(x);%></th><th><%out.println(y);%></th><th><%out.println(finalDue);%></th><th></th></tr>		
							
	 </table>			
	</body>
</html>							
		
		
	<%
			
	}
	catch(Exception e){       
      out.println("Something went wrong !! Please try again: "+e);       
  }   
%>