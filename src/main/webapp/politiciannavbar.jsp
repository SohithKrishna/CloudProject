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
    <title>Politician Home</title>

    <!-- Boxicons for icons -->
    <link href="https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css" rel="stylesheet">

    <!-- Custom CSS for the navbar -->
    <link rel="stylesheet" href="css/voternavbar.css">
</head>

<body>
    <!-- Politician Navbar -->
    <div class="side_wrapper">
        <div class="logo_wrapper">
            <div class="logo" id="politicianPanel">
                <span>Politician Panel</span>
            </div>
            <i class="bx bx-menu" id="btn"></i> <!-- Menu Button -->
        </div>

        <ul class="nav_list">
            <li>
                <i class='bx bx-search'></i>
                <input type="text" placeholder="Search..." />
                <span class="tooltip">Search</span>
            </li>

            <li>
                <a href="politicianhome.jsp">
                    <i class="bx bx-grid-alt"></i>
                    <span class="link_name">Home</span>
                </a>
                <span class="tooltip">Home</span>
            </li>

            <li>
                <a href="viewpoliticiantickets">
                    <i class="bx bxs-flag-alt"></i>
                    <span class="link_name">View Problems</span>
                </a>
                <span class="tooltip">Voter Requests</span>
            </li>

            <li>
                <a href="politicianprofile.jsp">
                    <i class="bx bxs-user"></i>
                    <span class="link_name">Profile</span>
                </a>
                <span class="tooltip">Profile</span>
            </li>

            <li>
                <a href="politicianupdate.jsp">
                    <i class="bx bx-cog"></i>
                    <span class="link_name">Settings</span>
                </a>
                <span class="tooltip">Settings</span>
            </li>

            <li>
                <a href="politicianlogout">
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
        let politicianPanel = document.querySelector("#politicianPanel");
        let sidebar = document.querySelector(".side_wrapper");
        let homeContent = document.querySelector(".home_content");

        // Toggle the sidebar when the Politician Panel (icon + text) is clicked
        politicianPanel.onclick = function () {
            sidebar.classList.toggle("active");
            homeContent.classList.toggle("active");
        }
    </script>

</body>

</html>
