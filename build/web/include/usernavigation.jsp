<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="req" value="${pageContext.request}" />
<c:set var="url">${req.requestURL}</c:set> 

 <c:if test="${fn:endsWith(url, 'cart.jsp')}" > 
  
     <c:set value="red" var="cart1"></c:set>
         
</c:if> 



 <c:if test="${fn:endsWith(url, 'checkout')}" > 
     
     <c:set value="red" var="cart1"></c:set>
         
</c:if> 

<div class="sec" > 
        
        <a href="#" >Sign in</a> &nbsp;| 
        <a href="cart.jsp" class="${cart1}">Cart</a> |&nbsp; 

<form action="ViewOrders" id="frm1">
  <input type="hidden" name="action" value="viewOrders"/>
    <input type="submit" class="${order}" id="submitLink" value="My Orders"/> <br>
</form>
 


    </div>
    