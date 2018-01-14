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
        <h3>Woah! You are almost there. Please choose one from below to proceed with CheckOut!</h3>
<!--     <form action="https://localhost/Hw1/order.jsp">-->
     
        <form action="order.jsp">
            
        <input type="submit" class="button2 blue" id="style1" value="Log in as Existing User">
        
        </form>
     
   <form action="userInfo.jsp">
        <input type="submit" class="button2 blue" id="style2" value="Register and create an account">
        
     </form>
            
    </div>
    
<jsp:include page="/include/Footer.jsp" />
