<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.klef.jfsd.sdp.model.Voter" %>
<%
    Voter voter = (Voter) session.getAttribute("voter");
    if (voter == null) {
        response.sendRedirect("loginfail");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Voter Profile</title>
    <link rel="stylesheet" href="css/profile.css">
    <link href="https://fonts.googleapis.com/css2?family=Abel&family=Montserrat:wght@300&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>
    <jsp:include page="voternavbar.jsp" />

    <div class="main">
        <div class="container">
            <div class="gradient">
                <div class="content">
                    <!-- Profile Image (Boy image) -->
                    <div class="profile-img">
                        <!-- Using a working image URL here -->
                        <img src="images/default-avatar.png" alt="boy profile image"/>
                    </div>
                    <!-- Voter Details -->
                    <h2>Welcome, Nayan</h2>
                    <p><strong>ID:</strong> <%= voter.getVoterId() %></p>
                    <p><strong>Name:</strong> <%= voter.getName() %></p>
                    <p><strong>Email:</strong> <%= voter.getEmail() %></p>
                    <p><strong>Address:</strong> <%= voter.getAddress() %></p>
                    <p><strong>Phone Number:</strong> <%= voter.getPhoneNumber() %></p>
                    <p><strong>Constituency:</strong> <%= voter.getConstituency() %></p>

                    <!-- Social Media Icons -->
                    <div class="icons">
                        <i class="fa fa-facebook-square" aria-hidden="true"></i>
                        <i class="fa fa-twitter" aria-hidden="true"></i>
                        <i class="fa fa-instagram" aria-hidden="true"></i>
                        <i class="fa fa-pinterest" aria-hidden="true"></i>
                    </div>

                    <!-- Profile Details -->
                    <p class="details">
                        An engaged citizen and advocate for social justice. I believe that voting is the foundation of a strong democracy and I’m committed to ensuring my voice is heard in every election.
                    </p>
                </div>
            </div>
        </div>
    </div>

</body>

</html>
