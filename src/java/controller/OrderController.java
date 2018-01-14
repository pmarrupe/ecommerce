/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.text.NumberFormat;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.Product;
import Model.User;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import Model.Cart;
import Model.Orders;
import Model.Orderitem;
import Util.ProductDB;
import Util.UserDB;
import java.util.Date;
import javax.swing.JOptionPane;

public class OrderController extends HttpServlet {
   
    
    private String url="";
  
    

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
          PrintWriter out = response.getWriter();
             ProductDB products = new ProductDB();
            String action = request.getParameter("action");

             double subtotal=0;
             HttpSession session = request.getSession();
             
             HttpSession userlog=request.getSession();
             String userLogin=(String)userlog.getAttribute("userL");

             Product product=new Product();
             Cart cart=(Cart) session.getAttribute("theShoppingCart");
             if(cart == null) {
                 cart = new Cart();
                 session.setAttribute("theShoppingCart", cart);
             }
             

             if(action.equals("updateCart")){
              String[] productList = request.getParameterValues("productList");   
              
                 if(productList != null){
             
             for(int i=0 ; i< productList.length ;i++) {
                  product = products.getProduct(productList[i]);
                 if(product!=null){
                    int quantity =0;
                    Orderitem item = new Orderitem();
                    item.setProduct(product);
                    quantity = Integer.parseInt(request.getParameter(productList[i]));
                    item.setQuantity(quantity);
            
                
                 
                 
                if(quantity > 0){
                   cart.addItem(item);
                   subtotal=0;
                   }
                else if(quantity == 0){
                   cart.removeItem(item);
                   subtotal=0;  
                   
                   }
                 }
                 
                 
                 for(int j=0;j< cart.items.size();j++){
                 Orderitem item = cart.getItems().get(j);
                 subtotal= subtotal + item.getTotal();
                 NumberFormat.getCurrencyInstance().format(subtotal);
                 session.setAttribute("subtotal",subtotal);
                 }                   
                 if(cart.items.size()== 0){
                 subtotal = 0;
                 session.setAttribute("subtotal",subtotal);
                 }
                  session.setAttribute("theShoppingCart", cart);
                  url="/cart.jsp";                 
                }
              }
           }
             
             
             else if((action.equals("checkout"))&&userLogin==null) {
                
 
                 Orders order=new Orders();
                 
                 
                 if(cart.items.size()==0){
                    session.setAttribute("currentOrder",order);
                    url = "/order.jsp";
                 }
                 
               else {
                
              
                order.setDate(Calendar.getInstance().getTime());
                order.setItems(cart.getItems());
                double total=0;
               
             
                     
   
                for(int i=0; i < cart.getItems().size();i++){
                Orderitem item= cart.getItems().get(i);
                total = total + item.getTotal();
                }
                for(int j=0;j< cart.items.size();j++){
                 Orderitem item = cart.getItems().get(j);
                 subtotal= subtotal + item.getTotal();
                 NumberFormat.getCurrencyInstance().format(subtotal);
                 session.setAttribute("subtotal",subtotal);
                }             
                
               
                double a=0.4f*subtotal;
                float i=(float)a;
                order.setTaxRate(i);
                order.setTotalCost(total);
                session.setAttribute("currentOrder",order);
                url = "/checkoutChoice.jsp";
                
                
                 }
                 
             }
              
             else if((action.equals("checkout"))&&userLogin!=null) {
                
 
                 Orders order=new Orders();
                 
                 
                 if(cart.items.size()==0){
                    session.setAttribute("currentOrder",order);
                    url = "/order.jsp";
                 }
                 
               else {
                
              
                order.setDate(Calendar.getInstance().getTime());
                order.setItems(cart.getItems());
                double total=0;
               
             
                     
   
                for(int i=0; i < cart.getItems().size();i++){
                Orderitem item= cart.getItems().get(i);
                total = total + item.getTotal();
                }
                for(int j=0;j< cart.items.size();j++){
                 Orderitem item = cart.getItems().get(j);
                 subtotal= subtotal + item.getTotal();
                 NumberFormat.getCurrencyInstance().format(subtotal);
                 session.setAttribute("subtotal",subtotal);
                }             
                
                
                double a=0.4f*subtotal;
                float i=(float)a;
                order.setTaxRate(i);
                order.setTotalCost(total);
                session.setAttribute("currentOrder",order);
                url = "/order.jsp";
                
                
                 }
                 
             }
             
             
            
          else if(action.equals("confirmOrder")){
            
            
            Orders itm2 = new Orders();
            itm2 = (Orders)session.getAttribute("currentOrder");
            float taxrate = itm2.getTaxRate();
            Date date = itm2.getDate();
            double pri1=(0.4f*(itm2.getTotalCost()))+itm2.getTotalCost();
                float pri=(float)pri1;
            
             String paid="false";
                
                
            HttpSession session2 = request.getSession();
            User usr= (User)session2.getAttribute("theuser");
            
            int userid=usr.getUserID();
                
            Cart confirm_order = new Cart();
            ProductDB  pitems = new ProductDB();
            confirm_order = (Cart)session.getAttribute("theShoppingCart");
            List<String> itm=new ArrayList();
            
          for(int i=0; i < confirm_order.items.size() ;i++) {
                
            paid = "true";

           
          itm.add(confirm_order.getItems().get(i).getProduct().getProductCode());
          
          }
          
         
          
           Orders ordob= pitems.addOrder(date,userid,taxrate,pri,paid);
           
           int ordernumber=ordob.getOrderNumber();
            
            HttpSession orderno = request.getSession();
            
            
            orderno.setAttribute("OrderNum", ordernumber);
            
         
           for(int y=0;y<itm.size();y++){
           
           pitems.addOrderItems(ordernumber,itm.get(y),1);
           
           }
         
            
            if(paid.equals("true")) {
           
                
              url = "/FinalInvoice.jsp";  
             
            }
           
            else {
           JOptionPane.showMessageDialog(null, "Cannot Confirm Payment","Sorry", JOptionPane.INFORMATION_MESSAGE);
           url = "/catalog.jsp";  
          
            }
          
          }
          
          else if(action.equals("viewOrders"))
          {
          
            ProductDB olyuser = new ProductDB();
            List<Orders> olist;
         
          
            HttpSession list = request.getSession();
            HttpSession orderlistuser=request.getSession();
            
            String email=request.getRemoteUser();
    
            User userdet = (User)UserDB.getUser(email);
            
            
             int userid=userdet.getUserID();
             String Firstn=userdet.getFirstName();
            orderlistuser.setAttribute("orderlistu", Firstn);
            
            olist = (List<Orders>)olyuser.getUserOrderList(userid);
            
            int a;
            
            List<Orders> newlist=new ArrayList();
            for(a=0;a<olist.size();a++){
            
                newlist.add(olist.get(a));
                
                
            }
            
            list.setAttribute("theuser", userdet);
            list.setAttribute("userL", userdet.getFirstName());
            list.setAttribute("theOrders", newlist);
                       
                  url="/orderList.jsp";
            
         }
            
                
                
             
getServletContext().getRequestDispatcher(url).forward(request, response);
    }
    
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
               

                
                
                 
                
                
                
