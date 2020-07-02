<%--
  Created by IntelliJ IDEA.
  User: 邹凯伦
  Date: 2020/7/1
  Time: 23:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    String dbURL = "jdbc:sqlserver://localhost:1433;DatabaseName =music";//music是数据库名
    String userName="SQL User";//用户名
    String userPwd="123456789";//密码
    Connection dbConn = null;


    Class.forName(driverName);
    System.out.println("加载驱动成功");


    dbConn = DriverManager.getConnection(dbURL,userName,userPwd);
    System.out.println("连接成功");


    String Username = request.getParameter("Username");
    String Password = request.getParameter("Password");
    System.out.println("Username  "+Username  +"Password  "+Password);


    Statement statement=dbConn.createStatement();
    String sql = "select * from dbo.user1 where username='"+Username+"' and password='"+Password+"'";
    ResultSet rs=statement.executeQuery(sql);//sql查询


    if(rs.next()){
        if(Username.equals(rs.getString("username").trim())){
            if (Password.equals(rs.getString("password").trim())){
                System.out.println("登录成功");
                out.println("<script language='JavaScript'>alert('登录成功')</script>");
                response.setHeader("refresh","0;URL = default.jsp" );
            }
            else{
                System.out.println("密码错误");
                out.println("<script language='JavaScript'>alert('密码错误，请重新输入')</script>");
                response.setHeader("refresh","0;URL = /html/login.html" );
            }

        }
        else{
            System.out.println("账号不存在");
            out.println("<script language='JavaScript'>alert('账号不存在，请重新输入')</script>");
            response.setHeader("refresh","0;URL = /html/login.html" );
        }
    }
    rs.close();
    statement.close();
    dbConn.close();
%>
</body>
</html>
