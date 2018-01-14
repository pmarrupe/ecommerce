/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Model.User;
import Util.PasswordUtil;
import Util.UserDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 *
 * @author prashanth
 */
public class UserController extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        
        String firstname=request.getParameter("fname");
        String lastname=request.getParameter("lname");
        String email=request.getParameter("email");
        String address1=request.getParameter("addr1");
        String address2=request.getParameter("addr2");
        String city=request.getParameter("city");
        String state=request.getParameter("state");
        String zip=request.getParameter("zipc");
        String country=request.getParameter("country");
        String password=request.getParameter("pwd");
        String password1=request.getParameter("pwd1");
        String hashc=null;
       
        try{
        hashc= PasswordUtil.hashPassword(password);
        }
        catch(NoSuchAlgorithmException e){
        
        out.println(e);
        }
        
        UserDB u=new UserDB();
        List <User> userlist=new ArrayList(); 
        
       
        userlist=u.getAllUsers();
        
        for(int i=0;i<userlist.size();i++){
        
            if(email.equals(userlist.get(i).getEmailAddr())){
                
                request.setAttribute("message", "Email address entered is already registered"); // Will be available as ${message}
                request.getRequestDispatcher("userInfo.jsp").forward(request,response);
                return;
            }
            
        
        }    
        
        if(password.equals(password1)){
        User u1= u.addUser(firstname,lastname,email,address1,address2,city,state,zip,country,hashc);
        
        String username= u1.getEmailAddr();
        
            request.login(username, password);
            response.sendRedirect("order.jsp");
            
      
      }
        else{
        
          request.setAttribute("message2", "Password and confirm password fields don't match!"); // Will be available as ${message}
                request.getRequestDispatcher("userInfo.jsp").forward(request,response);
                
            
        }
        
                
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
