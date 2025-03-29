<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Politician</title>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:600,700" rel="stylesheet">
    <style>
        * {
            font-family: 'Open Sans', sans-serif;
        }
        body {
            background: linear-gradient(to left, #ffffff, #ffcc80);
            margin: 0;
            padding: 0;
        }
        h1 {
            text-align: center;
            color: #ff9800;
            margin: 20px 0;
        }
        .container {
            width: 90%;
            max-width: 600px;
            margin: 0 auto;
            text-align: center;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .form-group {
            margin: 15px 0;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        input[type="text"], input[type="email"], input[type="number"] {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        button {
            background-color: #ff9800;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background-color: #e68900;
        }
    </style>
</head>
<body>

<jsp:include page="adminnavbar.jsp" />

<div class="container">
    <h1>Edit Politician</h1>
    <form action="updatepolitician" method="post">
        <input type="hidden" name="politicianAadhar" value="${politician.politicianAadhar}" />
        
        <div class="form-group">
            <label for="name">Name</label>
            <input type="text" id="name" name="name" value="${politician.name}" required />
        </div>
        
        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" id="email" name="email" value="${politician.email}" required />
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input type="text" id="password" name="password" value="${politician.password}" required />
        </div>
        
        <div class="form-group">
            <label for="party">Party</label>
            <input type="text" id="party" name="party" value="${politician.party}" required />
        </div>
        
        <div class="form-group">
            <label for="constituency">Constituency</label>
            <input type="text" id="constituency" name="constituency" value="${politician.constituency}" required />
        </div>

        <div class="form-group">
            <label for="politicianNumber">Politician Number</label>
            <input type="number" id="politicianNumber" name="politicianNumber" value="${politician.politicianNumber}" required />
        </div>

        <button type="submit">Update Politician</button>
    </form>
</div>

</body>
</html>
