<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
    <head>
        <title>Search Trainer View</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    </head>
    <style>
        table{
            border:3px solid black;
        }
        a{
            text-decoration: underline;
            cursor: pointer;
            color:blue;
        }
        span{
            color: red;
        }
    </style>
    <script>

        //AJAX

        var xmlHttp;
        xmlHttp = GetXmlHttpObject();
        function getResults() {
            if (xmlHttp == null)
            {
                alert("Your browser does not support AJAX!");
                return;
            }
            var key = document.getElementById("name").value;
            var dd = document.getElementById("dropdown").value;

            var letters = /^[a-zA-Z]+$/;
            //if (key.length > 1 && key.value.match(letters)) {
            var query = "action=searchByName&key=" + key;
            alert("in if");
            //} else {
            //  alert("in else");
            //var query = "action=searchBySpecialty&key=" + dd;
            /// }
            xmlHttp.onreadystatechange = function stateChanged()
            {
                if (xmlHttp.readyState == 4)
                {
                    document.getElementById("results").innerHTML = "";
                    var json = JSON.parse(xmlHttp.responseText);
                    if (json.users.length > 0) {
                        var x = document.createElement("TABLE");
                        x.setAttribute("id", "myTable");
                        document.getElementById("results").appendChild(x);
                        var y = document.createElement("TR");
                        y.setAttribute("id", "myTr");
                        document.getElementById("myTable").appendChild(y);
                        var z = document.createElement("TH");
                        var t = document.createTextNode("First Name");
                        z.appendChild(t);
                        document.getElementById("myTr").appendChild(z);
                        var z = document.createElement("TH");
                        var t = document.createTextNode("Last Name");
                        z.appendChild(t);
                        document.getElementById("myTr").appendChild(z);
                        var z = document.createElement("TH");
                        var t = document.createTextNode("Age");
                        z.appendChild(t);
                        document.getElementById("myTr").appendChild(z);
                        var z = document.createElement("TH");
                        var t = document.createTextNode("Gender");
                        z.appendChild(t);
                        document.getElementById("myTr").appendChild(z);
                        var z = document.createElement("TH");
                        var t = document.createTextNode("Height");
                        z.appendChild(t);
                        document.getElementById("myTr").appendChild(z);
                        var z = document.createElement("TH");
                        var t = document.createTextNode("Weight");
                        z.appendChild(t);
                        document.getElementById("myTr").appendChild(z);
                        var z = document.createElement("TH");
                        var t = document.createTextNode("Chest");
                        z.appendChild(t);
                        document.getElementById("myTr").appendChild(z);
                        var z = document.createElement("TH");
                        var t = document.createTextNode("Biceps");
                        z.appendChild(t);
                        document.getElementById("myTr").appendChild(z);
                        var z = document.createElement("TH");
                        var t = document.createTextNode("Waist");
                        z.appendChild(t);
                        document.getElementById("myTr").appendChild(z);
                        var z = document.createElement("TH");
                        var t = document.createTextNode("Speciality");
                        z.appendChild(t);
                        document.getElementById("myTr").appendChild(z);
                        var z = document.createElement("TH");
                        var t = document.createTextNode("Ratings");
                        z.appendChild(t);
                        document.getElementById("myTr").appendChild(z);
                        var z = document.createElement("TH");
                        var t = document.createTextNode("Photo");
                        z.appendChild(t);
                        document.getElementById("myTr").appendChild(z);
                        var z = document.createElement("TH");
                        var t = document.createTextNode("");
                        z.appendChild(t);
                        document.getElementById("myTr").appendChild(z);
                        for (var count = 0; count < json.users.length; count++) {
                            var y = document.createElement("TR");
                            y.setAttribute("id", "myTr" + count);
                            document.getElementById("myTable").appendChild(y);

                            var z = document.createElement("TD");
                            var t = document.createTextNode(json.users[count].firstName);
                            z.appendChild(t);
                            document.getElementById("myTr" + count).appendChild(z);
                            var z = document.createElement("TD");
                            var t = document.createTextNode(json.users[count].lastName);
                            z.appendChild(t);
                            document.getElementById("myTr" + count).appendChild(z);
                            var z = document.createElement("TD");
                            var t = document.createTextNode(json.users[count].age);
                            z.appendChild(t);
                            document.getElementById("myTr" + count).appendChild(z);
                            var z = document.createElement("TD");
                            var t = document.createTextNode(json.users[count].gender);
                            z.appendChild(t);
                            document.getElementById("myTr" + count).appendChild(z);
                            var z = document.createElement("TD");
                            var t = document.createTextNode(json.users[count].height);
                            z.appendChild(t);
                            document.getElementById("myTr" + count).appendChild(z);
                            var z = document.createElement("TD");
                            var t = document.createTextNode(json.users[count].weight);
                            z.appendChild(t);
                            document.getElementById("myTr" + count).appendChild(z);
                            var z = document.createElement("TD");
                            var t = document.createTextNode(json.users[count].chest);
                            z.appendChild(t);
                            document.getElementById("myTr" + count).appendChild(z);
                            var z = document.createElement("TD");
                            var t = document.createTextNode(json.users[count].biceps);
                            z.appendChild(t);
                            document.getElementById("myTr" + count).appendChild(z);
                            var z = document.createElement("TD");
                            var t = document.createTextNode(json.users[count].waist);
                            z.appendChild(t);
                            document.getElementById("myTr" + count).appendChild(z);
                            var z = document.createElement("TD");
                            var t = document.createTextNode(json.users[count].speciality);
                            z.appendChild(t);
                            document.getElementById("myTr" + count).appendChild(z);
                            var z = document.createElement("TD");
                            var t = document.createTextNode(json.users[count].ratings);
                            z.appendChild(t);
                            document.getElementById("myTr" + count).appendChild(z);
                            var z = document.createElement("TD");
                            var t = document.createElement("img");
                            t.setAttribute('src', json.users[count].photoName);
                            t.setAttribute('alt', 'Image NA');
                            t.setAttribute('height', '150px');
                            t.setAttribute('width', '150px');
                            z.appendChild(t);
                            document.getElementById("myTr" + count).appendChild(z);
                            var z = document.createElement("TD");
                            var a = document.createElement('a');
                            var id = json.users[count].customerID;
                            var rowID = "myTr" + count;
                            var linkText = document.createTextNode("Select");
                            a.appendChild(linkText);
                            a.title = "Select";
                            a.onclick = (function (id, rowID) {
                                return function () {
                                    selectRow(id, rowID);
                                }
                            })(id, rowID);
                            z.appendChild(a);
                            document.getElementById("myTr" + count).appendChild(z);
                        }
                    } else {
                        document.getElementById("results").innerHTML = "Try Searching Again!";
                    }
                }
            };
            xmlHttp.open("GET", "searchtrainer.htm", true);
            xmlHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xmlHttp.send(query);
            return false;
        }

        function selectRow(userID, rowID) {
            if (xmlHttp == null)
            {
                alert("Your browser does not support AJAX!");
                return;
            }

            var query = "action=select&trainer=" + userID;
            xmlHttp.onreadystatechange = function stateChanged()
            {
                if (xmlHttp.readyState == 4)
                {
                    var json = JSON.parse(xmlHttp.responseText);
                    document.getElementById("success").innerHTML = json.message;
                    var row = document.getElementById(rowID);
                    row.parentNode.style.backgroundColor = 'green';
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
                        <p>
                        <div id="searchForm" >
                            <h3>Search Trainer</h3>
                            <form id="search" onsubmit="return getResults();">

                                <p>Search Trainer by Name : </p><input type="text" id="name" name="user" /> 

                                <p>Search Trainer by Specialty: </p>
                                <select id="dropdown" >
                                    <option value="generic" selected>Generic personal trainer</option>
                                    <option value="intense">Intense fitness trainer</option>
                                    <option value="weight">Weight management trainer</option>
                                    <option value="senior">Senior fitness trainer</option>
                                    <option value="functional">Functional training trainer</option>
                                    <option value="strength">Strength building trainer</option>
                                    <option value="muscle">Muscle building trainer</option>

                                </select>
                                <input type="submit" name="search"/><br><br>
                            </form>
                        </div>
                        <p><span id="success" style="color: blue"></span></p>

                        </p>
                        <p>
                        <div id="results">

                        </div>
                        </p>
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

    <script type="text/javascript">
        var mytextbox = document.getElementById('name');
        var mydropdown = document.getElementById('dropdown');

        mydropdown.onchange = function () {
            mytextbox.value = mytextbox.value + this.value; //to appened
            // mytextbox.innerHTML = this.value;
            alert("in on chagnge function");
        }
    </script>
</html>
