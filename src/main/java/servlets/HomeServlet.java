package servlets;

import javax.servlet.*;
import javax.servlet.http.*;

import org.apache.tomcat.util.net.AbstractEndpoint.Handler;

import beans.HighPriorityHandler;
import beans.LowPriorityHandler;
import beans.MediumPriorityHandler;
import beans.TaskProxy;
import beans.User;

import javax.servlet.annotation.*;

import java.io.IOException;
import java.net.URLEncoder;
import java.security.Key;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.concurrent.Semaphore;

@WebServlet(name = "HomeServlet", value = "/HomeServlet")
public class HomeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get Data from DB
        // Looping result and do treatement
        HttpSession session = request.getSession();
        int user_id = (int) session.getAttribute("user_id");


    
        User user = new User();
        try {
           
            HashMap container_task = user.getContainers(user_id);
            System.out.println("sizeeeee");
            System.out.println(container_task.size());

            //ArrayList<String[]> all_tasks = user.getAllTasks();
            //  ArrayList<String[]> all_containers = user.getAllContainers();
            int i = 0;
            for (Object key : container_task.keySet()) {
                System.out.println("heyyyyy");
                ArrayList<String[]> value = (ArrayList<String[]>) container_task.get(key);
                System.out.println("Key: " + key + ", Value: " + value);
            }
            for (Object key : container_task.keySet()) {
                System.out.println("echoo");
                ArrayList<String[]> value = (ArrayList<String[]>) container_task.get(key);
                for (String[] value_info : value) {
                    ;
                    System.out.println(value_info[2]);
                    System.out.println("ok");
                    System.out.println();
                    System.out.println("echoaaaaaaaaaaa");
                    
                }
            }
            request.setAttribute("container_task", container_task);
            this.getServletContext().getRequestDispatcher("/WEB-INF/home.jsp").forward(request, response);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }


    }

    @Override

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("gigigigii");

        String title_task = request.getParameter("title_task");
        String desc_task = request.getParameter("desc_task");
        String container_title = request.getParameter("ajouter");
        String dueDate = request.getParameter("dueDate");


        String action = request.getParameter("action");
        String task_id = request.getParameter("sup_task");
        String high_pr_btn = request.getParameter("high-pr-btn");


        boolean alert;

        String alert_txt;


                // Traitement du premier formulaire
                // ...

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

        try {

            User user = new User();




          if (action.equals("ajout")) {
                HttpSession session = request.getSession();
                int user_id = (int) session.getAttribute("user_id");
                System.out.println("ajout");
                user.insetTask(title_task, desc_task, container_title, user_id,dueDate);
                response.sendRedirect("HomeServlet");
                
            } else if (action.equals("Suppression")) {
                System.out.println("supp3");
                TaskProxy supp=new TaskProxy();
                alert = supp.supprimer(task_id);
                System.out.println(alert);
                System.out.println("supp3");
                if (alert == true) {
                    boolean afficherelement = true;

                    // Stockage du code HTML dans l'objet de requête
                    request.setAttribute("afficherelement",afficherelement);

                    // Redirection de la requête vers la page JSP
                    response.sendRedirect("HomeServlet");
                } else{
                    supp.supprimer(task_id);
                    response.sendRedirect("HomeServlet");

                }
            }
          else if(action.equals("Suppression-high")){
              TaskProxy supp=new TaskProxy();
            supp.supprimer(high_pr_btn);
              response.sendRedirect("HomeServlet");
          }


        } catch (Exception e) {
            e.printStackTrace();
        }


    }
}