<%-- 
    Document   : index
    Created on : 1 de set de 2020, 18:01:26
    Author     : Rogerio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
        java.util.Date agora = new java.util.Date();
        out.println("<h3>Agora, no servidor: " +agora+ "</h3>");
        %>
         <a href="Idade.jsp">Voltar</a>
         <a href="tabuada.jsp">Voltar1</a>
    </body>
</html>
