package project.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import project.business.Account;
import project.business.Cart;
import project.business.LineItem;
import project.business.Product;
import project.data.UserDB;

public class AddToCartServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            response.setContentType("text/html;charset=UTF-8"); 
            response.setCharacterEncoding("UTF-8");
            request.setCharacterEncoding("UTF-8");
            HttpSession session = request.getSession();
            Account account = (Account) session.getAttribute("acc");
            if (account == null) {
             response.sendRedirect("login.jsp");
            } else {
            String url = "/home.jsp";
            ServletContext sc = getServletContext();

            String action = request.getParameter("action");
            if (action == null) {
                action = "cart";
            }

            if (action.equals("shop")) {
                url = "/home.jsp";
            } 
            else if (action.equals("cart")) {
        
            String productId = request.getParameter("productId");
            Product product =UserDB.selectProductById(productId);
            String quantityString = request.getParameter("quantity");
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new Cart();
            }
            int quantity;
            try {
                quantity = Integer.parseInt(quantityString);
                if (quantity < 0) {
                    quantity = 1;
                }
            } catch (NumberFormatException nfe) {
                quantity = 1;
            }
            List<LineItem> listI = cart.getItems();
            LineItem lineItem = new LineItem();
            lineItem.setProduct(product);
            lineItem.setQuantity(quantity);
            if (quantity > 0) {
                cart.addItem(lineItem);
            } else if (quantity == 0) {
                cart.removeItem(productId);
            } 
            
            session.setAttribute("cart", cart);
            session.setAttribute("size", listI.size());
            url = "/cart.jsp";

       
            }   else if (action.equals("update")) {
                String productId = request.getParameter("productId");
                Product product =UserDB.selectProductById(productId);
                String quantityString = request.getParameter("quantity");

                Cart cart = (Cart) session.getAttribute("cart");
                if (cart == null) {
                    cart = new Cart();
                }
                int quantity;
                try {
                    quantity = Integer.parseInt(quantityString);
                    if (quantity < 0) {
                        quantity = 1;
                    }
                } catch (NumberFormatException nfe) {
                    quantity = 1;
                }

                List<LineItem> listI = cart.getItems();
                LineItem lineItem = new LineItem();
                lineItem.setProduct(product);
                lineItem.setQuantity(quantity);
                if (quantity > 0) {
                    cart.addItem(lineItem);
                } else if (quantity == 0) {
                    cart.removeItem(productId);
                } 

                session.setAttribute("cart", cart);
                session.setAttribute("size", listI.size());
                url = "/cart.jsp";
            }
                sc.getRequestDispatcher(url)
                        .forward(request, response);
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
