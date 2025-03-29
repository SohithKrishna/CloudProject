<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.klef.jfsd.sdp.model.Politician" %>
<%
    Politician politician = (Politician) session.getAttribute("politician");
    if (politician == null) {
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
    <title>Politician Home</title>
</head>

<body>
    <!-- Include Navbar -->
    <jsp:include page="politiciannavbar.jsp" />

    <!-- Main Content Area -->
    <div id="main-container">
        <div id="container">
            <!-- Top Section with SVG graphic -->
            <div id="top">
                <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 47 42" style="enable-background:new 0 0 47 42;" xml:space="preserve">
                    <path class="smile" d="M3.4,20.8c10.9-10.2,28-9.6,38.2,1.3" />
                </svg>
            </div>

            <!-- Eyes animation -->
            <div class="eye eyeL"></div>
            <div class="eye eyeR"></div>
        </div>

        <!-- Politician's Personalized Greeting -->
        <div class="welcome-message">
            <h3>Welcome <%= politician.getName() %></h3>
        </div>
    </div>

</body>
</html>
