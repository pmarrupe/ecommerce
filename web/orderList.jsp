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
                    int k;
                    
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
                <td>Customer</td>
                <td>Order Date</td>
                <td>Total</td>  
            
            </tr>
           </thead>
           
           <tbody>
 
                        <% for(k = 0 ;k < ols.size() ;k++) { %>
                        <tr>
                        
                        <td>  <form action="OrderListInvoice.jsp"> 
                                
                                <input type="hidden" name="orderval" value="<%=ols.get(k).getOrderNumber()%>"/>
                                <input type="submit" id="submitLink" value="<%=ols.get(k).getOrderNumber()%>"/> 
                            </form>
                        </td>
                        <td><c:out value="<%= UserDB.getUserbyid(ols.get(k).getUserID()).getFirstName() %>" />
                        </td>
                        <td> <c:out value="<%= ols.get(k).getDate()%>"/>
                        </td>
                        <td><c:out value="<%= ols.get(k).getTotalCost() %>" />
                        </td>
                        
                        </tr>
                
                         <% } %>
                         
               
           </tbody>
           
        </table>
        
    </div>
    
<jsp:include page="/include/Footer.jsp" />
