<%@page import="java.sql.*"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%!
    
   	Connection conn;
    PreparedStatement statement;
    public void jspInit(){
    	try{
    		Class.forName("com.mysql.jdbc.Driver");
        	conn = DriverManager.getConnection("jdbc:mysql://localhost/mydb","root","root");
        	statement = conn.prepareStatement("delete from account1 where id=?");
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
    statement.setInt(1,id);
    statement.executeUpdate();

    %>
    
    <h1>Deleted Successfully!!!</h1>
  