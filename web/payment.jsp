 <%@page import="Model.Orders"%>
<jsp:include page="/include/Header.jsp"/>
 
 <%@ page import="Util.UserDB" %>
 <%@ page import="Model.User" %>
 
  <%
                     Orders total = new Orders();
                    total = (Orders)session.getAttribute("currentOrder");
 
               double a=(0.4f*(total.getTotalCost()))+total.getTotalCost();
                float i=(float)a;
                
  %>
 
          <div id="bread">
            
            <a href="#"  class="white" > Signed in as ${theuser.getFirstName()}  </a> <br> <br> <br> 
            <a href="index.jsp" id="si" class="white" > Home </a>
        </div> 




<jsp:include page="/include/usernavigation.jsp" />
<jsp:include page="/include/site-navigation.jsp" />
    
    <div class="sec2">
        
        <form action="confirmOrder" method="post" >
    <input type="hidden" name="action" value="confirmOrder"/>
    

                <h2 id="useri1">Please enter your payment card details</h2>
               
                <table class="table1">
                    
                    <tr>
                        <td>Card Type *: </td>   
                        <td><select>
                            <option value="visa">Visa</option>
                            <option value="master">Master card</option>
                            </select>
                        </td>
                        
                    </tr> 
                    
                    <tr>
                        <td>Card number  *: </td>
                        <td><input type="text" name="cnum" required/></td>
                    </tr>
                    <tr>
                        <td> Expiration Date(MM/YYYY)*: </td>
                        <td><input type="number" name="exmonth" class="input1" required/>
                        <input type="number" name="exyear" class="input2" required/>
                        </td>
                    </tr>    
                   
                     <tr>
                        <td>  CVV(3 digits) *: </td>
                        <td><input type="password" name="cvv" maxlength="3" class="input2" required/></td>
                    </tr>    
     
                     <tr>
                        <td>   </td>
                        <td><input type="submit" value="Confirm Payment" class="button2 blue" id="buttonsam"/></td>
                    </tr> 
                    
                   
                   
                </table>
         </form>
                 <h4 id="heading"> Your card will be charged a total of: $ <%= i %></h4>
    </div>
    
<jsp:include page="/include/Footer.jsp" />
