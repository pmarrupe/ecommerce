

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/include/Header.jsp" />
        <div id="bread">

            <a href="#"  class="white" id="si2"> 
            
             <c:if test="${userL!=null}">

                Signed in as ${userL}
             
              </c:if>
                
                <c:if test="${userL==null}">
                    Not signed in!
                </c:if>
                    
            </a> <br> <br> <br> 
            <a href="index.jsp"  class="white"> Home > </a> 
            <a href="catalog.jsp"  class="white"> Catalog > </a>
            <a href="cart.jsp"  class="white"> Cart </a>
        </div>
        
    

<jsp:include page="/include/usernavigation.jsp" />
    
<jsp:include page="/include/site-navigation.jsp" />
 
   <div class="sec2">
          <form action="updateCart" method="post" >
    <table class="table2">
        <caption>Your Cart <i>To remove an item,change the quantity to zero.</i></caption> 
                 
<tbody>
<tr>
    <th>Item</th>
    <th>Price</th>
    <th>Quantity</th>
    <th>Total</th>
    
</tr>
 <c:forEach var="item" items="${theShoppingCart.items}">
<tr>
    <td> 
        
       ${item.getProduct().productName}
       
   </td>
   
   <td>
       $${item.getProduct().price}
   </td>
   
   <td>
    <input type="hidden" name="productList" value="${item.getProduct().productCode}" />
<input type="number" id="quantity" required="required" name="${item.getProduct().productCode}" value="${item.quantity}"/>
   </td>
   
   <td>
      ${item.getTotal()}
   </td>
</tr>

 </c:forEach>

<tr>
    <td></td>
    <td></td>
    <td>Subtotal</td>
    <td>$${subtotal}</td>
    
</tr>

 </tbody>
         </table>
         
             <input type="hidden" name="action" value="updateCart"/>
       
             <input type="submit" name="sub1" value="Update Cart" class="button2 blue" id="le">
            </form> 
        
    
             <form action="checkout" method="post">
             <input type="hidden" name="action" value="checkout"/>
              <input type="submit" name="sub1" value="Checkout" class="button2 blue" id="le3">
         </form>
      
         </div>
     
<jsp:include page="/include/Footer.jsp" />
