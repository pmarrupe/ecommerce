/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Util;


import java.util.List;
import Model.User;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

public class UserDB {
    
    
    public User addUser(String firstName, String lastName, String email, String address1, String
address2, String city, String state, String zipcode, String country, String pwd) {
    
        User u=new User();
        
        u.setFirstName(firstName);
        u.setLastName(lastName);
        u.setEmailAddr(email);
        u.setAddress1Field(address1);
        u.setAddress2Field(address2);
        u.setCity(city);
        u.setState(state);
        u.setZipPostalCode(zipcode);
        u.setCountry(country);
        u.setPassword(pwd);
        u.setRole("customer");
        
        insertUser(u);
        return u;
    }    
    
    public static void insertUser(User usr){
    
        EntityManager emf=DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans=emf.getTransaction();
        trans.begin();
        try{
        emf.persist(usr);
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
    
    
    
    public static User getUser(String emailAddr) {
    
       
        EntityManager em=DBUtil.getEmFactory().createEntityManager();
        try{
        
           return (User)em.createNamedQuery("User.findByEmailAddr", User.class).setParameter("emailAddr", emailAddr).getSingleResult();
                
        }
        finally {
        em.close();
        }
        
    
    }
    
    
    public static User getUserbyid(int userid) {
    
       
        EntityManager em=DBUtil.getEmFactory().createEntityManager();
        try{
        
           return em.find(User.class, userid);
                
        }
        finally {
        em.close();
        }
        
    
    }
    
    public List<User> getAllUsers(){
    
        EntityManager em=DBUtil.getEmFactory().createEntityManager();

        try{
           
          return em.createNamedQuery("User.findAll", User.class).getResultList();
               
          
       }
        finally {
        em.close();
        }
        
        
        
    }
    
}
