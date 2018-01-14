/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 *
 * @author prashanth
 */
@Entity
@Table(name = "ORDERITEM")
@NamedQueries({
        @NamedQuery(name = "Orderitem.findAll", query = "SELECT o FROM Orderitem o")})
//         @NamedQuery(name="Orderitem.findByOrderNumber", query="SELECT o FROM Orderitem o where o.OrderNumber = :OrderNumber")
   
    public class Orderitem implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id   
    @Basic(optional = false)
    int ID;
    
    int OrderNumber;         
   
     String productcode;
     
    @Column(name = "Quantity")
    private int quantity;

 
    @Transient
    private Product product;

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

       
    
   
    
    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
    
    public double getTotal()
    {
        return (product.getPrice() * quantity);
   
    }
    
    public Orderitem() {
    }
   
    public Orderitem(Product Prod, int Quantity) 
{
    this.product = Prod;
    this.quantity = Quantity;
}


    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getOrdernumber() {
        return OrderNumber;
    }

    public void setOrdernumber(int OrderNumber) {
        this.OrderNumber = OrderNumber;
    }

    public String getProductCode() {
        return productcode;
    }

    public void setProductcode(String productcode) {
        this.productcode = productcode;
    }

    
}
