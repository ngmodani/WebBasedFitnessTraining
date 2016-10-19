<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
    <head>
        <title>Find Trainer</title>
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
                <c:set var="user" value="${requestScope.user}"></c:set>
                    <div class="row">
                        <div class="col-sm-4">
                            <h3></h3>
                            <p>   <jsp:include page="leftmenu.jsp"/>   </p>

                    </div>

                    <div class="col-sm-4">
                        <h3>Search Trainer</h3>

                        <form method="get" action="searchtrainer.htm">

                            <p>Search Trainer by Name : <input type="text" id="name" name="user" /> </p>
                            <br/><br/>
                            <p>Search Trainer by Specialty :</p>
                            <input type="radio" name="specialty" value="all" checked/>Any
                            <br/><input type="radio" name="specialty" value="generic"/>Generic personal trainer
                            <br/><input type="radio" name="specialty" value="intense"/>Intense fitness trainer
                            <br/><input type="radio" name="specialty" value="weight"/>Weight management trainer
                            <br/><input type="radio" name="specialty" value="senior"/>Senior fitness trainer
                            <br/><input type="radio" name="specialty" value="functional"/>Functional training trainer
                            <br/><input type="radio" name="specialty" value="strength"/>Strength building trainer
                            <br/><input type="radio" name="specialty" value="muscle"/>Muscle building trainer
                            <br/><br/>
                            <br/><p>Search Trainer by Ratings :</p>
                            <input type="radio" name="rating" value="0" checked/>Any
                            <br/><input type="radio" name="rating" value="1"/>1 or more
                            <br/><input type="radio" name="rating" value="2"/>2 or more
                            <br/><input type="radio" name="rating" value="3"/>3 or more
                            <br/><input type="radio" name="rating" value="4"/>4 or more
                            <br/><input type="radio" name="rating" value="5"/>5 or more

                            <input type="submit" name="search"/><br><br>
                            <input type="hidden" name="action" value="search"/>
                        </form>

                    </div>

                    <div class="col-sm-4" align="right">



                    </div>
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

    </body>
</html>

