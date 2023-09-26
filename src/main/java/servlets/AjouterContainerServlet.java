package servlets;

import beans.Uticonnexion;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet(name = "AjouterContainerServlet", value = "/AjouterContainerServlet")
public class AjouterContainerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {




    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String container_title= request.getParameter("title_container");
        HttpSession session = request.getSession();
        int user_id = (int) session.getAttribute("user_id");
        try {
            Connection con = Uticonnexion.seConecter();
            PreparedStatement res = (PreparedStatement) con.prepareStatement("insert into task_container (container_title,user_id) values (?,?)");
            res.setString(1,container_title);
            res.setInt(2,user_id );
            res.executeUpdate();
            response.sendRedirect("HomeServlet");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
