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

	<body>
			<form align="center" action="taskUpdateProcess.jsp">
				<table align="center" border="1">
					<tr>
						<td>TaskID</td><td><input type="text" name="taskId" value="<%out.println(session.getAttribute("TaskID"));%>"></td></td> 
					</tr>	
					<tr>
						<td>Subject</td>
						<td><select name="subject">
							<option value="management">Management</option>
							<option value="statistics">Statistics</option>
							<option value="java">Java</option>
							<option value="joomla">Joomla</option>
							<option value="database">Database</option>
						</td>   
					</tr>
					<tr>
						<td>University</td>
						<td><select name="university">
							<option value="jntu">JNTU</option>
							<option value="osmania">Osmania</option>
							<option value="kakatiya">Kakatiya</option>
							<option value="satavahana">Satavahana</option>
							<option value="ambedkar">Ambedkar</option>
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
				

			</form >
			
	
	</body>
</html>