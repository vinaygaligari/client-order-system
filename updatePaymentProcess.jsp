
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
			<form align="center" action="updateProcessing.jsp">
				<table align="center" border="1">
					<tr>
						<td>CustomerID</td><td><%out.println(session.getAttribute("CustomerID"));%></td></td> 
					</tr>
					<tr>
						<td>TotalCost</td><td><%out.println(session.getAttribute("TotalCost"));%></td></td> 
					</tr>
					<!--
					<tr>
						<td>TotalPayed</td><td><%out.println(session.getAttribute("TotalPayed"));%></td></td> 
					</tr>
					<tr>
						<td>PaymentDue</td><td><%out.println(session.getAttribute("PaymentDue"));%></td></td> 
					</tr>					
					<tr>
					-->
						<td>TaskID</td>
						<td><select name="taskId">
							
<%
   try
   {
	
		String CustomerID=(String)session.getAttribute("CustomerID");	   
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/customermanagement","root", "");
		Statement st1 = con.createStatement();
		ResultSet rs1 = st1.executeQuery("Select * From   payment where CustomerID='"+CustomerID+"' and TaskEndDate>=curdate() and Status='"+"open"+"'");
	
		while (rs1.next()) 
		{	
			String temp4=rs1.getString("TaskID");
		%>
						
						
						<option value="<%out.println(temp4);%>"><%out.println(temp4);%></option>
						
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
						<td>EnterAmount</td><td><input type="text" name="enterAmount" ></td></td> 
					</tr>
				</table>
				<p>**** Amount Entered for the "TaskID" should be less than "PaymentDue" Given Below ****</p>
				<button  type="submit" value="Submit">Submit</button>
				
			</form>
	</body>
</html>
<table border="1" align="center">
<tr><td>TaskID</td><td>Cost</td><td>PayedAmount</td><td>PaymentDue</td></tr>
<%@ page import ="java.sql.*" %>

<%
 try
   {
     
		String Cust1ID=(String)session.getAttribute("CustomerID");
		//out.println(Cust1ID); 
		
		Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
			   
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/customermanagement","root", "");
		Statement st1 = con.createStatement();
		ResultSet rs1 = st1.executeQuery("Select * From   payment where CustomerID='"+Cust1ID+"' and TaskEndDate>=curdate() and Status='"+"open"+"'");
		int paymentDue=0;
		int TotalCost=0;
		int TotalPaymentDue=0;
		
		while (rs1.next()) 
			{	
						
				String taskId=rs1.getString("TaskID");
				//out.println(taskId);
				String cost=rs1.getString("Cost");
				//out.println(cost);
				String paymentAmount=rs1.getString("PaymentAmount");
				//out.println(paymentAmount);
				paymentDue=Integer.parseInt(cost)-Integer.parseInt(paymentAmount);
				
			%>
			
					<tr><td><%out.println(taskId);%></td><td><%out.println(cost);%></td><td><%out.println(paymentAmount);%></td><td><%out.println(paymentDue);%></td></tr>
			
			
			<%
						
			} 
			%>
			</table>
			<%
	
	}
	catch(Exception e){       
      out.println("Something went wrong !! Please try again: "+e);       
  }  
		
%>