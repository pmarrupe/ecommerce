/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Util;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
/**
 *
 * @author prashanth
 */
public class DBUtil {
    
    private static final EntityManagerFactory emf=
            Persistence.createEntityManagerFactory("Hw1PU");
    
    public static EntityManagerFactory getEmFactory(){
    return emf;
    } 
}
