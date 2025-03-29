<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.klef.jfsd.sdp.model.Ticket" %>
<%@ page import="com.klef.jfsd.sdp.model.Politician" %>
<%
    Politician politician = (Politician) session.getAttribute("politician");
    if (politician == null) {
        response.sendRedirect("loginfail");
        return;
    }
    long politicianId = politician.getPoliticianAadhar(); // Get politician ID from session
%>

<jsp:include page="politiciannavbar.jsp" />

<!DOCTYPE html>
<html>
<head>
    <title>Ticket Details</title>
    <style>
        body {
            padding: 0;
            margin: 0;
            width: 100%;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to left, #ffffff, #ffcc80);
        }
        .ticketContainer {
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 100%;
            max-width: 450px;
        }
        .ticket {
            animation: bouncingCard 0.6s ease-out infinite alternate;
            background-color: white;
            color: darkslategray;
            border-radius: 12px;
            width: 100%;
            padding-bottom: 20px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        }
        .ticketShadow {
            animation: bouncingShadow 0.6s ease-out infinite alternate;
            margin-top: 4px;
            width: 95%;
            height: 12px;
            border-radius: 50%;
            background-color: rgba(0, 0, 0, 0.4);
            filter: blur(12px);
        }
        .ticketTitle {
            font-size: 1.5rem;
            font-weight: 700;
            padding: 12px 16px 4px;
            color: #ff9d00;
        }
        hr {
            width: 90%;
            border: 1px solid #efefef;
        }
        .ticketDetail {
            font-size: 1.1rem;
            font-weight: 500;
            padding: 4px 16px;
        }
        .ticketSubDetail {
            display: flex;
            justify-content: space-between;
            font-size: 1rem;
            padding: 12px 16px;
        }
        .ticketRip {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .circleLeft {
            width: 12px;
            height: 24px;
            background-color: #ff9d00;
            border-radius: 0 12px 12px 0;
        }
        .ripLine {
            width: 100%;
            border-top: 3px solid #ff9d00;
            border-top-style: dashed;
        }
        .circleRight {
            width: 12px;
            height: 24px;
            background-color: #ff9d00;
            border-radius: 12px 0 0 12px;
        }
        @keyframes bouncingCard {
            from { transform: translateY(0); }
            to { transform: translateY(-18px); }
        }
        @keyframes bouncingShadow {
            from { transform: translateY(0px); }
            to { transform: translateY(4px); }
        }
        .backLink {
            text-decoration: none;
            font-size: 1.2rem;
            color: #ff9d00;
            padding: 10px 20px;
            background-color: white;
            border-radius: 20px;
            border: 2px solid #ff9d00;
            transition: background-color 0.3s, color 0.3s;
            margin-top: 20px;
        }
        .backLink:hover {
            background-color: #ff9d00;
            color: white;
        }

        .formContainer {
            width: 100%;
            max-width: 350px;
            padding: 16px;
            display: flex;
            flex-direction: column;
            gap: 16px;
        }

        textarea {
            width: 100%;
            padding: 8px;
            font-size: 1rem;
            border: 1px solid #ccc;
            border-radius: 8px;
            resize: vertical;
            min-height: 100px;
        }

        .formButton {
            background-color: #ff9d00;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .formButton:hover {
            background-color: #e68900;
        }
    </style>
</head>
<body>

<div class="ticketContainer">
    <div class="ticket">
        <div class="ticketTitle">Ticket Details</div>
        <hr>
        <div class="ticketDetail">
            <div><strong>Ticket ID:</strong> <c:out value="${ticket.requestId}"/></div>
            <div><strong>Title:</strong> <c:out value="${ticket.title}"/></div>
            <div><strong>Description:</strong> <c:out value="${ticket.description}"/></div>
            <div><strong>Comment by Politician:</strong> <c:out value="${ticket.comment}"/></div>
            <div><strong>Status:</strong> <c:out value="${ticket.status}"/></div>
        </div>
        <div class="ticketRip">
            <div class="circleLeft"></div>
            <div class="ripLine"></div>
            <div class="circleRight"></div>
        </div>
        <div class="ticketSubDetail">
            <div class="code"><%= politicianId %></div> <!-- Display politicianId from session -->
            <div class="date"> Dec 7<sup>th</sup> 2024</div>
        </div>
    </div>
    <div class="ticketShadow"></div>

    <a href="viewpoliticiantickets" class="backLink">Back to Tickets</a>
</div>

<!-- Comment, Close, Open Forms -->
<c:if test="${not empty ticket and ticket.status ne 'Closed'}">
    <div class="formContainer">
        <form action="addcomment" method="post">
            <input type="hidden" name="requestId" value="${ticket.requestId}" />
            <textarea name="comment" placeholder="Add a comment..."></textarea>
            <button type="submit" class="formButton">Add Comment</button>
        </form>

        <form action="closeticket" method="post">
            <input type="hidden" name="requestId" value="${ticket.requestId}" />
            <button type="submit" class="formButton">Close Ticket</button>
        </form>
    </div>
</c:if>

<c:if test="${ticket.status eq 'Closed'}">
    <div class="formContainer">
        <form action="openticket" method="post">
            <input type="hidden" name="requestId" value="${ticket.requestId}" />
            <button type="submit" class="formButton">Reopen Ticket</button>
        </form>
    </div>
</c:if>

<c:if test="${empty ticket}">
    <p>Ticket not found.</p>
</c:if>

</body>
</html>
