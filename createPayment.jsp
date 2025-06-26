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
			<form align="center" action="createPaymentProcess.jsp">
				<table align="center" border="1">
					<tr>
						<td>CustomerID</td><td><input type="text" name="customerId" value=""></td>
					</tr>
					<tr>
						<td>PaymentAmount</td><td><input type="text" name="paymentAmount"></td>
					</tr>
					<tr>
						<td>TransactionID</td><td><input type="text" name="transactionId"></td>
					</tr>
					<tr>
						<td>PaymentDate</td><td><input type="text" name="PaymentDate" placeholder="YYYY-MM-DD"></td>
					</tr>
					<tr>
						<td>PaymentDue</td><td><input type="text" name="paymentDue"></td>
					</tr>
					<tr>
						<td>TaskID</td><td><input type="text" name="taskId" value=""></td>
					</tr>
					
				</table>
					<button  type="submit" value="Submit">Submit</button>

			</form>
	</body>
</html>