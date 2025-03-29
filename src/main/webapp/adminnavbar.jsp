<%@page import="com.klef.jfsd.sdp.model.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    Admin admin = (Admin) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect("sessionfail");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Home</title>

    <!-- Boxicons for icons -->
    <link href="https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css" rel="stylesheet">

    <!-- Custom CSS for the navbar -->
    <link rel="stylesheet" href="css/voternavbar.css">
</head>

<body>
    <!-- Admin Navbar -->
    <div class="side_wrapper">
        <div class="logo_wrapper">
            <div class="logo" id="adminPanel">
                <i class="bx bx-vote"></i> <!-- Admin Icon -->
                <span>Admin Panel</span>
            </div>
            <i class="bx bx-menu" id="btn"></i> <!-- Menu Button -->
        </div>

        <ul class="nav_list">
            <!-- Search Input -->
            <li>
                <i class="bx bx-search"></i>
                <input type="text" placeholder="Search..." />
                <span class="tooltip">Search</span>
            </li>

            <!-- Home Link -->
            <li>
                <a href="adminhome.jsp">
                    <i class="bx bx-home"></i>
                    <span class="link_name">Home</span>
                </a>
                <span class="tooltip">Home</span>
            </li>

            <!-- View All Politicians -->
            <li>
                <a href="viewallpoliticians">
                    <i class="bx bx-user-plus"></i>
                    <span class="link_name">View All politicians</span>
                </a>
                <span class="tooltip">View All Politicians</span>
            </li>

            <!-- Politician Registration -->
            <li>
                <a href="politicianreg.jsp">
                    <i class="bx bx-user-plus"></i>
                    <span class="link_name">Politician Registration</span>
                </a>
                <span class="tooltip">Politician Registration</span>
            </li>

            <!-- Admin Profile -->
            <li>
                <a href="adminprofile.jsp">
                    <i class="bx bxs-user"></i>
                    <span class="link_name">Profile</span>
                </a>
                <span class="tooltip">Profile</span>
            </li>

            <!-- Settings -->
            <li>
                <a href="settings.jsp">
                    <i class="bx bx-cog"></i>
                    <span class="link_name">Settings</span>
                </a>
                <span class="tooltip">Settings</span>
            </li>

            <!-- Logout -->
            <li>
                <a href="adminlogout">
                    <i class="bx bx-log-out"></i>
                    <span class="link_name">Logout</span>
                </a>
                <span class="tooltip">Logout</span>
            </li>
        </ul>
    </div>

    <!-- JavaScript for Sidebar Toggle -->
    <script>
        let adminPanel = document.querySelector("#adminPanel");
        let sidebar = document.querySelector(".side_wrapper");
        let homeContent = document.querySelector(".home_content");
        let toggleBtn = document.querySelector("#btn");

        // Toggle the sidebar when the Admin Panel (icon + text) or Menu Button is clicked
        function toggleSidebar() {
            sidebar.classList.toggle("active");
            homeContent.classList.toggle("active");
        }

        // Add event listeners for both admin panel and menu button
        adminPanel.onclick = toggleSidebar;
        toggleBtn.onclick = toggleSidebar;
    </script>
</body>

</html>
