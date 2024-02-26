<%-- 
    Document   : voter_dashboard
    Created on : 23-Oct-2023, 10:41:49 am
    Author     : rajat
--%>

<%
    String voterID = "";
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.time.*"%>
<%@page import="java.util.*"%>
<%@page import="java.time.format.*"%>
<%@page import="org.app.onlinevotingapplication.*"%>

<%
    
    voterID = (String) session.getAttribute("voter_id");
    if(voterID == null)
    {
       response.sendRedirect("logout.jsp");
    }
    
    VoterManagement voterManagement = new VoterManagement();
    Voter voter = voterManagement.getVoterDetails(voterID);
    
    String voterName = voter.getVoterName();
    String voterAadhaar = voter.getVoterAadhaarNumber();
    
    StateManagement stateManagement = new StateManagement(); 
    ElectionManagement electionManagement = new ElectionManagement();
    List<Election> electionList = electionManagement.getElectionList();
    
    if(session.getAttribute("election_processed") != null && (Boolean) session.getAttribute("election_processed") )
    {
%>
<script>
    alert("You have casted your vote successfully");
</script>
<%
    }
session.removeAttribute("election_processed");

%>


<!DOCTYPE html>
<html>                         
    <head>
        <title>Voter Dashboard</title>
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

            .bg-blue
            {
                background-color:#000080;
            }

            .btn-type1
            {
                background-color:#000080;
                color:white;
                transition: 0.2s;
            }
            .btn-type1:hover
            {
                border:1px solid #000080;
                color:#000080;
                background-color: white;
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
            .view-image
            {
                width:11rem;
                height:12rem;
            }
            .btn-type2
            {
                border-bottom-left-radius: 0;
                border-top-left-radius: 0;
            }
            .display_gradient
            {
                transition: 0.3s;
                background: rgb(255,255,255);
                background: linear-gradient(140deg, rgba(255,153,51,0.5) 0%, rgba(255,255,255,100) 50% ,rgba(19,136,8,0.5) 100%);
            }
            .display_gradient:hover
            {
                transition: 0.3s;
                background: rgb(255,255,255);
                background: linear-gradient(140deg, rgba(255,153,51,0.6) 0%, rgba(255,255,255,100) 50% ,rgba(19,136,8,0.6) 100%);
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
                        <a href="voter_dashboard.jsp" class="t-blue a-link" style="font-size:1.1rem;">
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
                    <div class="h5 text-center">Voter Dashboard</div>
                    <div class="row">
                        <div class="col-lg-4 col-md-12">
                            <div class="div_block1 m-3 p-3 border rounded">
                                <div class="h6 text-center">Voter</div>
                                <table class="table table-striped">
                                    <tr class="">
                                        <td colspan="2" class="text-center">
                                            <img src="images/avatar.png" style="width:170px;height:190px;" class="img-thumbnail" alt="alt"/>
                                        </td>
                                    </tr>
                                    <tr class="">
                                        <td class="p-2 pt-3 ">Voter Name</td>
                                        <th class="text-hover p-2 pt-3 ps-5 text-end"><%=voterName%></th>
                                    </tr>   
                                    <tr class="">
                                        <td class="p-2 pt-3 ">Voter ID</td>
                                        <th class="text-hover p-2 pt-3 ps-5 text-end"><%=voterID%></th>
                                    </tr>
                                    <tr class="">
                                        <td class="p-2 pt-3 ">Aadhaar Number</td>
                                        <th class="text-hover p-2 pt-3 ps-5 text-end"><%=voterAadhaar%></th>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div class="col-lg-8 col-md-12">
                            <div class="container-fluid p-3 border rounded mt-3" style="height:750px;overflow:scroll;">
                                <div class="h6 text-center p-3">Elections For You</div>
                                <%
                                    for(int i=0;i<electionList.size();i++)
                                    {
                                        Election election = electionList.get(i);
                                %>
                                <form action="voting_panel.jsp?election_id=<%=election.getElectionID()%>" class="form-group" method="POST">


                                    <div class="row">
                                        <div class="col-md-6 col-lg-4">
                                            <button type="submit" class="from-control btn btn_type1 text-hover display_gradient div_block2 m-3 p-3 border rounded shadow-sm">
                                                <div class="p-1">
                                                    <div class="h6"><%=election.getElectionType()%></div>
                                                    <div class="h6">Active till</div>
                                                    <div class=""><%=election.getElectionEndTime()%>, <%=election.getElectionEndDate()%></div>
                                                    <div class="pt-4 h6 text-center">Click here to cast your vote</div>
                                                </div>
                                            </button>
                                        </div>
                                    </div>

                                </form>
                                <%
                }
                                %>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </body>

</html>

