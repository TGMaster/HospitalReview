<%-- 
    Document   : viewhospital
    Created on : May 26, 2018, 7:28:06 PM
    Author     : NemoVinh
--%>

<%@page import="DAO.AdminDAO"%>
<%@page import="DAO.PatientDAO"%>
<%@page import="DTO.Admin"%>
<%@page import="DTO.Patient"%>
<%@page import="DTO.Patient"%>
<%@page import="DAO.HospitalDAO"%>
<%@page import="DTO.Hospital"%>
<%@page import="DAO.DoctorDAO"%>
<%@page import="DTO.Doctor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${param.language}" scope="session" />
<%String language = request.getParameter("language"), english = "", french = "", vietnamese = "";
    if (language == null) {
        language = "en_US";
    }
    if (language.equals("en_US")) {
        language = "English";
        english = "active";
    } else if (language.equals("fr_FR")) {
        language = "Français";
        french = "active";
    } else if (language.equals("vi_VN")) {
        language = "Tiếng Việt";
        vietnamese = "active";
    }
%>
<c:if test="${not empty language}">
    <fmt:setLocale value="${language}" scope="session"/>
</c:if>
<fmt:setBundle basename="text" />
<!DOCTYPE html>
<html lang="${language}">
    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Montserrat:300,400,500,700" rel="stylesheet">
        <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="lib/form/search.css">
        <link rel="stylesheet" href="lib/form/sidebar.css">
        <link rel="stylesheet" href="lib/form/form.css">
        <link rel="stylesheet" href="lib/form/profile.css">
    </head>

    <body>

        <!--cookie-->
        <%
            Patient patient = null;
            Admin admin = null;

            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("u_email")) {
                        patient = PatientDAO.getUserbyEmail(cookie.getValue());
                    } else if (cookie.getName().equals("a_email")) {
                        admin = AdminDAO.getUserbyEmail(cookie.getValue());
                    }
                }
            }
            if (session.getAttribute("patient") != null) {
                patient = (Patient) session.getAttribute("patient");
            } else if (session.getAttribute("admin") != null) {
                admin = (Admin) session.getAttribute("admin");
            }
        %>
        <!--endcookie-->

        <header id="header">
            <div class="container-fluid">
                <div id="logo" class="pull-left">
                    <h1><a href="home.jsp" class="scrollto">Doctor STRANGE</a></h1>
                </div>
                <nav id="nav-menu-container">
                    <ul class="nav-menu">
                        <li class="menu-has-children menu-active"><a href="/doctor"><fmt:message key="finddoc"/></a>
                            <ul>
                                <li>
                                    <div class="dropdown-form">
                                        <form action="doctor" method="POST">
                                            <h3><fmt:message key="finddoc"/></h3>
                                            <input type="text" name="search" class="form-control form-search" id="name" placeholder="Search doctors by name, speciality"/>                               
                                            <input class="dropdown-button" type="submit" value="Search Doctor">
                                        </form>
                                    </div>
                                </li>
                            </ul> 
                        </li>
                        <li><a href="#"><fmt:message key="appt"/></a></li>
                        <li class="menu-has-children"><a href=""><fmt:message key="language"/></a>
                            <ul>
                                <li><a href="viewhospital.jsp?language=en_US">English</a></li>
                                <li><a href="viewhospital.jsp?language=vi_VN">Tiếng Việt</a></li>
                            </ul>
                        </li>
                        <li><a href="#contact"><fmt:message key="contact"/></a></li>

                        <% if (patient != null) {%>
                        <li class="menu"><a href="logout"><fmt:message key="signout"/></a></li>
                            <% } else {%>
                        <li class="menu"><a href="#" data-toggle="modal" data-target="#myLogin" data-keyboard="true" onclick="animeEffectIn()"><fmt:message key="signinup"/></a></li>
                            <% }%>

                    </ul>
                </nav>
            </div>
        </header>

        <!-- Login Popup -->
        <!-- Modal -->
        <div id="myLogin" class="modal fade" role="dialog" tabindex='-1'>
            <div class="modal-dialog modal-dialog-centered modal-lg">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-body">
                        <section id="formHolder">

                            <div class="row">

                                <!-- Brand Box -->
                                <div class="col-sm-6 brand">
                                    <a href="home.jsp" class="logo">Doctor <span>STRANGE</span></a>

                                    <div class="heading">
                                        <h2 class="effectAnime"><span id="heading"><fmt:message key="signup"/></span></h2>
                                    </div>

                                    <div class="success-msg">
                                        <p><fmt:message key="loginsuccess"/></p>
                                        <div class="success-btn"><a href="patient" class="profile"><fmt:message key="yourprofile"/></a></div>
                                        <div class="success-btn"><a href="home.jsp" class="btn-info"><fmt:message key="backtohomepage"/></a></div>
                                    </div>
                                </div>


                                <!-- Form Box -->
                                <div class="col-sm-6 form">

                                    <!-- Login Form -->
                                    <div class="login form-peice switched">
                                        <form class="login-form" action="#" method="post">
                                            <span id="user-result" style="color: red"></span>

                                            <div class="form-group">
                                                <label for="email"><fmt:message key="email"/></label>
                                                <input type="email" name="email" id="email" required>
                                            </div>

                                            <div class="form-group">
                                                <label for="password"><fmt:message key="password"/></label>
                                                <input type="password" name="password" id="password" required>
                                            </div>

                                            <div class="form-group">
                                                <label for="remember"><fmt:message key="rememberme"/></label>
                                                <input type="checkbox" name="remember" id="remember" value="yes">
                                            </div>

                                            <div class="CTA">
                                                <input type="submit" value="Login" name="action" id="login">
                                                <a href="#" class="switch" id="registersw"><fmt:message key="imnew"/></a>
                                            </div>
                                        </form>
                                    </div><!-- End Login Form -->


                                    <!-- Signup Form -->
                                    <div class="signup form-peice">
                                        <form class="signup-form" action="register" method="post">

                                            <div class="form-group">
                                                <label for="fname"><fmt:message key="firstname"/></label>
                                                <input type="text" name="fname" id="fname" class="fname" required>
                                                <span class="error"></span>
                                            </div>

                                            <div class="form-group">
                                                <label for="lname"><fmt:message key="lastname"/></label>
                                                <input type="text" name="lname" id="lname" class="lname" required>
                                                <span class="error"></span>
                                            </div>

                                            <div class="form-group">
                                                <label for="email"><fmt:message key="email"/></label>
                                                <input type="email" name="email" id="email" class="email" required>
                                                <span class="error"></span>
                                            </div>

                                            <div class="form-group">
                                                <label for="address"><fmt:message key="address"/></label>
                                                <input type="text" name="address" id="address" class="address" required>
                                                <span class="error"></span>
                                            </div>

                                            <div class="CTA">
                                                <input type="submit" value="Signup Now" id="submit" name="action">
                                                <a href="#" class="switch" id="loginsw"><fmt:message key="ihaveanaccount"/></a>
                                            </div>
                                        </form>
                                    </div><!-- End Signup Form -->
                                </div>
                            </div>
                        </section>
                    </div> <!-- body -->
                </div>

            </div>
        </div>

        <%
            Hospital hos;
