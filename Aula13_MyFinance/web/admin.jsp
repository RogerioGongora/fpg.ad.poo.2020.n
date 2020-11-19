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
        <h2>Administração do Sistema</h2>
        <%if(session.getAttribute("session.login") == null){%>
        <div>Vocênão tem permissão de acesso a página</div>
        <%}else if(!session.getAttribute("session.papel").equals("ADMINISTRADOR")){%>
        <div>Vocênão tem permissão de acesso</div>
        <%}else{%>
        <h3>Banco de Dados</h3>
        <%if(DbListener.exceptionMessage==null){%>
            <div>Banco de Dados Criado Com Sucesso</div>
        <%}else{%>
            <div style="color: red">Falha na Criação do Banco de Dados: <%= DbListener.exceptionMessage%></div>
        <%}%>
        <h3>Usuários</h3>
        <%for(Usuario u: Usuario.getList()){%>    
        <div>
            <ul>
                <li><%= u.getNome()%></li>
            </ul>
        </div>
        <%}%>
        <%}%>
    </body>
</html>
