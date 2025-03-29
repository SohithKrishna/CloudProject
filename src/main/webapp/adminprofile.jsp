<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.klef.jfsd.sdp.model.Admin" %>
<%
    Admin admin = (Admin) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect("loginfail");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Profile</title>
    <link rel="stylesheet" href="css/profile.css">
    <link href="https://fonts.googleapis.com/css2?family=Abel&family=Montserrat:wght@300&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>
    <jsp:include page="adminnavbar.jsp" />

    <div class="main">
        <div class="container">
            <div class="gradient">
                <div class="content">
                    <!-- Profile Image (Admin image) -->
                    <div class="profile-img">
                        <!-- Using a working image URL here -->
                        <img src="images/default-admin-avatar.png" alt="admin profile image"/>
                    </div>

                    <!-- Admin Details -->
                    <h2>Welcome, <%= admin.getUsername() %></h2>

                    <!-- Social Media Icons -->
                    <div class="icons">
                        <i class="fa fa-facebook-square" aria-hidden="true"></i>
                        <i class="fa fa-twitter" aria-hidden="true"></i>
                        <i class="fa fa-instagram" aria-hidden="true"></i>
                        <i class="fa fa-pinterest" aria-hidden="true"></i>
                    </div>

                    <!-- Profile Description -->
                    <p class="details">
                        A dedicated administrator working to ensure the smooth operation of the platform, 
                        overseeing user management and system integrity with a focus on security and performance.
                    </p>
                </div>
            </div>
        </div>
    </div>

</body>

</html>
