<%@ page import ="java.sql.*" %>

<%
   try
   {
       String FirstName = request.getParameter("firstName");   
       String SecondName = request.getParameter("secondName");
	    String Phone = request.getParameter("phone");
		String AltPhone = request.getParameter("altPhone");   
       String Whatsapp = request.getParameter("whatsapp");
	    String Facebook = request.getParameter("facebook");
		String Email = request.getParameter("email");
		
		String CustomerID=FirstName+"_"+SecondName.substring(0,2);
		session.setAttribute("CustomerID1",CustomerID);
	
		//out.println(CustomerID);
	   	   
	
		Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
			   
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/customermanagement","root", "");
		Statement st = con.createStatement();
		st.executeUpdate("Insert into addclient (FirstName, SecondName, Phone, AltPhone, Whatsapp, Facebook, Email, CustomerID) values ('"+FirstName+"', '"+SecondName+"',"+Phone+", '"+AltPhone+"', '"+Whatsapp+"', '"+Facebook+"', '"+Email+"', '"+CustomerID+"')");
		ResultSet rs = st.executeQuery("select * from addclient");
	
		if (rs.next()) 
		{	
		
			//out.println("added successfully");
			response.sendRedirect("addClientSuccess.jsp");
			
			
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