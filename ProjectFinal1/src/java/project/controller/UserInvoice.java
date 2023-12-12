package project.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import project.business.Account;
import project.business.Invoice;
import project.business.Product;
import project.data.UserDB;

public class UserInvoice extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        try {
        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        if (action == null) {
            action = "account"; 
        }
        if (action.equals("account")) {
            Account account = (Account) session.getAttribute("acc");
            int a = account.getUserId();
            List<Invoice> invoices = UserDB.selectInvoiceByUserId(a);
            request.setAttribute("invoices", invoices);
            request.getRequestDispatcher("UserInvoice.jsp").forward(request, response);
            } 
        else if (action.equals("admin")) {
            List<Invoice> invoices = UserDB.getAllInvoices();
            request.setAttribute("invoices", invoices);
            request.getRequestDispatcher("UserInvoice.jsp").forward(request, response);
        }
        }catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("home");
        }
        
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}