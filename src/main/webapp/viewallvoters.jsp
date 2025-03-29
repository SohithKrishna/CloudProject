<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View All Voters</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        body {
            margin: 0px;
        }
        table {
            margin-top: 20px;
            width: 100%;
        }
        .table-header {
            background-color: #343a40;
            color: white;
        }
    </style>
</head>
<body>

    <!-- Include the admin navbar -->
 <jsp:include page="adminnavbar.jsp" /> 

    <div class="container">
        <h1 class="text-center mb-4">List of Voters</h1>
        
        <!-- Politician Table -->
        <table class="table table-striped table-bordered">
            <thead class="table-header">
                <tr>
                    <th>Voter ID</th>
                    <th>Voter Name</th>
                    <th>Voter Email</th>
                    <th>Voter Address</th>
                    <th>Voter Contact</th>
                    <th>Voter Constituency</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="voter" items="${vlist}">
                    <tr>
                        <td>${voter.voterId}</td>
                        <td>${voter.name}</td>
                        <td>${voter.email}</td>
                        <td>${voter.address}</td>
                        <td>${voter.phoneNumber}</td>
                        <td>${voter.constituency}</td>
                        <td>
                            <a href="deletepolitician?id=${voter.voterId}" 
                               class="btn btn-danger btn-sm" 
                               onclick="return confirm('Are you sure?')">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

</body>
</html>
