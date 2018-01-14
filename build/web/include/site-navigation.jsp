
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="req" value="${pageContext.request}" />
<c:set var="url">${req.requestURL}</c:set> 

 <c:if test="${fn:endsWith(url, 'index.jsp')}" > 
  
     <c:set value="red" var="chan"></c:set>
         
</c:if> 

 <c:if test="${fn:endsWith(url, 'catalog.jsp')}" > 
  
     <c:set value="red" var="chan1"></c:set>
         
</c:if> 
 
     <c:if test="${fn:endsWith(url, 'item.jsp')}" > 
  
     <c:set value="red" var="chan1"></c:set>
         
</c:if> 
    
<c:if test="${fn:endsWith(url, 'about.jsp')}" > 
  
     <c:set value="red" var="chan2"></c:set>
         
</c:if> 
 

<c:if test="${fn:endsWith(url, 'contact.jsp')}" > 
  
     <c:set value="red" var="chan3"></c:set>
         
</c:if> 
 

<nav>
        <a href="index.jsp" class="${chan}" >  Home </a> <br>
        <a href="catalog.jsp" class="${chan1}" >  Catalog </a> <br>
        <a href="about.jsp" class="${chan2}"> About </a> <br>
        <a href="contact.jsp" class="${chan3}"> Contact Us </a> <br>
                  
    </nav>