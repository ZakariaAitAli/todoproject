package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Uticonnexion;

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
            PreparedStatement res = con.prepareStatement("insert into task_container (container_title,user_id) values (?,?)");
            res.setString(1,container_title);
            res.setInt(2,user_id );
            res.executeUpdate();
            response.sendRedirect("HomeServlet");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
