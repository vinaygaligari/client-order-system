<%@ page import ="java.sql.*" %>

<%
   try
   {
		String TaskID = request.getParameter("taskId");
		String Subject = request.getParameter("subject");
		String University = request.getParameter("university");   
        String Cost = request.getParameter("cost");
	    String StartDate = request.getParameter("startDate");
		String EndDate = request.getParameter("endDate");
		String CustomerID = request.getParameter("customerId");
		
		out.println(TaskID);
		out.println(Subject);
		out.println(University);
		out.println(Cost);
		out.println(StartDate);
		out.println(EndDate);
		out.println(CustomerID);
	   
		Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
	
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/customermanagement","root", "");
			
		PreparedStatement pstatement = null;
		
		int updateQuery = 0;
		
		String queryString = "update task set University=?, Cost=?,StartDate=?, EndDate=?, TaskID=?, CustomerID=?, Subject=? WHERE TaskID='"+ TaskID +"'";
		pstatement = con.prepareStatement(queryString);
		pstatement.setString(1,University);
		pstatement.setString(2,Cost);
		pstatement.setString(3,StartDate);
		pstatement.setString(4,EndDate);
		pstatement.setString(5,TaskID);
		pstatement.setString(6,CustomerID);
		pstatement.setString(7,Subject);
		
				
		
		updateQuery = pstatement.executeUpdate();
		
		if(updateQuery>0)
		{

			//out.println("Success");
				/*PreparedStatement pstatement1 = null;
				int updateQuery1 = 0;
		
			
				String queryString1 = "update payment set (CustomerID, PaymentAmount, PaymentDate, Cost, TaskID, Status, TaskEndDate) values ('"+CustomerID+"', '"+"0"+"',curdate(),  '"+Cost+"', '"+TaskID+"', '"+"open"+"', '"+EndDate+"') where TransactionID='"+"TRA"+TaskID+"'";
				pstatement1 = con.prepareStatement(queryString1);
				updateQuery1 = pstatement1.executeUpdate();
			
				if (updateQuery1>0) 
				{	
					out.println("success");
					
				} 
				else 
				{
					out.println("adding failed");
				}*/
			
			response.sendRedirect("taskUpdateSuccess.jsp"); 
		}	
		else
		{
			out.println("failed");
		}
	
		con.close();
		
	}
	catch(Exception e)
	{
         out.println("Something went wrong !! Please try again: "+e);       
	}   
  
  
%>
