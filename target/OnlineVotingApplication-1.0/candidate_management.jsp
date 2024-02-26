<%-- 
    Document   : candidate_management
    Created on : 04-Sept-2023, 12:20:04 am
    Author     : rajat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.time.*"%>
<%@page import="java.util.*"%>
<%@page import="java.time.format.*"%>
<%@page import="org.app.onlinevotingapplication.*"%>
<%@page import="java.io.*" %>
<%
    if(session == null)
    {
        response.sendRedirect("logout.jsp");
    }
    PageNavigationManagement pageNavManagement = new PageNavigationManagement();
    DashboardNavigations dNavigation = pageNavManagement.getDashboardNavigation();
    String navBlock1 = dNavigation.getNavBlock1();
    String navBlock2 = dNavigation.getNavBlock2();
    String navBlock3 = dNavigation.getNavBlock3();
    String navBlock4 = dNavigation.getNavBlock4();
    navBlock4 = "Manage Parties";
    String navBlock5 = dNavigation.getNavBlock5();
    String navBlock6 = dNavigation.getNavBlock6();
    
    StateManagement stateManagement = new StateManagement();
    DistrictManagement districtManagement = new DistrictManagement();
    PartyManagement partyManagement = new PartyManagement();
    CandidateManagement candidateManagement = new CandidateManagement();
   
    List<District> districtList = districtManagement.getDistrictList();
    List<State> stateList = stateManagement.getStateList();
    List<Party> partyList = partyManagement.getPartyList();
    List<Candidate> candidateList = candidateManagement.getCandidateList();
    
    GenerateID genID = new GenerateID();
    String generatedID = "CNDTE" + genID.generateID();

