/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import static javax.persistence.FetchType.EAGER;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

/**
 *
 * @author prashanth
 */
@Entity
@Table(name = "ORDERS")
@NamedQueries({
    @NamedQuery(name = "Orders.findAll", query = "SELECT o FROM Orders o"),
    @NamedQuery(name = "Orders.findByOrderNumber", query = "SELECT o FROM Orders o WHERE o.orderNumber = :orderNumber"),
    @NamedQuery(name = "Orders.findByDate", query = "SELECT o FROM Orders o WHERE o.date = :date"),
    @NamedQuery(name = "Orders.findByUserID", query = "SELECT o FROM Orders o WHERE o.userID = :userID"),
    @NamedQuery(name = "Orders.findByTaxRate", query = "SELECT o FROM Orders o WHERE o.taxRate = :taxRate"),
    @NamedQuery(name = "Orders.findByTotalCost", query = "SELECT o FROM Orders o WHERE o.totalCost = :totalCost"),
    @NamedQuery(name = "Orders.findByPaid", query = "SELECT o FROM Orders o WHERE o.paid = :paid")})
public class Orders implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "OrderNumber")
    private Integer orderNumber;
    
    @Column(name = "Date")
    @Temporal(TemporalType.DATE)
    private Date date;
    
    @Column(name = "UserID")
    private int userID;
    
    @Column(name = "TaxRate")
    private float taxRate;
    
    @Column(name = "TotalCost")
    private double totalCost;
    
    @Column(name = "Paid")
    private String paid;

    

    @Transient
    User user;

    
    
    @Transient
    private ArrayList<Orderitem> Items;

     


     
     
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public ArrayList<Orderitem> getItems() {
        return Items;
    }

    public void setItems(ArrayList<Orderitem> Items) {
        this.Items = Items;
    }    
     
     
    public Orders() {
    }

    public Orders(Integer orderNumber) {
        this.orderNumber = orderNumber;
    }

    public Orders(Integer orderNumber, Date date, int userID, float taxRate, float totalCost, String paid) {
        this.orderNumber = orderNumber;
        this.date = date;
        this.userID = userID;
        this.taxRate = taxRate;
        this.totalCost = totalCost;
        this.paid = paid;
    }

    public Integer getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(Integer orderNumber) {
        this.orderNumber = orderNumber;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public float getTaxRate() {
        return taxRate;
    }

    public void setTaxRate(float taxRate) {
        this.taxRate = taxRate;
    }

    public double getTotalCost() {
        return totalCost;
    }

    public void setTotalCost(double totalCost) {
        this.totalCost = totalCost;
    }

    public String getPaid() {
        return paid;
    }

    public void setPaid(String paid) {
        this.paid = paid;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (orderNumber != null ? orderNumber.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Orders)) {
            return false;
        }
        Orders other = (Orders) object;
        if ((this.orderNumber == null && other.orderNumber != null) || (this.orderNumber != null && !this.orderNumber.equals(other.orderNumber))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Model.Orders[ orderNumber=" + orderNumber + " ]";
    }
    
}
