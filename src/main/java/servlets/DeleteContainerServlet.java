package servlets;

import beans.Uticonnexion;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet(name = "DeleteContainerServlet", value = "/DeleteContainerServlet")
public class DeleteContainerServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String title_container=request.getParameter("delete_container");

        Connection con;
        try {
            con = Uticonnexion.seConecter();
            PreparedStatement res = (PreparedStatement) con.prepareStatement("delete from task_container where container_title=?");
            res.setString(1,title_container);
            res.executeUpdate();
            response.sendRedirect("HomeServlet");

        } catch (Exception e) {
            throw new RuntimeException(e);
        }


}
}
