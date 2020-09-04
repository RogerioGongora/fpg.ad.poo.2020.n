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
        <title>Tabuada</title>
    </head>
    <body>
        <h1>Tabuada</h1>
        <form>
            Quantidade
        <input type="number" name="n"/>
        <input type="submit" value="run"/>
        </form> 
        <%
            int n;
            try{
             n = Integer.parseInt(request.getParameter("n"));
            }catch(Exception ex){
            n = 0;
            }
        
       %>
    
        <%
        for(int i = 0; i<=10; i++){
        out.println(n*i);
        }    
        %>
        
        <a href="index.jsp">Voltar1</a>
     
         
    </body>
</html>
