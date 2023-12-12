package project.controller;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

import project.business.Account;
import project.data.UserDB;

public class ManagerAccountServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();

        String url = "/ManagerAccount.jsp";

        String action = request.getParameter("action");
        if (action == null) {
            action = "display_users";
        }

        if (action.equals("display_users")) {
           
            //            ArrayList<Account> accounts = new ArrayList<>();
//            accounts = UserDB.selectAccounts();
//            request.setAttribute("accounts", accounts);
            int page = 1;
            int pageSize = 9;
            
            if (request.getParameter("page") != null) {
                page = Integer.parseInt(request.getParameter("page"));
            }
            ArrayList<Account> accounts = UserDB.selectAccounts();
            request.setAttribute("accounts", accounts);
            int totalAccount = UserDB.getTotalUsers();
            int totalPages = (int) Math.ceil((double) totalAccount / pageSize);
            List<Account> list = UserDB.getAccountByPage(page, pageSize);
            request.setAttribute("totalAccount", totalAccount);
            request.setAttribute("pageSize", pageSize);
            request.setAttribute("accounts", list);
            request.setAttribute("currentPage", page);
            request.setAttribute("totalPages", totalPages);
            url = "/ManagerAccount.jsp";
            request.setAttribute("accounts", accounts);
        } else if (action.equals("display_user")) {
            String emailAddress = request.getParameter("email");
            Account account = UserDB.selectAccount(emailAddress);
            session.setAttribute("account", account);
            url = "/Update.jsp";
        } else if (action.equals("update_user")) {
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String password = request.getParameter("password");
            String phoneNumber = request.getParameter("phoneNumber");
            String address = request.getParameter("address");
            String city = request.getParameter("city");
            String province = request.getParameter("province");
            
            int page = 1;
            int pageSize = 9;
            
            if (request.getParameter("page") != null) {
                page = Integer.parseInt(request.getParameter("page"));
            }
            int totalAccount = UserDB.getTotalUsers();
            int totalPages = (int) Math.ceil((double) totalAccount / pageSize);
            List<Account> list = UserDB.getAccountByPage(page, pageSize);
            request.setAttribute("totalAccount", totalAccount);
            request.setAttribute("pageSize", pageSize);
            request.setAttribute("accounts", list);
            request.setAttribute("currentPage", page);
            request.setAttribute("totalPages", totalPages);
            url = "/ManagerAccount.jsp";
            
            Account account = (Account) session.getAttribute("account");
            account.setFirstName(firstName);
            account.setLastName(lastName);
            account.setPassword(password);
            account.setPhoneNumber(phoneNumber);
            account.setAddress(address);
            account.setCity(city);
            account.setProvince(province);
            UserDB.updateAccount(account);

            ArrayList<Account> accounts = UserDB.selectAccounts();
            request.setAttribute("accounts", accounts);
            
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