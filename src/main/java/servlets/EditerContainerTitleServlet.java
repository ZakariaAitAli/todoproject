package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Uticonnexion;

@WebServlet(name = "EditerContainerTitleServlet", value = "/EditerContainerTitleServlet")
public class EditerContainerTitleServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String container_title= request.getParameter("new_title_container");
        String old_title=request.getParameter("old_title");
        HttpSession session = request.getSession();
        int user_id = (int) session.getAttribute("user_id");
        try {
            Connection con = Uticonnexion.seConecter();
            PreparedStatement ps = con.prepareStatement("Select * from task_container where container_title=? and user_id=?");
            ps.setString(1,old_title);
            ps.setInt(2,user_id);
            ResultSet result = ps.executeQuery();
            while (result.next()) {
                PreparedStatement res = con.prepareStatement("update task_container set container_title=? where user_id=? and container_id=?");
                res.setString(1, container_title);
                res.setInt(2, user_id);
                res.setInt(3, result.getInt("container_id"));
                res.executeUpdate();
                response.sendRedirect("HomeServlet");
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    }
