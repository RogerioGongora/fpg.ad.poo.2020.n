<%-- 
    Document   : index
    Created on : 9 de nov de 2020, 20:02:27
    Author     : Rogerio
--%>

<%@page import="model.Usuario"%>
<%@page import="model.Categoria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="web.DbListener"%>
<!DOCTYPE html>
<%
    String exceptionMessage = null;
    if(request.getParameter("cancelar") != null){
            response.sendRedirect(request.getRequestURI());
        
    }
    if(request.getParameter("formInsert") != null){
        try {
            String nome = request.getParameter("nome");
            String descricao = request.getParameter("descricao");
            Categoria.Insert(nome, descricao);
            response.sendRedirect(request.getRequestURI());
            
        } catch (Exception ex) {
            exceptionMessage = ex.getLocalizedMessage();
        
        }
    }
    if(request.getParameter("formUpdate") != null){
        try {
            String nomeAntigo = request.getParameter("nomeAntigo");
            String nome = request.getParameter("nome");
            String descricao = request.getParameter("descricao");
            Categoria.Update(nomeAntigo, nome, descricao);
            response.sendRedirect(request.getRequestURI());
            
        } catch (Exception ex) {
            exceptionMessage = ex.getLocalizedMessage();
        
        }
    }
    if(request.getParameter("formDelete") != null){
        try {
            String nome = request.getParameter("nome");
            Categoria.Delete(nome);
            response.sendRedirect(request.getRequestURI());
            
        } catch (Exception ex) {
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
            <h2>Categorias</h2>
        <%if(session.getAttribute("session.login") == null){%>
            <div>Você não tem permissão de acesso</div>
        <%}else{%>
            <%if(request.getParameter("prepInsert") != null){%>
                <h3>Inserir Registro</h3>
                <form>
                    Nome: <input type="text" name="nome">
                    Descrição: <input type="text" name="descricao">
                    <input type="submit" name="formInsert" value="Inserir">
                    <input type="submit" name="cancelar" value="Cancelar">
                </form>
            <%}else if(request.getParameter("prepUpdate") != null){%>
            <h3>Alterar Registro</h3>
                <form>
                    <%String nome = request.getParameter("nome");
                      String descricao = request.getParameter("descricao");
                    %>
                    <input type="hidden" name="nomeAntigo" value="<%= nome%>">
                    Nome: <input type="text" name="nome" value="<%= nome%>">
                    Descrição: <input type="text" name="descricao" value="<%= descricao%>">
                    <input type="submit" name="formUpdate" value="Alterar">
                    <input type="submit" name="cancelar" value="Cancelar">
                </form>
            <%}else if(request.getParameter("prepDelete") != null){%>
            <h3>Deletar Registro</h3>
                <form>
                    <%String nome = request.getParameter("nome");%>
                    <input type="hidden" name="nome" value="<%= nome%>">
                    Excluir o Registro <b><%= nome%></b>?
                    <input type="submit" name="formDelete" value="Deletar">
                    <input type="submit" name="cancelar" value="Cancelar">
                </form>
            <%}else{%>
                <form method="post">
                    <input type="submit" name="prepInsert" value="Inserir">
                </form>
            <%}%>
            <h3>Lista</h3>
            <table border="1">
                <tr>
                    <th>Nome</th>
                    <th>Descrição</th>
                    <th>Comandos</th>
                </tr>
                <%for(Categoria c: Categoria.getList()){%>
                <tr>
                <td><%= c.getNome()%></td>
                <td><%= c.getDescricao()%></td>
                <td>
                    <form>
                        <input type="hidden" name="nome" value="<%= c.getNome()%>">
                        <input type="hidden" name="descricao" value="<%= c.getDescricao()%>">
                        <input type="submit" name="prepUpdate" value="Alterar">
                        <input type="submit" name="prepDelete" value="Excluir">
                    </form>
                </td>
                </tr>
                <%}%>
            </table>
        <%}%>
    </body>
</html>