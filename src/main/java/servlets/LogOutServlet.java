package servlets;

import java.io.IOException;

/**
 * Servlet implementation class LogOutServlet
 */
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "LogOutServlet", value = "/LogOutServlet")
    public class LogOutServlet extends HttpServlet {
        @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

            HttpSession session = request.getSession(false);

            // Vérification si l'utilisateur est connecté
            if (session != null) {
                // Invalidation de la session
                session.invalidate();
            }
            // Redirection vers la page de connexion
            response.sendRedirect(request.getContextPath() + "/LoginServlet");
        }


        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        }
    }
