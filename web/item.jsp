<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/include/Header.jsp" />
 <%@page import ="Util.ProductDB" %>


        <div id="bread">
            <a href="#"  class="white" id="si2"> 
            
            
                <c:if test="${userL!=null}">

                Signed in as  <c:out value="${userL}"/>
             
              </c:if>
                
                <c:if test="${userL==null}">
                    Not signed in!
                </c:if>

                    
            </a> <br> <br> <br> 
            <a href="index.jsp"  class="white"> Home > </a> 
            <a href="catalog.jsp"  class="white"> Catalog >  </a> 
            <a href="item.jsp"  class="white"> Item </a>
        </div>
        
      
<jsp:include page="/include/usernavigation.jsp" />
<jsp:include page="/include/site-navigation.jsp" />
    
    <div class="sec2">
         
         <table class="table2">
             
<tbody>
<tr>
   
    <td> 
       <img src=${imageURL} alt="img" class="img3"> 
   </td>
   
   <td>
       <b> <i>  <c:out value="${product_name}"/> </i> </b> <br><br>
                 <c:out value="${catalog_category}"/>         <br> <br>
              $ <c:out value="${price}"/>
   </td>
</tr>
</tbody>
         </table>
         

         <form action="updateCart" method="post">
             <input type="hidden" name ="productList" value="${product_code}" />
             <input type="hidden" name="action" value="updateCart"/>
             <input type="hidden" name="${product_code}" value="1"/>
             
             <input type="submit" name="sub1" value="Add To Cart" class="button2 blue" id="le">
           
                        
             
         </form> 
         
         <form action="catalog.jsp">
             <input type="submit" name="sub2" value="Goto Catalog" class="button2 blue" id="le3">
             
         </form>
   <h3 class="place">Description</h3>
         <p class="p1">
             
             
      
             ${description} 
    </p>     
       
         
</div>
    
<jsp:include page="/include/Footer.jsp" />