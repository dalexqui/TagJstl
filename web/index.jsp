<%-- 
    Document   : index
    Author     : David Quiñonez
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Conexion JSTL sql</title>
        <style type="text/css">
            .tg  {border-collapse:collapse;border-spacing:0;}
            .tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;}
            .tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;}
        </style>
    </head>
    <body>
        <h1>Conexion JSTL con Base de datos sample APP</h1>
        <%-- Esta etiqueta (setDataSource) permite establecer información de la fuente de datos. ademas maneja parámetros para configurar la información del origen de datos.--%>
        <sql:setDataSource  driver="org.apache.derby.jdbc.ClientDriver" url="jdbc:derby://localhost:1527/sample" user="app" password="app" var="lib"/>

        <%-- Esta etiqueta especifica la sentencia SQL para ejecutar en la base de datos.--%>
        <sql:query dataSource="${lib}" var="resultado">
            select * from product_code
        </sql:query> 

            <form action="insertarJSTL.jsp" method="post">
                Prod_code(2 Char) &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Discount_code(1 Char)  &nbsp;&nbsp; &nbsp; &nbsp; Description(10 Char)<br> <input type="text" name="prod_code" required="">&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="text" name="discount_code" required=""> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="text" name="description" required=""> 
        <input type="submit" value="Agregar" name="agregar"><br><br>
</form>

        <table border="2" class="tg">
            <tr>
                <th class="tg-031e"><strong>PROD_CODE </strong></th>
                <th class="tg-031e"><strong>DISCOUNT_CODE</strong></th>
                <th class="tg-031e">D<strong>DESCRIPTION</strong></th>
                <th class="tg-031e"><strong>OPCIONES</strong></th>
            </tr>
        <%-- Utilizamos forEach para ejecutar el mismo conjunto de estados de un número finito de veces. --%>
        <c:forEach var="fila" items="${resultado.rows}">

                <tr>
                    <td class="tg-031e"><c:out value="${fila.prod_code}" /> </td>
                    <td class="tg-031e"><c:out value="${fila.discount_code}" /></td>
                    <td class="tg-031e"><c:out value="${fila.description}" /></td>
                    <td class="tg-031e"> <a href="eliminarJSTL.jsp?id=<c:out value="${fila.prod_code}" />">Borrar</a></td>
                </tr>
          
        </c:forEach>
</table>

</body>
</html>
