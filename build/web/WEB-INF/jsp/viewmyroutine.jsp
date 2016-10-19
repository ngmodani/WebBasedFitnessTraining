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
                        <h3>My Routine</h3><br/>
                        <c:choose>
                            <c:when test="${!empty requestScope.routine}">
                                <table class="table table-striped">
                                    <tr>
                                        <th>Date</th>
                                        <th>Days Of Week</th>

                                        <th>Exercise 1</th>
                                        <th>Notes</th>
                                        <th>Exercise 2</th>
                                        <th>Notes</th>
                                        <th>Exercise 3</th>
                                        <th>Notes</th>
                                        <th>Exercise 4</th>
                                        <th>Notes</th>

                                        <th></th>
                                    </tr>

                                    <c:forEach var="user" items="${requestScope.routine}">
                                        <tr>
                                            <td><c:out value="${user.date}"></c:out></td>
                                            <td><c:out value="${user.daysofweek}"></c:out></td>
                                            <td><c:out value="${user.exercise1}" default="NA"></c:out></td>
                                            <td><c:out value="${user.exercise1url}" default="NA"></c:out></td>
                                            <td><c:out value="${user.exercise2}" default="NA"></c:out></td>
                                            <td><c:out value="${user.exercise2url}" default="NA"></c:out></td>
                                            <td><c:out value="${user.exercise3}" default="NA"></c:out></td>
                                            <td><c:out value="${user.exercise3url}" default="NA"></c:out></td>
                                            <td><c:out value="${user.exercise4}" default="NA"></c:out></td>
                                            <td><c:out value="${user.exercise4url}" default="NA"></c:out></td>

                                            </tr>
                                    </c:forEach>
                                </table>
                            </c:when>
                            <c:otherwise>
                                <p>No Routine Updated Yet.</p>
                            </c:otherwise>
                        </c:choose>
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
