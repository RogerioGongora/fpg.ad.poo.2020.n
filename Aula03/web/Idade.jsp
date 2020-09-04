<%-- 
    Document   : index
    Created on : 1 de set de 2020, 18:01:26
    Author     : Rogerio
--%>

<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
        int anoAtual = Calendar.getInstance().get(Calendar.YEAR);
        int anoNascimento = 2001;
        int idade = anoAtual - anoNascimento;
        %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Minha idade - JSP</title>
    </head>
    <body>
        <h1>Idade de Rogério Alexandre Gongora</h1>
        <h2>Idade:</h2>
        <%=idade%>
        <br>
        <a href="index.jsp">Voltar</a>
    </body>
</html>
