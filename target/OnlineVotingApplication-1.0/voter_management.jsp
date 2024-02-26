<%-- 
    Document   : voter_management
    Created on : 01-Sept-2023, 11:26:09 pm
    Author     : rajat
--%> 
<%
    String adminID = (String) session.getAttribute("admin_id");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.time.*"%>
<%@page import="java.util.*"%>
<%@page import="java.time.format.*"%>
<%@page import="org.app.onlinevotingapplication.*"%>
<%@page import="java.io.*" %>



<%
    Voter voter = new Voter();
    VoterDAO voterDAO = new VoterDAO();  
    VoterManagement voterManagement = new VoterManagement();
    List<Voter> voterList = voterManagement.getVoterList();
            
    StateManagement stateManagement = new StateManagement();
    DistrictManagement districtManagement = new DistrictManagement();
    
    List<District> districtList = districtManagement.getDistrictList();
    
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
    String generatedID = "VOTER" + genID.generateID();
    
%>

<!DOCTYPE html>
<html>
    <head>
        <title><%=navBlock2%></title>
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
                    <%
                        if(adminID == null)
                        {
                            response.sendRedirect("logout.jsp");
                        }
                    %>
                </div>
                <div class="container">
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
                    <div class="h5 text-center"><%= dNavigation.getNavBlock2() %></div>
                    <div class="container p-4 mt-3 border rounded shadow-sm" name="register">
                        <div class="h6">Register Voter</div>
                        <div name="voter-message" class="h5 pt-3 text-center"></div>
                        <%
                        if(session.getAttribute("voter_registration") != null && (boolean) session.getAttribute("voter_registration"))
                        {
                            System.out.println((boolean) session.getAttribute("voter_registration"));
                        %>
                        <script>
                            alert("Voter Successfully Registered");
                        </script>
                        <%
                            
                        }
                        else if(session.getAttribute("voter_registration") != null)
                        {
                            System.out.println((boolean) session.getAttribute("voter_registration"));
                        %>
                        <script>
                            alert("Voter Registration Failed");
                        </script>
                        <%
                        }
                        session.removeAttribute("voter_registration");
                        
                        if(request.getMethod().equalsIgnoreCase("POST"))
                        {

                            if(request.getParameter("btn_search_voter") != null)
                            {
                                String searchVoterID = request.getParameter("voter_id");
                                if(voterManagement.searchVoter(searchVoterID))
                                {
                                    response.sendRedirect("voter_profile.jsp?voter_id=" + searchVoterID);
                                }            
                                else
                                {

                                %>
                                <script>

                                    function delayRedirection()
                                    {
                                        setTimeout(function ()
                                        {
                                            window.location.href = 'voter_management.jsp'; // Replace with your target page's URL
                                        }, 2000);
                                    }

                                    function message()
                                    {
                                        let message = "Voter does not exist";
                                        $("div[name='voter-message']").text(message);
                                        $("div[name='voter-message']").css("color", "red");
                                    }
                                    delayRedirection();
                                    message();
                                </script>
                                <%
                                }
                            }

                        }
                        %>
                        <form action="RegisterVoter" method="POST" class="form-group" enctype="multipart/form-data" name="form-register-voter">
                            <div class="row">
                                <div class="col-md-12 col-lg-4 pt-2">
                                    <p class="h6 text-center">Voter's photo</p>
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
                                            <input type="hidden" name="voter_id" value="<%=generatedID%>">
                                            <label>Voter's name</label>
                                            <input type="text" name="voter_name" class="form-control  shadow-none" maxlength="50" placeholder="Enter voter's name" required/>
                                        </div>
                                        <div class="col-md-6 col-lg-4 p-2">
                                            <label>Father's name</label>
                                            <input type="text" name="voter_father_name" class="form-control  shadow-none" maxlength="50" placeholder="Enter voter's father name" required/>
                                        </div>
                                        <div class="col-md-6 col-lg-4 p-2">
                                            <label>Phone number</label>
                                            <input type="text" name="voter_phone" class="form-control  shadow-none" maxlength="10" placeholder="Enter voter's phone number" required/>
                                        </div>
                                        <div class="col-md-6 col-lg-4 p-2">
                                            <label>Aadhaar number</label>
                                            <input type="text" name="voter_aadhaar" class="form-control  shadow-none" maxlength="12" placeholder="Enter voter's aadhaar number" required/>
                                        </div>
                                        <div class="col-md-6 col-lg-4  p-2">
                                            <label>Gender</label>
                                            <select class="form-control shadow-none" name="voter_gender" placeholder="Enter voter's gender" required/>
                                            <option value="">Select gender</option>
                                            <option value="Male">Male</option>
                                            <option value="Female">Female</option>
                                            </select>
                                        </div>
                                        <div class="col-md-6 col-lg-4 p-2">
                                            <label>Date of birth</label>
                                            <input type="date" name="voter_dob" class="form-control  shadow-none" placeholder="Enter voter's date of birth" required/>
                                        </div>
                                        <div class="col-md-6 col-lg-3 p-2">
                                            <label>State</label>
                                            <!--<input type="text" name="voter_state" class="form-control  shadow-none" placeholder="Enter state" required/>-->
                                            <select name="voter_state" class="form-control  shadow-none" required>
                                                <option value="">Select State</option>
                                                <%
                                                for(int i=0;i<stateManagement.getStateList().size();i++)
                                                {
                                                    State stateList = stateManagement.getStateList().get(i);
                                                %>
                                                <option value="<%=stateList.getStateID()%>"><%=stateList.getStateName()%></option>
                                                <%
                                            }
                                                %>
                                            </select>
                                        </div>
                                        <div class="col-md-6 col-lg-3 p-2">
                                            <label class="dist">District</label>
                                            <!--<input type="text" name="voter_district" class="form-control  shadow-none" placeholder="Enter district" required/>-->
                                            <select name="voter_district" class="form-control  shadow-none" required>
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
                                        <div class="col-md-12 col-lg-6 p-2">
                                            <label>Address</label>
                                            <input type="text" name="voter_address" class="form-control  shadow-none" maxlength="100" placeholder="Enter voter's address" required/>
                                        </div>
                                        <div class="col-lg-12 p-2">
                                            <button  type="submit" name="btn_register_voter" class="btn btn-block btn-type1"> <i class="fa-solid fa-check pe-1"></i> Register voter</button>
                                            <input type="reset" name="reset-image" class="btn btn-block btn-type1" value="Reset">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>

                    <!--<hr>-->

                    <div class="container p-4 mt-2" name="search">
                        <div class="h5 text-center">Voter List</div>
                        <form action="" method="post" class="form-group">
                            <div class="row pt-2">
                                <div class="col-sm-12">
                                    <div class="input-group">
                                        <input type="text" name="voter_id" class="form-control shadow-none" placeholder="Search voter" required/>
                                        <div class="input-group-append">
                                            <button name="btn_search_voter" class="btn-block btn btn-type1 btn-type2" value="voter_search">
                                                <i class="fa-solid fa-search pe-1"></i> Search
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="container p-3 pt-1 pb-5">
                        <div class="row overflow-scroll" style="height:530px">
                            <%
                                for(int i=voterManagement.getVoterList().size()-1;i>=0;i--)
                                {
                                Voter list = voterList.get(i);
                                String base64Image = Base64.getEncoder().encodeToString(list.getVoterImage());
                                ProcessImage image = new ProcessImage();
                                image.decodeImage(base64Image);
                            %>
                            <div class="col-md-6 col-lg-3">

                                <div class="text-hover display_gradient pt-3 p-2 m-3 shadow-sm border rounded" style="height:480px">
                                    <form action="voter_profile.jsp" method="get" class="form-group text-center">
                                        <button class="btn" style="border:0px;" name="">
                                            <input type="hidden" value="<%=list.getVoterID()%>" name="voter_id">
                                            <!--<div class="text-center h6">Voter ID</div>-->
                                            <div class="p-1">
                                                <div class="text-center p-2 mb-2">
                                                    <img src="data:image/jpeg;base64,<%=base64Image%>" class="img-thumbnail" style="width:140px;height:160px;" alt="Voter"/>
                                                </div>
                                                <div class="mb-3 text-center h6"><%=list.getVoterID()%></div>
                                                <table class="container table table-borderless ">
                                                    <tr>
                                                        <td class="h6 p-1 text-start">Name</td>
                                                        <td class="h6 p-1 text-end"><%=list.getVoterName()%></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="h6 p-1 text-start">Gender</td>
                                                        <td class="h6 p-1 text-end"><%=list.getVoterGender()%></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="h6 p-1 text-start">D.O.B</td>
                                                        <td class="h6 p-1 text-end"><%=list.getVoterDOB()%></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="h6 p-1 text-start">Phone Number</td>
                                                        <td class="h6 p-1 text-end"><%=list.getVoterPhone()%></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="h6 p-1 text-start">Address</td>
                                                        <td class="h6 p-1 text-end"><%=list.getVoterAddress()%></td>
                                                    </tr>
                                                </table>
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
