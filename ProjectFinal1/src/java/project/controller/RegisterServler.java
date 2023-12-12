package project.controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import project.business.Account;
import project.data.UserDB;

public class RegisterServler extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        String url = "/index.html";
        
        String action = request.getParameter("action");
        if (action == null) {
            action = "join";
        }

        if (action.equals("join")) {
            url = "/login.jsp";
        } 
        else if (action.equals("add")) {
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String phoneNumber = request.getParameter("phoneNumber");
            String address = request.getParameter("address");
            String city = request.getParameter("city");
            String province = request.getParameter("province");

            Account user = new Account();
            user.setEmail(email);
            user.setFirstName(firstName);
            user.setLastName(lastName);
            user.setPassword(password);
            user.setPhoneNumber(phoneNumber);
            user.setAddress(address);
            user.setCity(city);
            user.setProvince(province);

            String message;
            if (UserDB.emailExists(user.getEmail())) {
                message = "This email address already exists.<br>" +
                          "Please enter another email address.";
                url = "/register.jsp";
            }
            else {
                message = "";
                url = "/inforUser.jsp";
                UserDB.insert(user);
            }
            request.setAttribute("user", user);
            request.setAttribute("message", message);
        }
        getServletContext().getRequestDispatcher(url).forward(request, response);
    }    
}
