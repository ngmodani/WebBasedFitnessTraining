<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
    <head>
        <title>Bootstrap Example</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    </head>
    <body>

        <div class="container">
            <div class="jumbotron" align="center">
                <h1><img src="stay_logo.jpg" alt="HTML5 Icon" style="width:500px;height:80px;"></h1>
                <p>Get Fit Stay Fit</p> 
            </div>
            <div class="row">
                <div class="col-sm-4">
                    <h3></h3>
                    <p>                       </p>
                    <p>                       </p>
                </div>

                <div class="col-sm-4">
                    <h3>Login</h3><br/>
                    <c:if test="${requestScope.error == 'true'}">
                        <p style="color:red">Invalid credentials</p>
                    </c:if><br/>

                    <form method="post" action="login.htm" class="login-form">
                        <p> <input type="text" name ="username" /></p>
                        <p><input type="password" name ="password" /></p>
                        <p><input type="submit" value="Login"/></p>
                        <p><input type="hidden" value="login" name="action"/>
                        <p class="message">Not registered? <a href="addperson.htm">Create an account</a></p>
                    </form>
                </div>

                <div class="col-sm-4">
                    <h3></h3>
                    <p>                       </p>
                    <p>                       </p>
                </div>
            </div>
        </div>

    </body>
</html>

