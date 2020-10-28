<%-- 
    Document   : index
    Created on : 26 de out de 2020, 20:11:14
    Author     : Rogerio
--%>

<%@page import="listeners.DbListener"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Início - Controle de acesso</title>
    </head>
    <body>
        <%if(DbListener.exception!=null){%>
        <div style="color: red"><%= DbListener.exception %></div>
        <hr/>
        <%}%>
        
        <%
            String loginErrorMessage = null;
            if(request.getParameter("login")!=null){
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String name = DbListener.login(email, password);
                if(name==null){
                    loginErrorMessage = "Usuário e/ou senha inválido(s)";
                }else{
                    session.setAttribute("email", email);
                    session.setAttribute("name", name);
                    response.sendRedirect(request.getRequestURI());
                }
            }
            if(request.getParameter("logout")!=null){
                session.removeAttribute("email");
                session.removeAttribute("name");
                response.sendRedirect(request.getRequestURI());
            }
        %>
        <%if(session.getAttribute("email")==null){%>
            <%if(loginErrorMessage!=null){%>
            <div style="color: red"><%= loginErrorMessage %></div>
            <%}%>
            <form method="post">
                Email: <input type="text" name="email"/>
                Senha: <input type="password" name="password"/>
                <input type="submit" name="login" value="Entrar"/>
            </form>
        <%}else{%>
            <form>
                Bem vindo, <%= session.getAttribute("name") %>
                <input type="submit" name="logout" value="Sair"/>
            </form>
        <%}%>
        
        <h1>Controle de acesso</h1>
        <%if(session.getAttribute("email")==null){%>
            <div>Entre no site para ver o conteúdo</div>
        <%}else{%>
            <%try{%>
                <h2>Usuários: <%= DbListener.getUsersCount() %></h2>
                <%for(String email: DbListener.getUsersEmails()){%>
                    <div><%= email %></div>
                <%}%>
            <%}catch(Exception ex){%>
                <div style="color:red"><%= ex.getMessage() %></div>
            <%}%>
        <%}%>
    </body>
</html>