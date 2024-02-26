<%-- 
    Document   : party_management
    Created on : 03-Sept-2023, 4:37:50 pm
    Author     : rajat
--%>

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
    
    GenerateID genID = new GenerateID();
    String generatedID = "PARTY" + genID.generateID();
    
    PartyManagement partyManagement = new PartyManagement();
    List<Party> partyList = partyManagement.getPartyList();
    
    CandidateManagement candidateManagement = new CandidateManagement();
    List<Candidate> candidateList = candidateManagement.getCandidateList();
    
    AllianceManagement allianceManagement = new AllianceManagement();
    List<Alliance> allianceList = allianceManagement.getAllianceList();
       

%>
<!DOCTYPE html>
<html>
    <head>
        <title><%=navBlock4%></title>
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
            .voter-image
            {
                width:11rem;
                height:12rem;
            }
            .view-image
            {
                width:11rem;
                height:12rem;
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
                    <a href="" class="t-blue a-link" style="font-size:1.1rem;">
                        <i class="fa-solid fa-sign-out ms-4"></i> 
                    </a>
                </div>
            </div>
        </nav>
        <div class="container-fluid mt-5 pt-2 pb-4">
            <div class="container bg-white border rounded shadow-sm p-3 mt-3">
                <div class="container mt-2">
                </div>
                <div class="container">
                    <div class="container">
                        <nav class="navbar navbar-light">
                            <form class="container justify-content-center">
                                <a href="#" class="text-hover t-blue"><button class="btn btn-block btn-type1 m-2" type="button">
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
                    <div class="h5 text-center"><%= dNavigation.getNavBlock4() %></div>
                    <div class="container p-4 mt-3 border rounded shadow-sm" name="register">
                        <div class="h6">Register Party</div>
                        <div name="voter-message" class="h5 pt-3 text-center"></div>
                        <form action="RegisterParty" method="POST" class="form-group" enctype="multipart/form-data" name="">
                            <div class="row">
                                <div class="col-md-12 col-lg-12 pt-2">
                                    <p class="h6 text-center">Party's Election Symbol</p>
                                    <div class="text-center">
                                        <img src="images/blank-image.png" alt="alt" name="view-image" style="width:180px;height:120px;" class="view-image border rounded"/>
                                    </div>
                                    <div class="p-2" style="width:300px; margin:0 auto;">
                                        <input type="file" name="set-image" class="form-control shadow-none" accept="image/png, image/jpeg" >
                                    </div>
                                </div>
                                <%
                                if(session.getAttribute("party_registration") != null && (boolean) session.getAttribute("party_registration"))
                                { 
                                %>
                                <script>
                                    alert("Party Registered Successfully");
                                </script>
                                <%
                                }
                                else if(session.getAttribute("party_registration") != null)
                                {
                                %>
                                <script>
                                    alert("Party Registration Failed");
                                </script>
                                <%    
                                }
                                 session.removeAttribute("party_registration");
                                %>
                                <div class="col-md-12 col-lg-12 p-2">
                                    <div class="row p-1">
                                        <div class="col-md-6 col-lg-4 p-2">
                                            <input type="hidden" name="party_id" value="<%=generatedID%>">
                                            <label>Party name</label>
                                            <input type="type" name="party_name" class="form-control  shadow-none" maxlength="50" placeholder="Enter party name"  required/>
                                        </div>
                                        <div class="col-md-6 col-lg-4 p-2">
                                            <label>Election Symbol In Words</label>
                                            <input type="text" name="party_symbol" class="form-control  shadow-none" maxlength="50" placeholder="Party's Election Symbol"  required/>
                                        </div>
                                        <div class="col-md-4 col-lg-4 p-2">
                                            <label>Abbreviation</label>
                                            <input type="text" name="party_abbreviation" class="form-control  shadow-none" maxlength="5" placeholder="Party's Abbreviation"  required/>
                                            <input type="hidden" name="party_leader" class="form-control  shadow-none" value=""/>
                                        </div>
                                        
                                        <div class="col-md-4 col-lg-4 p-2">
                                            <label>Alliance</label>
                                            <select name="party_alliance" class="form-control  shadow-none" maxlength="50" required>
                                                <option value="">Select</option>
                                                <option value="None">None</option>
                                                <%
                                                    for(int i=0;i<allianceList.size();i++)
                                                    {
                                                    Alliance alliance = allianceList.get(i);
                                                %>
                                                <option value=<%=alliance.getAllianceID()%>><%=alliance.getAllianceName()%></option>
                                                <%
                                                }
                                                %>
                                            </select>
                                        </div>
                                        <div class="col-md-12 col-lg-12 p-2">
                                            <button  type="submit" name="btn_register_party" class="btn btn-block btn-type1"> <i class="fa-solid fa-check pe-1"></i> Register Party</button>
                                            <input type="reset" name="reset-image" class="btn btn-block btn-type1" value="Reset">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="container p-4 mt-3 border rounded shadow-sm" >
                        <div class="h6">Registered Parties</div>
                        <div class="row overflow-scroll" style="height:450px">
                            <%
                            for(int i=0;i<partyList.size();i++)
                            {
                            Party party = partyList.get(i);
                            String base64Image = Base64.getEncoder().encodeToString(party.getPartyFlag());
                            ProcessImage image = new ProcessImage();
                            image.decodeImage(base64Image);
                            %>
                            <div class="col-lg-3 col-md-6">
                                <div class="display_gradient text-hover m-2 p-3 border rounded shadow-sm">
                                    <form action="party_profile.jsp" method="get">
                                        <button class="btn" style="border:0px;">
                                            <div class="row">
                                                <div class="col-sm-12 text-center">
                                                    <input type="hidden" name="party_id" value="<%=party.getPartyID()%>">
                                                    <div class="h6 text-center"><%=party.getPartyID()%></div>
                                                    <img src="data:image/jpeg;base64,<%=base64Image%>" class="img-thumbnail" style="width:180px;height:120px;" alt="alt"/>
                                                </div>
                                                <div class="col-sm-12 p-2">
                                                    <div class="text-center h6"><%=party.getPartyName()%></div>
                                                    <div class="text-center h6">(<%=party.getPartyAbbreviation()%>)</div>
                                                    <table class="table table-borderless">
                                                        <tr>
                                                            <td class="h6">Symbol</td>
                                                            <td class="text-start pe-2 h6"><%=party.getPartySymbol()%></td>
                                                        </tr>
                                                        <tr>
                                                            <td class="h6">Leader</td>
                                                            <%
                                                            String partyLeader = party.getPartyLeader();
                                                            if(partyLeader.equals("") || partyLeader == null)
                                                            {
                                                                partyLeader = "None";
                                                            }
                                                            
                                                            Candidate fetchPartyLeaderName = candidateManagement.getCandidateDetails(partyLeader);
                                                            %>
                                                            <td class="text-start pe-2 h6"><%=fetchPartyLeaderName.getCandidateName()%></td>
                                                        </tr>
                                                        <tr>
                                                            <td class="h6" >Alliance</td>
                                                            <%
                                                            Alliance alliance = allianceManagement.getAllianceDetails(party.getPartyAlliance());
                                                            %>
                                                            <td class="text-start pe-2 h6"><%=alliance.getAllianceName()%></td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </div>
                                        </button>
                                    </form> 
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
    </body>
    <script src="scripts/index.js"></script>
</html>
