<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
    <head>
        <title>Customer View</title>
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
                        <p>   <jsp:include page="leftmenu.jsp"/>   </p>

                    </div>

                    <div class="col-sm-4">

                        <c:set var="trainer" value="${requestScope.trainer}"/>

                        <c:choose>
                            <c:when test="${!empty requestScope.trainer}">
                                <h3>My Trainer</h3><br/>
                                <table class="table table-striped">

                                    <tr><td>First Name</td><td>:</td><td>${trainer.firstName}</td></tr>
                                    <tr><td>Last Name</td><td>:</td><td>${trainer.lastName}</td></tr>
                                    <tr><td>Age</td><td>:</td><td>${trainer.age}</td></tr>
                                    <tr><td>Gender</td><td>:</td><td>${trainer.gender}</td></tr>
                                    <tr><td>Height</td><td>:</td><td>${trainer.height}</td></tr>
                                    <tr><td>Weight</td><td>:</td><td>${trainer.weight}</td></tr>
                                    <tr><td>Chest</td><td>:</td><td>${trainer.chest}</td></tr>
                                    <tr><td>Biceps</td><td>:</td><td>${trainer.biceps}</td></tr>
                                    <tr><td>Waist</td><td>:</td><td>${trainer.waist}</td></tr>
                                    <tr><td>Specialty</td><td>:</td><td>${trainer.speciality}</td></tr>
                                    <tr><td>Ratings</td><td>:</td><td>${trainer.ratings}</td></tr>

                                    <tr><td><p><a href="sendmessage.htm?to=${trainer.userName}"><input type="button" value="Send Message" name="Send Message"/></a></p>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <br/>

                            <div class="col-sm-4" align="right">

                                <p>  <img width="150" height="150" src="${trainer.photoName}" alt="Image not Available"/>  </p>
                                <p>                       </p>

                            </div>
                        </c:when>
                        <c:otherwise>
                            <p><a href="selecttrainer.htm?action=search">Select A Trainer</a></p>
                        </c:otherwise>
                    </c:choose>
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

