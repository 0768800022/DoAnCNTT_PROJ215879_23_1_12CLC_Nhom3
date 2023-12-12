package project.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import project.business.Account;
import project.business.Cart;
import project.business.Invoice;
import project.business.Invoice_detail;
import project.business.LineItem;
import project.business.Product;
import project.data.UserDB;


public class CheckoutServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("acc");
        String userEmail = account.getEmail();
        Cart c = (Cart)session.getAttribute("cart");
        List<LineItem> listitem = c.getItems();
        LocalDate d = java.time.LocalDate.now();
        Date currentDate = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String formattedDate = dateFormat.format(currentDate);
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String date = d.format(formatter);
        if (account == null) {
         response.sendRedirect("login.jsp");
        } else {
        if (c.getCount() > 0)
        {
            Invoice invoice = new Invoice();
            invoice.setAccount(account);
            invoice.setInvoiceDate(currentDate);
            invoice.setTotalPay((int) c.getTotalPrice());
            UserDB.saveInvoice(invoice);
            for(int i = 0 ; i < c.getCount(); i++){
               LineItem item = listitem.get(i);
               Invoice_detail od = new Invoice_detail();
               od.setInvoice(invoice);
               od.setProduct(item.getProduct());
               od.setQuantity(item.getQuantity());
               od.setPrice(item.getTotal());
               UserDB.saveInvoiceDetail(od);
            }
        EmailCheckOut.sendInvoiceEmail(userEmail, invoice ,c);
        session.removeAttribute("cart");
        session.removeAttribute("size");
        request.getRequestDispatcher("thanks.jsp").forward(request, response);  
        }
        else {
            request.setAttribute("message", "No item in your cart ");
            request.getRequestDispatcher("checkout.jsp").forward(request, response);
        }
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