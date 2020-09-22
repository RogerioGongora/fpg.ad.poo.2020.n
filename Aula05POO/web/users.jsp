<%-- 
    Document   : users
    Created on : 22 de set de 2020, 18:45:57
    Author     : Rogerio
--%>

<%@page import="br.edu.fatecpg.poo.User"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%
     ArrayList<User> userList = (ArrayList) application.getAttribute("userList");
     if(userList == null){
         userList = new ArrayList();
         userList.add(new User("Administrador", "admin@domain.com", "34817676"));
         userList.add(new User("Fulano", "fulano@domain.com", "33456789"));
         userList.add(new User("Beltrano", "beltrano@domain.com", "35665746"));
         userList.add(new User("Cicrano", "cicrano@domain.com", "36785858"));
         application.setAttribute("userList", userList);
     }
     if(request.getParameter("add")!=null){
         String name = request.getParameter("name");
         String email = request.getParameter("email");
         String password = request.getParameter("telefone");
         userList.add(new User(name, email, password));
         response.sendRedirect(request.getRequestURI());
     }
     if(request.getParameter("remove")!=null){
         int i = Integer.parseInt(request.getParameter("i"));
         userList.remove(i);
         response.sendRedirect(request.getRequestURI());
     }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuários - JavaOO</title>
    </head>
    <body>
        <div><a href="index.jsp">Voltar</a></div>
        <h1>JavaOO</h1>
        <h2>Usuários</h2>
        <form method="post">
            Nome: <input type="text" name="name"/>
            Email: <input type="text" name="email"/>
            Telefone: <input type="text" name="telefone"/>
            <input type="submit" name="add" value="Adicionar"/>
        </form>
        <hr/>
        <table border="1">
            <tr>
                <th>Índice</th>
                <th>Nome</th>
                <th>Email</th>
                <th>Telefone</th>
                <th>Comandos</th>
            </tr>
            <%for(int i=0; i<userList.size(); i++){%>
                <% User user = userList.get(i); %>
                <tr>
                    <td><%= i %></td>
                    <td><%= user.getName() %></td>
                    <td><%= user.getEmail() %></td>
                    <td><%= user.gettelefone() %></td>
                    <td>
                        <form>
                            <input type="submit" name="remove" value="Remover"/>
                            <input type="hidden" name="i" value="<%= i %>"/>
                        </form>
                    </td>
                </tr>
            <%}%>
        </table>
    </body>
</html>
