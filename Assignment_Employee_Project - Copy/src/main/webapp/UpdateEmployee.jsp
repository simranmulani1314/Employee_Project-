<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%!
    
   	Connection conn;
    PreparedStatement statement;
    public void jspInit(){
    	try{
    		Class.forName("com.mysql.jdbc.Driver");
        	conn = DriverManager.getConnection("jdbc:mysql://localhost/mydb","root","root");
        	statement = conn.prepareStatement("update account1 set sal=? where id=?;");
    	}catch(SQLException e){
    		e.printStackTrace();
    	}catch(ClassNotFoundException ec){
    		ec.printStackTrace();
    	}
    }
    
    public void jsDestroy() throws SQLException{
    	statement.close();
		conn.close();
    	
    }
    
    %>
    
    
    <%
    
    int id = Integer.parseInt(request.getParameter("id"));
    int sal = Integer.parseInt(request.getParameter("sal"));
	out.print(id);
    statement.setInt(1,sal);
    statement.setInt(2,id);
    
    
    statement.executeUpdate();

    %>
    
    <h1>Updated Successfully!!</h1>
    
    
    
    
    
    
    
    
    
    
    
