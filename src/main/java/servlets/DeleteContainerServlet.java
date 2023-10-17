package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Uticonnexion;

@WebServlet(name = "DeleteContainerServlet", value = "/DeleteContainerServlet")
public class DeleteContainerServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String title_container=request.getParameter("delete_container");

        Connection con;
        try {
            con = Uticonnexion.seConecter();
            PreparedStatement res = con.prepareStatement("delete from task_container where container_title=?");
            res.setString(1,title_container);
            res.executeUpdate();
            response.sendRedirect("HomeServlet");

        } catch (Exception e) {
            throw new RuntimeException(e);
        }


}
}
