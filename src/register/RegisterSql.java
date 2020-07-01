package register;

import java.sql.*;

public class RegisterSql {
    private String NUsername;
    private String NPassword;
    private String NNikename;
    public RegisterSql(String NUsername,String NPassword,String NNikename){
        String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
        String dbURL = "jdbc:sqlserver://localhost:1434;DatabaseName =music";//music是数据库名
        String userName="SQLUser";//用户名
        String userPwd="1234";//密码
        Connection dbConn = null;
        try {
            Class.forName(driverName);
            System.out.println("加载驱动成功");
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            System.out.println("加载驱动失败");

        }
        try {
            dbConn = DriverManager.getConnection(dbURL,userName,userPwd);
            System.out.println("连接成功");
        } catch (SQLException e) {
            System.out.println("连接失败");
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        Statement sql;
//        ResultSet rs;
        try {
            sql = dbConn.createStatement();
            String sqldate = "insert into dbo.UserTest values("+"'"+NUsername+"','"+NPassword+"','"+NNikename+"');";
            sql.executeUpdate(sqldate);
            dbConn.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}
