package project.business;

import java.io.Serializable;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

public class Cart implements Serializable {

        private List<LineItem> items;

        public Cart() {
            items = new ArrayList();
        }
        
        public void setItems(List<LineItem> items) {
            this.items = items;
        }

        public List<LineItem> getItems() {
            return items;
        }

        public int getCount() {
            return items.size();
        }
        public int getQuantitybyID(String id){
            return getItembyID(id).getQuantity();
        }
        public LineItem getItembyID(String id) {
            for(LineItem i: items){
                if(i.getProduct().getProductId() == null ? id == null : i.getProduct().getProductId().equals(id))
                    return i;
            }
            return null;
        }
        public void addItem(LineItem item) {
            if(getItembyID(item.getProduct().getProductId()) != null){
                LineItem i = getItembyID(item.getProduct().getProductId());
                i.setQuantity(i.getQuantity() + item.getQuantity());

            }
            else  items.add(item);
       }

        public void removeItem(String id) {
            if(getItembyID(id) != null) {
               LineItem i = getItembyID(id);
              items.remove(i);
            }
        }
        
        public void updateItem(LineItem item) {
            String code = item.getProduct().getProductId();
            int quantity = item.getQuantity();
            for (int i = 0; i < items.size(); i++) {
                LineItem lineItem = items.get(i);
                if (lineItem.getProduct().getProductId().equals(code)) {
                    lineItem.setQuantity(quantity);
                    return;
                }
            }
            items.add(item);
        }

        public double getTotalPrice (){
            double t =0;
            for(LineItem i: items) 
                t+= i.getTotal();
            return t;
        }
          public String getTotalPriceCurrencyFormat() {
            NumberFormat currency = NumberFormat.getCurrencyInstance();
            return currency.format(this.getTotalPrice());
        }
}