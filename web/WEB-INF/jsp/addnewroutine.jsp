<%-- 
    Document   : registrationview
    Created on : Feb 17, 2016, 10:56:17 PM
    Author     : yash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Register</title>
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
                            <p>   <jsp:include page="trainer.jsp"/>   </p>

                    </div>
                    <div class="col-sm-4">
                        <h3>Add New Routine</h3>
                        <spring:form method="post" commandName="routine">

                            <p> Days of Week : <spring:input path="daysofweek" type="text"/>
                                <spring:errors cssStyle="color:red" path="daysofweek" /><br/><br/>

                            </p><p>Exercise 1 : <spring:input path="exercise1" type="text"/>
                                <spring:errors cssStyle="color:red" path="exercise1" />

                            </p><p> Notes : <spring:input path="exercise1url" type="text"/>
                                <spring:errors cssStyle="color:red" path="exercise1url" /><br/><br/>

                            </p><p>Exercise 2 : <spring:input path="exercise2" type="text"/>
                                <spring:errors cssStyle="color:red" path="exercise2" />

                            </p><p> Notes : <spring:input path="exercise2url" type="text"/>
                                <spring:errors cssStyle="color:red" path="exercise2url" /><br/><br/>

                            </p><p>Exercise 3 : <spring:input path="exercise3" type="text"/>
                                <spring:errors cssStyle="color:red" path="exercise3" />

                            </p><p> Notes : <spring:input path="exercise3url" type="text"/>
                                <spring:errors cssStyle="color:red" path="exercise3url" /><br/><br/>

                            </p><p>Exercise 4 : <spring:input path="exercise4" type="text"/>
                                <spring:errors cssStyle="color:red" path="exercise4" />

                            </p><p> Notes : <spring:input path="exercise4url" type="text"/>
                                <spring:errors cssStyle="color:red" path="exercise4url" /><br/><br/>

                            </p><p> <input type="submit" value="Save" />
                            </p>
                        </spring:form>

                    </div>

                </div>
            </c:if>
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

