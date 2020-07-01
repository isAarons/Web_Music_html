package register;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "RegisterServlet",urlPatterns = {"/zhuce"})
public class RegisterServlet extends HttpServlet {
    private String name ;
    private String password;
    private String nickname;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("gb2312");
        response.setContentType("text/html;charset=gb2312");

        String name = request.getParameter("Name");
        name = new String(name.getBytes("iso8859-1"),"gb2312");
        String password = request.getParameter("Password");
        password = new String(password.getBytes("iso8859-1"),"gb2312");
        String nickname = request.getParameter("Nickname");
        nickname = new String(nickname.getBytes("iso8859-1"),"gb2312");
        PrintWriter out = response.getWriter();
        out.println("<html>");
        out.println("<head>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h3>姓名："+name+"</h3><p>");
        out.println("<h3>年龄："+password+"</h3><p>");
        out.println("<h3>年龄："+nickname+"</h3><p>");
        out.println("</body>");
        out.println("</html>");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("Name");
        name = new String(name.getBytes("iso8859-1"),"gb2312");
        String password = request.getParameter("Password");
        password = new String(password.getBytes("iso8859-1"),"gb2312");
        String nickname = request.getParameter("Nickname");
        nickname = new String(nickname.getBytes("iso8859-1"),"gb2312");
        PrintWriter out = response.getWriter();
//        doPost(request,response);
        new RegisterSql(name,password,nickname);
    }

    @Override
    public void init() throws ServletException {
        super.init();
        new RegisterSql(name,password,nickname);
    }
}
