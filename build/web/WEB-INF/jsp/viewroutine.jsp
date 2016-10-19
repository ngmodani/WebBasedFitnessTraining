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
    <style></style>
    <script>

        //AJAX

        var xmlHttp;
        xmlHttp = GetXmlHttpObject();

        function deleteRow(routineID, rowID) {
            if (xmlHttp == null)
            {
                alert("Your browser does not support AJAX!");
                return;
            }

            var query = "action=delete&routineid=" + routineID;

            xmlHttp.onreadystatechange = function stateChanged()
            {
                if (xmlHttp.readyState == 4)
                {
                    var row = document.getElementById(rowID);
                    row.parentNode.removeChild(row);
                }
            };
            xmlHttp.open("POST", "viewroutine.htm", true);
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
    <body>

        <div class="container">
            <div class="jumbotron" align="center">
                <h1><img src="stay_logo.jpg" alt="HTML5 Icon" style="width:500px;height:80px;"></h1>
                <p>Get Fit Stay Fit</p> 
            </div>
            <c:if test="${!empty sessionScope.userName}">
                <c:set var="customer" value="${requestScope.custom}"/>
                <div class="row">
                    <div class="col-sm-4">
                        <h3></h3>
                        <p>   <jsp:include page="trainer.jsp"/>   </p>

                    </div>
                    <div>
                        <h3>Routine of <b>${customer.firstName} ${customer.lastName}</b></h3>
                        <h4>Age : ${customer.age} <br/> Gender : ${customer.gender}</h4>
                        <h4>Height : <c:out value="${customer.height}" default="NA"/> <br/> Weight : <c:out value="${customer.weight}" default="NA"/> </h4> 
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
                                <tr id="${user.routineID}">
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
                                    <td><input type="button" onclick="deleteRow('${user.routineID}', '${user.routineID}')" value="Delete"></td>

                                </tr>
                            </c:forEach>
                        </table>
                        <br/>
                        <p> <a href="addroutine.htm?cust=${customer.customerID}"><input type="button" value="Add New Routine"></a></p>

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

