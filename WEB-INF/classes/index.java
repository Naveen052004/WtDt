import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;

public class index extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse res)throws ServletException,IOException {
        PrintWriter out = res.getWriter();
        out.println("Click Here if page is not redirected in 5sec-->><a href=\"index\" id =\"reload\">Redirect</a><script>document.getElementById(\"reload\").click();</script>");
        out.println("");
        int flag = 0;
        Cookie c[] = req.getCookies();
        out.println(c.length);
            for(int i=0;i<c.length;i++) {
                if (c[i].getName().equalsIgnoreCase("name") || c[i].getName().equalsIgnoreCase("pass")) {
                    flag = 1;
                    RequestDispatcher rd=req.getRequestDispatcher("home.html");
                    rd.forward(req,res);
                }
            }
        if (flag == 0) {
            RequestDispatcher rd=req.getRequestDispatcher("login.html");
                    rd.forward(req,res);
        }
    }
}