//            
            hos = (Hospital) session.getAttribute("prohos");
////            Doctor doc;
//            int i = 1;
//            HospitalDAO dao  = new HospitalDAO();
//            hos = (Hospital) dao.getHospital(i); 


        %> 

        <main id="main">
            <!-- De choi thoi -->
            <div class="nothing-special-dark"></div>
            <div class="nothing-special-light"></div>
            <section class="card-section-imagia">
                <div class="container">
                    <div class="row">
                        <div class="col-md-7 col-sm-7" style="background-color: #eee; margin-right: 10px;">
                            <div class="doctor-name">
                                <div class="row" style="margin-top: 40px;">             
                                    <div class="col-md-4 col-sm-10">
                                        <div class="doctor-pic">
                                            <img src="" alt="">
                                        </div>
                                    </div>
                                    <div class="col-md-7 col-sm-10">
                                        <h3 class="name"><%= hos.getName()%></h3>
                                        <div class="doctor-text"> DOB: 11-01-1997<br> Address <%= hos.getAddress()%></div>
                                    </div>
                                </div>
                            </div>
                            <div class="doctor-information">
                                <div class="head"><fmt:message key="personalinformation"/></div><br> 
                                <table>
                                    <!--                                    <tr><td><div class="info">Working Place: </div></td><td> <div class="info-text">Abc hospital</div></td></tr>
                                                                        <tr><td><div class="info">Speciality: </div></td><td> <div class="info-text">Neurology</div></td></tr>-->
                                    <tr><td><div class="info"><fmt:message key="hospitaladminname"/> :  </div></td><td> <div class="info-text"><%= hos.getAdName()%> </div></td></tr>
                                    <tr><td><div class="info"><fmt:message key="hospitaladminemail"/>: </div></td><td> <div class="info-text"><%= hos.getAdEmail()%></div></div></td></tr>
                                    <tr><td><div class="info"><fmt:message key="website"/>:  </div></td><td> <div class="info-text"><%= hos.getWebsite()%></div></div></td></tr>
                                    <!--                                    <tr><td><div class="info">Language: </div></td><td> <div class="info-text"></div></div></td></tr>
                                                                        <tr><td><div class="info">Work-hour: </div></td><td> <div class="info-text"></div></div></td></tr>-->
                                </table>
                            </div>
                        </div>

                        </article>




                        <!--edit-->

                        <form action="hospital" method="POST">
                            <div class="form-group">
                                <label for="name"><fmt:message key="name"/></label>
                                <input type="name" class="form-control" id="name" name="name" value="<%= hos.getName()%>">
                            </div>
                            <div class="form-group">
                                <label for="address"><fmt:message key="address"/></label>
                                <input type="address" class="form-control" id="address"  name="address" value="<%= hos.getAddress()%>">
                            </div>
                            <div class="form-group">
                                <label for="website"><fmt:message key="website"/></label>
                                <input type="website" class="form-control" id="website" name="website" value="<%= hos.getWebsite()%>">
                            </div>
                            <div class="form-group">
                                <label for="name"><fmt:message key="hospitaladminname"/></label>
                                <input type="name" class="form-control" id="name" name="admin" value="<%= hos.getAdName()%>" >
                            </div>
                            <div class="form-group">
                                <label for="email"><fmt:message key="hospitaladminemail"/> </label>
                                <input type="email" class="form-control" id="email" name="email" value="<%= hos.getAdEmail()%>">
                            </div>
                            <input type="hidden" name="id" value="<%= hos.getID()%>" >
                            <input type="hidden" name="action" value="update">
                            <button type="submit" class="btn btn-default"><fmt:message key="edit"/></button>
                        </form>
                        <form action="hospital" method="POST">
                            <input type="hidden" name="id" value="<%= hos.getID()%>" >
                            <input type="hidden" name="action" value="remove">
                            <button type="submit" class="btn btn-default"><fmt:message key="remove"/></button>
                        </form>        
  
                        <form method="POST" action="controlBookmark">
                            <input type="hidden" name="pID" value="<%= patient.getID()%>">
                            <input type="hidden" name="hID" value="<%= hos.getID()%>">
                            <button class="side-button2" value="bookmarkhospital" name="action"><fmt:message key="bookmark"/> </button><hr>
                        </form> 
                        <!--end of edit-->



                        <!-- End of Result -->
                        <footer id="footer">
                            <div class="footer-top">
                                <div class="container">
                                    <div class="row">

                                        <div class="col-lg-3 col-md-6 footer-info">
                                            <h3>Doctor STRANGE</h3>
                                            <p> Man tao cá mày không được vui nữa kể từ khi cái này tao đến. Nhìn tao đứng trên top cái miệng mày câm như hến .Sẽ có ngày tới mày nhưng việc đầu tiên trước hết. Mày muốn thắng trò chơi này việc đầu tiên phải làm là giết tao chết</p>
                                        </div>

                                        <div class="col-lg-3 col-md-6 footer-links">
                                            <h4><fmt:message key="usefullinks"/></h4>
                                            <ul>
                                                <li><i class="ion-ios-arrow-right"></i> <a href="#"><fmt:message key="home"/></a></li>
                                                <li><i class="ion-ios-arrow-right"></i> <a href="#"><fmt:message key="aboutus"/></a></li>
                                                <li><i class="ion-ios-arrow-right"></i> <a href="#"><fmt:message key="services"/></a></li>
                                                <li><i class="ion-ios-arrow-right"></i> <a href="#"><fmt:message key="termsofservice"/></a></li>
                                                <li><i class="ion-ios-arrow-right"></i> <a href="#"><fmt:message key="privacypolicy"/></a></li>
                                            </ul>
                                        </div>

                                        <div class="col-lg-3 col-md-6 footer-contact">
                                            <h4><fmt:message key="contact"/></h4>
                                            <p>
                                                69 IU Street <br>
                                                Ho Chi Minh City, <br>
                                                Viet Nam<br>
                                                <strong>Phone:</strong> 911 <br>
                                                <strong>Email:</strong> abc@gmail.com<br>
                                            </p>

                                            <div class="social-links">
                                                <a href="#" class="twitter"><i class="fa fa-twitter"></i></a>
                                                <a href="#" class="facebook"><i class="fa fa-facebook"></i></a>
                                                <a href="#" class="instagram"><i class="fa fa-instagram"></i></a>
                                                <a href="#" class="google-plus"><i class="fa fa-google-plus"></i></a>
                                                <a href="#" class="linkedin"><i class="fa fa-linkedin"></i></a>
                                            </div>

                                        </div>

                                        <div class="col-lg-3 col-md-6 footer-newsletter">
                                            <h4><fmt:message key="other"/></h4>
                                            <p>motherfucker không quen, tao không quen, đừng nói chuyện thân thiện như vậy với tao, tao không quen, cũng đừng nói chuyện đằng sau lưng của tao như vậy. </p>
                                        </div>

                                    </div>
                                </div>
                            </div>

                            <div class="container">
                                <div class="copyright">
                                    &copy; Copyright <strong>Doctor Strange</strong>. All Rights Reserved
                                </div>
                            </div>
                        </footer>


                        <script src="lib/jquery/jquery.min.js"></script>
                        <script src="lib/jquery/jquery-migrate.min.js"></script>
                        <script src="lib/bootstrap/js/bootstrap.bundle.min.js"></script>
                        <script src="lib/waypoints/waypoints.min.js"></script>
                        <script src="lib/flexslider/jquery.flexslider-min.js"></script>
                        <script src="lib/bootstrap/js/bootstrap.min.js"></script>
                        <script src="lib/superfish/hoverIntent.js"></script>
                        <script src="lib/superfish/superfish.min.js"></script>
                        <script src="lib/wow/wow.min.js"></script>
                        <script src="lib/form/rating.js"></script>
                        <script src="lib/form/side.js"></script>
                        <script src="js/main.js"></script>

                        </body>
                        </html>
