<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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

<div class="container">
    <form:form method="post" modelAttribute="user" action="/new-user">
        <form:hidden path="id"/>
        <fieldset class="form-group">
            <form:label path="name">Name</form:label>
            <form:input path="name" type="text" class="form-control"/>
        </fieldset>
        <fieldset class="form-group">
            <form:label path="surname">Surname</form:label>
            <form:input path="surname" type="text" class="form-control"/>
        </fieldset>
        </fieldset>
        <button type="save" class="btn btn-success">Save</button>
        <a href="/" type="button" class="btn btn-default">Cancel</a>
    </form:form>
</div>
</body>
</html>