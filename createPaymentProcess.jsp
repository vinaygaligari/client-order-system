<%@ page import ="java.sql.*" %>

<%
   try
   {
	   String CustomerID = request.getParameter("customerId");
       String PaymentAmount = request.getParameter("paymentAmount");
	   String TransactionID = request.getParameter("transactionId");
	   String PaymentDate = request.getParameter("PaymentDate");    
	   String Cost = request.getParameter("cost");
	   String TaskID = request.getParameter("taskId");  
	  
	
	
		Class.forName("com.mysql.jdbc.Driver");  
			   
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/customermanagement","root", "");
		Statement st = con.createStatement();
		st.executeUpdate("Insert into payment (CustomerID, PaymentAmount, TransactionID, PaymentDate, Cost, TaskID, Status) values ('"+CustomerID+"', '"+PaymentAmount+"','"+TransactionID+"', '"+PaymentDate+"',  '"+Cost+"', '"+TaskID+"', '"+"open"+"')");
		ResultSet rs = st.executeQuery("select * from payment");
	
		if (rs.next()) 
		{	
			//out.println("added successfully");
			response.sendRedirect("createPaymentSuccess.jsp");	
		} 
		else 
		{
			out.println("adding failed");
		}
	
		
	}
catch(Exception e){       
      out.println("Something went wrong !! Please try again: "+e);       
  }   
%>