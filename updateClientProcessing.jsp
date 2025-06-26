<%@ page import ="java.sql.*" %>

<%
   try
   {
		String CustomerID = (String)session.getAttribute("CustID");
		String FirstName = request.getParameter("firstName");
		String SecondName = request.getParameter("secondName");
		String Phone = request.getParameter("phone");   
        String AltPhone = request.getParameter("altPhone");
	    String WhatsApp = request.getParameter("whatsapp");
		String Facebook = request.getParameter("facebook");
		String Email = request.getParameter("email");
		
		out.println(CustomerID);
		out.println(FirstName);
		out.println(SecondName);
		out.println(Phone);
		out.println(AltPhone);
		out.println(WhatsApp);
		out.println(Facebook);
		out.println(Email);
	   
		Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
	
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/customermanagement","root", "");
			
		PreparedStatement pstatement = null;
		
		int updateQuery = 0;
		
		String queryString = "update addclient set FirstName=?, SecondName=?,Phone=?, AltPhone=?, WhatsApp=?, Facebook=?, Email=? WHERE CustomerID='"+ CustomerID +"'";
		pstatement = con.prepareStatement(queryString);
		pstatement.setString(1,FirstName);
		pstatement.setString(2,SecondName);
		pstatement.setString(3,Phone);
		pstatement.setString(4,AltPhone);
		pstatement.setString(5,WhatsApp);
		pstatement.setString(6,Facebook);
		pstatement.setString(7,Email);
		
				
		
		updateQuery = pstatement.executeUpdate();
		
		if(updateQuery>0)
		{

			//out.println("Success");
			response.sendRedirect("clientUpdateSuccess.jsp"); 
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
