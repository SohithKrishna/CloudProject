<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.klef.jfsd.sdp.model.Voter" %>
<%
    Voter voter = (Voter) session.getAttribute("voter");
    if (voter == null) {
        response.sendRedirect("sessionfail");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/textanm.css">
    <title>Voter Home</title>
</head>

<body>
    <jsp:include page="voternavbar.jsp" />

    <div id="main-container">
        <div id="container">
            <div id="top">
                <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 47 42" style="enable-background:new 0 0 47 42;" xml:space="preserve">
                    <path class="smile" d="M3.4,20.8c10.9-10.2,28-9.6,38.2,1.3" />
                </svg>
            </div>

            <div class="eye eyeL"></div>
            <div class="eye eyeR"></div>
        </div>
        <p>Hello, <%= voter.getName() %>!</p>
    </div>
</body>

</html>
