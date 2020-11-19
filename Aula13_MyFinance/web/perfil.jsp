<%-- 
    Document   : index
    Created on : 9 de nov de 2020, 20:02:27
    Author     : Rogerio
--%>

<%@page import="model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="web.DbListener"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Início</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf"%>
        <h2>Perfil do Usuário</h2>
        <%if(session.getAttribute("session.login") == null){%>
        <div>Vocênão tem permissão de acesso</div>
        <%}else{%>
        <h3>Login</h3>
        <div><%= session.getAttribute("session.login")%></div>
        <h3>Nome</h3>
        <div><%= session.getAttribute("session.nome")%></div>
        <h3>Papel</h3>
        <div><%= session.getAttribute("session.papel")%></div>
        <%}%>
    </body>
</html>
