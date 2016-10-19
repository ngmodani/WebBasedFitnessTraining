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
                <c:set var="user" value="${requestScope.user}"></c:set>
                    <div class="row">
                        <div class="col-sm-4">
                            <h3></h3>
                            <p>   <jsp:include page="trainer.jsp"/>   </p>

                    </div>

                    <div class="col-sm-4">
                        <h3>Welcome ${sessionScope.userName}</h3>
                        <p>  <img width="150" height="100" src="${user.photoName}" alt="Image not Available"/>  </p>
                        <br/><h4>My Customers</h4>


                        <table class="table table-striped">
                            <tr>
                                <th>First Name</th>
                                <th>Last Name</th>
                                <th>Age</th>
                                <th>Gender</th>
                                <th>Height</th>
                                <th>Weight</th>
                                <th>Chest</th>
                                <th>Biceps</th>
                                <th>Waist</th>
                                <th>Photo</th>
                                <th>Routine</th>
                                <th>Message</th>
                            </tr>

                            <c:forEach var="user" items="${requestScope.custList}">
                                <tr>
                                    <td><c:out value="${user.firstName}"></c:out></td>
                                    <td><c:out value="${user.lastName}"></c:out></td>
                                    <td><c:out value="${user.age}"></c:out></td>
                                    <td><c:out value="${user.gender}"></c:out></td>
                                    <td><c:out value="${user.height}" default="NA"></c:out></td>
                                    <td><c:out value="${user.weight}" default="NA"></c:out></td>
                                    <td><c:out value="${user.chest}" default="NA"></c:out></td>
                                    <td><c:out value="${user.biceps}" default="NA"></c:out></td>
                                    <td><c:out value="${user.waist}" default="NA"></c:out></td>
                                    <td><img width="50" height="50" src="${user.photoName}" alt="Image NA"/> </td>
                                    <td><a href="viewroutine.htm?cust=${user.customerID}&action=a">View</a></td>
                                    <td><a href="sendmessage.htm?to=${user.userName}">Send</a></td>


                                </tr>
                            </c:forEach>
                        </table>
                    </div>

                    <div class="col-sm-4" align="right">

                        <p>                       </p>
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

