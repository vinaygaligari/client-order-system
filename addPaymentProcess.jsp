
<%@ page import ="java.sql.*" %>

<%
   try
   {
       	String CustomerID=request.getParameter("customerId"); 
		//out.println(CustomerID);
		Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
			   
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/customermanagement","root", "");
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("Select * From   task where CustomerID='"+CustomerID+"'");
	
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
		
		Statement st1 = con.createStatement();
		ResultSet rs1 = st1.executeQuery("Select * From   payment where CustomerID='"+CustomerID+"'");
		
		int result1; 
		int totalPayed=0; 
		while (rs1.next()) 
			{	
						
				String temp1=rs1.getString("PaymentAmount");
				//out.println(temp1);
				//out.println("success");
				result = Integer.parseInt(temp1);
				//out.println(result); 
				totalPayed=totalPayed+result; 		
				
			} 
		//out.println(totalPayed);
		
		int paymentDue=totalCost-totalPayed; 
		//out.println(paymentDue); 
%>

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
			<form align="center" action="addPaymentProcess.jsp">
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