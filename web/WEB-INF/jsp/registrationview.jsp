<%-- 
    Document   : registrationview
    Created on : Feb 17, 2016, 10:56:17 PM
    Author     : yash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags/form"%>
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
            <div class="row">
                <div class="col-sm-4">
                    <h3></h3>
                    <p>                       </p>
                    <p>                       </p>
                </div>
                <div class="col-sm-4">
                    <h3>Registration Page</h3>
                    <spring:form method="post" commandName="customer">

                        <p> First Name : <spring:input path="firstName" type="text"/>
                            <spring:errors cssStyle="color:red" path="firstName" /><br/><br/>

                        </p><p>Last Name : <spring:input path="lastName" type="text"/>
                            <spring:errors cssStyle="color:red" path="lastName" /><br/><br/>

                        </p><p> Age : <spring:input path="age" type="number"/>
                            <spring:errors cssStyle="color:red" path="age" /><br/><br/>

                        </p><p>Gender : <spring:radiobutton path="gender" value="M"/>Male
                            <spring:radiobutton path="gender" value="F"/>Female
                            <spring:errors cssStyle="color:red" path="gender" /><br/><br/>

                        </p><p>UserName : <spring:input path="userName" type="text"/>
                            <spring:errors cssStyle="color:red" path="userName" /><br/><br/>

                        </p><p>Password : <spring:input path="password" type="password"/>
                            <spring:errors cssStyle="color:red" path="password" /><br/><br/>

                        </p><p> Sign Up As : <spring:radiobutton path="membership_type" value="Customer"/>Customer
                            <spring:radiobutton path="membership_type" value="Trainer"/>Trainer
                            <spring:radiobutton path="membership_type" value="Admin"/>Admin
                            <spring:errors cssStyle="color:red" path="membership_type" /><br/><br/>

                        </p><p> <input type="submit" value="Sign Up" />
                        </p>
                    </spring:form>

                </div>
                <div class="col-sm-4">
                    <h3></h3>
                    <p>                       </p>
                    <p>                       </p>
                </div>
            </div>
        </div>

    </body>
</html>

