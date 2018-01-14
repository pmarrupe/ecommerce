
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
            <a href="index.jsp"  class="white" > About Us </a>
          
          </div> 




<jsp:include page="/include/usernavigation.jsp" />
<jsp:include page="/include/site-navigation.jsp" />
    
    <div class="sec2">
        <h1 class="cen"> About ALT.Winter </h1> 
        <p>
        
           ALT.Winter is a young and vibrant company that aims to provide good quality branded products. 
           This caters to the fashion needs of men, women and kids across all kinds of winter clothing and accessories.
At ALT.Winter.com we strive to achieve the highest level of "Customer Satisfaction" possible. 
Our cutting edge E-commerce platform, highly experienced buying team, agile warehouse systems and state of the art customer care centre provides customer with:
Broader selection of products
Superior buying experience
On-time delivery of products
Quick resolution of any concerns
<br><br>
<b>Partner sites:</b><br>
Tripda<br>
Foodpanda<br>
Fabfurnish<br>
Printvenue<br>
PricePanda<br>
CupoNation<br>
        <br><br><br><br><br><span>HAPPY Shopping!</span> 
           </p> 
    </div>
    
<jsp:include page="/include/Footer.jsp" />
