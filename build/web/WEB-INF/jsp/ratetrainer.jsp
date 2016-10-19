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
                        <p>   <jsp:include page="leftmenu.jsp"/>   </p>

                    </div>

                    <div class="col-sm-4">
                        <h3>Trainer FeedBack</h3><br/>
                        <c:choose>
                            <c:when test="${!empty requestScope.error}">
                                <p>Please Select Your Trainer</p>
                            </c:when>
                            <c:otherwise>
                                <br/>
                                <form action="ratetrainer.htm" method="post">
                                    <p>Q1. Friendliness (5 being best)</p><br/>
                                    &nbsp;<input type="radio" name="rating1" value="5" checked> 5 &nbsp;
                                    <input type="radio" name="rating1" value="4"/> 4 &nbsp;
                                    <input type="radio" name="rating1" value="3"/> 3 &nbsp;
                                    <input type="radio" name="rating1" value="2"/> 2 &nbsp;
                                    <input type="radio" name="rating1" value="1"/> 1 &nbsp;
                                    <br/>
                                    <br/>
                                    <p>Q2. Timeliness in Response (5 being best)</p><br/>
                                    &nbsp;<input type="radio" name="rating2" value="5" checked> 5 &nbsp;
                                    <input type="radio" name="rating2" value="4"> 4 &nbsp;
                                    <input type="radio" name="rating2" value="3"> 3 &nbsp;
                                    <input type="radio" name="rating2" value="2"> 2 &nbsp;
                                    <input type="radio" name="rating2" value="1"> 1 &nbsp;
                                    <br/>
                                    <br/>
                                    <p>Q3. Quality of Training (5 being best)</p><br/>
                                    &nbsp;<input type="radio" name="rating3" value="5" checked> 5 &nbsp;
                                    <input type="radio" name="rating3" value="4"> 4 &nbsp;
                                    <input type="radio" name="rating3" value="3"> 3 &nbsp;
                                    <input type="radio" name="rating3" value="2"> 2 &nbsp;
                                    <input type="radio" name="rating3" value="1"> 1 &nbsp;
                                    <br/>
                                    <br/>
                                    <p>Q4. Satisfaction w.r.t Results (5 being best)</p><br/>
                                    &nbsp;<input type="radio" name="rating4" value="5" checked> 5 &nbsp;
                                    <input type="radio" name="rating4" value="4"> 4 &nbsp;
                                    <input type="radio" name="rating4" value="3"> 3 &nbsp;
                                    <input type="radio" name="rating4" value="2"> 2 &nbsp;
                                    <input type="radio" name="rating4" value="1"> 1 &nbsp;
                                    <br/>
                                    <br/>
                                    <p>Q5. Overall (5 being best)</p><br/>
                                    &nbsp;<input type="radio" name="rating5" value="5" checked> 5 &nbsp;
                                    <input type="radio" name="rating5" value="4"> 4 &nbsp;
                                    <input type="radio" name="rating5" value="3"> 3 &nbsp;
                                    <input type="radio" name="rating5" value="2"> 2 &nbsp;
                                    <input type="radio" name="rating5" value="1"> 1 &nbsp;
                                    <br/>
                                    <br/>
                                    <input type="submit" value="Submit" name="Submit"/>
                                    <input type="hidden" value="save" name="action"/>
                                </form>
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
