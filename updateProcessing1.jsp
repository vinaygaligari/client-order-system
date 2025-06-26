<%@ page import ="java.sql.*" %>

<%
  
	String TaskID = request.getParameter("taskId").trim();
	String temp = request.getParameter("enterAmount");
	
	try
	{
     
		Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/customermanagement","root", "");
		Statement st1 = con.createStatement();
		ResultSet rs1 = st1.executeQuery("Select * From   payment where TaskID='"+TaskID+"'");
		int paymentDue=0;
		int inpValid=0; 
		
		if (rs1.next()) 
			{	
				inpValid=Integer.parseInt(temp);		
				String cost=rs1.getString("Cost");
				
				
				
				
				
				
				/*String taskId=rs1.getString("TaskID");
				//out.println(taskId);
				String cost=rs1.getString("Cost");
				//out.println(cost);
				String paymentAmount=rs1.getString("PaymentAmount");
				//out.println(paymentAmount);
				paymentDue=Integer.parseInt(cost)-Integer.parseInt(paymentAmount);
				
				inpValid=Integer.parseInt(temp);*/
				
				if(inpValid>paymentDue)
				{
					response.sendRedirect("updatePaymentProcess.jsp");
					
				}
				else
				{
						int updatedTotal1=0;
						session.setAttribute("TaskID", taskId); //changes made
						session.setAttribute("temp", temp); 
						
						int EnterAmount=Integer.parseInt(temp); 
						//out.println(TaskID);
						//out.println(EnterAmount);
						String tempID=(String)session.getAttribute("CustomerID");
						
						Class.forName("com.mysql.jdbc.Driver");
						Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/customermanagement","root", "");
						Statement st=con1.createStatement(); 
						ResultSet rs;
						rs=st.executeQuery("Select * from payment where TaskID='"+TaskID+"' and CustomerID='"+tempID+"'"); 
						String UpdatedAmount=""; 
						String CustomerID=""; 
						if(rs.next())
						{
								//out.println("Success");
								String exAmount=rs.getString("PaymentAmount");
								int intAmount=Integer.parseInt(exAmount);
								//out.println(intAmount);
								//out.println(EnterAmount);
								
								UpdatedAmount=String.valueOf(intAmount+EnterAmount); 
								out.println(UpdatedAmount);
								
								//out.println(CustomerID);
								Statement st3=con.createStatement(); 
								st3.executeUpdate("update payment set PaymentAmount='"+UpdatedAmount+"', PaymentDate=curdate()  where CustomerID='"+tempID+"'  and TaskID='"+TaskID+"'" ); 
								session.setAttribute(TaskID, "TaskID"); 
								ResultSet rs3=st3.executeQuery("Select * from payment where CustomerID='"+tempID+"'  and TaskID='"+TaskID+"'"); 			
								
								if(rs3.next())
								{
									out.println("Success1"); 
									//out.println(TaskID);
									//String tempID=(String)session.getAttribute("CustomerID");
									out.println(tempID);
									//int tempPayment=(int)session.getAttribute("TotalPayed");
									//out.println(tempPayment);
									//int tempDue=(int)session.getAttribute("PaymentDue");
									//out.println(tempDue);
									
									int tempTotal=(int)session.getAttribute("TotalCost");
									out.println(tempTotal);
									
									int parsedAmount=Integer.parseInt(UpdatedAmount); 
												
									updatedTotal1=tempTotal-parsedAmount; 		

										if(updatedTotal1<=0)
											{
											
												out.println("yes");
												Statement st2=con.createStatement(); 
												st2.executeUpdate("update payment set Status='"+"close"+"' where CustomerID='"+tempID+"'  and TaskID='"+TaskID+"'"); 
												ResultSet rs2=st2.executeQuery("Select * from payment where TaskID='"+TaskID+"'"); 
												
												
												if(rs2.next())
												{

													out.println("Success"); 
													//response.sendRedirect("paymentUpdateSuccess.jsp"); 
												}	
												else
												{
													out.println("Failed");
												}
												
												out.println("no");
												
											}
									
										
									response.sendRedirect("paymentUpdateSuccess.jsp"); 
									
									
								}	
								else
								{
									out.println("Failed");
								}
								
						}
						else
						{
								out.println("No");
						}
							
						
								
									
				}
			}
			
			else
			{
				out.println("Failed again");
			}
						
		}
		catch(Exception e)
		{       
		  out.println("Something went wrong !! Please try again: "+e);       
		}
		   
  
%>
