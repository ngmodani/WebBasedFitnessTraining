<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
    <head>
        <title>Trainer List View</title>
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

                    <div>
                        <h3>Trainer List</h3><br/>
                        <span id="success" style="color: blue;border: 1px #0033ff"></span>
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
                                <th></th>
                            </tr>

                            <c:forEach var="user" items="${requestScope.trainerList}">
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
                                    <td><input type="button" value="Select" onclick="return selectRow(${user.customerID});"></td>

                                </tr>
                            </c:forEach>
                        </table>
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

        <script>
            //AJAX

            var xmlHttp;
            xmlHttp = GetXmlHttpObject();

            function selectRow(userID) {
                if (xmlHttp == null)
                {
                    alert("Your browser does not support AJAX!");
                    return;
                }

                var query = "action=select&train=" + userID;

                xmlHttp.onreadystatechange = function stateChanged()
                {
                    if (xmlHttp.readyState == 4)
                    {

                        document.getElementById("success").innerHTML = "Successfully updated";
                    }
                };
                xmlHttp.open("POST", "searchtrainer.htm", true);
                xmlHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                xmlHttp.send(query);
                return false;
            }

            function GetXmlHttpObject()
            {
                var xmlHttp = null;
                try
                {
                    // Firefox, Opera 8.0+, Safari
                    xmlHttp = new XMLHttpRequest();
                } catch (e)
                {
                    // Internet Explorer
                    try
                    {
                        xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
                    } catch (e)
                    {
                        xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                    }
                }
                return xmlHttp;
            }
        </script>
    </body>


</html>

