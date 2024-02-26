<%-- 
    Document   : election_management
    Created on : 26-Oct-2023, 9:09:01 pm
    Author     : rajat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.time.*"%>
<%@page import="java.util.*"%>
<%@page import="java.time.format.*"%>
<%@page import="org.app.onlinevotingapplication.*"%>

<%
    
String adminID = (String) session.getAttribute("admin_id");
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

ElectionManagement electionManagement = new ElectionManagement();
List<Election> electionList = electionManagement.getElectionList();

if(request.getMethod().equalsIgnoreCase("POST"))
{
    if(request.getParameter("btn_delete_election") != null)
    {
        String electionID = request.getParameter("election_id");
        electionManagement.deleteElectionDetails(electionID);   
        response.sendRedirect("admin_dashboard.jsp?admin_id="+adminID);
    }
}
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
                <div class="container">
                    <nav class="navbar navbar-light">
                        <form class="container justify-content-center">
                            <a href="election_management.jsp" class="text-hover t-blue"><button class="btn btn-block btn-type1 m-2" type="button">
                                    <i class="fa-solid fa-chalkboard-user me-2"></i> <%=navBlock1%></button>
                            </a>
                            <a href="voter_management.jsp" class="text-hover t-blue"><button class="btn btn-block btn-type1 m-2" type="button">
                                    <i class="fa-solid fa-check-to-slot me-2"></i> <%=navBlock2%></button>
                            </a>
                            <a href="candidate_management.jsp" class="text-hover t-blue"><button class="btn btn-block btn-type1 m-2" type="button">
                                    <i class="fa-solid fa-user-tie me-2"></i> <%=navBlock3%></button>
                            </a>
                            <a href="party_management.jsp" class="text-hover t-blue"><button class="btn btn-block btn-type1 m-2" type="button">
                                    <i class="fa-solid fa-landmark-flag me-2"></i> <%=navBlock4%></button>
                            </a>
                            <a href="result_management.jsp" class="text-hover t-blue"><button class="btn btn-block btn-type1 m-2" type="button">
                                    <i class="fa-solid fa-file me-2"></i> <%=navBlock5%></button>
                            </a>
                            <a href="alliance_management.jsp" class="text-hover t-blue"><button class="btn btn-block btn-type1 m-2" type="button">
                                    <i class="fa-solid fa-handshake me-2"></i> <%=navBlock6%></button>
                            </a>
                        </form>
                    </nav>      

                </div>
                <div class="container mt-1">
                    <div class="h5 text-center">Election Management</div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12">
                            <div class="container-fluid p-3 border rounded mt-3" style="height:700px; overflow: scroll;">
                                <%
                                for(int i=0;i<electionList.size();i++)
                                {
                                    Election election = electionList.get(i);
                                %>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="text-hover display_gradient div_block2 m-3 p-3 border rounded shadow-sm">
                                            <div class="h6"><%=election.getElectionID()%></div>
                                            <div class="h6"><%=election.getElectionType()%></div>
                                            <table class="table table-borderless">
                                                <tr>
                                                    <td class="h6">Start date</td>
                                                    <td class="h6">End date</td>
                                                </tr>
                                                <tr>
                                                    <td><%=election.getElectionStartDate()%></td>
                                                    <td><%=election.getElectionEndDate()%></td>

                                                </tr>
                                                <tr>
                                                    <td class="h6">Start time</td>
                                                    <td class="h6">End time</td>
                                                </tr>
                                                <tr>
                                                    <td><%=election.getElectionStartTime()%></td>
                                                    <td><%=election.getElectionEndTime()%></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" class="text-end">
                                                        <form action="" method="post">
                                                            <input type="hidden" name="election_id" value="<%=election.getElectionID()%>" >
                                                            <button name="btn_delete_election" class="btn btn-type1"> <i class="fa-solid fa-trash"></i> Delete </button>
                                                        </form>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </div>
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
