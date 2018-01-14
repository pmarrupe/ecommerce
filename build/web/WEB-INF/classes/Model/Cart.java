/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.*;
import java.util.ArrayList;

/**
 *
 * @author prashanth
 */
public class Cart implements Serializable {

    
   final public ArrayList<Orderitem> items;
   
    public ArrayList<Product> items1;
   
    
    public Cart(){
      
        items = new ArrayList<Orderitem>();
        
        items1=new ArrayList<Product>();
    }
 
    public ArrayList<Orderitem> getItems() {
    return items;
    }
    
    public void addItem(Orderitem item){
    String code = item.getProduct().getProductCode();
    int quantity = item.getQuantity();
    for ( int i=0; i < items.size(); i++) {
    Orderitem orderitem = items.get(i);
    if(orderitem.getProduct().getProductCode().equals(code)) {
      orderitem.setQuantity(quantity);
      return;
     }
    }
    items.add(item);
    }
    
    public void removeItem(Orderitem item) {
    String code = item.getProduct().getProductCode();
    for ( int i=0; i < items.size(); i++) {
    Orderitem orderitem = items.get(i);
    if(orderitem.getProduct().getProductCode().equals(code)) {
      items.remove(i);
      return;
    }
    }
    }
    
    public void emptyCart() {
    items.removeAll(items);
    }
    
}