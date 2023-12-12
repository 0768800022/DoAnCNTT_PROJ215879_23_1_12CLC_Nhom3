package project.business;

import java.io.Serializable;
import java.util.List;
import javax.persistence.*;

@Entity
@Table(name = "product")
public class Product implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private String productId;

    private String productName;
    private String productImage;
    private String productDescription;
    private double productPrice;
    private String productCategory;

    @OneToMany(mappedBy = "product")
    private List<Invoice_detail> invoiceDetails;

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getProductCategory() {
        return productCategory;
    }

    public void setProductCategory(String productCategory) {
        this.productCategory = productCategory;
    }

    public String getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    public double getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(double productPrice) {
        this.productPrice = productPrice;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductImage() {
        return productImage;
    }

    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }

    public List<Invoice_detail> getInvoiceDetails() {
        return invoiceDetails;
    }

    public void setInvoiceDetails(List<Invoice_detail> invoiceDetails) {
        this.invoiceDetails = invoiceDetails;
    }
}
