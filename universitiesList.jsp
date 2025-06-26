
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


	
 <%@ page import ="java.sql.*" %>
<%
try
{
	
    Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/customermanagement","root", "");
	Statement st=con.createStatement(); 
	ResultSet rs;
	rs=st.executeQuery("Select * from  university"); 
	%>
	<body>	
				<table align="center" border="1">
				<tr><th>UniversityName</th><th>Country</th></tr>
	<%
	while(rs.next())
	{
			//out.println("success"); 
			String universityName=rs.getString("university"); 
			//out.println(universityName);
			String country=rs.getString("Country"); 
%>
		
					<tr>
						<td><%out.println(universityName);%></td>
						<td><%out.println(country);%></td>
					</tr>
					
				
<%
	}
}
catch(Exception e)
{
	out.println("Something went wrong !! Please try again: "+e);       
}

%>
				</table>
	</body>		
	
</html>