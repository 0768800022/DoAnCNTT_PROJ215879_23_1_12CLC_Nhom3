package project.business;

import java.io.Serializable;
import java.text.NumberFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import javax.persistence.*;

import project.business.*;

@Entity
@Table(name = "invoice")
public class Invoice implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int invoiceID;

    private Date invoiceDate;
    private double totalPay;

    @ManyToOne
    @JoinColumn(name = "userId")
    private Account account;

    @OneToMany(mappedBy = "invoice")
    private List<Invoice_detail> listReceiptItem;

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public int getInvoiceID() {
        return invoiceID;
    }

    public void setInvoiceID(int invoiceID) {
        this.invoiceID = invoiceID;
    }

    @Temporal(javax.persistence.TemporalType.DATE)
    public Date getInvoiceDate() {
        return invoiceDate;
    }

    public void setInvoiceDate(Date invoiceDate) {
        this.invoiceDate = invoiceDate;
    }

    public double getTotalPay() {
        return totalPay;
    }

    public void setTotalPay(double totalPay) {
        this.totalPay = totalPay;
    }

    public List<Invoice_detail> getListReceiptItem() {
        return listReceiptItem;
    }

    public void setListReceiptItem(List<Invoice_detail> listReceiptItem) {
        this.listReceiptItem = listReceiptItem;
    }
}