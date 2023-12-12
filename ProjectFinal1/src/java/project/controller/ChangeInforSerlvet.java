package project.controller;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

import project.business.Account;
import project.data.UserDB;

public class ChangeInforSerlvet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();

        String url = "/inforUserafterter.jsp";

        String action = request.getParameter("action");
        if (action == null) {
            action = "display_users";
        }

        if (action.equals("display_users")) {
            ArrayList<Account> accounts = new ArrayList<>();
            accounts = UserDB.selectAccounts();
            request.setAttribute("accounts", accounts);
        } else if (action.equals("display_user")) {
            String emailAddress = request.getParameter("email");
            Account account = UserDB.selectAccount(emailAddress);
            session.setAttribute("account", account);
            url = "/Changethemselves.jsp"; 
        } else if (action.equals("update")) {
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String password = request.getParameter("password");
            String phoneNumber = request.getParameter("phoneNumber");
            String address = request.getParameter("address");
            String city = request.getParameter("city");
            String province = request.getParameter("province");

            Account account = (Account) session.getAttribute("account");
            account.setFirstName(firstName);
            account.setLastName(lastName);
            account.setPassword(password);
            account.setPhoneNumber(phoneNumber);
            account.setAddress(address);
            account.setCity(city);
            account.setProvince(province);
            UserDB.updateAccount(account);
            
            
            request.setAttribute("account", account);
        } else if (action.equals("delete_user")) {
            String email = request.getParameter("email");
            Account account = UserDB.selectAccount(email);

            UserDB.deleteAccount(account);

            ArrayList<Account> accounts = UserDB.selectAccounts();
            request.setAttribute("accounts", accounts);
        }
        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

}
