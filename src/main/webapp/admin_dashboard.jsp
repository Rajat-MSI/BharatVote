<%-- 
    Document   : admin-dashboard
    Created on : 31-Aug-2023, 5:21:07 pm
    Author     : rajat
--%>
<%
    String adminName = "";     
    String adminID = "";
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.time.*"%>
<%@page import="java.util.*"%>
<%@page import="java.time.format.*"%>
<%@page import="org.app.onlinevotingapplication.*"%>

<%
    
    adminID = (String) session.getAttribute("admin_id");
    if(adminID == null)
    {
       response.sendRedirect("logout.jsp");
    }
        
    PageNavigationManagement pageNavManagement = new PageNavigationManagement();
    DashboardNavigations dNavigation = pageNavManagement.getDashboardNavigation();
    
    
    String navBlock1 = dNavigation.getNavBlock1();
    String navBlock2 = dNavigation.getNavBlock2();
    String navBlock3 = dNavigation.getNavBlock3();
    String navBlock4 = dNavigation.getNavBlock4();
    String navBlock5 = dNavigation.getNavBlock5();
    String navBlock6 = dNavigation.getNavBlock6();
    
    AdministratorManagement adminManagement = new AdministratorManagement();
    Administrator admin = adminManagement.getAdminDetails(adminID);
    
    adminName = admin.getAdminName();
    
    GenerateID genID = new GenerateID();
    String electionID = "ELECT" + genID.generateID();
    StateManagement stateManagement = new StateManagement();    
%>


