<%--
  Created by IntelliJ IDEA.
  User: Chuka Nwobi
  Date: 18/03/2018
  Time: 7:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Tangerine">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>Customer Form</title>
</head>
<body>
<div id="wrapper">

    <div id="header" style="font-family: Helvetica  ">
        <h2><b>CRM- Customer Relationship Manager </b></h2>

    </div>

    <table class="table table-stripped table-hover table-sm ">
        <thead class="thead-dark">
        <tr>
            <th scope="col">

                <h4> New Customer Details </h4>
            </th>

        </tr>


        </thead>
    </table>
<form:form action="saveCustomer" modelAttribute="customer" method="post">
    <!-- associate this data to a particular customer-->
    <form:hidden path="id"/>

    <div class=" row">
        <label for="inputEmail3" class="col  text-right" > <h5> First Name: </h5></label>
        <div class="col">
            <form:input path="firstName"  class="form-control" id="inputEmail3" placeholder="First Name"/>
        </div>
        <div class="col"><form:errors path="firstName" class="text-danger"/></div>
        <div class="col"></div>
        <div class="col"></div>
        <div class="col"></div>
    </div>
    <div class=" row">
        <label for="inputEmail3" class="col  text-right" > <h5> Last Name: </h5></label>
        <div class="col">
            <form:input path="lastName"  class="form-control"  placeholder="Last Name"/>

        </div>
        <div class="col"> <form:errors path="lastName" class="text-danger" /> </div>
        <div class="col"></div>
        <div class="col"></div>
        <div class="col"></div>
    </div>
    <div class=" row">
        <label  class="col  text-right" > <h5> Email: </h5></label>
        <div class="col">
            <form:input path="email"  class="form-control"  placeholder="@email"/>
        </div>
        <div class="col"><form:errors path="email" class="text-danger" cssClass="error"/></div>
        <div class="col"></div>
        <div class="col"></div>
        <div class="col"></div>
    </div>

    <div class="row">
        <div class="col">
            ..
        </div>
        <div class="col">
        <input type="submit" class="btn btn-secondary btn-sm" value="Submit"  style=" margin: 10px"/>
        </div>
        <div class="col"></div>
        <div class="col"></div>
        <div class="col"></div>
        <div class="col"></div>
    </div>
        </form:form>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">


        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
            <div class="navbar-nav">

                <a class="nav-item nav-link" href="${pageContext.request.contextPath}/customer/list">Back to List</a>


            </div>
        </div>

    </nav>
        <!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</body>
</html>
