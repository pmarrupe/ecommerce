
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Model.Product;
import java.util.List;
import Util.ProductDB;

public class CatalogController extends HttpServlet {

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        ProductDB pros=new ProductDB();
        
        HttpSession session2 = request.getSession();
  
        
        List<Product> pro_db= pros.getAllProducts();
        
        
          
        
        
        if(request.getParameter("product_code")!= null) {
            for(int i=0 ; i< pro_db.size() ;i++) {
                
             if(request.getParameter("product_code").equals(pro_db.get(i).getProductCode())){
                 request.setAttribute("product_code", pro_db.get(i).getProductCode());
                 request.setAttribute("product_name", pro_db.get(i).getProductName());
                 request.setAttribute("catalog_category", pro_db.get(i).getCatalogCategory());
                 request.setAttribute("description", pro_db.get(i).getDescription());
                 request.setAttribute("price", pro_db.get(i).getPrice());
                 request.setAttribute("imageURL", pro_db.get(i).getImageUrl());
                 
                 
                 
                 request.getRequestDispatcher("item.jsp").forward(request, response);
                 return;
                 
             }
         
             
            }
           
           }
       
        
       
        
        
        String catalog_category = request.getParameter("categories");
        
        
            if(catalog_category!= null) {
                    
                 if(catalog_category.equals("Menclothing")) {
                   
                    
                 
                   
                   
                    session2.setAttribute("Flag", 1);
                    
                    response.sendRedirect("catalog.jsp");
                       
                 }
                    else if(catalog_category.equals("Womenclothing")) {
                    
                   
                    
                 
                    session2.setAttribute("Flag", 2);
                    
                    response.sendRedirect("catalog.jsp");

                    }
                    
                    else if(catalog_category.equals("All")){
                        
                        
                        session2.removeAttribute("Flag");
                        
                    response.sendRedirect("catalog.jsp");
                        
                    }
                   }
             else 
           
                        
            
  {
     RequestDispatcher dispatcher= request.getRequestDispatcher("catalog.jsp");
      dispatcher.forward(request, response);      
  } 
            }
        
        
    
    

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
