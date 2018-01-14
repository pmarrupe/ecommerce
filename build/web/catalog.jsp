<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="/DisplayCatalog.jsp" %>

 
        
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
            <a href="index.jsp"  class="white"> Home > </a>  
            <a href="catalog.jsp"  class="white"> Catalog </a>
        </div>
       
   

<jsp:include page="/include/usernavigation.jsp" />
<jsp:include page="/include/site-navigation.jsp" />
<div class="sec2">

<c:choose>

    <c:when test="${Flag==1}">

   

   
               
     <table class="table2">
             <caption>
           
                 <form action="CatalogController">
                 
                     
                  
                 Category: 
                
                 <select name="categories" onchange="this.form.submit()">
             <option value="All" >  All  </option>
             <option value="Menclothing" selected> Men's</option>
  <option value="Womenclothing" >Women's</option>
         </select>
                 
                 </form>
             </caption>
             
             <thead>
                 
                 <tr>
                     <th>&nbsp;&nbsp; </th> 
                     <th>Product </th>
                     <th> Category </th>
                     <th>Price </th>
                 </tr>
             </thead>

            
             
        
             
             <tbody>
                 
                 
<tr>
    <td><img src="<%= imageurl.get(0) %>" alt> </td>
    <td><a href="CatalogController?product_code=A101" class="a1"  >  <c:out value="<%= itm.get(0) %>"/> </a></td> 
    <td> <c:out value= "<%= category.get(0) %>"/> </td>
    <td>  $ <c:out value="<%= price.get(0) %>"/>  </td>
</tr>


<tr>
    <td><img src="<%= imageurl.get(1) %>" alt> </td>
    <td><a href="CatalogController?product_code=A102" class="a1"  > <c:out value="<%= itm.get(1) %>"/> </a></td> 
    <td> <c:out value= "<%= category.get(1) %>"/> </td>
    <td>  $ <c:out value="<%= price.get(1) %>"/>  </td>


</tr>


<tr>
    <td><img src="<%= imageurl.get(2) %>" alt> </td>
    <td><a href="CatalogController?product_code=A103" class="a1"  > <c:out value="<%= itm.get(2) %>"/> </a></td> 
    <td> <c:out value= "<%= category.get(2) %>"/> </td>
    <td>  $ <c:out value="<%= price.get(2) %>"/>  </td>


</tr>



             </tbody>
           
             
       
     </table>
     
</c:when>

    
   <c:when test="${Flag==2}">  
            
     <table class="table2">
             <caption>
           
                 <form action="CatalogController">
                 
                     
                  
                 Category: 
                
                 <select name="categories" onchange="this.form.submit()">
             <option value="All" >  All  </option>
             <option value="Menclothing"> Men's</option>
  <option value="Womenclothing"  selected>Women's</option>
         </select>
                 
                 </form>
             </caption>
             
             <thead>
                 
                 <tr>
                     <th>&nbsp;&nbsp; </th> 
                     <th>Product </th>
                     <th> Category </th>
                     <th>Price </th>
                 </tr>
             </thead>

            
             
        
             
             <tbody>
                 
                 
<tr>
    <td><img src="<%= imageurl.get(3) %>" alt> </td>
    <td><a href="CatalogController?product_code=A104" class="a1"  > <c:out value="<%= itm.get(3) %>"/> </a></td> 
    <td> <c:out value= "<%= category.get(3) %>"/> </td>
    <td>  $ <c:out value="<%= price.get(3) %>"/>  </td>

</tr>


<tr>
    <td><img src="<%= imageurl.get(4) %>" alt> </td>
    <td><a href="CatalogController?product_code=A105" class="a1"  > <c:out value="<%= itm.get(4) %>"/> </a></td> 
    <td> <c:out value= "<%= category.get(4) %>"/> </td>
    <td>  $ <c:out value="<%= price.get(4) %>"/>  </td>


</tr>


<tr>
    <td><img src="<%= imageurl.get(5) %>" alt> </td>
    <td><a href="CatalogController?product_code=A106" class="a1"  > <c:out value="<%= itm.get(5) %>"/> </a></td> 
    <td> <c:out value= "<%= category.get(5) %>"/> </td>
    <td>  $ <c:out value="<%= price.get(5) %>"/>  </td>


</tr>



             </tbody>
           
             
       
     </table>


   </c:when>  
    
    <c:otherwise> 
    
    <table class="table2">
             <caption>
           
                 <form action="CatalogController">
                 
                     
                  
                 Category: 
                
                 <select name="categories" onchange="this.form.submit()">
             <option value="All" >  All  </option>
             <option value="Menclothing"> Men's</option>
  <option value="Womenclothing" >Women's</option>
         </select>
                 
                 </form>
             </caption>
             
             <thead>
                 
                 <tr>
                     <th>&nbsp;&nbsp; </th> 
                     <th>Product </th>
                     <th> Category </th>
                     <th>Price </th>
                 </tr>
             </thead>

            
             
        
             
             <tbody>
           
<tr>
    <td><img src="<%= imageurl.get(0) %>" alt> </td>
    <td><a href="CatalogController?product_code=A101" class="a1"  > <c:out value="<%= itm.get(0) %>"/> </a></td> 
    <td> <c:out value= "<%= category.get(0) %>"/> </td>
    <td>  $ <c:out value="<%= price.get(0) %>"/>  </td>

</tr>

<tr>
    <td><img src="<%= imageurl.get(1) %>" alt> </td>
    <td><a href="CatalogController?product_code=A102" class="a1"  > <c:out value="<%= itm.get(1) %>"/> </a></td> 
    <td> <c:out value= "<%= category.get(1) %>"/> </td>
    <td>  $ <c:out value="<%= price.get(1) %>"/>  </td>


</tr>


<tr>
    <td><img src="<%= imageurl.get(2) %>" alt> </td>
    <td><a href="CatalogController?product_code=A103" class="a1"  > <c:out value="<%= itm.get(2) %>"/> </a></td> 
    <td> <c:out value= "<%= category.get(2) %>"/> </td>
    <td>  $ <c:out value="<%= price.get(2) %>"/>  </td>


</tr>

<tr>
    <td><img src="<%= imageurl.get(3) %>" alt> </td>
    <td><a href="CatalogController?product_code=A104" class="a1"  > <c:out value="<%= itm.get(3) %>"/> </a></td> 
    <td> <c:out value= "<%= category.get(3) %>"/> </td>
    <td>  $ <c:out value="<%= price.get(3) %>"/>  </td>


</tr>

<tr>
    <td><img src="<%= imageurl.get(4) %>" alt> </td>
    <td><a href="CatalogController?product_code=A105" class="a1"  > <c:out value="<%= itm.get(4) %>"/> </a></td> 
    <td> <c:out value= "<%= category.get(4) %>"/> </td>
    <td>  $ <c:out value="<%= price.get(4) %>"/>  </td>


</tr>

<tr>
    <td><img src="<%= imageurl.get(5) %>" alt> </td>
    <td><a href="CatalogController?product_code=A106" class="a1"  > <c:out value="<%= itm.get(5) %>"/> </a></td> 
    <td> <c:out value= "<%= category.get(5) %>"/> </td>
    <td>  $ <c:out value="<%= price.get(5) %>"/>  </td>


</tr>

          </tbody>
        
              
 
    
        
    
         </table>
   
    </c:otherwise>
 
</c:choose>
 </div>         
          
   
    
<jsp:include page="/include/Footer.jsp" />