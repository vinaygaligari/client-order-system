
<%@ page import ="java.sql.*" %>

<%
   try
   {
       	String CustomerID=request.getParameter("customerId").trim(); 
		session.setAttribute("CustID", CustomerID); 
		//out.println(CustomerID);
		Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
			   
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/customermanagement","root", "");
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("Select * From   addClient where CustomerID='"+CustomerID+"'");
		String  firstName=""; 
		String  secondName=""; 
		String  phone=""; 
		String  altPhone=""; 
		String  whatsApp=""; 
		String  faceBook=""; 
		String  email=""; 
		String  customerId=""; 
			
			
			if (rs.next()) 
			{			
				//out.println("success");
				firstName=rs.getString("FirstName");
				secondName=rs.getString("SecondName");
				phone=rs.getString("Phone");
				altPhone=rs.getString("AltPhone");
				whatsApp=rs.getString("WhatsApp");
				faceBook=rs.getString("Facebook");
				email=rs.getString("email");		
			}
			else
			{
				out.println("failed");
			} 
		
		
		
		
	
		
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
			<form align="center" action="updateClientProcessing.jsp">
				<table align="center" border="1">
					<tr>
						<td>CustomerID</td><td><%out.println(CustomerID);%></td>
					</tr>
					<tr>
						<td>PersonFirstName</td><td><input type="text" name="firstName" value="<%out.println(firstName);%>"></td>
					</tr>
					<tr>
						<td>SecondName</td><td><input type="text" name="secondName" value="<%out.println(secondName);%>"></td>
					</tr>
					<tr>
						<td>Phone</td><td><input type="text" name="phone" value="<%out.println(phone);%>"></td></td> 
					</tr>
					<tr>
						<td>Alt.Phone</td><td><input type="text" name="altPhone" value="<%out.println(altPhone);%>"></td></td>
					</tr>
					<tr>
						<td>Whatsapp</td><td><input type="text" name="whatsapp" value="<%out.println(whatsApp);%>"></td></td>
					</tr>
					<tr>
						<td>Facebook</td><td><input type="text" name="facebook" value="<%out.println(faceBook);%>"></td></td>
					</tr>
					<tr>
						<td>Email</td><td><input type="text" name="email" value="<%out.println(email);%>" ></td></td>
					</tr>
				</table>
				<button  type="submit" value="Submit">Update</button>
			
<%	
	}
	catch(Exception e){       
      out.println("Something went wrong !! Please try again: "+e);       
  }   
%>

			</form>
	</body>
</html>