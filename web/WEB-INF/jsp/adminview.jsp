<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
    <head>
        <title>Admin View</title>
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
            <c:if test="${!empty sessionScope.userName}">
                <div class="row">
                    <div class="col-sm-4">
                        <h3></h3>
                        <p><a href="home.htm?action=home">Home</a>                 
                        </p><p><a href="viewmessage.htm?action=inbox">Inbox</a>            
                        </p><p><a href="viewmessage.htm?action=sent">Sent</a>
                        </p><p><a href="logout.htm?action=logout">Logout</a></p>
                    </div>

                    <div class="col-sm-4">


                        <h3>Welcome ${sessionScope.userName}</h3><br/>
                        <p></p>

                    </div>
                </c:if><br/>
                <c:if test="${empty sessionScope.userName}">
                    <div class="row">
                        <div class="col-sm-4">
                            <h3>Page Not Accessible!</h3>
                            <p>   <a href="index.htm">Please Login here to Access</a>   </p>

                        </div>
                    </div>
                </c:if>
            </div>
        </div>

    </body>
</html>

