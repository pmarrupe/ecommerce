<%@page import ="Util.ProductDB" %>
<%@page import="Model.Product" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<% 
    ProductDB pros = new ProductDB();
List itm = new ArrayList();
List<Product> pro_db = pros.getAllProducts();
for (int j = 0 ; j <  pro_db.size() ; j++ ) {
itm.add( pro_db.get(j).getProductName());
}
List category = new ArrayList();
for (int k=0; k < pro_db.size() ; k++) {
category.add( pro_db.get(k).getCatalogCategory());
}

List<Long> price = new ArrayList();
for (int l=0;  l< pro_db.size() ; l++) {
price.add( pro_db.get(l).getPrice());
}

List imageurl = new ArrayList();
for (int i=0; i < pro_db.size() ; i++) {
imageurl.add( pro_db.get(i).getImageUrl());
}


%>
