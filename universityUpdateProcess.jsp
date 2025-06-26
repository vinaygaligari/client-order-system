<%@ page import ="java.sql.*" %>

<%
   try
   {
		String University = request.getParameter("university").trim();
		String Course = request.getParameter("course").trim();
		String Country = request.getParameter("country").trim();   
        String UniversityID = request.getParameter("universityId").trim();
		
		out.println(University);
		out.println(Course);
		out.println(Country);
		out.println(UniversityID);
		
	    
		
	   
		Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
	
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/customermanagement","root", "");
			
		PreparedStatement pstatement = null;
		
		int updateQuery = 0;
		
		String queryString = "update task set University=?, Course=?, Country=?, UniversityID=? WHERE University='"+ University +"'";
		pstatement = con.prepareStatement(queryString);
		pstatement.setString(1,University);
		pstatement.setString(2,"Course");
		pstatement.setString(3,Country);
		pstatement.setString(4,UniversityID);
		
		updateQuery = pstatement.executeUpdate();
		
		if(updateQuery>0)
		{
			response.sendRedirect("universityUpdateSuccess.jsp"); 
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
