<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
 <%@ page isELIgnored="false" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Inicio</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 
    <!-- jQuery Files -->
    <script type="text/javascript" src="https://examples.javacodegeeks.com/wp-content/litespeed/localres/aHR0cHM6Ly9hamF4Lmdvb2dsZWFwaXMuY29tL2FqYXgvlibs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript" src="resource/js/form_login.js"></script>
 
    <!-- CSS File -->
    <link rel="stylesheet" href="https://examples.javacodegeeks.com/wp-content/litespeed/localres/aHR0cHM6Ly9tYXhjZG4uYm9vdHN0cmFwY2RuLmNvbS8=bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
    <div id="mongoDbServlet" class="container">
        <h1 align="center" class="text-primary">Jugueteria</h1>
        <hr />
 
        <!------ MONGODB JSP & SERVLET EXAMPLE ------>
        <div id="login_form">
            <form id="user_login_form" name="loginForm" method="post" action="Login">
                <!----- LOGIN FORM ------>
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                    <input type="text" class="form-control" id="login_id" placeholder="Enter login id ..." name="login_id">
                </div>
                <div> </div>
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                    <input type="password" class="form-control" id="login_pwd" placeholder="Enter password ..." name="login_pwd">
                </div>
 
                <!----- SUBMIT BUTTON ------>
                <div> </div>
                <button id="submit_btn" type="submit" class="btn btn-primary">Ingresar</button>
                
                <a href="<%=request.getContextPath()%>/register.jsp" class="nav-link">Registrar</a>
            </form>
        </div>
         
        <h4 id="errMsg" class="text-danger" align="center"><c:out value='${error_message}'/></h4>
    </div>
</body>
</html>