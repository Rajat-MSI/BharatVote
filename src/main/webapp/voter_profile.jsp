<%-- 
    Document   : voter_profile
    Created on : 20-Sept-2023, 10:56:27 pm
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
    
    String voterID = request.getParameter("voter_id");
    
    VoterManagement voterManagement = new VoterManagement();
    Voter voter = voterManagement.getVoterDetails(voterID);

    String voterName = voter.getVoterName();
    String voterGender = voter.getVoterGender();
    String emptyGender = "";
    if(voterGender.equals("Male"))
    {
        emptyGender = "Female";
    }
    else if(voterGender.equals("Female"))
    {
        emptyGender = "Male";
    }
    
    StateManagement stateManagement = new StateManagement();
    DistrictManagement districtManagement = new DistrictManagement();
    
    List<State> stateList = stateManagement.getStateList();
    List<District> districtList = districtManagement.getDistrictList();
    
    String voterDOB = voter.getVoterDOB();
    String voterFatherName = voter.getVoterFatherName();
    String voterPhone = voter.getVoterPhone();
    String voterState = voter.getVoterState();
    State stateProfileValue = stateManagement.getStateDetails(voterState);
    String voterAadhaar = voter.getVoterAadhaarNumber();
    String voterDistrict = voter.getVoterDistrict();
    District districtProfileValue = districtManagement.getDistrictDetails(voterDistrict);
    String voterAddress = voter.getVoterAddress();
    
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=voterID%> - Voter</title>
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
                <!--<div class="h4 text-center p-2">Voter Profile</div>-->
                <div class="container border rounded shadow-sm p-3">
                    <div class="row m-3 mb-3">
                        <div class="h6 text-center">Voter Profile</div>
                        <div name="voter_message" class="pb-4 h5 text-center text-success"></div>
                        <div class="col-md-12 col-lg-12 p-1 pt-0">
                            <div class="text-center">
                                <img src="images/blank-image.png" alt="alt" name="view-image" class="view-image border rounded"/>
                                <div class="border-bottom h4 p-3 m-3" style="font-weight:lighter"><%=voterID%></div>
                            </div>
                        </div>
                        <div class="col-md-12 col-lg-12 p-1">
                            <%
                                if(request.getMethod().equalsIgnoreCase("Post"))
                                {
                            %>
                            <script>
                                function delayRedirection()
                                {
                                    setTimeout(function ()
                                    {
                                        window.location.href = "voter_profile.jsp?voter_id=<%=voterID%>"; // Replace with your target page's URL
                                    }, 0);
                                }
                            </script>
                            <%
                            if(request.getParameter("btn_update_name") != null)
                            {
                                String updateVoterName = request.getParameter("voter_name");
                                voterManagement.updateVoterDetails(updateVoterName,"voterName",voterID);
                            %>
                            <script>
                                function message()
                                {
                                    let message = "<%=voterID%> :: Name has been updated";
                                    $("div[name='voter_message']").text(message);
                                }
                                alert("<%=voterID%> :: Name has been updated");
                                delayRedirection();
//                                                    message();
                            </script>
                            <%

                        }

                        if(request.getParameter("btn_update_dob") != null)
                        {
                            String updateVoterDOB = request.getParameter("voter_dob");
                            voterManagement.updateVoterDetails(updateVoterDOB,"voterDOB",voterID);
                            %>
                            <script>
                                function message()
                                {
                                    let message = "<%=voterID%> :: Date of birth has been updated";
                                    $("div[name='voter_message']").text(message);
                                }
                                alert("<%=voterID%> :: Date of birth has been updated");
                                delayRedirection();
//                                                    message();
                            </script>
                            <%

                        }

                        if(request.getParameter("btn_update_gender") != null)
                        {
                            String updateVoterGender = request.getParameter("voter_gender");
                            voterManagement.updateVoterDetails(updateVoterGender,"voterGender",voterID);
                            %>
                            <script>
                                function message()
                                {
                                    let message = "<%=voterID%> :: Gender has been updated";
                                    $("div[name='voter_message']").text(message);
                                }
                                alert("<%=voterID%> :: Gender has been updated");

                                delayRedirection();
//                                                    message();
                            </script>
                            <%

                        }

                        if(request.getParameter("btn_update_father_name") != null)
                        {
                            String updateVoterFatherName = request.getParameter("voter_father_name");
                            voterManagement.updateVoterDetails(updateVoterFatherName,"voterFatherName",voterID);
                            %>
                            <script>
                                function message()
                                {
                                    let message = "<%=voterID%> :: Father's name has been updated";
                                    $("div[name='voter_message']").text(message);
                                }
                                alert("<%=voterID%> :: Father's name has been updated");

                                delayRedirection();
//                                                    message();
                            </script>
                            <%

                        }

                        if(request.getParameter("btn_update_phone") != null)
                        {
                            String updateVoterPhone = request.getParameter("voter_phone");
                            voterManagement.updateVoterDetails(updateVoterPhone,"voterPhone",voterID);
                            %>
                            <script>
                                function message()
                                {
                                    let message = "<%=voterID%> :: Phone number has been updated";
                                    $("div[name='voter_message']").text(message);
                                }
                                alert("<%=voterID%> :: Phone number has been updated");
                                delayRedirection();
//                                                    message();
                            </script>
                            <%

                        }

                        if(request.getParameter("btn_update_aadhaar") != null)
                        {
                            String updateVoterAadhaarNumber = request.getParameter("voter_aadhaar");
                            voterManagement.updateVoterDetails(updateVoterAadhaarNumber,"voterAadhaarNumber",voterID);
                            %>
                            <script>
                                function message()
                                {
                                    let message = "<%=voterID%> :: Aadhaar number has been updated";
                                    $("div[name='voter_message']").text(message);
                                }
                                alert("<%=voterID%> :: Aadhaar number has been updated");
                                delayRedirection();
//                                                    message();
                            </script>
                            <%

                        }

                        if(request.getParameter("btn_update_state") != null)
                        {
                            String updateVoterState = request.getParameter("voter_state");
                            voterManagement.updateVoterDetails(updateVoterState,"voterState",voterID);
                            %>
                            <script>
                                function message()
                                {
                                    let message = "<%=voterID%> :: Belonging State has been updated";
                                    $("div[name='voter_message']").text(message);
                                }
                                alert("<%=voterID%> :: State has been updated");
                                delayRedirection();
//                                                    message();
                            </script>
                            <%

                        }

                        if(request.getParameter("btn_update_district") != null)
                        {
                            String updateVoterDistrict = request.getParameter("voter_district");
                            voterManagement.updateVoterDetails(updateVoterDistrict,"voterDistrict",voterID);
                            %>
                            <script>
                                function message()
                                {
                                    let message = "<%=voterID%> :: Belonging District has been updated";
                                    $("div[name='voter_message']").text(message);
                                }
                                alert("<%=voterID%> :: District has been updated");
                                delayRedirection();
//                                                    message();
                            </script>
                            <%

                        }

                         if(request.getParameter("btn_update_address") != null)
                        {
                            String updateVoterAddress = request.getParameter("voter_address");
                            voterManagement.updateVoterDetails(updateVoterAddress,"voterAddress",voterID);
                            %>
                            <script>
                                function message()
                                {
                                    let message = "<%=voterID%> :: Address has been updated";
                                    $("div[name='voter_message']").text(message);
                                }
                                alert("<%=voterID%> :: Address has been updated");
                                delayRedirection();
//                                                    message();
                            </script>
                            <%
                        }

                        if(request.getParameter("btn_remove_voter") != null)
                        {
                            String removeVoter = request.getParameter("remove_voter");
                            boolean isProcessed = voterManagement.deleteVoterDetails(removeVoter);
                            System.out.println(isProcessed);
                            if(isProcessed)
                            {
                            %>
                            <script>
                                function message()
                                {
                                    let message = "<%=voterID%> :: has been moved to archives";
                                    $("div[name='voter_message']").text(message);
                                }

                                function delayRedirection2()
                                {
                                    setTimeout(function ()
                                    {
                                        window.location.href = "voter_management.jsp"; // Replace with your target page's URL
                                    }, 0);
                                }
                                alert("<%=voterID%> :: Removed from voter the list");
                                delayRedirection2();
//                                                    message();
                            </script>
                            <%
                            }
                            else
                            {
                            %>
                            <script>
                                alert("Error occured! Unable to remove voter");
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
                                            <input type="text" maxlength="50" class="form-control shadow-none" name="voter_name" value="<%=voterName%>" >
                                            <div class="input-group-append">
                                                <button type="submit" value="Name" class="btn btn-block btn-type1 btn-type2" name="btn_update_name">
                                                    <i class="fa-solid fa-reply"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="col-md-6 col-lg-4">
                                    <form action="" method="post" class="form-group  pt-2">
                                        <label class="">Date Of Birth</label>
                                        <div class="input-group">
                                            <input type="date" class="form-control shadow-none" name="voter_dob" value="<%=voterDOB%>" >

                                            <div class="input-group-append">
                                                <button type="submit" class="btn btn-block btn-type1 btn-type2" name="btn_update_dob">
                                                    <i class="fa-solid fa-reply"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="col-md-6 col-lg-4">
                                    <form action="" method="post" class="form-group pt-2">
                                        <label class="">Father's Name</label>
                                        <div class="input-group">
                                            <input type="text" maxlength="50" class="form-control shadow-none" name="voter_father_name" value="<%=voterFatherName%>" >

                                            <div class="input-group-append">
                                                <button type="submit" class="btn btn-block btn-type1 btn-type2" name="btn_update_father_name">
                                                    <i class="fa-solid fa-reply"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="col-md-6 col-lg-4">
                                    <form action="" method="post" class="form-group pt-2">
                                        <label class="">Gender</label>
                                        <div class="input-group">
                                            <select class="form-control shadow-none" name="voter_gender"/>
                                            <option value="<%=voterGender%>"><%=voterGender%></option>
                                            <option value="<%=emptyGender%>"><%=emptyGender%></option>
                                            </select>

                                            <div class="input-group-append">
                                                <button type="submit" class="btn btn-block btn-type1 btn-type2" name="btn_update_gender">
                                                    <i class="fa-solid fa-reply"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="col-md-6 col-lg-4">
                                    <form action="" method="post" class="form-group pt-2">
                                        <label class="">Phone Number</label>
                                        <div class="input-group">
                                            <input type="text" maxlength="10" class="form-control shadow-none" name="voter_phone" value="<%=voterPhone%>" >

                                            <div class="input-group-append">
                                                <button type="submit" class="btn btn-block btn-type1 btn-type2" name="btn_update_phone">
                                                    <i class="fa-solid fa-reply"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="col-md-6 col-lg-4">
                                    <form action="" method="post" class="form-group pt-2">
                                        <label class="">Aadhaar Number</label>
                                        <div class="input-group">
                                            <input type="text" maxlength="12" class="form-control shadow-none" name="voter_aadhaar" value="<%=voterAadhaar%>" >

                                            <div class="input-group-append">
                                                <button type="submit" class="btn btn-block btn-type1 btn-type2" name="btn_update_aadhaar">
                                                    <i class="fa-solid fa-reply"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="col-md-6 col-lg-4">
                                    <form action="" method="post" class="form-group pt-2">
                                        <label class="">State</label>
                                        <div class="input-group">
                                            <select type="text" name="voter_state" class="form-control shadow-none">
                                                <option value="<%=stateProfileValue.getStateID()%>"><%=stateProfileValue.getStateName()%></option>
                                                <%
                                                for(int i=0;i<stateList.size();i++)
                                                {
                                                    State state = stateList.get(i);
                                                %>
                                                <option value="<%=state.getStateID()%>"><%=state.getStateName()%></option>
                                                <%
                                            }
                                                %>
                                            </select>
                                            <div class="input-group-append">
                                                <button type="submit" class="btn btn-block btn-type1 btn-type2" name="btn_update_state">
                                                    <i class="fa-solid fa-reply"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="col-md-6 col-lg-4">
                                    <form action="" method="post" class="form-group pt-2">
                                        <label class="">District</label>
                                        <div class="input-group">
                                            <select name="voter_district" class="form-control shadow-none">
                                                <option value="<%=districtProfileValue.getDistrictID()%>"><%=districtProfileValue.getDistrictName()%></option>
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
                                            <div class="input-group-append">
                                                <button type="submit" class="btn btn-block btn-type1 btn-type2" name="btn_update_district">
                                                    <i class="fa-solid fa-reply"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="col-md-6 col-lg-4">
                                    <form action="" method="post" class="form-group pt-2">
                                        <label class="">Address</label>
                                        <div class="input-group">
                                            <input maxlength="100" rows="4" type="text" name="voter_address" class="form-control shadow-none" value="<%=voterAddress%>">
                                            <div class="input-group-append">
                                                <button type="submit" value="Address" class="btn btn-block btn-type1 btn-type2" name="btn_update_address">
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
                        <div class="h6">Remove Voter</div>
                        <div class="row">
                            <div class="col-lg-4">
                                <form action="" method="post" class="form-group pt-1">
                                    <label class="">Enter Voter ID</label>
                                    <div class="input-group">
                                        <input type="type" name="remove_voter" class="form-control shadow-none" placeholder="Type voter ID" required/>
                                        <div class="input-group-append">
                                            <button name="btn_remove_voter" class="btn btn-block btn-type1 btn-type2" type="submit">
                                                <i class="fa-solid fa-xmark pe-2"></i> Remove Voter
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
