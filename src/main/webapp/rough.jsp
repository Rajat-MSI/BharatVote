<%-- 
    Document   : rough
    Created on : 11-Sept-2023, 1:04:31 pm
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
        <h1>Hello World!</h1>
        <div class="table-responsive">
            <table class="table table-striped text-center">
                <tr>
                    <th>Voter ID</th>
                    <th>Name</th>
                    <th>Father's Name</th>
                    <th>Date Of Birth</th>
                    <th>Address</th>
                    <th>Edit</th>
                </tr>
                <%
                    List<Voter> voterList = voterDAO.getAllVoters();
                    for(int i=voterList.size() - 1;i>=0;i--)
                    {
                        Voter list = voterList.get(i);
                %>
                <tr>
                    <td><%=list.getVoterID()%></td>
                    <td><%=list.getVoterName()%></td>
                    <td><%=list.getVoterFatherName()%></td>
                    <td><%=list.getVoterDOB()%></td>
                    <td><%=list.getVoterAddress()%></td>
                    <td>
                        <button value="<%=list.getVoterID()%>" class="btn btn-block btn-type1"><i class="fa-regular fa-pen-to-square p-1"></i> Edit</button>
                    </td>
                </tr>
                <%     
                                        
            }
                %>
            </table>
        </div>
    </body>
</html>