<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.klef.jfsd.sdp.model.Voter" %>
<%
    Voter voter = (Voter) session.getAttribute("voter");
    if (voter == null) {
        response.sendRedirect("loginfail");
        return;
    }
    long voterId = voter.getVoterId();
%>
<jsp:include page="voternavbar.jsp"/>

<!DOCTYPE html>
<html>
<head>
    <title>Tickets Raised by You</title>
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
        .rwd-table {
            margin: 20px auto;
            min-width: 300px;
            max-width: 100%;
            border-collapse: collapse;
        }
        .rwd-table tr:first-child {
            background: #ff9800;
            color: #fff;
        }
        .rwd-table tr {
            background-color: #fff;
            border: 1px solid #ddd;
        }
        .rwd-table tr:hover {
            background-color: #ffecb3;
        }
        .rwd-table th, .rwd-table td {
            padding: 1em;
            text-align: left;
        }
       .btn-view {
        background-color: #ffcc00; /* Golden Yellow */
        color: white;
        padding: 5px 10px;
        border: none;
       border-radius: 4px;
       cursor: pointer;
       text-decoration: none;
       font-size: 0.9em;
}
.btn-view:hover {
    background-color: #e6b800; /* Slightly darker golden yellow on hover */
}

        .btn-delete {
            background-color: #f44336;
            color: white;
            padding: 5px 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 0.9em;
        }
        .btn-delete:hover {
            background-color: #d32f2f;
        }
       .raise-ticket-link {
        display: inline-block;
        margin: 20px auto;
        padding: 10px 20px;
        background-color: #ff9800;
        color: white;
        text-decoration: none;
        border-radius: 5px;
        font-size: 1em;
        text-align: center;
        transition: transform 0.3s ease, background-color 0.3s ease;
    }
    .raise-ticket-link:hover {
        background-color: #e67e22;
        transform: scale(1.1);
    }
    </style>
</head>
<body>
<h1>Tickets Raised by <%= voter.getName() %></h1>


<div class="container">
    <c:choose>
        <c:when test="${not empty tickets}">
            <table class="rwd-table">
                <thead>
                    <tr>
                        <th>Ticket ID</th>
                        <th>Title</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                
                    <c:forEach var="ticket" items="${tickets}">
                        <tr>
                            <td data-th="Ticket ID"><c:out value="${ticket.requestId}"/></td>
                            <td data-th="Title"><c:out value="${ticket.title}"/></td>
                            <td data-th="Status"><c:out value="${ticket.status}"/></td>
                            <td data-th="Actions">
                        <a href="viewticket?requestId=${ticket.requestId}" class="btn-view">View</a>
                                <form action="deleteticket" method="post" style="display:inline;">
                                    <input type="hidden" name="requestId" value="${ticket.requestId}">
                                    <button type="submit" class="btn-delete">Delete</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            
        </c:when>
        <c:otherwise>
            <p>No tickets raised by you.</p>
        </c:otherwise>
        
    </c:choose>
</div>

<div style="text-align: center; margin: 20px;">
    <a href="voterticket" class="raise-ticket-link">Raise a New Ticket</a>
</div>


</body>
</html>
