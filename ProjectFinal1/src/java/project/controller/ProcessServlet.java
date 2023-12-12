package project.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import project.business.Cart;
import project.business.LineItem;
import project.business.Product;
import project.data.UserDB;


@WebServlet(name = "ProcessServlet", urlPatterns = {"/process"})
public class ProcessServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        HttpSession session = request.getSession(true);

        Cart cart = null;
        Object o = session.getAttribute("cart");

        if(o!=null) {
            cart=(Cart)o;
        } else {
            cart = new Cart();
        }
        int num = Integer.parseInt(request.getParameter("num"));
        String productId = request.getParameter("productId");

        if (num == -1 && cart.getQuantitybyID(productId) == 1)
            cart.removeItem(productId);
        else {
             Product product = UserDB.selectProductById(productId);
                LineItem lineItem = new LineItem();
                lineItem.setProduct(product);
                lineItem.setQuantity(num);
                cart.addItem(lineItem);
        }
        
        List<LineItem> list = cart.getItems();
        session.setAttribute("cart", cart);
        session.setAttribute("size", list.size());
        request.getRequestDispatcher("cart.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        HttpSession session = request.getSession(true);
        Cart cart = null;
        Object o = session.getAttribute("cart");
        if (o != null)
               cart = (Cart)o;
        else
            cart = new Cart();
        String productId = request.getParameter("productId");
        
        cart.removeItem(productId);
        List<LineItem> lineItem = cart.getItems();
        session.setAttribute("cart", cart);
        session.setAttribute("size", lineItem.size());
        request.getRequestDispatcher("cart.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