<!DOCTYPE html>
<html>                         
    <head>
        <title>Dashboard</title>
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
                background-color:rgba(0,0,0,0);

                /*background-color: linear-gradient(145deg, rgba(255,153,51,1) 0%, rgba(255,255,255,1) 55%, rgba(19,136,8,1) 100%);*/
                background-blend-mode: multiply;
            }
            .t-saffron
            {
                color:#FF9933;
            }

            .t-green
            {
                color:#138808;
            }

            .t-blue
            {
                color:#000080;
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
            .a-link
            {
                text-decoration: none;

            }
            .text-hover
            {
                transition: 0.4s;
                cursor:pointer;
            }
            .text-hover:hover
            {
                transition:0.2s;
                transform:scale(1.02);
            }

        </style>
    </head>
    <body>
        <div class="container-fluid pt-3 pb-4">
            <nav class="navbar navbar-default navbar-expand-lg bg-white border shadow-sm fixed-top">
                <div class="container">
                    <div class="p-1">
                        <div class="h4">BHARAT <span style="color:#FF9933">VO</span><span style="color:#138808">TE</span>
                        </div>
                        <!--<div class="h6 t-green">Online voting system</div>-->
                    </div>
                    <div class="text-center">
                        <a href="admin_dashboard.jsp" class="t-blue a-link" style="font-size:1.1rem;">
                            <i class="fa-solid fa-house ms-4"></i> 
                        </a>
                        <a href="" class="t-blue a-link" style="font-size:1.1rem;">
                            <i class="fa-solid fa-gear ms-4"></i> 
                        </a>
                        <a href="logout.jsp" class="t-blue a-link" style="font-size:1.1rem;">
                            <i class="fa-solid fa-sign-out ms-4"></i> 
                        </a>
                    </div>
                </div>
            </nav>
            <div class="pt-3"></div>
            <div class="container bg-white border rounded shadow-sm p-3 mt-5 pt-4">
                <div class="container mt-1">
                    <div class="row">
                        <div class="col-md-12 col-lg-4 ">
                            <div class="div_block1 m-3 p-3 border rounded">
                                <div class="h6 text-center">Administrator</div>
                                <table class="table table-striped">
                                    <tr class="">
                                        <td colspan="2" class="text-center">
                                            <img src="images/avatar.png" style="width:170px;height:190px;" class="img-thumbnail" alt="alt"/>
                                        </td>
                                    </tr>
                                    <tr class="">
                                        <td class="p-2 pt-3 ">Administrator Name</td>
                                        <th class="text-hover p-2 pt-3 ps-5 text-end"><%=adminName%></th>
                                    </tr>   
                                    <tr class="">
                                        <td class="p-2 pt-3 ">Administrator ID</td>
                                        <th class="text-hover p-2 pt-3 ps-5 text-end"><%=adminID%></th>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div class="col-md-12 col-lg-8 border rounded shadow-sm p-4">
                            <div class="h5 text-center"> <i class="fa-solid fa-hand-pointer pe-1"></i> Generate Elections</div>
                            <form action="RegisterElection" method="POST" class="form-group">
                                <div class="row">
                                    <div class="row">
                                        <input type="hidden" name="election_id" value="<%=electionID%>">
                                        <div class="col-md-12 col-md-6 col-lg-4 p-2">
                                            <label>Election type</label>
                                            <select class="form-select shadow-none" name="election_type" required>
                                                <option value="">Select</option>
                                                <option value="General elections">General elections</option>
                                                <option value="State elections">State elections</option>
                                            </select>
                                        </div>
                                        <%
                                           LocalDate currentDate = LocalDate.now();
                                    
                                           String year = String.valueOf(currentDate.getYear() + 1);
                                    
                                           DateTimeFormatter setFormat = DateTimeFormatter.ofPattern("MM-dd");
                                           String formattedDate = currentDate.format(setFormat);
                                        %>

                                        <div class="col-md-12 col-md-6 col-lg-4 p-2">
                                            <label>State</label>
                                            <!--<input type="text" name="state" class="form-control shadow-none" placeholder="State" >-->
                                            <select name="election_state" class="form-control  shadow-none" disabled="true">
                                                <option value="">Select State</option>
                                                <%
                                                for(int i=0;i<stateManagement.getStateList().size();i++)
                                                {
                                                    State stateList = stateManagement.getStateList().get(i);
                                                %>
                                                <option value="<%=stateList.getStateName()%>"><%=stateList.getStateName()%></option>
                                                <%
                                            }
                                                %>
                                            </select>
                                        </div>
                                        <div class="col-md-12 col-md-6 col-lg-4 p-2">
                                            <label>Start date</label>
                                            <input type="date" value="" min="" max="" name="election_start_date" class="form-control shadow-none" required/>
                                        </div>
                                        <script>
                                            $("input[name='start-date']").attr("min", "<%=currentDate%>");
                                            $("input[name='start-date']").attr("max", "<%=year%>-<%=formattedDate%>");
                                        </script>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12 col-md-6 col-lg-4 p-2">
                                            <label>End date</label>
                                            <input type="date" name="election_end_date" class="form-control shadow-none" required/>
                                            <script>
                                                $("input[name='end-date']").attr("min", "<%=currentDate%>");
                                                $("input[name='end-date']").attr("max", "<%=year%>-<%=formattedDate%>");
                                            </script>
                                        </div>
                                        <div class="col-md-12 col-md-6 col-lg-4 p-2">
                                            <label>Start time</label>
                                            <input type="time" name="election_start_time" class="form-control shadow-none" required/>
                                        </div>
                                        <div class="col-md-12 col-md-6 col-lg-4 p-2">
                                            <label>End time</label>
                                            <input type="time" name="election_end_time" class="form-control shadow-none" required/>

                                        </div>
                                    </div>
                                    <div class="row pt-3">
                                        <div clas="col-md-4">
                                            <input type="Submit" value="Generate" name="name" class="btn btn-type1 btn-block">
                                            <input type="Reset" value="Reset" name="name" class="btn btn-type1 btn-block">
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="container mt-4 border rounded shadow-sm mb-4">
                    <div class="row p-2">
                        <div class="text-center h5 p-2"><i class="fa-solid fa-bars pe-2"></i>Main Menu</div>
                        <div class="col-md-6 col-lg-4 col-sm-12 text-hover">
                            <a href="election_management.jsp" class="a-link text-dark">
                                <div class="p-3 mt-3 mb-3 border rounded shadow-sm" name="administration_panel">
                                    <div class="h6 text-center"><%= navBlock1 %></div>
                                    <p class="text-center">
                                        Manage the voting process, including creating, modifying election data and polls.
                                    </p>
                                    <div class="d-flex justify-content-center">
                                        <i class="t-blue fa-solid fa-chalkboard-user p-2" style="font-size:6rem;"></i>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-6 col-lg-4 col-sm-12 text-hover">
                            <a href="voter_management.jsp" class="a-link text-dark">
                                <div class="p-3 mt-3 mb-3 border rounded shadow-sm" name="voter_management">
                                    <div class="h6 text-center"><%= navBlock2 %></div>
                                    <p class="text-center">
                                        manage the voters, including adding,remove , or updating voter information,
                                        from the list.
                                    </p>
                                    <div class="d-flex justify-content-center">
                                        <i class="t-blue fa-solid fa-check-to-slot p-2" style="font-size:6rem;"></i>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-6 col-lg-4 col-sm-12 text-hover">
                            <a href="candidate_management.jsp" class="a-link text-dark">
                                <div class="p-3 mt-3 mb-3 border rounded shadow-sm" name="candidate_management">
                                    <div class="h6 text-center"><%= navBlock3 %></div>
                                    <p class="text-center">
                                        manage the candidates Register,
                                        update, and remove them from the list
                                    </p>
                                    <div class="d-flex justify-content-center">
                                        <i class="t-blue fa-solid fa-user-tie p-2" style="font-size:6rem;"></i>
                                    </div>
                                </div>
                            </a>

                        </div>
                        <div class="col-md-6 col-lg-4 col-sm-12 text-hover">
                            <a href="party_management.jsp" class="a-link text-dark">
                                <div class="p-3 mt-3 mb-3 border rounded shadow-sm" name="party_management">
                                    <div class="h6 text-center"><%= navBlock4 %></div>
                                    <p class="text-center">
                                        manage the political Parties Register,
                                        update, and remove parties from the list
                                    </p>
                                    <div class="d-flex justify-content-center">
                                        <i class="t-blue fa-solid fa-landmark-flag p-2" style="font-size:6rem;"></i>
                                    </div>
                                </div>
                            </a>

                        </div>
                        <div class="col-md-6 col-lg-4 col-sm-12 text-hover">
                            <a href="result_management.jsp" class="a-link text-dark">
                                <div class="p-3 mt-3 mb-3 border rounded shadow-sm" name="result_management">
                                    <div class="h6 text-center"><%= navBlock5 %></div>
                                    <p class="text-center">
                                        manage the Election Result,
                                        view and declare result of on going elections
                                    </p>
                                    <div class="d-flex justify-content-center">
                                        <i class="t-blue fa-solid fa-file p-2" style="font-size:6rem;"></i>
                                    </div>
                                </div>
                            </a>

                        </div>
                        <div class="col-md-6 col-lg-4 col-sm-12 text-hover">
                            <a href="party_management.jsp" class="a-link text-dark">
                                <div class="p-3 mt-3 mb-3 border rounded shadow-sm" name="alliance_management">
                                    <div class="h6 text-center"><%= navBlock6 %></div>
                                    <p class="text-center">
                                        manage the Alliances in the national politics,
                                        update, and remove parties from the list
                                    </p>
                                    <div class="d-flex justify-content-center">
                                        <i class="t-blue fa-solid fa-handshake p-2" style="font-size:6rem;"></i>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script>
        //for election type state or national
        var election_type = $("select[name='election_type']");
        var state = $("select[name='election_state']");
        election_type.on("input", function ()
        {
            let value = election_type.find(":selected").val();
            if (value !== "State elections")
            {
                state.attr("disabled", "disabled");
            } else
            {
                state.removeAttr("disabled");
            }
        });
    </script>
</html>