%>
<!DOCTYPE html>
<html>
    <head>
        <title><%=navBlock3%></title>
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
                    <a href="logout.jsp" class="t-blue a-link" style="font-size:1.1rem;">
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

                    <div class="h5 text-center"><%= navBlock3 %></div>
                    <div class="container p-4 mt-3 border rounded shadow-sm" name="register">
                        <div class="h6">Register Candidate</div>
                        <%
                        if(session.getAttribute("candidate_registration") != null && (boolean) session.getAttribute("candidate_registration"))
                        {
                        %>
                        <script>
                            alert("Candidate Successfully Registered");
                        </script>
                        <%
                        }
                        else if(session.getAttribute("candidate_registration") != null)
                        {
                        %>
                        <script>
                            alert("Candidate Registration Failed");
                        </script>
                        <%
                        }

                        session.removeAttribute("candidate_registration");
                        %>
                        <form action="RegisterCandidate" method="POST" class="form-group" enctype="multipart/form-data" name="form-register-voter">
                            <div class="row">
                                <div class="col-md-12 col-lg-4 pt-2">
                                    <p class="h6 text-center">Candidate's photo</p>
                                    <div class="text-center">
                                        <img src="images/blank-image.png" alt="alt" name="view-image" class="view-image border rounded"/>
                                    </div>
                                    <div class="p-2">
                                        <input type="file" name="set-image" class="form-control shadow-none" accept="image/*" required/>
                                    </div>
                                </div>
                                <div class=" col-md-12 col-lg-8 pt-2">
                                    <div class="row p-1">
                                        <div class="col-md-6 col-lg-4 p-2">
                                            <input type="hidden" name="candidate_id" value="<%=generatedID%>">
                                            <label>Candidate's name</label>
                                            <input type="text" name="candidate_name" class="form-control  shadow-none" maxlength="50" placeholder="Enter candidate's name" required/>
                                        </div>
                                        <div class="col-md-6 col-lg-4 p-2">
                                            <label>Father's name</label>
                                            <input type="text" name="candidate_father_name" class="form-control  shadow-none" maxlength="50" placeholder="Enter candidate's father name" required/>
                                        </div>
                                        <div class="col-md-6 col-lg-4 p-2">
                                            <label>Associate Party</label>
                                            <select class="form-control shadow-none" name="candidate_party" required/>
                                            <option value="">None</option>
                                            <%
                                            for(int i=0;i<partyList.size();i++)
                                            {
                                                Party party = partyList.get(i);
                                            %>
                                            <option value="<%=party.getPartyID()%>"><img src="images/blank-image.png" class="img-thumbnail" style="width:80px;height:20px;"><%=party.getPartyName()%></option>
                                            <%
                                            }
                                            %>
                                            </select>
                                        </div>
                                        <div class="col-md-6 col-lg-4 p-2">
                                            <label>Phone number</label>
                                            <input type="text" name="candidate_phone" class="form-control  shadow-none" maxlength="10" placeholder="Enter candidate's phone number" required/>
                                        </div>
                                        <input type="hidden" name="candidate_designation" value="Member">
                                        <div class="col-md-6 col-lg-4 p-2">
                                            <label>Aadhaar number</label>
                                            <input type="text" name="candidate_aadhaar" class="form-control  shadow-none" maxlength="12" placeholder="Enter candidate's aadhaar number" required/>
                                        </div>
                                        <div class="col-md-6 col-lg-4  p-2">
                                            <label>Gender</label>
                                            <select class="form-control shadow-none" name="candidate_gender" placeholder="Enter candidate's gender" required/>
                                            <option value="">Select gender</option>
                                            <option value="Male">Male</option>
                                            <option value="Female">Female</option>
                                            </select>
                                        </div>
                                        <div class="col-md-6 col-lg-4 p-2">
                                            <label>Date of birth</label>
                                            <input type="date" name="candidate_dob" class="form-control  shadow-none" placeholder="Enter candidate's date of birth" required/>
                                        </div>
                                        <div class="col-md-6 col-lg-4 p-2">
                                            <label>State</label>
                                            <!--<input type="text" name="voter_state" class="form-control  shadow-none" placeholder="Enter state" required/>-->
                                            <select name="candidate_state" class="form-control  shadow-none" required>
                                                <option value="">Select State</option>
                                                <%
                                                for(int i=0;i<stateManagement.getStateList().size();i++)
                                                {
                                                    State state = stateList.get(i);
                                                %>
                                                <option value="<%=state.getStateID()%>"><%=state.getStateName()%></option>
                                                <%
                                                }
                                                %>
                                            </select>
                                        </div>
                                        <div class="col-md-6 col-lg-4 p-2">
                                            <label class="dist">District</label>
                                            <!--<input type="text" name="voter_district" class="form-control  shadow-none" placeholder="Enter district" required/>-->
                                            <select name="candidate_district" class="form-control  shadow-none" required>
                                                <option value="">Select District</option>
                                                <%
                                                    
                                                    for(int i=0;i<districtList.size();i++)
                                                    {
                                                    District district = districtList.get(i);
                                                %>
                                                <option value="<%=district.getDistrictID()%>"><%=district.getDistrictName()%></option>
                                                <%
                                                }
                                                %>
                                            </select>
                                        </div>

                                        <div class="col-md-6 col-lg-8 p-2">
                                            <label>Address</label>
                                            <input type="text" name="candidate_address" class="form-control  shadow-none" maxlength="100" placeholder="Enter candidate's address" required/>
                                        </div>
                                        <div class="col-lg-12 p-2">
                                            <button  type="submit" name="btn_register_candidate" class="btn btn-block btn-type1"> <i class="fa-solid fa-check pe-1"></i> Register Candidate</button>
                                            <input type="reset" name="reset-image" class="btn btn-block btn-type1" value="Reset">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>

                    <!--<hr>-->

                    <div class="container p-4 mt-2" name="search">
                        <div class="h5 text-center">Candidate List</div>
                        <form action="" method="post" class="form-group">
                            <div class="row pt-2">
                                <div class="col-sm-12">
                                    <div class="input-group">
                                        <input type="text" name="candidate_id" class="form-control shadow-none" placeholder="Search candidate" required/>
                                        <div class="input-group-append">
                                            <button name="btn_search_candidate" class="btn-block btn btn-type1 btn-type2" value="candidate_search">
                                                <i class="fa-solid fa-search pe-1"></i> Search
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="container p-4 mt-3 border rounded shadow-sm" >
                        <div class="h6">Registered Candidates</div>
                        <div class="row overflow-scroll" style="height:450px">
                            <%
                            for(int i=0;i<candidateList.size();i++)
                            {
                            Candidate candidate = candidateList.get(i);
                            String base64Image = Base64.getEncoder().encodeToString(candidate.getCandidateImage());
                            ProcessImage image = new ProcessImage();
                            image.decodeImage(base64Image);
                            %>
                            <div class="col-lg-3 col-md-6">
                                <form action="candidate_profile.jsp" method="get" class="form-group">
                                    <input type="hidden" name="candidate_id" value="<%=candidate.getCandidateID()%>">
                                    <!--<input type="hidden" name="current_candidate_image" value="<%=base64Image%>">-->
                                    <button style="border:0px;" class="btn">
                                        <div class="display_gradient text-hover m-2 p-3 border rounded shadow-sm">
                                            <div class="row">
                                                <div class="col-sm-12 text-center">
                                                    <img src="data:image/jpeg;base64,<%=base64Image%>" class="img-thumbnail" style="width:130px;height:150px;" alt="alt"/>
                                                </div>
                                                <div class="col-sm-12">
                                                    <div class="h6 pe-2 text-center"><%=candidate.getCandidateID()%></div>
                                                    <table class="table table-borderless">
                                                        <tr>
                                                            <td class="h6">Name</td>
                                                            <td class="text-start pe-2 h6"><%=candidate.getCandidateName()%></td>
                                                        </tr>
                                                        <tr>
                                                            <td class="h6">Party</td>
                                                            <%
                                                            Party fetchCandidateParty = partyManagement.getPartyDetails(candidate.getCandidateParty());
                                                            %>
                                                            <td class="text-start pe-2 h6"><%=fetchCandidateParty.getPartyName()%></td>
                                                        </tr>
                                                        <tr>
                                                            <td class="h6" >Gender</td>
                                                            <td class="text-start pe-2 h6"><%=candidate.getCandidateGender()%></td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </button>

                                </form>
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
    <script>
                            $("input[name='reset-image']").on("click", function ()
                            {
                                $("img[name='view-image']").attr("src", "images/blank-image.png");
                            });
    </script>
</html>


