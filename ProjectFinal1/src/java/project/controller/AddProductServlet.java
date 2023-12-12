package project.controller;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

import project.business.Product;
import project.data.UserDB;

public class AddProductServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();

        String url = "/ManagerProduct.jsp";

        String action = request.getParameter("action");
        if (action == null) {
            action = "display_products";
        }
        if (action.equals("display_products")) {

            int page = 1;
            int pageSize = 3;

            if (request.getParameter("page") != null) {
                page = Integer.parseInt(request.getParameter("page"));
            }
            int totalProducts = UserDB.getTotalProducts();
            int totalPages = (int) Math.ceil((double) totalProducts / pageSize);

            List<Product> list = UserDB.getProductsByPage(page, pageSize);

            request.setAttribute("products", list);
            request.setAttribute("currentPage", page);
            request.setAttribute("totalPages", totalPages);
            url = "/ManagerProduct.jsp";
        } else if (action.equals("display_product")) {
            String productId = request.getParameter("productId");
            Product product = UserDB.selectProductById(productId);
            session.setAttribute("product", product);
            url = "/Product.jsp";
        } else if (action.equals("update_product")) {
            String productName = request.getParameter("productName");
            String productImage = request.getParameter("productImage");
            String productDescription = request.getParameter("productDescription");
            String SproductPrice = request.getParameter("productPrice");
            String productCategory = request.getParameter("productCategory");
            String SinvoiceID = request.getParameter("invoiceID");
            int productPrice;
            try {
                productPrice = Integer.parseInt(SproductPrice);
            } catch (NumberFormatException nfe) {
                productPrice = 1;
            }
            Product product = (Product) session.getAttribute("product");
            product.setProductName(productName);
            product.setProductImage(productImage);
            product.setProductDescription(productDescription);
            product.setProductPrice(productPrice);
            product.setProductCategory(productCategory);

            UserDB.update(product);

            List<Product> products = UserDB.selectProducts();
            request.setAttribute("products", products);
            url = "/ManagerProduct.jsp";
        } else if (action.equals("delete_product")) {
            String productId = request.getParameter("productId");
            Product product = UserDB.selectProductById(productId);

            UserDB.delete(product);

            List<Product> products = UserDB.selectProducts();
            request.setAttribute("products", products);
            url = "/ManagerProduct.jsp";
        } else if (action.equals("add")) {
            try {
                String productName = request.getParameter("productName");
                String productImage = request.getParameter("productImage");
                String productDescription = request.getParameter("productDescription");
                double productPrice = Double.parseDouble(request.getParameter("productPrice"));
                String productCategory = request.getParameter("productCategory");

                Product product = new Product();
                product.setProductName(productName);
                product.setProductImage(productImage);
                product.setProductDescription(productDescription);
                product.setProductPrice(productPrice);
                product.setProductCategory(productCategory);

                if (productName != null && productImage != null && productDescription != null && productCategory != null) {
                    UserDB.insert(product);
                    url = "/ManagerProduct.jsp";
                    request.setAttribute("product", product);
                } else {
                    url = "/error.jsp";
                    request.setAttribute("errorMessage", "Validation error: All fields are required.");
                }
            } catch (NumberFormatException e) {
                url = "/error.jsp";
                request.setAttribute("errorMessage", "Validation error: Invalid product price.");
            }
        }
        getServletContext().getRequestDispatcher(url).forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
