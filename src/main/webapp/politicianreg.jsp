<%@page import="com.klef.jfsd.sdp.model.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    Admin admin = (Admin) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect("sessionfail.jsp");
        return;
    }
%>
    <jsp:include page="adminnavbar.jsp" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Politician Signup</title>
    <link rel="stylesheet" href="css/signup.css">
</head>
<body>

    <section class="form-section">
        <div class="form-wrapper">
            <form action="insertpolitician" method="POST">
                <div class="input-block">
                    <label for="politician-aadhar">Aadhar Number</label>
                    <input type="number" id="politician-aadhar" name="politicianAadhar" placeholder="Enter your Aadhar number" 
                           pattern="\d{12}" title="Aadhar number must be 12 digits" required>
                </div>

                <div class="input-block">
                    <label for="politician-number">Politician Number</label>
                    <input type="text" id="politician-number" name="politicianNumber" placeholder="Enter your politician phone number" required>
                </div>
                
                <div class="input-block">
                    <label for="politician-name">Name</label>
                    <input type="text" id="politician-name" name="politicianName" placeholder="Enter your name" required>
                </div>
                
                <div class="input-block">
                    <label for="politician-email">Email</label>
                    <input type="email" id="politician-email" name="politicianEmail" placeholder="Enter your email" required>
                </div>
                
                <div class="input-block">
                    <label for="politician-password">Password</label>
                    <input type="password" id="politician-password" name="politicianPassword" placeholder="Enter your password" required>
                </div>
                
                <div class="input-block">
                    <label for="politician-party">Party</label>
                    <input type="text" id="politician-party" name="politicianParty" placeholder="Enter your party" required>
                </div>
                
                <div class="input-block">
                    <label for="politician-constituency">Constituency</label>
                    <select id="politician-constituency" name="politicianConstituency" required>
                        <option value="">Select your constituency</option>
                        <option value="Ananthapur">Ananthapur</option>
                        <option value="Chittoor">Chittoor</option>
                        <option value="East Godavari">East Godavari</option>
                        <option value="Guntur">Guntur</option>
                        <option value="Krishna">Krishna</option>
                        <option value="Kurnool">Kurnool</option>
                        <option value="Nellore">Nellore</option>
                        <option value="Prakasam">Prakasam</option>
                        <option value="Srikakulam">Srikakulam</option>
                        <option value="Visakhapatnam">Visakhapatnam</option>
                        <option value="Vizianagaram">Vizianagaram</option>
                        <option value="West Godavari">West Godavari</option>
                        <option value="YSR Kadapa">YSR Kadapa</option>
                    </select>
                </div>

                <button class="btn-login" type="submit">Sign Up</button>
            </form>
        </div>
    </section>
    
</body>
</html>
