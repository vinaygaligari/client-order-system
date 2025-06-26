	
<%@ page import ="java.sql.*" %>
<%
   try
   {
       	String CustomerID=request.getParameter("customerId").trim(); 
		//out.println(CustomerID);
		Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
			   
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/customermanagement","root", "");
		Statement st = con.createStatement();
		/*ResultSet rs = st.executeQuery("Select * From   task where CustomerID='"+CustomerID+"'");
	
			int result; 
			int totalCost=0; 
			while (rs.next()) 
			{	
				
				//out.println("success");
				String temp=rs.getString("Cost");
				//out.println(temp);
				result = Integer.parseInt(temp);
				//out.println(result); 
				totalCost=totalCost+result; 
				
			} 
		//out.println(totalCost);
		*/
		
		
		Statement st1 = con.createStatement();
		//out.println(CustomerID);
		ResultSet rs1 = st1.executeQuery("Select * From   payment where CustomerID='"+CustomerID+"' and TaskEndDate>=curdate() and Status='"+"open"+"'");
	
		int result1; 
		int totalPayed=0; 
		int result; 
		int totalCost=0; 
		
		while (rs1.next()) 
			{	
						
				String temp1=rs1.getString("PaymentAmount");
				result = Integer.parseInt(temp1);
				totalPayed=totalPayed+result; 	

				String temp=rs1.getString("Cost");
				result = Integer.parseInt(temp);
				totalCost=totalCost+result; 
				
				
			} 
		//out.println(totalPayed);
		
		int paymentDue=totalCost-totalPayed; 
		//out.println(paymentDue); 
		
		
		
		session.setAttribute("CustomerID", CustomerID);
		session.setAttribute("TotalCost", totalCost);
		session.setAttribute("TotalPayed", totalPayed);
		session.setAttribute("PaymentDue", paymentDue);
		

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
			<form align="center" action="updatePaymentProcess.jsp">
				<table align="center" border="1">
					<tr>
						<td>CustomerID</td><td><%out.println(CustomerID);%></td></td> 
					</tr>
					<tr>
						<td>TotalCost</td><td><%out.println(totalCost);%></td></td> 
					</tr>
					<tr>
						<td>TotalPayed</td><td><%out.println(totalPayed);%></td></td> 
					</tr>
					<tr>
						<td>PaymentDue</td><td><%out.println(paymentDue);%></td></td> 
					</tr>
				</table>
				<button  type="submit" value="Submit">AddPayment</button>
<%	
	}
	catch(Exception e){       
      out.println("Something went wrong !! Please try again: "+e);       
  }   
%>

			</form>
	</body>
</html>