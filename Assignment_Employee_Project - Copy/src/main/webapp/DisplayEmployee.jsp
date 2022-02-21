<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
    <%!
    
   	Connection conn;
    Statement statement;
    ResultSet resultSet;
    public void jspInit(){
    	try{
    		Class.forName("com.mysql.jdbc.Driver");
        	conn = DriverManager.getConnection("jdbc:mysql://localhost/mydb","root","root");
        	statement = conn.createStatement();
        	resultSet = statement.executeQuery("Select * from account1;");
    	}catch(SQLException e){
    		e.printStackTrace();
    		//System.out.print("SQL exception");
    	}catch(ClassNotFoundException ec){
    		ec.printStackTrace();
    		//System.out.print("Class not found");
    	}
    }
    
    public void jsDestroy() throws SQLException{
    	statement.close();
		conn.close();
    	
    }
    
    %>
    
  <style>
.content-table{
border-collapse:collapse;
margin :25px;
font-size: 0.9cm;
min-width:1000px;
background:url("image/a.jpg");
border-radius:5px 5px 0 0;
}
  

.content-table thread tr{
background-color:grey;
color:#ffff;
text-aligh:ceter;

}

.content-table th,
.content-table:td{
padding: 12px 15px;

}

.content-table tbody tr{
border-bottom:1px solid #dddddd}

.content-table tbody tr:nth-of-type(even){
background-color:#f3f3f3;
}
 
 </style>
    
 <table>
 	<tr>
 		<th> ID </th>
 		<th> FirstName</th>
 		<th> LastName </th>
  		<th> Salary </th>
 	</tr>
 	 		<% while(resultSet.next()){ %>
 	
 		<tr> 
 			<td><%=resultSet.getInt(1) %></td> 
 			<td><%=resultSet.getString(2) %></td> 
 			<td><%=resultSet.getString(3) %></td> 
 			<td><%=resultSet.getInt(4) %></td> 
 		</tr>
 		 	 		<% } %>

 </table>
    
    
    
    