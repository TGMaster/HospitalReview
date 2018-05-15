<%-- 
    Document   : resetpass
    Created on : May 12, 2018, 9:24:20 AM
    Author     : TGMaster
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${param.language}" scope="session" />
<c:if test="${not empty language}">
    <fmt:setLocale value="${language}" />
</c:if>
<fmt:setBundle basename="text" />
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <link rel="icon" href=" ">
        <title>Doctor Strange</title>

        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Font Awesome Style Icon -->
        <link rel="stylesheet" href="css/font-awesome.min.css">

        <!-- Custom form -->
        <link rel="stylesheet" type="text/css" href="css/resetpass.css">
    </head>
    <body class="my-login-page">
        <form>
            <select name="language" onchange="submit()">
                <option disabled selected value> -- Select language -- </option>
                <option value="en_US"><fmt:message key="EN"/></option>
                <option value="fr_FR"><fmt:message key="FR"/></option>
                <option value="vi_VN"><fmt:message key="VN"/></option>
            </select>
        </form>
        <%
            String error = "";
            if (request.getAttribute("error") != null) {
                error = (String) request.getAttribute("error");
            }

            String message = "";
            if (request.getAttribute("message") != null) {
                message = (String) request.getAttribute("message");
        %>

        <div class="container animated slideInDown" id="message">
            <div class="row">
                <div class="col-sm-3 col-md-3"></div>
                <div class="col-sm-6 col-md-6">
                    <div class="alert alert-success">
                        <i class="fa fa-check"></i> <strong><fmt:message key="label.forgotpass.resetsuccess"/></strong>
                        <hr class="message-inner-separator">
                        <p><%=message%></p>
                    </div>
                </div>
            </div>
        </div>
        <%}%>

        <section class="h-100">
            <div class="container h-100">
                <div class="row justify-content-md-center align-items-center h-100">
                    <div class="card-wrapper">
                        <div class="brand">
                            <img src="img/logo/logo.jpg">
                        </div>
                        <div class="card fat">
                            <div class="card-body">
                                <h4 class="card-title"><fmt:message key="label.forgotpass.forgot"/></h4>
                                <form method="POST" action="forgot">

                                    <%
                                        if (error.length() > 0) {
                                    %>
                                    <div class="form-group has-danger">
                                        <div class="form-control-feedback">
                                            <span class="text-danger align-middle">
                                                <i class="fa fa-close"></i> <%=error%>
                                            </span>
                                        </div>
                                        <label for="email"><fmt:message key="label.email"/></label>
                                        <input id="email" type="email" class="form-control" name="email" value="" required autofocus>
                                        <div class="form-text text-muted">
                                            <fmt:message key="label.forgotpass.msg1"/>
                                        </div>
                                    </div>
                                    <%} else {%>
                                    <div class="form-group">
                                        <label for="email"><fmt:message key="label.email"/></label>
                                        <input id="email" type="email" class="form-control" name="email" value="" required autofocus>
                                        <div class="form-text text-muted">
                                            <fmt:message key="label.forgotpass.msg1"/>
                                        </div>
                                    </div>
                                    <%}%>
                                    <div class="form-group no-margin">
                                        <button type="submit" class="btn btn-primary btn-block">
                                            <fmt:message key="label.forgotpass.resetbtn"/>
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="footer">
                            Copyright &copy; 2018 &mdash;  TGMaster
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Bootstrap core JavaScript
          ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="js/jquery.min.js" ></script>
        <script src="js/bootstrap.min.js"></script>

        <%if (message.length() > 0) {%>
        <script type = "text/javascript">

                $(document).ready(function () {
                    $("header").hide();
                    $('#message').prop("disabled", true);

                    $('#message').delay(4000).slideUp("slow", function () {
                        // Animation complete.
                        $('#message').prop("disabled", false);
                        $("header").show();
                    });
                });

        </script>
        <%}%>

    </body>
</html>
