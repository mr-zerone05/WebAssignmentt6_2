<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:useBean id="user" class="vn.edu.hcmute.fit.demo1.User" scope="request" />

<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>Email List - Thanks</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/main.css" type="text/css"/>
</head>
<body>
<h1>Thanks for joining our email list</h1>

<p>Here is the information that you entered:</p>

<label>Email:</label>
<span>${user.email}</span><br/>

<label>First Name:</label>
<span>${user.firstName}</span><br/>

<label>Last Name:</label>
<span>${user.lastName}</span><br/>

<label>Heard From:</label>
<span>${user.heardFrom}</span><br/>

<label>Receive Updates:</label>
<span>${user.wantsUpdates}</span><br/>

<!-- Ẩn/hiện bằng EL (không cần JSTL) -->
<div style="display:${user.wantsUpdates eq 'Yes' ? 'block' : 'none'};">
    <label>Contact Via:</label>
    <span>${user.contactVia}</span><br/>
</div>

<p>To enter another email address, click Back in your browser or the Return button below.</p>

<form action="${pageContext.request.contextPath}/survey" method="get">
    <input type="submit" value="Return"/>
</form>

<%@ include file="/includes/footer.jsp" %>
</body>
</html>
