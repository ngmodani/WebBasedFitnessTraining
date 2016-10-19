<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
    <head>
        <title>Update Profile</title>
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


                        <h3>Update Profile</h3>
                        <spring:form method="post" commandName="customer" enctype="multipart/form-data">

                            <p> First Name : <spring:input path="firstName" type="text" />
                                <spring:errors cssStyle="color:red" path="firstName" /><br/><br/>

                            </p><p>Last Name : <spring:input path="lastName" type="text"/>
                                <spring:errors cssStyle="color:red" path="lastName" /><br/><br/>

                            </p><p> Age : <spring:input path="age" type="number"/>
                                <spring:errors cssStyle="color:red" path="age" /><br/><br/>

                            </p><p>Gender : <spring:radiobutton path="gender" value="M"/>Male
                                <spring:radiobutton path="gender" value="F"/>Female
                                <spring:errors cssStyle="color:red" path="gender" /><br/><br/>


                            </p><p>Height : <spring:input path="height" type="number"/>
                                <spring:errors cssStyle="color:red" path="height" /><br/><br/>

                            </p><p>Weight : <spring:input path="weight" type="number"/>
                                <spring:errors cssStyle="color:red" path="weight" /><br/><br/>

                            </p><p>Chest : <spring:input path="chest" type="number"/>
                                <spring:errors cssStyle="color:red" path="chest" /><br/><br/>
                                <br/><br/>

                            </p><p>Biceps : <spring:input path="biceps" type="number"/>
                                <spring:errors cssStyle="color:red" path="biceps" /><br/><br/>
                                <br/><br/>

                            </p><p>Waist : <spring:input path="waist" type="number"/>
                                <spring:errors cssStyle="color:red" path="waist" /><br/><br/>
                                <br/><br/>

                            </p><p>Specialty : <br/><spring:radiobutton path="speciality" value="generic"/>Generic personal trainer<br/>
                                <spring:radiobutton path="speciality" value="intense"/>Intense fitness trainer<br/>
                                <spring:radiobutton path="speciality" value="weight"/>Weight management trainer<br/>
                                <spring:radiobutton path="speciality" value="senior"/>Senior fitness trainer<br/>
                                <spring:radiobutton path="speciality" value="functional"/>Functional training trainer<br/>
                                <spring:radiobutton path="speciality" value="strength"/>Strength building trainer<br/>
                                <spring:radiobutton path="speciality" value="muscle"/>Muscle building trainer
                                <spring:errors cssStyle="color:red" path="speciality" /><br/><br/>

                            </p><p>Upload Photo (Max 5MB): <spring:input path="photo" type="file" />
                                <spring:errors cssStyle="color:red" path="photo" /><br/><br/>

                            </p><p> <input type="submit" value="Update" />
                            </p>
                        </spring:form>


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

