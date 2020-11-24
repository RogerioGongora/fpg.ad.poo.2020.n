<%-- 
    Document   : index
    Created on : 9 de nov de 2020, 20:02:27
    Author     : Rogerio
--%>

<%@page import="model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="web.DbListener"%>
<!DOCTYPE html>
<% 
  String exceptionMessage = null;
  if(request.getParameter("changePassword")!=null){ 
try{
    String login = (String)session.getAttribute("session.login");
    String password = request.getParameter("password");
    String newPassword = request.getParameter("newPassword");
    String newPassword2 = request.getParameter("newPassword2");
    if(Usuario.getUser(login, password)== null){
        exceptionMessage = "status invalido";
        }else if(!newPassword.equals(newPassword2)){
            exceptionMessage = "As senhas novas não conferem";
        }else{
            Usuario.changePassword(login, newPassword);
        }
    
}catch(Exception ex){
    exceptionMessage = ex.getLocalizedMessage();
}
}
%>
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
        <hr/>
        <h4>Alterar senha</h4>
        <% if(exceptionMessage!= null){ %>
        <div style="color: red"><%= exceptionMessage %></div>
        <%}%>
        <form method="post">
            Senha Atual: <input type="password" name="password"/>
            Nova senha: <input type="password" name="newPassword"/>
            Confirmação de nova senha: <input type="password" name="newPassword2"/>
            <input type="submit" name="changePassword" value="Alterar"/>
        </form>
        <%}%>
    </body>
</html>
