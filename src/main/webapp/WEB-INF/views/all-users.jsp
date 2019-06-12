<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Web-client</title>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
<nav role="navigation" class="navbar navbar-default">
    <div class="">
        <a href="/" class="navbar-brand">Web-client</a>
    </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
            <li class="active"><a href="/">Main</a></li>
        </ul>
    </div>

</nav>

<div class="conteiner">
    <table id="table" class="table table-striped table-bordered">
        <thead>
        <tr>
            <td>Id</td>
            <td>Name</td>
            <td>Surname</td>
            <td class="column">Delete</td>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${users}" var="user">
            <tr>
                <td>${user.id}
                <td>${user.name}</td>
                <td>${user.surname}</td>
                <td class="column">
                    <a type="button" class="btn btn-sm btn-danger" href="/delete/${user.id}"><span
                            class="glyphicon glyphicon-trash"></span></a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<div class="container">
    <a href="/new-user" type="button" class="btn btn-success add_user_btn">+add user</a>
</div>
</body>
</html>