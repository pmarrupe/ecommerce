 <%@page import="Model.Product"%>
<%@page import="java.util.Arrays"%>
<%@page import="Util.ProductDB"%>
<%@page import="Model.Orderitem"%>
<%@page import="Util.UserDB"%>
<%@page import="java.util.List"%>
<%@page import="Model.Orders"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/include/Header.jsp"/>
      
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
               <%  
                    HttpSession s= request.getSession();
                    ArrayList<Orders> ols = new ArrayList();
                    ols= (ArrayList<Orders>)s.getAttribute("theOrders");
                          
                 int l= Integer.parseInt(request.getParameter("orderval"));
                  
                 List<Orderitem> prodc= new ArrayList();
                 
                       
                       prodc  = ProductDB.getOrderitembyId();
                 
                 List<Orderitem> prodc1=new ArrayList();
                 
                 for(int k=0;k<prodc.size();k++){
                 
                     int orde=prodc.get(k).getOrdernumber();
                     if(orde == l){
                     
                         prodc1.add(prodc.get(k));
                         
                     }
                     
                 }
                 
                 StringBuffer prodcodelist1= new StringBuffer();
                 
                 for(int q=0;q<prodc1.size();q++){
                 
                 
                    prodcodelist1.append(prodc1.get(q).getProductCode());
                          
                    if(q!=(prodc1.size()-1)){
                
                             prodcodelist1.append(",");

                         }
                 }
                 
                 String prodcodelist= prodcodelist1.toString();
                 
                 List<String> aList = Arrays.asList(prodcodelist.split(","));
                 
                 List<Product> newlist=new ArrayList();
                 for(int a=0;a<aList.size();a++){
                     
                    String op= aList.get(a);
                     newlist.add(ProductDB.getProduct(op));
                   
                   
               }
                 
                 
                 
                 StringBuffer productnames=new StringBuffer();
                 for(int j=0;j<newlist.size();j++){
        
            productnames.append(newlist.get(j).getProductName());
            
            if(j!=(newlist.size()-1)){
                
            productnames.append(",");
            productnames.append(System.lineSeparator());
            }
        }
                 
                 StringBuffer prices=new StringBuffer();
                 for(int j=0;j<newlist.size();j++){
                 
                     prices.append(newlist.get(j).getPrice());
                     prices.append("$");
                   if(j!=(newlist.size()-1)){
                   
                   prices.append(System.getProperty("line.separator"));
                   }
                 
                 
                 }

                 String products1=productnames.toString();
                 String prices1=prices.toString();
               %>

          <div id="bread">
              
               <a href="#"  class="white"> 

                 
                Signed in as <c:out value="${orderlistu}"/>    
 
               </a> <br> <br> <br>
            
            <a href="index.jsp" id="si" class="white" > Home </a>      
                  
            
            
        </div> 




<jsp:include page="/include/usernavigation.jsp" />
<jsp:include page="/include/site-navigation.jsp" />
    
    <div class="sec2">
        

        
        <table class="table2">
            
            <thead>
            <tr>
                <td>Order Number</td>
                <td>Items</td>
                <td>Price</td>
                  
            
            </tr>
           </thead>
           
           <tbody>
 
                        <tr>
                        
                            <td> <c:out value="<%=l%>"/> </td>
                            <td> <c:out value="<%=products1%>"/>     </td>
                            <td> <c:out value="<%=prices1%>"/>  </td>         
                        </tr>
                
                         
               
           </tbody>
           
        </table>
        
    </div>
    
<jsp:include page="/include/Footer.jsp" />
