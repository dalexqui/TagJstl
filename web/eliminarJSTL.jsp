<%-- 
    Document   : eliminarJSTL
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
         <sql:setDataSource  driver="org.apache.derby.jdbc.ClientDriver" url="jdbc:derby://localhost:1527/sample" user="app" password="app" var="lib"/>
        <% String id = request.getParameter("id");%>
                
        <sql:update var="eliminar" scope="request" dataSource="${lib}">
            DELETE FROM product_code
            WHERE PROD_CODE = '<%=id%>'
        </sql:update>
            <%response.sendRedirect("index.jsp");%>
       
    </body>
</html>
