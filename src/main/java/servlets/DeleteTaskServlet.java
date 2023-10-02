package servlets;

import beans.Task;
import beans.Uticonnexion;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
             PreparedStatement res = (PreparedStatement) con.prepareStatement("delete from task where task_id=?");
             res.setLong(1,task_id);
             res.executeUpdate();
             response.sendRedirect("HomeServlet");

         } catch (Exception e) {
             throw new RuntimeException(e);
         }

 
   
    	}
    }





