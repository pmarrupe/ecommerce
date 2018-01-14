 <jsp:include page="/include/Header.jsp"/>
      
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
          <div id="bread">
              
               <a href="#"  class="white"> 

              <c:if test="${userL!=null}">

                Signed in as <c:out value="${userL}"/>
             
              </c:if>
                
                <c:if test="${userL==null}">
                    Not signed in!
                </c:if>
                
 
               </a> <br> <br> <br>
            
            <a href="index.jsp" id="si" class="white" > Home </a>      
                  
            
            
        </div> 




<jsp:include page="/include/usernavigation.jsp" />
<jsp:include page="/include/site-navigation.jsp" />
    
    <div class="sec2">
       
        <h1> Your Email is sent to your Registered Email ID!</h1>
        
        <br><br><br><br><br><span>Thank you for Shopping!</span> 
        <form action="logout">
            
            <input type="submit" value="Click To Logout" class="button2 blue" id="le">
            
        </form>
    </div>
    
<jsp:include page="/include/Footer.jsp" />
