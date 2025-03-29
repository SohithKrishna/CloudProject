<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View All Politicians</title>
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
            max-width: 1200px;
            margin: 0 auto;
            text-align: center;
        }
        table {
            margin: 20px auto;
            width: 100%;
            border-collapse: collapse;
        }
        thead {
            background: #ff9800;
            color: #fff;
        }
        th, td {
            padding: 1em;
            text-align: left;
            border: 1px solid #ddd;
        }
        tr:hover {
            background-color: #ffecb3;
        }
        .btn-edit {
            background-color: #ffcc00;
            color: white;
            padding: 5px 10px;
            border: none;
            border-radius: 4px;
            text-decoration: none;
            font-size: 0.9em;
            cursor: pointer;
        }
        .btn-edit:hover {
            background-color: #e6b800;
        }
        .btn-delete {
            background-color: #f44336;
            color: white;
            padding: 5px 10px;
            border: none;
            border-radius: 4px;
            font-size: 0.9em;
            cursor: pointer;
        }
        .btn-delete:hover {
            background-color: #d32f2f;
        }
    </style>
</head>
<body>

<jsp:include page="adminnavbar.jsp" />

<div class="container">
    <h1>List of Politicians</h1>
    <c:choose>
        <c:when test="${not empty plist}">
            <table>
                <thead>
                    <tr>
                        <th>Aadhar</th>
                        <th>Number</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Party</th>
                        <th>Constituency</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="politician" items="${plist}">
                        <tr>
                            <td>${politician.politicianAadhar}</td>
                            <td>${politician.politicianNumber}</td>
                            <td>${politician.name}</td>
                            <td>${politician.email}</td>
                            <td>${politician.party}</td>
                            <td>${politician.constituency}</td>
                            <td>
                                <a href="editpolitician?politicianAadhar=${politician.politicianAadhar}" class="btn-edit">Edit</a>
                                <a href="deletepolitician?id=${politician.politicianAadhar}" class="btn-delete" onclick="return confirm('Are you sure?')">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:when>
        <c:otherwise>
            <p>No politicians found.</p>
        </c:otherwise>
    </c:choose>
</div>

</body>
</html>
