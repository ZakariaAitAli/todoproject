package servlets;

import  beans.Uticonnexion;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        this.getServletContext().getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);

    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uemail=request.getParameter("email");
        String upassword=request.getParameter("password");
        HttpSession session=request.getSession();
        try {
            Connection con = Uticonnexion.seConecter();
            PreparedStatement pst=con.prepareStatement("select * from user where email=? and password=?");
            pst.setString(1,uemail);
            pst.setString(2,upassword);

            ResultSet res=pst.executeQuery();
            if(res.next()){
                session.setAttribute("user_id",res.getInt("user_id"));
                System.out.println(res.getString("user_id"));
                response.sendRedirect("HomeServlet");
               // this.getServletContext().getRequestDispatcher("/WEB-INF/HomeServlet").forward(request, response);
                System.out.println("registerok");





            }
            else{
                request.setAttribute("status","failed");
                request.getRequestDispatcher("login.jsp");
                System.out.println("registerono");
            }
        }catch (Exception e){


            e.printStackTrace();

        }
    }
}
