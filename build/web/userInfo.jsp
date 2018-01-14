 <jsp:include page="/include/Header.jsp"/>
      
  
          <div id="bread">
            <a href="#"  class="white" id="si2"> Not signed in! </a> <br> <br> <br> 
            <a href="index.jsp"  class="white"> Home > </a> 
            <a href="catalog.jsp"  class="white"> Catalog > </a>
            <a href="cart.jsp"  class="white"> Cart </a>
        </div>




<jsp:include page="/include/usernavigation.jsp" />
<jsp:include page="/include/site-navigation.jsp" />
    
    <div class="sec2">
     <form action="UserController">
                <h2 id="useri">
                    <font color="red" size="4">   ${message}<br> ${message2} </font> <br>
                    Create Log in and Register with ALT.winter</h2>
                <table class="table1">
                    
                    <tr>
                        <td>First Name *: </td>   
                        <td><input type="text" name="fname"/></td>
                        
                    </tr> 
                    
                    <tr>
                        <td> Last Name *: </td>
                        <td><input type="text" name="lname" /></td>
                    </tr>
                    <tr>
                        <td>  Email *: </td>
                        <td><input type="email" name="email" /></td>
                    </tr>    
                   
                     <tr>
                        <td>  Address Line1 *: </td>
                        <td><input type="text" name="addr1" /></td>
                    </tr>    
            
                      <tr>
                        <td>  Address Line2 *: </td>
                        <td><input type="text" name="addr2" /></td>
                    </tr>    
            
                     <tr>
                        <td>  City *: </td>
                        <td><input type="text" name="city" /></td>
                    </tr>    
                      
                      <tr>
                        <td>  State *: </td>
                        <td><input type="text" name="state" /></td>
                    </tr>
                    <tr>
                        <td>  Zip Code *: </td>
                        <td><input type="text" name="zipc" /></td>
                    </tr>
                    
                    <tr>
                        <td>  Country *: </td>
                        <td><input type="text" name="country" /></td>
                    </tr>
                    
                    <tr>
                        <td>  Password *: </td>
                        <td><input type="password" name="pwd" /></td>
                    </tr>

                    <tr>
                        <td> Re-type Password *: </td>
                        <td><input type="password" name="pwd1" /></td>
                    </tr>
                    
                    <tr>
                        <td>
               
                        </td>
                        <td>
                             <input type="submit" value="Submit" class="button2 blue" id="buttonsam"/>
                             
                        </td>
                </table>
            </form>
            
    </div>
    
<jsp:include page="/include/Footer.jsp" />
