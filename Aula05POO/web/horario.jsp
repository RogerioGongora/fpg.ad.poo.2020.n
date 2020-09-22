<%-- 
    Document   : horario
    Created on : 22 de set de 2020, 18:14:11
    Author     : Rogerio
--%>

<%@page import="br.edu.fatecpg.poo.Horario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Horario agora = new Horario(7, 27);
    Horario intervalo = new Horario();
    intervalo.setHoras(20);
    intervalo.setMinutos(40);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Horário - JavaOO</title>
    </head>
    <body>
        <div><a href="index.jsp">Voltar</a></div>
        <h1>JavaOO</h1>
        <h2>Classe Horário</h2>
        <h3>Agora</h3>
        <div>
            <%= agora.getHorário()%>
        </div>
        <h3>Intervalo:</h3>
        <div>
            <%= intervalo.getHoras()%>:<%= intervalo.getMinutos()%>
        </div>
    </body>
</html>
