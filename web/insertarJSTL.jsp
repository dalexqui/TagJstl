<%-- 
    Document   : insertarJSTL
    Author     : David Quiñonez
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%if(request.getParameter("agregar") != null) {%>
        
         <sql:setDataSource  driver="org.apache.derby.jdbc.ClientDriver" url="jdbc:derby://localhost:1527/sample" user="app" password="app" var="lib"/>
        
    <sql:update var="insertar" scope="request" dataSource="${lib}">
        INSERT INTO product_code (PROD_CODE, DISCOUNT_CODE, DESCRIPTION)
        VALUES ('<%=request.getParameter("prod_code")%>', '<%=request.getParameter("discount_code")%>', '<%=request.getParameter("description")%>')
    </sql:update>
        <%response.sendRedirect("index.jsp");}%>

</body>
</html>
