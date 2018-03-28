<%--
  Created by IntelliJ IDEA.
  User: Chuka Nwobi
  Date: 29/03/2018
  Time: 1:26 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Bootstrap core CSS -->
    <link href="/CustomerApp_war_exploded/resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/CustomerApp_war_exploded/resources/css/starter-template.css" rel="stylesheet">
    <link rel="icon" href="../../../../favicon.ico">

    <title>Starter Template for Bootstrap</title>


</head>

<body>

<nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">

    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarsExampleDefault">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" onclick="window.location.href='showFormForAdd'; return false" href="">New Customer</a>
            </li>


        </ul>
        <form:form action="search" method="post" class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="text" name="theSearchName" placeholder="Search Customer" aria-label="Search"/>
            <button class="btn btn-outline-active my-2 my-sm-0" type="submit">Search</button>
        </form:form>
    </div>
</nav>


<main role="main" class="container">

    <div class="starter-template">
        <h1>CUSTOMER RELATIONSHIP MANAGER</h1>
    </div>
    <div class="table-responsive">
        <table class="table table-striped table-active table-hover" >
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


                <tr >
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

</main><!-- /.container -->

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script>window.jQuery || document.write('<script src="/js/vendor/jquery-slim.min.js"><\/script>')</script>
<script src="/CustomerApp_war_exploded/resources/js/vendor/popper.min.js"></script>
<script src="/CustomerApp_war_exploded/resources/js/bootstrap.min.js"></script>
</body>
</html>