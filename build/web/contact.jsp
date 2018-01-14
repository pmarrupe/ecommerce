
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <jsp:include page="/include/Header.jsp" />
      
          <div id="bread">
            
            <a href="#"  class="white" > 
                
              <c:if test="${userL!=null}">

                Signed in as ${userL}
             
              </c:if>
                
                <c:if test="${userL==null}">
                    Not signed in!
                </c:if>
            
            </a> <br> <br> <br> 
            <a href="index.jsp"  class="white" > Home > </a>
            <a href="index.jsp"  class="white" > Contact Us </a>
          
          </div> 




<jsp:include page="/include/usernavigation.jsp" />
<jsp:include page="/include/site-navigation.jsp" />
    
    <div class="sec2">
        <h1> Contact Us </h1> 
        <p>
        
            <b> <u>Customer care </u> </b> <br>
            
Want to know about order status or queries related to a product give us a call or drop a line
Phone number: 0124-7047551895; Email: care@AltW.com
<br> <br>
<b> <u> Our Complaint Resolution </u> </b> <br>
Our issue resolution process is designed to encourage the fast and efficient resolution of your issue at the first point of contact. 
While we always aim to provide you with awesome customer service, we recognize that you may wish to express dissatisfaction with our products, services, staff or policies.
So please call us immediately if you have any concerns.

<br><br><br><br><br><span>HAPPY Shopping!</span> 
           </p> 
    </div>
    
<jsp:include page="/include/Footer.jsp" />
