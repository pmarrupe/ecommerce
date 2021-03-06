<%@page import="java.util.List"%>
<%@page import="Util.UserDB"%>
<%@page import="Model.User"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%    
    
    HttpSession usersession = request.getSession();
    HttpSession usersession1 = request.getSession();    
    String u1=request.getRemoteUser();
    User userdet = (User)UserDB.getUser(u1);
    usersession1.setAttribute("userL", userdet.getFirstName());
    usersession.setAttribute("theuser", userdet);
 
%>


 <jsp:include page="/include/Header.jsp" />
      
          <div id="bread">
            <a href="#"  class="white" id="si2"> Signed in as  <c:out value="${theuser.getFirstName()}"/></a> <br> <br> <br> 
            <a href="index.jsp"  class="white"> Home > </a> 
            <a href="order.jsp"  class="white"> Orders >  </a> 
            <a href="order.jsp"  class="white"> Invoice </a>
        </div>




<jsp:include page="/include/usernavigation.jsp" />
<jsp:include page="/include/site-navigation.jsp" />
    
    <div class="sec2">
    
      
        <p id="para">        <b>Invoice Date:</b> <br>
         <c:out value="${currentOrder.getDate()}" />  <br>
        
        <b> Ship to / Bill to:</b> <br>
       <c:out value= "${theuser.getFirstName()}"/> , <c:out value= "${theuser.getLastName()}"/> <br>
       <c:out value= "${theuser.getAddress1Field()}"/> <br> 
       <c:out value= "${theuser.getAddress2Field()}"/> <br>
       <c:out value= "${theuser.getCity()}"/> , <c:out value= "${theuser.getState()}"/> <br>
        
      <c:out value= "${theuser.getZipPostalCode()}" />
      <c:out value=  "${theuser.getCountry()}" />
      
        </p>
     
        <table class="table2">
        <caption>Your Order </caption> 
                 
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
                             <c:out value="${item.getProduct().productName}"/>
                            </td>
                            <td>
                                $ <c:out value="${item.getProduct().price}"/>
                            </td>
                            <td>
                                <c:out value="${item.quantity}"/>
                            </td>
                            <td>
                                <c:out value="${item.getTotal()}"/>
                            </td>
                        </tr>
                        </c:forEach>
<tr>
    <td></td>
    <td></td>
    <td>Subtotal</td>
    <td>$ <c:out value="${subtotal}"/></td>
    
</tr>

<tr>
    <td></td>
    <td></td>
    <td>Tax</td>
    <td> <c:out value="${currentOrder.getTaxRate()}"/> </td>
    
</tr>

<tr>
    <td></td>
    <td></td>
    <td>Total</td>
    <td> <c:out value="${currentOrder.getTaxRate()+subtotal}"/></td>
    
</tr>


 </tbody>
         </table>
         
    <form action="cart.jsp">     
             <input type="submit" name="sub1" value="Back To Cart" class="button2 blue" id="le">
            </form> 
        
    
             <form action="payment.jsp">
             
              <input type="submit" name="sub1" value="Purchase" class="button2 blue" id="le3">
         </form>
     
    </div>
    
<jsp:include page="/include/Footer.jsp" />
