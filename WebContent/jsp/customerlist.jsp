<%@page import="java.util.*" %>
<% 
	Properties prop = (Properties)session.getAttribute("interview.querydata");

	String[] customerNums = prop.getProperty("customerNumbers").split(":");
	String[] customerNames = prop.getProperty("customerNames").split(":");
	String[] amountsDue = prop.getProperty("amountsDue").split(":");
%>
<html>
	<body>
		<div>
			<span style="text-align: center">
				<h3>Customer Data</h3>
			</span>
		</div>
		<div>
			<table id="customerData" align="center" border="1px solid black;">
				<tr>
					<td>Customer Number</td>
					<td>Customer Name</td>
					<td>Amount Due</td>
				</tr>
				<%
					int count = 0;
					String rowStyle = "style=\"background-color: #D3D3D3\"";
					for(String number : customerNums){
						if(count % 2 == 0){
							out.println("<tr " + rowStyle + "><td>" + number + "</td><td>" + customerNames[count] + "</td><td>" 
											+ amountsDue[count] + "</td></tr>");
						}else{
							out.println("<tr><td>" + number + "</td><td>" + customerNames[count] + "</td><td>" + amountsDue[count] + "</td></tr>");
						}
						count++;
					}
				%>
			</table>
		</div>
	</body>
</html>