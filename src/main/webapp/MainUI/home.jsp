<%-- 
    Document   : home
    Created on : May 16, 2018, 4:41:41 PM
    Author     : MSI
--%>

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
    <fmt:setLocale value="${language}" />
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
        <link href="lib/animate/animate.min.css" rel="stylesheet">
        <link href="lib/ionicons/css/ionicons.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <link href="css/modal.css" rel="stylesheet">
        <link rel="stylesheet" href="lib/form/form.css">
    </head>

    <body>

        <header id="header">
            <div class="container-fluid">
                <div id="logo" class="pull-left">
                    <h1><a href="#intro" class="scrollto">Doctor STRANGE</a></h1>
                </div>
                <nav id="nav-menu-container">
                    <ul class="nav-menu">
                        <li class="menu-has-children menu-active"><a href="#">Find Doctor</a>
                            <ul>
                                <li>
                                    <div class="dropdown-form">
                                        <form action="" method="">
                                            <h3>Find Your Doctor</h3>
                                            <input type="text" name="search" class="form-control form-search" id="name" placeholder="Search doctors by name, speciality"/>                               
                                            <input class="dropdown-button" type="submit" value="Search Doctor">
                                        </form>
                                    </div>
                                </li>
                            </ul> 
                        </li>
                        <li><a href="#">Appointment</a></li>
                        <li class="menu-has-children"><a href="">Language</a>
                            <ul>
                                <li><a href="#">English</a></li>
                                <li><a href="#">Tiếng Việt</a></li>
                            </ul>
                        </li>
                        <li><a href="#contact">Contact Us</a></li>
                        <li class="menu-active"><a href="#" data-toggle="modal" data-target="#myLogin" data-keyboard="true">Sign In/Sign Up</a></li>                     
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
                    <!--
                    <div class="modal-header">
                        <h4 class="modal-title">Modal Header</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        
                    </div>
                    <div class="modal-body">
                        <p>Some text in the modal.</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                    -->
                    <div class="modal-body">
                        <section id="formHolder">

                            <div class="row">

                                <!-- Brand Box -->
                                <div class="col-sm-6 brand">
                                    <a href="#" class="logo">Doctor <span>STRANGE</span></a>

                                    <div class="heading">
                                        <h2>Login</h2>
                                        <p>Your Right Choice</p>
                                    </div>

                                    <div class="success-msg">
                                        <p>Great! You are one of our members now</p>
                                        <a href="#" class="profile">Your Profile</a>
                                    </div>
                                </div>


                                <!-- Form Box -->
                                <div class="col-sm-6 form">

                                    <!-- Login Form -->
                                    <div class="login form-peice switched">
                                        <form class="login-form" action="login" method="post">
                                            <div class="form-group">
                                                <label for="loginemail">Email Adderss</label>
                                                <input type="email" name="email" id="loginemail" required>
                                            </div>

                                            <div class="form-group">
                                                <label for="loginPassword">Password</label>
                                                <input type="password" name="password" id="loginPassword" required>
                                            </div>

                                            <div class="CTA">
                                                <input type="submit" value="Login" name="action">
                                                <a href="#" class="switch">I'm New</a>
                                            </div>
                                        </form>
                                    </div><!-- End Login Form -->


                                    <!-- Signup Form -->
                                    <div class="signup form-peice">
                                        <form class="signup-form" action="register" method="post">

                                            <div class="form-group">
                                                <label for="name">Full Name</label>
                                                <input type="text" name="username" id="name" class="name">
                                                <span class="error"></span>
                                            </div>

                                            <div class="form-group">
                                                <label for="email">Email Adderss</label>
                                                <input type="email" name="emailAdress" id="email" class="email">
                                                <span class="error"></span>
                                            </div>

                                            <div class="form-group">
                                                <label for="phone">Phone Number - <small>Optional</small></label>
                                                <input type="text" name="phone" id="phone">
                                            </div>

                                            <div class="form-group">
                                                <label for="password">Password</label>
                                                <input type="password" name="password" id="password" class="pass">
                                                <span class="error"></span>
                                            </div>

                                            <div class="form-group">
                                                <label for="passwordCon">Confirm Password</label>
                                                <input type="password" name="passwordCon" id="passwordCon" class="passConfirm">
                                                <span class="error"></span>
                                            </div>

                                            <div class="CTA">
                                                <input type="submit" value="Signup Now" id="submit">
                                                <a href="#" class="switch">I have an account</a>
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


        <section id="intro">
            <div class="intro-container">
                <div id="introCarousel" class="carousel  slide carousel-fade" data-ride="carousel">

                    <ol class="carousel-indicators"></ol>

                    <div class="carousel-inner" role="listbox">

                        <div class="carousel-item active">
                            <div class="carousel-background"><img src="img/intro/1.jpg" alt=""></div>
                            <div class="carousel-container">
                                <div class="carousel-content">
                                    <h2>All doctors you need are here</h2>
                                    <p>Doctor Strange provide a new solution to connect to all hospitals and doctors you need. What makes us better, makes you better.</p>
                                    <a href="#featured-services" class="btn-get-started scrollto">Get Started</a>
                                </div>
                            </div>
                        </div>

                        <div class="carousel-item">
                            <div class="carousel-background"><img src="img/intro/2.jpg" alt=""></div>
                            <div class="carousel-container">
                                <div class="carousel-content">
                                    <h2>Anything Else</h2>
                                    <p>Blah blah blah blah blah.</p>
                                    <a href="#featured-services" class="btn-get-started scrollto">Get Started</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <a class="carousel-control-prev" href="#introCarousel" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon ion-chevron-left" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>

                    <a class="carousel-control-next" href="#introCarousel" role="button" data-slide="next">
                        <span class="carousel-control-next-icon ion-chevron-right" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>

                </div>
            </div>
        </section>

        <main id="main">
            <section id="featured-services">
                <div class="container">
                    <div class="row">

                        <div class="col-lg-4 box">
                            <i class="ion-ios-bookmarks-outline"></i>
                            <h4 class="title"><a href="">Find All Doctor</a></h4>
                            <p class="description">List of all doctor with full information</p>
                        </div>

                        <div class="col-lg-4 box box-bg">
                            <i class="ion-ios-stopwatch-outline"></i>
                            <h4 class="title"><a href="">Set An Appointment</a></h4>
                            <p class="description">Fill a simple form and make an appointment with the doctor you want</p>
                        </div>

                        <div class="col-lg-4 box">
                            <i class="ion-ios-heart-outline"></i>
                            <h4 class="title"><a href="">Health</a></h4>
                            <p class="description">Blah blah blah Blah blah blah Blah blah blah Blah blah blah Blah blah blah</p>
                        </div>

                    </div>
                </div>
            </section>
            <section id="about">
                <div class="container">

                    <header class="section-header">
                        <h3>About Us</h3>
                        <p>More than 500 doctors come from 8 biggest hospitals in Viet Nam with many kinds of speciality.</p>
                    </header>

                    <div class="row about-cols">

                        <div class="col-md-4 wow fadeInUp">
                            <div class="about-col">
                                <div class="img">
                                    <img src="img/about-mission.jpg" alt="" class="img-fluid">
                                    <div class="icon"><i class="ion-ios-speedometer-outline"></i></div>
                                </div>
                                <h2 class="title"><a href="#">Our Mission</a></h2>
                                <p>
                                    Provide the fastest way to connect patient to doctor
                                </p>
                            </div>
                        </div>

                        <div class="col-md-4 wow fadeInUp" data-wow-delay="0.1s">
                            <div class="about-col">
                                <div class="img">
                                    <img src="img/about-plan.jpg" alt="" class="img-fluid">
                                    <div class="icon"><i class="ion-ios-list-outline"></i></div>
                                </div>
                                <h2 class="title"><a href="#">Our Plan</a></h2>
                                <p>
                                    Cooperate with 20 hospitals 1000 doctors in 2020
                                </p>
                            </div>
                        </div>

                        <div class="col-md-4 wow fadeInUp" data-wow-delay="0.2s">
                            <div class="about-col">
                                <div class="img">
                                    <img src="img/about-vision.jpg" alt="" class="img-fluid">
                                    <div class="icon"><i class="ion-ios-eye-outline"></i></div>
                                </div>
                                <h2 class="title"><a href="#">Our Vision</a></h2>
                                <p>
                                    Beoome the biggest healthcare ecosystem in Southeast Asia in 2020
                                </p>
                            </div>
                        </div>

                    </div>

                </div>
            </section><!-- #about -->

            <!--==========================
              Services Section
            ============================-->
            <section id="services">
                <div class="container">

                    <header class="section-header wow fadeInUp">
                        <h3>Services</h3>
                        <p>We provide many services for patient and hospital can connect each other easily</p>
                    </header>

                    <div class="row">

                        <div class="col-lg-4 col-md-6 box wow bounceInUp" data-wow-duration="1.4s">
                            <div class="icon"><i class="ion-ios-analytics-outline"></i></div>
                            <h4 class="title"><a href="">Find Your Doctor</a></h4>
                            <p class="description">Rap tao giết mày k cần dao</p>
                        </div>
                        <div class="col-lg-4 col-md-6 box wow bounceInUp" data-wow-duration="1.4s">
                            <div class="icon"><i class="ion-ios-bookmarks-outline"></i></div>
                            <h4 class="title"><a href="">Become Our Member</a></h4>
                            <p class="description">Trong bài Real rap 2x2=4 thêm 3+3=6 ngày hôm nay</p>
                        </div>
                        <div class="col-lg-4 col-md-6 box wow bounceInUp" data-wow-duration="1.4s">
                            <div class="icon"><i class="ion-ios-paper-outline"></i></div>
                            <h4 class="title"><a href="">Bookmark Your Doctor</a></h4>
                            <p class="description">Mở miệng là phản động, 3 sọc</p>
                        </div>
                        <div class="col-lg-4 col-md-6 box wow bounceInUp" data-wow-delay="0.1s" data-wow-duration="1.4s">
                            <div class="icon"><i class="ion-ios-speedometer-outline"></i></div>
                            <h4 class="title"><a href="">Make An Appointment</a></h4>
                            <p class="description">Mày coi lại mày đi thằng con bà Ngọc</p>
                        </div>
                        <div class="col-lg-4 col-md-6 box wow bounceInUp" data-wow-delay="0.1s" data-wow-duration="1.4s">
                            <div class="icon"><i class="ion-ios-barcode-outline"></i></div>
                            <h4 class="title"><a href="">Get Health Information</a></h4>
                            <p class="description">Trời trên đầu mày không phải Việt Bắc, trời trên đầu mày là Việt Nam</p>
                        </div>
                        <div class="col-lg-4 col-md-6 box wow bounceInUp" data-wow-delay="0.1s" data-wow-duration="1.4s">
                            <div class="icon"><i class="ion-ios-people-outline"></i></div>
                            <h4 class="title"><a href="">Something Else</a></h4>
                            <p class="description">Chạy ngay đi trước khi mọi chuyện dần tồi tệ hơn</p>
                        </div>

                    </div>

                </div>
            </section>
            <!--==========================
              Facts Section
            ============================-->
            <section id="facts"  class="wow fadeIn">
                <div class="container">

                    <header class="section-header">
                        <h3>Facts</h3>
                        <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque</p>
                    </header>

                    <div class="row counters">

                        <div class="col-lg-3 col-6 text-center">
                            <span data-toggle="counter-up">1</span>
                            <p>Health Service</p>
                        </div>

                        <div class="col-lg-3 col-6 text-center">
                            <span data-toggle="counter-up">40</span>
                            <p>Medical Specialities</p>
                        </div>

                        <div class="col-lg-3 col-6 text-center">
                            <span data-toggle="counter-up">696</span>
                            <p>Number of Doctor</p>
                        </div>

                        <div class="col-lg-3 col-6 text-center">
                            <span data-toggle="counter-up">24</span>
                            <p>Hours a Day</p>
                        </div>
                    </div>

                    <div class="facts-img">
                        <img src="img/lab.jpg" alt="" class="img-fluid">
                    </div>

                </div>
            </section>

            <!--==========================
              Clients Section
            ============================-->
            <section id="clients" class="wow fadeInUp">
                <div class="container">

                    <header class="section-header">
                        <h3>Our Clients</h3>
                    </header>

                    <div class="owl-carousel clients-carousel">

                        <img src="img/clients/client-9.png" alt="">
                        <img src="img/clients/client-10.png" alt="">
                        <img src="img/clients/client-11.png" alt="">
                        <img src="img/clients/client-12.png" alt="">
                        <img src="img/clients/client-13.png" alt="">
                        <img src="img/clients/client-14.png" alt="">
                        <img src="img/clients/client-15.png" alt="">
                    </div>

                </div>
            </section>


            <!--Cai nay dung tam hinh thoi-->
            <section id="team">
                <div class="container">
                    <div class="section-header wow fadeInUp">
                        <h3>Team</h3>
                        <p>Team make that fucking website!</p>
                    </div>

                    <div class="row">
                        <div class="col-lg-3 col-md-6 wow fadeInUp">
                            <div class="member">
                                <img src="img/team-1.jpg" class="img-fluid" alt="">
                                <div class="member-info">
                                    <div class="member-info-content">
                                        <h4>Tien Grimmes</h4>
                                        <span>Chief Executive Officer</span>
                                        <div class="social">                          
                                            <a href=""><i class="fa fa-facebook"></i></a>
                                            <a href=""><i class="fa fa-google-plus"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-6 wow fadeInUp">
                            <div class="member">
                                <img src="img/team-1.jpg" class="img-fluid" alt="">
                                <div class="member-info">
                                    <div class="member-info-content">
                                        <h4>Hung Cao</h4>
                                        <span>Chief Executive Officer</span>
                                        <div class="social">
                                            <a href=""><i class="fa fa-facebook"></i></a>
                                            <a href=""><i class="fa fa-google-plus"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                            <div class="member">
                                <img src="img/team-2.jpg" class="img-fluid" alt="">
                                <div class="member-info">
                                    <div class="member-info-content">
                                        <h4>Vinh Gay</h4>
                                        <span>Product Manager</span>
                                        <div class="social">
                                            <a href=""><i class="fa fa-facebook"></i></a>
                                            <a href=""><i class="fa fa-google-plus"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.2s">
                            <div class="member">
                                <img src="img/team-3.jpg" class="img-fluid" alt="">
                                <div class="member-info">
                                    <div class="member-info-content">
                                        <h4>Bao Tran</h4>
                                        <span>CTO</span>
                                        <div class="social">
                                            <a href=""><i class="fa fa-twitter"></i></a>
                                            <a href=""><i class="fa fa-facebook"></i></a>
                                            <a href=""><i class="fa fa-google-plus"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                            <div class="member">
                                <img src="img/team-4.jpg" class="img-fluid" alt="">
                                <div class="member-info">
                                    <div class="member-info-content">
                                        <h4>Duyet Gay</h4>
                                        <span>Accountant</span>
                                        <div class="social">
                                            <a href=""><i class="fa fa-twitter"></i></a>
                                            <a href=""><i class="fa fa-facebook"></i></a>
                                            <a href=""><i class="fa fa-google-plus"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>
            </section>


            <section id="contact" class="section-bg wow fadeInUp">
                <div class="container">

                    <div class="section-header">
                        <h3>Contact Us</h3>
                        <p>Call us when you need</p>
                    </div>

                    <div class="row contact-info">

                        <div class="col-md-4">
                            <div class="contact-address">
                                <i class="ion-ios-location-outline"></i>
                                <h3>Address</h3>
                                <address>69, HCMIU, HCM City, Viet Nam</address>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="contact-phone">
                                <i class="ion-ios-telephone-outline"></i>
                                <h3>Phone Number</h3>
                                <p><a href="tel:+113">113</a></p>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="contact-email">
                                <i class="ion-ios-email-outline"></i>
                                <h3>Email</h3>
                                <p><a href="abc@gmail.com">abc@gmail.com</a></p>
                            </div>
                        </div>

                    </div>

                    <div class="form2">
                        <form action="" method="post" role="form" class="contactForm">
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <input type="text" name="name" class="form-control" id="name" placeholder="Your Name" data-rule="minlen:4" data-msg="Please enter at least 4 chars" />
                                    <div class="validation"></div>
                                </div>
                                <div class="form-group col-md-6">
                                    <input type="email" class="form-control" name="email" id="email" placeholder="Your Email" data-rule="email" data-msg="Please enter a valid email" />
                                    <div class="validation"></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" name="subject" id="subject" placeholder="Subject" data-rule="minlen:4" data-msg="Please enter at least 8 chars of subject" />
                                <div class="validation"></div>
                            </div>
                            <div class="form-group">
                                <textarea class="form-control" name="message" rows="5" data-rule="required" data-msg="Please write something for us" placeholder="Message"></textarea>
                                <div class="validation"></div>
                            </div>
                            <div class="text-center"><button type="submit">Send Message</button></div>
                        </form>
                    </div>

                </div>
            </section>

        </main>
        <footer id="footer">
            <div class="footer-top">
                <div class="container">
                    <div class="row">

                        <div class="col-lg-3 col-md-6 footer-info">
                            <h3>Doctor STRANGE</h3>
                            <p> Man tao cá mày không được vui nữa kể từ khi cái này tao đến. Nhìn tao đứng trên top cái miệng mày câm như hến .Sẽ có ngày tới mày nhưng việc đầu tiên trước hết. Mày muốn thắng trò chơi này việc đầu tiên phải làm là giết tao chết</p>
                        </div>

                        <div class="col-lg-3 col-md-6 footer-links">
                            <h4>Useful Links</h4>
                            <ul>
                                <li><i class="ion-ios-arrow-right"></i> <a href="#">Home</a></li>
                                <li><i class="ion-ios-arrow-right"></i> <a href="#">About us</a></li>
                                <li><i class="ion-ios-arrow-right"></i> <a href="#">Services</a></li>
                                <li><i class="ion-ios-arrow-right"></i> <a href="#">Terms of service</a></li>
                                <li><i class="ion-ios-arrow-right"></i> <a href="#">Privacy policy</a></li>
                            </ul>
                        </div>

                        <div class="col-lg-3 col-md-6 footer-contact">
                            <h4>Contact Us</h4>
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
                            <h4>Other</h4>
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

        <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>


        <script src="lib/jquery/jquery.min.js"></script>
        <script src="lib/jquery/jquery-migrate.min.js"></script>
        <script src="lib/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/superfish/hoverIntent.js"></script>
        <script src="lib/superfish/superfish.min.js"></script>
        <script src="lib/wow/wow.min.js"></script>
        <script src="lib/waypoints/waypoints.min.js"></script>
        <script src="lib/counterup/counterup.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="lib/isotope/isotope.pkgd.min.js"></script>
        <script src="lib/lightbox/js/lightbox.min.js"></script>
        <script src="lib/touchSwipe/jquery.touchSwipe.min.js"></script>

        <script src="contactform/contactform.js"></script>

        <script src="js/main.js"></script>
        <script src="js/modal.js"></script>

    </body>
</html>

