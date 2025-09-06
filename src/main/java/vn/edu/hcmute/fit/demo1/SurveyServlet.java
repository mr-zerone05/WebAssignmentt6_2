package vn.edu.hcmute.fit.demo1;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/survey")
public class SurveyServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // GIỮ index.jsp ngoài WEB-INF → forward thẳng ra /index.jsp
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String firstName = request.getParameter("firstName");
        String lastName  = request.getParameter("lastName");
        String email     = request.getParameter("email");
        String heardFrom = request.getParameter("heardFrom");

        String wantsUpdates = request.getParameter("wantsUpdates");
        if (wantsUpdates == null) wantsUpdates = "No";

        String contactVia = request.getParameter("contactVia");

        User user = new User(firstName, lastName, email, heardFrom, wantsUpdates, contactVia);
        request.setAttribute("user", user);

        // Trang hiển thị kết quả nằm trong WEB-INF
        request.getRequestDispatcher("/WEB-INF/survey.jsp").forward(request, response);
    }
}
