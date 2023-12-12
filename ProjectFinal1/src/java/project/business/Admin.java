package project.business;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Admin")
public class Admin implements Serializable{

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private String userID;
    private String email;
    private String adname;
    private String password;
    
    public Admin() {
    }

    public Admin(String userID, String email, String adname, String password) {
        
        this.userID = userID;
        this.email = email;
        this.adname = adname;
        this.password = password;
    }
    
    
    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }
    
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    public String getAdname() {
        return adname;
    }

    public void setAdname(String adname) {
        this.adname = adname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

}