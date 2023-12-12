package project.data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import project.business.*;

public class UserDB {

    public static void insert(Account user) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            em.persist(user);
            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
            trans.rollback();
        } finally {
            em.close();
        }
    }

    public static void insert(Admin admin) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            em.persist(admin);
            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
            trans.rollback();
        } finally {
            em.close();
        }
    }

    public static void update(Account user) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            em.merge(user);
            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
            trans.rollback();
        } finally {
            em.close();
        }
    }

    public static void delete(Account user) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            em.remove(em.merge(user));
            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
            trans.rollback();
        } finally {
            em.close();
        }
    }

    public static Account selectUser(String email) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        String qString = "SELECT u FROM Account u "
                + "WHERE u.email = :email";
        TypedQuery<Account> q = em.createQuery(qString, Account.class);
        q.setParameter("email", email);
        try {
            Account user = q.getSingleResult();
            return user;
        } catch (NoResultException e) {
            return null;
        } finally {
            em.close();
        }
    }

    public static Admin selectAdmin(String email) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        String aString = "SELECT a FROM Admin a "
                + "WHERE a.email = :email";
        TypedQuery<Admin> a = em.createQuery(aString, Admin.class);
        a.setParameter("email", email);
        try {
            Admin admin = a.getSingleResult();
            return admin;
        } catch (NoResultException e) {
            return null;
        } finally {
            em.close();
        }
    }

    public static Account getUser(String email, String password) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        String qString = "SELECT u FROM Account u "
                + "WHERE u.email = :email AND u.password = :password";
        TypedQuery<Account> q = em.createQuery(qString, Account.class);
        q.setParameter("email", email);
        q.setParameter("password", password);

        try {
            Account user = q.getSingleResult();
            return user;
        } catch (NoResultException e) {
            return null; // User not found with the provided email and password
        } finally {
            em.close();
        }
    }

    public static Admin getAdmin(String email, String password) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        String aString = "SELECT a FROM Admin a "
                + "WHERE a.email = :email AND a.password = :password";
        TypedQuery<Admin> a = em.createQuery(aString, Admin.class);
        a.setParameter("email", email);
        a.setParameter("password", password);

        try {
            Admin admin = a.getSingleResult();
            return admin;
        } catch (NoResultException e) {
            return null; // Admin not found with the provided email and password
        } finally {
            em.close();
        }
    }

    public static boolean emailExists(String email) {
        Account u = selectUser(email);
        return u != null;
    }

    public static boolean firstNameExists(String firstName) {
        Account u = selectUser(firstName);
        return u != null;
    }

    public static ArrayList<Account> selectUsers() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public static ArrayList<Admin> selectAdmins() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public static int insertAccount(Account account) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

        String query
                = "INSERT INTO Account (Email, FirstName, LastName, Password, PhoneNumber, Address, City, Province) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, account.getEmail());
            ps.setString(2, account.getFirstName());
            ps.setString(3, account.getLastName());
            ps.setString(4, account.getPassword());
            ps.setString(5, account.getPhoneNumber());
            ps.setString(6, account.getAddress());
            ps.setString(7, account.getCity());
            ps.setString(8, account.getProvince());
            return ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
            return 0;
        } finally {
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static int updateAccount(Account account) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

        String query = "UPDATE Account SET "
                + "FirstName = ?, "
                + "LastName = ?, "
                + "Password = ?, "
                + "PhoneNumber = ?, "
                + "Address = ?, "
                + "City = ?, "
                + "Province = ? "
                + "WHERE Email = ?";

        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, account.getFirstName());
            ps.setString(2, account.getLastName());
            ps.setString(3, account.getPassword());
            ps.setString(4, account.getPhoneNumber());
            ps.setString(5, account.getAddress());
            ps.setString(6, account.getCity());
            ps.setString(7, account.getProvince());
            ps.setString(8, account.getEmail());

            return ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
            return 0;
        } finally {
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static int deleteAccount(Account account) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

        String query = "DELETE FROM Account "
                + "WHERE Email = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, account.getEmail());

            return ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
            return 0;
        } finally {
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static boolean emailExistss(String email) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;

        String query = "SELECT Email FROM Account "
                + "WHERE Email = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, email);
            rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            System.out.println(e);
            return false;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static Account selectAccount(String email) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;

        String query = "SELECT * FROM Account "
                + "WHERE Email = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, email);
            rs = ps.executeQuery();
            Account account = null;
            if (rs.next()) {
                account = new Account();
//                user.setUserId(rs.getString("UserId"));
                account.setFirstName(rs.getString("FirstName"));
                account.setLastName(rs.getString("LastName"));
                account.setEmail(rs.getString("Email"));
                account.setPassword(rs.getString("Password"));
                account.setPhoneNumber(rs.getString("PhoneNumber"));
                account.setAddress(rs.getString("Address"));
                account.setCity(rs.getString("City"));
                account.setProvince(rs.getString("Province"));

            }
            return account;
        } catch (SQLException e) {
            System.out.println(e);
            return null;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static ArrayList<Account> selectAccounts() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;

        String query = "SELECT * FROM Account";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            ArrayList<Account> accounts = new ArrayList<>();
            while (rs.next()) {
                Account account = new Account();
//                account.setUserId(rs.getString("UserId"));
                account.setFirstName(rs.getString("FirstName"));
                account.setLastName(rs.getString("LastName"));
                account.setEmail(rs.getString("Email"));
                account.setPassword(rs.getString("Password"));
                account.setPhoneNumber(rs.getString("PhoneNumber"));
                account.setAddress(rs.getString("Address"));
                account.setCity(rs.getString("City"));
                account.setProvince(rs.getString("Province"));

                accounts.add(account);
            }
            return accounts;
        } catch (SQLException e) {
            e.printStackTrace();  // Log or handle the exception appropriately
            return null;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static void insert(Product product) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            em.persist(product);
            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
            trans.rollback();
        } finally {
            em.close();
        }
    }

    public static void update(Product product) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            em.merge(product);
            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
            trans.rollback();
        } finally {
            em.close();
        }
    }

    public static void delete(Product product) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            em.remove(em.merge(product));
            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
            trans.rollback();
        } finally {
            em.close();
        }
    }

    public static boolean productExists(String producId) {
        Product u = selectProductById(producId);
        return u != null;
    }

    public static List<Product> selectProducts() {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        String qString = "SELECT u from Product u";
        TypedQuery<Product> q = em.createQuery(qString, Product.class);

        List<Product> products;
        try {
            products = q.getResultList();
            if (products == null || products.isEmpty()) {
                products = null;
            }
        } finally {
            em.close();
        }
        return products;
    }

    public static Product selectProduct(String productName) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        String qString = "SELECT u FROM Product u "
                + "WHERE u.productName = :productName";
        TypedQuery<Product> q = em.createQuery(qString, Product.class);
        q.setParameter("productName", productName);
        try {
            Product product = q.getSingleResult();
            return product;
        } catch (NoResultException e) {
            return null;
        } finally {
            em.close();
        }
    }

    public static Product selectProductById(String productId) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        String qString = "SELECT u FROM Product u "
                + "WHERE u.productId = :productId";
        TypedQuery<Product> q = em.createQuery(qString, Product.class);
        q.setParameter("productId", productId);

        try {
            Product product = q.getSingleResult();
            return product;
        } catch (NoResultException e) {
            return null;
        } finally {
            em.close();
        }
    }

    public static Product getProductByID(String id) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        try {
            Product product = em.find(Product.class, id);
            return product;
        } finally {
            em.close();
        }
    }

    public static List<Product> getProductsBySaleID(int saleID) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        try {
            // Build JPQL query to select products associated with a specific sale ID
            String qString = "SELECT p FROM Product p JOIN p.sales s WHERE s.id = :saleID";

            TypedQuery<Product> q = em.createQuery(qString, Product.class);
            q.setParameter("saleID", saleID);

            // Execute the query and return the result
            return q.getResultList();
        } finally {
            em.close();
        }
    }



    public static List<Product> getAllProducts() {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        String qString = "SELECT p FROM Product p";
        TypedQuery<Product> q = em.createQuery(qString, Product.class);
        try {
            List<Product> products = q.getResultList();
            return products;
        } finally {
            em.close();
        }
    }

    public static List<Product> getTop3Products() {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        String qString = "SELECT p FROM Product p ORDER BY p.rating DESC";
        TypedQuery<Product> q = em.createQuery(qString, Product.class).setMaxResults(3);
        try {
            List<Product> products = q.getResultList();
            return products;
        } finally {
            em.close();
        }
    }

    public static List<Product> getNext3Products(int offset) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        String qString = "SELECT p FROM Product p ORDER BY p.rating DESC";
        TypedQuery<Product> q = em.createQuery(qString, Product.class).setFirstResult(offset).setMaxResults(3);
        try {
            List<Product> products = q.getResultList();
            return products;
        } finally {
            em.close();
        }
    }


    public static List<Product> searchByName(String productName) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        String qString = "SELECT p FROM Product p WHERE p.productName LIKE :productName";
        TypedQuery<Product> q = em.createQuery(qString, Product.class);
        q.setParameter("productName", "%" + productName + "%");
        try {
            List<Product> products = q.getResultList();
            return products;
        } finally {
            em.close();
        }
    }

    public static List<Account> searchUserByName(String firstName) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        String qString = "SELECT p FROM Account p WHERE p.firstName LIKE :firstName";
        TypedQuery<Account> q = em.createQuery(qString, Account.class);
        q.setParameter("firstName", "%" + firstName + "%");
        try {
            List<Account> accounts = q.getResultList();
            return accounts;
        } finally {
            em.close();
        }
    }

    public static List<Product> searchProductsByName(String productName) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        String jpql = "SELECT p FROM Product p WHERE LOWER(p.productName) LIKE LOWER(:productName)";
        TypedQuery<Product> query = em.createQuery(jpql, Product.class);
        query.setParameter("productName", "%" + productName + "%");

        return query.getResultList();
    }

    public static List<Product> getProductsByCID(int categoryID) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        try {
            // Build JPQL query to select products based on category ID
            String qString = "SELECT p FROM Product p WHERE p.category.id = :categoryID";

            TypedQuery<Product> q = em.createQuery(qString, Product.class);
            q.setParameter("categoryID", categoryID);

            // Execute the query and return the result
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    public static Product getLast() {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        try {
            // Build JPQL query to select the last product
            String qString = "SELECT p FROM Product p ORDER BY p.id DESC";

            TypedQuery<Product> q = em.createQuery(qString, Product.class);
            q.setMaxResults(1); // Set max results to 1 to get only the last product

            // Execute the query and return the result
            List<Product> resultList = q.getResultList();
            return resultList.isEmpty() ? null : resultList.get(0);
        } finally {
            em.close();
        }
    }

    public static void addInvoice(Invoice invoice) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            em.persist(invoice);
            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
            trans.rollback();
        } finally {
            em.close();
        }
    }

    public static void addInvoiceDetail(Invoice_detail invoice_detail) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            em.persist(invoice_detail);
            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
            trans.rollback();
        } finally {
            em.close();
        }
    }

    public static int saveInvoice(Invoice invoice) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction transaction = em.getTransaction();

        try {
            transaction.begin();
            em.persist(invoice);
            transaction.commit();
            return invoice.getInvoiceID();
        } catch (Exception e) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            em.close();
        }
        return -1;
    }

    public static void saveInvoiceDetail(Invoice_detail invoice_detail) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction transaction = em.getTransaction();

        try {
            transaction.begin();
            em.persist(invoice_detail);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            em.close();
        }
    }

    public static void insert(Invoice_detail invoice_detail) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            em.persist(invoice_detail);
            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
            trans.rollback();
        } finally {
            em.close();
        }
    }

    public static List<Invoice> selectInvoiceByUserId(int userId) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        String qString = "SELECT i FROM Invoice i WHERE i.account.userId = :userId";
        TypedQuery<Invoice> q = em.createQuery(qString, Invoice.class);
        q.setParameter("userId", userId);

        try {
            List<Invoice> invoice = q.getResultList();
            return invoice;
        } catch (NoResultException e) {
            return null;
        } finally {
            em.close();
        }
    }

    public static List<Invoice_detail> selectInvoiceDetail(int invoiceID) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        String qString = "SELECT i FROM Invoice_detail i WHERE i.invoice.invoiceID = :invoiceID";
        TypedQuery<Invoice_detail> q = em.createQuery(qString, Invoice_detail.class);
        q.setParameter("invoiceID", invoiceID);

        try {
            List<Invoice_detail> invoiceDetail = q.getResultList();
            return invoiceDetail;
        } catch (NoResultException e) {
            return null;
        } finally {
            em.close();
        }
    }

    public static int getTotalProducts() {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        int count = 0;
        String qString = "SELECT COUNT(p) FROM Product p";
        try {
            Query query = em.createQuery(qString);
            count = ((Number) query.getSingleResult()).intValue();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    public static List<Product> getProductsByPage(int page, int pageSize) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        List<Product> list = null;
        try {
            String qString = "SELECT p FROM Product p ORDER BY p.productId";
            Query query = em.createQuery(qString);
            query.setFirstResult((page - 1) * pageSize);
            query.setMaxResults(pageSize);

            list = query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static List<Account> getAccountByPage(int page, int pageSize) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        List<Account> list = null;
        try {
            String qString = "SELECT a FROM Account a ORDER BY a.userId";
            Query query = em.createQuery(qString);
            query.setFirstResult((page - 1) * pageSize);
            query.setMaxResults(pageSize);

            list = query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static int getTotalUsers() {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        int count = 0;
        String qString = "SELECT COUNT(a) FROM Account a";
        try {
            Query query = em.createQuery(qString);
            count = ((Number) query.getSingleResult()).intValue();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }
    public static List<Invoice> getAllInvoices() {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        String qString = "SELECT p FROM Invoice p";
        TypedQuery<Invoice> q = em.createQuery(qString, Invoice.class);
        try {
            List<Invoice> invoices = q.getResultList();
            return invoices;
        } finally {
            em.close();
        }
    }
    
    public static Invoice selectInvoiceById(int invoiceID) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        String qString = "SELECT u FROM Invoice u "
                + "WHERE u.invoiceID = :invoiceID";
        TypedQuery<Invoice> q = em.createQuery(qString, Invoice.class);
        q.setParameter("invoiceID", invoiceID);

        try {
            Invoice invoice = q.getSingleResult();
            return invoice;
        } catch (NoResultException e) {
            return null;
        } finally {
            em.close();
        }
    }
    
    public static void delete(Invoice invoice) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            em.remove(em.merge(invoice));
            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
            trans.rollback();
        } finally {
            em.close();
        }
    }
    
}
