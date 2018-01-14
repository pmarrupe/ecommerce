 <jsp:include page="/include/Header.jsp"/>
      
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
          <div id="bread">
              
               <a href="#"  class="white"> 
               

              <c:if test="${userL!=null}">

                Signed in as ${userL}
               
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
       <p>  Welcome to ALT Winter, the Mega E-commerce shopping website exclusively for 
        Winter clothing. We have, all you need  and what you need more is what you buy here.
        Select from a wide range of clothing under Men or Women and get rid of this spine chilling winter.
        We sell thousands of varieties of winter clothes under many categories. All the prices are discounted and no further price reductions will be possible.
        Conditions applied.
        <br><br><br><br><br><span>HAPPY Shopping!</span> 
           </p> 
    </div>
    
<jsp:include page="/include/Footer.jsp" />
