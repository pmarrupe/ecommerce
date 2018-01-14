
package Util;

import Model.Orderitem;
import Model.Orders;
import java.util.*;
import Model.Product;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;
import javax.persistence.TypedQuery;



public class ProductDB {
    
    public void addProduct(String productCode, String productName, String catalogCategory,
            Long price, String description, String ImageURL) {
    
        Product p=new Product();
        p.setProductCode(productCode);
        p.setProductName(productName);
        p.setPrice(price);
        p.setImageUrl(ImageURL);
        p.setDescription(description);
        p.setCatalogCategory(catalogCategory);
    
        insertProduct(p);
        
    }    
    
    public static void insertProduct(Product pro){
    
        EntityManager emf=DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans=emf.getTransaction();
        trans.begin();
        try{
        emf.persist(pro);
        trans.commit();
        }
        catch(Exception e){
        System.out.println(e);
        trans.rollback();
        }
        finally{
        emf.close();
        }
        
    } 
    
    
    public Orders addOrder(Date date, int userid, float taxrate, double totalcost, String paid) {
    
        Orders o=new Orders();
        
        o.setDate(date);
        o.setUserID(userid);
        o.setTaxRate(taxrate);
        o.setTotalCost(totalcost);
        o.setPaid(paid);
    
        insertOrder(o);
        return o;
    }
    
    public void insertOrder(Orders o){
        
        EntityManager emf=DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans=emf.getTransaction();
        trans.begin();
        try{
        emf.persist(o);
        trans.commit();
        }
        catch(Exception e){
        System.out.println(e);
        trans.rollback();
        }
        finally{
        emf.close();
        }
    }
    
    
    
    /* order item table */
  
        public Orderitem addOrderItems(int ordernumber,String productcode,int quantity) {
      
             
        Orderitem oi=new Orderitem();
        oi.setOrdernumber(ordernumber);
        oi.setProductcode(productcode);
        oi.setQuantity(quantity);
    
        insertOrder1(oi);
        return oi;
    }
    
    public void insertOrder1(Orderitem oi){
        
        EntityManager emf=DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans=emf.getTransaction();
        trans.begin();
        try{
        emf.persist(oi);
        trans.commit();
        }
        catch(Exception e){
        System.out.println(e);
        trans.rollback();
        }
        finally{
        emf.close();
        }
    }
    
    
    public static List<Orderitem> getOrderitembyId(){
    
        EntityManager em=DBUtil.getEmFactory().createEntityManager();
        try{
          
           return em.createNamedQuery("Orderitem.findAll",Orderitem.class).getResultList();
            
//            query.setParameter("OrderNumber", OrderNumber);
//            
//            List<Orderitem> ol=new ArrayList();
//            
//          ol=  query.getResultList();
//            
//          List<Orderitem> ol1=new ArrayList();
//          
//          for(int i=0;i<ol.size();i++){
//          
//              ol1.add(ol.get(i));
//              
//          }
//          return ol1;
// TypedQuery<Orderitem> query = em.createQuery("SELECT o FROM Orderitem o WHERE o.OrderNumber = :OrderNumber", Orderitem.class).setParameter("OrderNumber", OrderNumber);                    
      }
       
        finally {
        em.close();
     }
        
  }
    
        
            
            public static Product getProduct(String productcode) {
    
        EntityManager em=DBUtil.getEmFactory().createEntityManager();
        try{
        
            Product product=em.find(Product.class, productcode);
            return product; 
        
        }
        finally {
        em.close();
        }
        
    
    }
    
    public List<Product> getAllProducts(){
    
         
        EntityManager em=DBUtil.getEmFactory().createEntityManager();

        try{
           
          return em.createNamedQuery("Product.findAll", Product.class).getResultList();
               
       }
        finally {
        em.close();
        }
    }

public List<Orders> getUserOrderList(int userid){

            EntityManager em=DBUtil.getEmFactory().createEntityManager();
            
            try{
                
            
            TypedQuery<Orders> query = em.createQuery("SELECT o FROM Orders o WHERE o.userID = :userID", Orders.class).setParameter("userID", userid);
              
               return query.getResultList();
                
            }
             finally {
            em.close();
            }
}


}              
    
