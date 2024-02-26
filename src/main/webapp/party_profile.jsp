<%-- 
    Document   : party_profile
    Created on : 21-Oct-2023, 11:02:27 pm
    Author     : rajat
--%>

<%-- 
    Document   : candidate_profile
    Created on : 20-Oct-2023, 10:11:26 pm
    Author     : rajat
--%>

<%
    String adminID = (String) session.getAttribute("admin_id");
    if(adminID == null)
    {
        response.sendRedirect("logout.jsp");
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.time.*"%>
<%@page import="java.util.*"%>
<%@page import="java.time.format.*"%>
<%@page import="org.app.onlinevotingapplication.*"%>
<%@page import="java.io.*" %>

<%  
    PageNavigationManagement pageNavManagement = new PageNavigationManagement();
    DashboardNavigations dNavigation = pageNavManagement.getDashboardNavigation();
    String navBlock1 = dNavigation.getNavBlock1();
    String navBlock2 = dNavigation.getNavBlock2();
    String navBlock3 = dNavigation.getNavBlock3();
    String navBlock4 = dNavigation.getNavBlock4();
    navBlock4 = "Manage Parties";
    String navBlock5 = dNavigation.getNavBlock5();
    String navBlock6 = dNavigation.getNavBlock6();
    
    PartyManagement partyManagement = new PartyManagement();
    String partyID = request.getParameter("party_id");
    
    AllianceManagement allianceManagement = new AllianceManagement();
    List<Alliance> allianceList = allianceManagement.getAllianceList();
    
    CandidateManagement candidateManagement = new CandidateManagement();
    List<Candidate> partyCandidateList = candidateManagement.getPartyCandidateList(partyID);

    
    Party party = partyManagement.getPartyDetails(partyID);
    String partyName = party.getPartyName();
    String partySymbol = party.getPartySymbol();
    String partyAbbreviation = party.getPartyAbbreviation();
    String partyLeader = party.getPartyLeader();
    if(partyLeader.equals("") || partyLeader == null)
    {
        partyLeader = "None";
    }
    String partyAlliance = party.getPartyAlliance();
//    String base64Image = Base64.getEncoder().encodeToString(voter.getVoterImage());
//    System.out.println(base64Image);
//    ProcessImage image = new ProcessImage();
//    image.decodeImage(base64Image);
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=partyName%></title>
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
        </style>
    </head>
    <body>
        <nav class="navbar navbar-default navbar-expand-lg bg-white border shadow-sm fixed-top">
            <div class="container">
                <div class=" p-1">
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
        <div class="container mt-5 pt-4 pb-4">
            <div class="container bg-white p-3 border rounded shadow-sm">
                <div class="container">
                    <nav class="navbar navbar-light ">
                        <form class="container justify-content-center">
                            <a href="#" class="t-blue"><button class="btn btn-block btn-type1 m-2" type="button">
                                    <i class="fa-solid fa-chalkboard-user me-2"></i> <%=navBlock1%></button>
                            </a>
                            <a href="voter_management.jsp" class="t-blue"><button class="btn btn-block btn-type1 m-2" type="button">
                                    <i class="fa-solid fa-check-to-slot me-2"></i> <%=navBlock2%></button>
                            </a>
                            <a href="candidate_management.jsp" class="t-blue"><button class="btn btn-block btn-type1 m-2" type="button">
                                    <i class="fa-solid fa-user-tie me-2"></i> <%=navBlock3%></button>
                            </a>
                            <a href="party_management.jsp" class="t-blue"><button class="btn btn-block btn-type1 m-2" type="button">
                                    <i class="fa-solid fa-landmark-flag me-2"></i> <%=navBlock4%></button>
                            </a>
                            <a href="result_management.jsp" class="t-blue"><button class="btn btn-block btn-type1 m-2" type="button">
                                    <i class="fa-solid fa-file me-2"></i> <%=navBlock5%></button>
                            </a>
                            <a href="alliance_management.jsp" class="t-blue"><button class="btn btn-block btn-type1 m-2" type="button">
                                    <i class="fa-solid fa-handshake me-2"></i> <%=navBlock6%></button>
                            </a>
                        </form>
                    </nav>      

                </div>
                <div class="container border rounded shadow-sm p-3">
                    <div class="row m-3 mb-3">
                        <div class="h6 text-center">Party Profile</div>
                        <div name="voter_message" class="pb-4 h5 text-center text-success"></div>
                        <div class="col-md-12 col-lg-12 p-1 pt-0">
                            <div class="text-center">
                                <img src="images/blank-image.png" alt="alt" name="view-image" class="view-image border rounded"/>
                                <div class="border-bottom h4 p-3 m-3" style="font-weight:lighter"><%=partyID%></div>
                            </div>
                        </div>
                        <div class="col-md-12 col-lg-12 p-1">
                            <%
                            if(request.getMethod().equalsIgnoreCase("Post"))
                            {
                            %>
                            <script>
                                function redirection()
                                {
                                    setTimeout(function ()
                                    {
                                        window.location.href = "party_profile.jsp?party_id=<%=partyID%>"; // Replace with your target page's URL
                                    }, 0);
                                }
                            </script>
                            <%
                                String partyMessage = "";
                                if(request.getParameter("btn_update_name") != null)
                                {
                                    String updatePartyName = request.getParameter("party_name");
                                    partyManagement.updatePartyDetails(updatePartyName,"partyName",partyID);
                                    partyMessage = partyID + " :: Name has been updated";
                                    %>
                                    <script>
                                        alert("<%=partyMessage%>");
                                        redirection();
                                    </script>
                                    <%
                                }

                                if(request.getParameter("btn_update_symbol") != null)
                                {
                                    String updatePartySymbol = request.getParameter("party_symbol");
                                    partyManagement.updatePartyDetails(updatePartySymbol,"partySymbol",partyID);
                                    partyMessage = partyID + " :: Party Symbol has been updated";
                                    %>
                                    <script>
                                        alert("<%=partyMessage%>");
                                        redirection();
                                    </script>
                                    <%
                                }

                                if(request.getParameter("btn_update_leader") != null)
                                {
                                    String updatePartyLeader = request.getParameter("party_leader");
                                    partyManagement.updatePartyDetails(updatePartyLeader,"partyLeader",partyID);
                                    partyMessage = partyID + " :: Party leader has been updated";
                                    %>
                                    <script>
                                        alert("<%=partyMessage%>");
                                        redirection();
                                    </script>
                                    <%
                                }

                                if(request.getParameter("btn_update_alliance") != null)
                                {
                                    String updatePartyAlliance = request.getParameter("party_alliance");
                                    partyManagement.updatePartyDetails(updatePartyAlliance,"partyAlliance",partyID);
                                    partyMessage = partyID + " :: Party Alliance has been updated";
                                    %>
                                    <script>
                                        alert("<%=partyMessage%>");
                                        redirection();
                                    </script>
                                    <%
                                }

                                

                                if(request.getParameter("btn_remove_party") != null)
                                {
                                    String removeParty = request.getParameter("remove_party");
                                    boolean isProcessed = partyManagement.deletePartyDetails(removeParty);
                                
                                    System.out.println(isProcessed);
                                    if(isProcessed)
                                    {
                                    partyMessage = partyID + " :: has been moved to party archives";
                                    %>
                                    <script>
                                        alert("<%=partyMessage%>");
                                        window.location.href = "party_management.jsp";
                                    </script>
                                    <%
                                    }
                                    else
                                    {
                                    partyMessage = "Error! Occured unable to remove party";
                                    %>
                                    <script>
                                        alert("<%=partyMessage%>");
                                        window.location.href = "party_management.jsp";
                                    </script>
                                    <%
                                    }
                                }
                            }
                            %>
                            <div class="row">
                                <div class="col-md-6 col-lg-4">
                                    <form action="" method="post" class="form-group pt-2">
                                        <label class="">Name</label>
                                        <div class="input-group">
                                            <input type="text" maxlength="50" class="form-control shadow-none" name="party_name" value="<%=partyName%>" >
                                            <div class="input-group-append">
                                                <button type="submit" value="Name" class="btn btn-block btn-type1 btn-type2" name="btn_update_name">
                                                    <i class="fa-solid fa-reply"></i>
                                                </button> 
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="col-md-6 col-lg-4">
                                    <form action="" method="post" class="form-group pt-2">
                                        <label class="">Symbol</label>
                                        <div class="input-group">
                                            <input type="text" maxlength="50" class="form-control shadow-none" name="party_symbol" value="<%=partySymbol%>" >
                                            <div class="input-group-append">
                                                <button type="submit" value="Name" class="btn btn-block btn-type1 btn-type2" name="btn_update_symbol">
                                                    <i class="fa-solid fa-reply"></i>
                                                </button> 
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="col-md-6 col-lg-4">
                                    <form action="" method="post" class="form-group pt-2">
                                        <label class="">Alliance</label>
                                        <div class="input-group">
                                            <%
                                                Alliance fetchProfileAlliance = allianceManagement.getAllianceDetails(partyAlliance);
                                            %>
                                            <select class="form-control shadow-none" name="party_alliance">
                                                <option value="<%=fetchProfileAlliance.getAllianceID()%>">- <%=fetchProfileAlliance.getAllianceName()%></option>
                                                <%
                                                for(int i=0;i<allianceList.size();i++)
                                                {
                                                Alliance alliance = allianceList.get(i);
                                                %>
                                                <option value="<%=alliance.getAllianceID()%>"><%=alliance.getAllianceName()%></option>
                                                <%
                                                }
                                                %>
                                            </select>
                                            <div class="input-group-append">
                                                <button type="submit" value="Name" class="btn btn-block btn-type1 btn-type2" name="btn_update_alliance">
                                                    <i class="fa-solid fa-reply"></i>
                                                </button> 
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="col-md-6 col-lg-4">
                                    <form action="" method="post" class="form-group pt-2">
                                        <label class="">Party Leader</label>
                                        <div class="input-group">
                                            <select class="form-control shadow-none" name="party_leader">
                                                <%
                                                Candidate fetchPartyLeaderName = candidateManagement.getCandidateDetails(partyLeader); 
                                                %>
                                                <option value="">- <%=fetchPartyLeaderName.getCandidateName()%></option>
                                                <%
                                                for(int i=0;i<partyCandidateList.size();i++)
                                                {
                                                Candidate partyCandidate = partyCandidateList.get(i);
                                                %>
                                                <option value="<%=partyCandidate.getCandidateID()%>"><%=partyCandidate.getCandidateName()%></option>
                                                <%
                                                }
                                                %>
                                            </select>
                                            <div class="input-group-append">
                                                <button type="submit" value="Name" class="btn btn-block btn-type1 btn-type2" name="btn_update_leader">
                                                    <i class="fa-solid fa-reply"></i>
                                                </button> 
                                            </div>
                                        </div>
                                    </form>
                                </div>            
                            </div>
                        </div>
                    </div>
                </div>
                <div class="container border rounded shadow-sm mt-3 p-3">
                    <div class="container p-3 pb-4">
                        <div class="h6">Remove Party</div>
                        <div class="row">
                            <div class="col-lg-6">
                                <form action="" method="post" class="form-group pt-1">
                                    <label class="">Type Party ID </label>
                                    <div class="input-group">
                                        <input type="type" name="remove_party" class="form-control shadow-none" placeholder="Party ID" required/>
                                        <div class="input-group-append">
                                            <button name="btn_remove_party" class="btn btn-block btn-type1 btn-type2" type="submit">
                                                <i class="fa-solid fa-xmark pe-2"></i>Remove Party
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>  
            </div>
        </div>
    </body>
</html>
