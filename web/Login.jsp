 <jsp:include page="/include/Header.jsp"/>
      
  
          <div id="bread">
            <a href="#"  class="white" id="si2"> Not signed in! </a> <br> <br> <br> 
            <a href="index.jsp"  class="white"> Home > </a> 
            <a href="catalog.jsp"  class="white"> Catalog > </a>
            <a href="cart.jsp"  class="white"> Cart </a>
        </div>




<%--<jsp:include page="/include/usernavigation.jsp" />--%>

<jsp:include page="/include/site-navigation.jsp" />
    
    <div class="sec2">
        
     <form action="j_security_check" method="get">
     
                 <h2 id="userlogin">Login to your Account</h2>
                
                 <table class="table1">
                   
                    <tr>
                        <td>  Email *: </td>
                        <td><input type="email" name="j_username" /></td>
                    </tr>

                    
                    <tr>
                        <td>  Password *: </td>
                        <td><input type="password" name="j_password" /></td>
                    </tr>

                    <tr>
                        <td>
               
                        </td>
                        <td>
                             <input type="submit" value="Submit" class="button2 blue" id="loginbutton"/>
                             
                        </td>
                </table>
            </form>
            
    </div>
    
<jsp:include page="/include/Footer.jsp" />
