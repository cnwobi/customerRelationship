<%--
  Created by IntelliJ IDEA.
  User: Chuka Nwobi
  Date: 18/03/2018
  Time: 2:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Tangerine">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <!-- Custom styles for this template -->
    <link href="/CustomerApp_war_exploded/resources/css/starter-template.css" rel="stylesheet">

    <title>Customer List</title>

</head>
<body>
<div id="wrapper">
    <div id="header" style="font-family: Helvetica  ">
        <h2><b>CRM- Customer Relationship Manager </b></h2>

    </div>

    <div >
        <!-- Content here -->

    <input type="button" class="btn btn-secondary btn-sm" value="Add Customer" onclick="window.location.href='showFormForAdd'; return false" style="float: right ; margin: 10px"/>
    </div>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <form:form action="search" method="post" class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="text" name="theSearchName" placeholder="Search Customer" aria-label="Search"/>
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            </form:form>
        </div>
    </nav>
    <div id="container">

        <div id="content">
            <table class="table table-stripped table-hover table-sm ">
                <thead class="thead-dark">


                <tr>
                    <th scope="col">
                        First Name
                    </th>
                    <th scope="col">Last Name</th>
                    <th scope="col">Email</th>
                    <th scope="col">Action</th>
                </tr>
                </thead>
                <tbody>
                <!-- construct an update link-->

                <!-- loop over and print customers-->
                <c:forEach var="tempCustomer" items="${customers}">
                    <c:url var="updateLink" value="/customer/showFormForUpdate">
                        <c:param name="customerId" value="${tempCustomer.id}"/>
                    </c:url>
                    <c:url var="deleteLink" value="/customer/delete">
                        <c:param name="customerId" value="${tempCustomer.id}"/>
                    </c:url>
                <tr class="table-success">
                    <td>${tempCustomer.firstName}</td>
                    <td>${tempCustomer.lastName}</td>
                    <td>${tempCustomer.email}</td>
                    <td><a  class="text-muted" href="${updateLink}"> Update</a>
                        | <a class="text-muted" href="${deleteLink}" onclick="if(!(confirm('Are you sure you want to delete this customer?')))return false">Delete </a></td>
                </tr>

                </c:forEach>
                </tbody>
            </table>

        </div>
    </div>
</div>
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</body>
</html>
