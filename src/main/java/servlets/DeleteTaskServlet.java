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

@WebServlet(name = "DeleteTaskServlet", value = "/DeleteTaskServlet")
public class DeleteTaskServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	 System.out.println("getting");
         long task_id = Long.parseLong(request.getParameter("task_id"));

         Connection con;
         try {
             con = Uticonnexion.seConecter();
             PreparedStatement res = con.prepareStatement("delete from task where task_id=?");
             res.setLong(1,task_id);
             res.executeUpdate();
             response.sendRedirect("HomeServlet");

         } catch (Exception e) {
             throw new RuntimeException(e);
         }



    	}
    }





