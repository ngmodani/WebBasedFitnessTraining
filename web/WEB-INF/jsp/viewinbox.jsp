<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
    <head>
        <title>Rate Trainer View</title>
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

                    <div>
                        <h3>Inbox</h3><br/>

                        <table class="table table-striped">
                            <tr>
                                <th>Message Date</th>
                                <th>From</th>
                                <th>Message</th>
                                <th></th>

                            </tr>

                            <c:forEach var="message" items="${requestScope.messageList}">
                                <tr>
                                    <td><c:out value="${message.messageDate}"></c:out></td>
                                    <td><c:out value="${message.fromUser}"></c:out></td>
                                    <td><c:out value="${message.messagebody}"></c:out></td>
                                    <td><a href="sendmessage.htm?to=<c:out value="${message.fromUser}"/>">Reply</a></td>

                                </tr>
                            </c:forEach>
                        </table>

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


