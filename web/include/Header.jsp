<%-- 
    Document   : Header
    Created on : Feb 9, 2015, 7:38:20 PM
    Author     : prashanth
--%>

<!DOCTYPE html>
<!--[if lt IE 9]>
  <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    
    <head>
        <title>Alt Winter</title>
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="CSS/style.css">
       
       
   
    </head>
    <body>
    <header> <h1> ALT. Winter Store </h1> 
        
   <c:if test="${userL!=null}">

              <form action="logout" id="foor"> <input type="submit" value="Logout" id="inp1" class="button2 blue"/> </form>     
              </c:if>
        
    </header>
        
   
  
   
        
