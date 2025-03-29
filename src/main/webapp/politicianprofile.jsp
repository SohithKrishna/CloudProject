<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.klef.jfsd.sdp.model.Politician" %>
<%
    Politician politician = (Politician) session.getAttribute("politician");
    if (politician == null) {
        response.sendRedirect("loginfail");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Politician Profile</title>
    <link rel="stylesheet" href="css/profile.css">
    <link href="https://fonts.googleapis.com/css2?family=Abel&family=Montserrat:wght@300&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>
    <jsp:include page="politiciannavbar.jsp" />

    <div class="main">
        <div class="container">
            <div class="gradient">
                <div class="content">
                    <!-- Profile Image (Politician image) -->
                    <div class="profile-img">
                        <!-- Using a working image URL here -->
                        <img src="images/default-politician-avatar.png" alt="politician profile image"/>
                    </div>

                    <!-- Politician Details -->
                    <h2>Welcome, <%= politician.getName() %></h2>
                    <p><strong>Aadhar:</strong> <%= politician.getPoliticianAadhar() %></p>
                    <p><strong>Number:</strong> <%= politician.getPoliticianNumber() %></p>
                    <p><strong>Name:</strong> <%= politician.getName() %></p>
                    <p><strong>Email:</strong> <%= politician.getEmail() %></p>
                    <p><strong>Party:</strong> <%= politician.getParty() %></p>
                    <p><strong>Constituency:</strong> <%= politician.getConstituency() %></p>

                    <!-- Social Media Icons -->
                    <div class="icons">
                        <i class="fa fa-facebook-square" aria-hidden="true"></i>
                        <i class="fa fa-twitter" aria-hidden="true"></i>
                        <i class="fa fa-instagram" aria-hidden="true"></i>
                        <i class="fa fa-linkedin" aria-hidden="true"></i>
                    </div>

                    <!-- Profile Description -->
                    <p class="details">
                        A passionate leader dedicated to serving the people and fostering positive change. 
                        I believe in transparency, accountability, and building a brighter future for our constituency.
                    </p>
                </div>
            </div>
        </div>
    </div>

</body>

</html>
