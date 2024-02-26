<%-- 
    Document   : logout
    Created on : 09-Sept-2023, 2:32:33 am
    Author     : rajat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       
        <%
        try 
        {
            %>
             <h1>You will be logged out in 3 seconds</h1>
            <%
            Thread.sleep(2000); // 5000 milliseconds = 5 seconds
        }
        catch (InterruptedException e) 
        {
            Thread.currentThread().interrupt();
        }
        
        if(session != null)
        {
            session.invalidate();
        }
        response.sendRedirect("index.jsp");
        %>
    </body>
</html>
