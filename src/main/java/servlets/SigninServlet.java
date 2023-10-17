package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Uticonnexion;

@WebServlet(name = "SigninServlet", value = "/SigninServlet")
public class SigninServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        this.getServletContext().getRequestDispatcher("/WEB-INF/signin.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        RequestDispatcher dispatcher=null;
            String uemail=request.getParameter("email");
            String uname=request.getParameter("name");
            String upassword=request.getParameter("password");
            try {
                Connection con = Uticonnexion.seConecter();
                PreparedStatement pst = con.prepareStatement("insert  into user(name,email,password) values (?,?,?)");
                pst.setString(1,uname);
                pst.setString(2,uemail);
                pst.setString(3,upassword);
                int rowCount=pst.executeUpdate();

                PreparedStatement pstr=con.prepareStatement("select * from user where email=? and password=?");
                pstr.setString(1,uemail);
                pstr.setString(2,upassword);

                HttpSession session = request.getSession();

                ResultSet res=pstr.executeQuery();
                if(res.next()) {
                       session.setAttribute("user_id", res.getInt("user_id"));
                    System.out.println(res.getString("user_id"));
                    response.sendRedirect("/HomeServlet");
                    if (rowCount > 0) {
                        request.setAttribute("status", "success");

                    } else {
                        request.setAttribute("status", "failed");
                    }
                }
            } catch (Exception e) {
                throw new RuntimeException(e);

            }


    }
}
