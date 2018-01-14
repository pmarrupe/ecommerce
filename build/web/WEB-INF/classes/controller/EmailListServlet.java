/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Model.Cart;
import Model.Orderitem;
import Model.Orders;
import Model.Product;
import Model.User;
import Util.HtmlEmailSender;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author prashanth
 */
public class EmailListServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
  
  
        HttpSession ses1=request.getSession();
    
        User us1= (User)ses1.getAttribute("theuser");
        String email=us1.getEmailAddr();
        
        HttpSession ses2=request.getSession();
        Cart c= (Cart)ses2.getAttribute("theShoppingCart");
        
        ArrayList<Product> ar=new ArrayList();
        for(int i=0;i<c.items.size();i++){
                    
            ar.add(c.items.get(i).getProduct());
        
        }
       
        StringBuffer productname = new StringBuffer(110);  
        
        for(int j=0;j<ar.size();j++){
        
            productname.append(ar.get(j).getProductName());
            
            if(j!=(ar.size()-1)){
            productname.append(",");
            }
        }
        
        HttpSession ses3=request.getSession();
        Orders o=(Orders)ses3.getAttribute("currentOrder");
        
       double totcost= o.getTotalCost();
        
        
       String firstname= us1.getFirstName();
       String lastname = us1.getLastName();
       
       String to=email;
       String from="uncc@nbad.com";
       String subject="Thank you for your Order!";
       String body="<html> <center> <h1>Hello, "+firstname+" "+lastname+"</h1> <h2>Your Order Invoice:</h2> </center><br> <center> <table> "
               + " <tr><td> <b>Products</b> </td> <td> <b>Total Cost</b> </td> </tr>"
               + " <tr> <td> "+productname+" </td> <td> "+totcost+" </td> </tr> </table> </center>  </html>";
       
       boolean isBodyHTML=true;
       
       try{
           
           HtmlEmailSender.sendHtmlEmail(to, from, subject, body, isBodyHTML);
       
       }
       catch(MessagingException e){
       String errorMessage= "Error: Unable to send Email. Check Tomcat Logs for details"+ e.getMessage();
            request.setAttribute("errorMessage",errorMessage);   
                  
       }
    
    getServletContext().getRequestDispatcher("/JavaEmailSuccess.jsp").forward(request, response);
    
    
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
