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
    <title>Voter Home</title>

    <!-- Boxicons for icons -->
    <link href="https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css" rel="stylesheet">

    <!-- Custom CSS for the navbar -->
    <link rel="stylesheet" href="css/voternavbar.css">
</head>

<body>
    <!-- Voter Navbar -->
    <div class="side_wrapper">
        <<div class="logo_wrapper">
    <div class="logo" id="voterPanel">
        <i class="bx bx-vote"></i> <!-- Voter Icon -->
        <span>Voter Panel</span>
    </div>
    <i class="bx bx-menu" id="btn"></i> <!-- Menu Button -->
</div>


        <ul class="nav_list">
            

            <li>
                <a href="voterhome">
                    <i class="bx bx-grid-alt"></i>
                    <span class="link_name">Home</span>
                </a>
                <span class="tooltip">Home</span>
            </li>

            <li>
                <a href="voterticket">
                    <i class="bx bxs-check-circle"></i>
                    <span class="link_name">Raise a ticket</span>
                </a>
                <span class="tooltip">Raise a ticket</span>
            </li>
            
             <li>
                <a href="voterviewticket">
                    <i class="bx bx-show-alt"></i>
                    <span class="link_name">View Tickets</span>
                </a>
                <span class="tooltip">View Tickets</span>
            </li>

            <li>
                <a href="voterprofile">
                    <i class="bx bxs-user"></i>
                    <span class="link_name">Profile</span>
                </a>
                <span class="tooltip">Profile</span>
            </li>

            <li>
                <a href="voterupdate.jsp">
                    <i class="bx bx-cog"></i>
                    <span class="link_name">Settings</span>
                </a>
                <span class="tooltip">Settings</span>
            </li>

            <li>
                <a href="voterlogout">
                    <i class="bx bx-log-out"></i>
                    <span class="link_name">Logout</span>
                </a>
                <span class="tooltip">Logout</span>
            </li>
        </ul>
    </div>

    <!-- JavaScript for Sidebar Toggle -->
    <script>
        // Select elements for toggle functionality
       // Select elements for toggle functionality
let voterPanel = document.querySelector("#voterPanel");
let sidebar = document.querySelector(".side_wrapper");
let homeContent = document.querySelector(".home_content");

// Toggle the sidebar when the Voter Panel (icon + text) is clicked
voterPanel.onclick = function () {
    sidebar.classList.toggle("active");
    homeContent.classList.toggle("active");
}

    </script>

</body>

</html>
