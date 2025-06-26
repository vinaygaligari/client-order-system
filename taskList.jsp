
<html>
<h2 align="center">

			<a href="createTask.jsp">|CreateTask|</a>
			<a href="createPayment.jsp">|Payment|</a>
			<a href="addClient.jsp">|ClientData|</a>
			<a href="addSubject.jsp">|AddSubject|</a>	
			<a href="addUniversity.jsp">|AddUniversity|</a>	
			<a href="dues.jsp">|Dues|</a>
			<a href="totalRevenues.jsp">|Report|</a>
			

</h2>
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
	
	
 <%@ page import ="java.sql.*" %>
<%
try
{
	
    Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/customermanagement","root", "");
	Statement st=con.createStatement(); 
	ResultSet rs;
	rs=st.executeQuery("Select * from  task"); 
	%>
	<body>	
				<table align="center" border="1">
				<tr><th>TaskID</th><th>TaskStartDate</th><th>TaskEndDate</th></tr>
	<%
	while(rs.next())
	{
			//out.println("success"); 
			String taskId=rs.getString("TaskID"); 
			//out.println(subjectName);
			String startDate=rs.getString("StartDate"); 
			String endDate=rs.getString("EndDate"); 
			
%>
		
					<tr>
						<td><%out.println(taskId);%></td>
						<td><%out.println(startDate);%></td>
						<td><%out.println(endDate);%></td>
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