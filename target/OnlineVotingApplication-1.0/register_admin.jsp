<%-- 
    Document   : register_admin
    Created on : 05-Sept-2023, 1:16:38 am
    Author     : rajat
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.mindrot.jbcrypt.BCrypt"%>
<%@page import="org.app.onlinevotingapplication.*"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Bharat vote</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" href=""/>
        <link rel="stylesheet" href="css/style.css"/>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
        <script src="https://kit.fontawesome.com/e0275a7647.js" crossorigin="anonymous"></script>
        <style>
            body
            {
                /*background: rgb(255,153,51);*/
                background-image:url(images/vote-bg.jpg);
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-size: cover;
                background-position: center;
                /*background-color:grey;*/

                /*background-color: linear-gradient(145deg, rgba(255,153,51,1) 0%, rgba(255,255,255,1) 55%, rgba(19,136,8,1) 100%);*/
                /*background-blend-mode: multiply;*/
            }
            .btn-type1
            {
                background-color:#000080;
                color:white;
            }
            .btn-type1:hover
            {
                border:1px solid #000080;
                color:#000080;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid p-5 bg-white">
            <div class="h1 text-center pt-2 mt-2">BHARAT <span style="color:#FF9933">VO</span><span style="color:#138808">TE</span></div>
            <p class="h6 text-center t-saffron">Online voting system</p>
            <div class="text-center h5 pt-3">Administration Registration</div>
        </div>
        <div class="container-fluid mt-5">
            <div class="container d-flex justify-content-center">
                <div class="row">
                    <p class="text-center"></p>
                    <div class="col-lg-12 col-md-12 ">
                        <div class="p-2 shadow-sm p-3 mb-5 bg-white rounded">
                            <form action="" method="post">
                                 <div class="form-group m-3">
                                    <label>Name</label>
                                    <input type="text" placeholder="Enter your name" class="form-control shadow-none" maxlength="50" name="admin_name" />
                                </div>
                                <div class="form-group m-3">
                                    <label>Administrative ID</label>
                                    <input type="text" placeholder="Assigned admin ID" class="form-control shadow-none" maxlength="8" name="admin_id" />
                                </div>
                                <div class="form-group m-3">
                                    <label>Password</label>
                                    <input type="password" placeholder="Enter your password" class="form-control shadow-none" maxlength="150" name="admin_password" />
                                </div>
                                 <div class="form-group m-3">
                                    <label>Email</label>
                                    <input type="text" placeholder="Enter your email" class="form-control shadow-none" maxlength="30" name="admin_email" />
                                </div>
                                <div class="form-group m-3">
                                    <div name="message" class="text-center text-danger"></div>
                                    <div class="d-grid">
                                        <button type="submit" name="btn-signup" class="btn-type1 btn btn-block mt-3">Register</button>
                                    </div>
                                </div>
                                <div class="text-center m-3">
                                    <a href="index.jsp" class="text-black text-decoration-none">Click here to Login</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
<%
    if(request.getMethod().equalsIgnoreCase("POST"))
    {
        String adminName = request.getParameter("admin_name");
        String adminID = request.getParameter("admin_id");
        String adminPassword = request.getParameter("admin_password");
        String adminEmail = request.getParameter("admin_email");
        String hashedPassword = BCrypt.hashpw(adminPassword,BCrypt.gensalt());
        
        %>
            <div><%=adminName%></div>
            <div><%=adminID%></div>
            <div><%=hashedPassword%></div>
            <div><%=adminEmail%></div>
        <%
        
        Administrator admin = new Administrator();
        AdministratorDAO adminDAO = new AdministratorDAO();
        
        admin.setAdminName(adminName);
        admin.setAdminID(adminID);
        admin.setAdminPassword(hashedPassword);
        admin.setAdminEmail(adminEmail);
        
        adminDAO.saveAdministrator(admin);
        
        boolean processed = adminDAO.isProcessed();
        if(processed)
        {
            response.sendRedirect("index.jsp");
        }
        else
        {
            response.sendRedirect("rough.jsp");
        }
    }
%>


