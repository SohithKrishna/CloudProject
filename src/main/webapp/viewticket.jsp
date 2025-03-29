<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.klef.jfsd.sdp.model.Voter" %>
<%
    Voter voter = (Voter) session.getAttribute("voter");
    if (voter == null) {
        response.sendRedirect("loginfail");
        return;
    }
    long voterId = voter.getVoterId(); // Get voter ID from session
%>
<jsp:include page="voternavbar.jsp" />

<!DOCTYPE html>
<html>
<head>
    <title>Ticket Details</title>
    <style>
        body{
            padding: 0;
            margin: 0;
            width: 100%;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: sans-serif;
            font-size: 12px;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to left, #ffffff, #ffcc80);
        }
        /* Main Ticket Style */
        .ticketContainer{
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .ticket{
            animation: bouncingCard 0.6s ease-out infinite alternate;
            background-color: white;
            color: darkslategray;
            border-radius: 12px;
            width: 350px;
            padding-bottom: 20px;
        }
        .ticketShadow{
            animation: bouncingShadow 0.6s ease-out infinite alternate;
            margin-top: 4px;
            width: 95%;
            height: 12px;
            border-radius: 50%;
            background-color: rgba(0, 0, 0, 0.4);
            filter: blur(12px);
        }
        /* Ticket Content */
        .ticketTitle{
            font-size: 1.5rem;
            font-weight: 700;
            padding: 12px 16px 4px;
            color: #ff9d00;
        }
        hr{
            width: 90%;
            border: 1px solid #efefef;
        }
        .ticketDetail{
            font-size: 1.1rem;
            font-weight: 500;
            padding: 4px 16px;
        }
        .ticketSubDetail{
            display: flex;
            justify-content: space-between;
            font-size: 1rem;
            padding: 12px 16px;
        }
        .ticketSubDetail .code{
            margin-right: 24px;
        }
        /* Ticket Ripper */
        .ticketRip{
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .circleLeft{
            width: 12px;
            height: 24px;
            background-color: #ff9d00;
            border-radius: 0 12px 12px 0;
        }
        .ripLine{
            width: 100%;
            border-top: 3px solid #ff9d00;
            border-top-style: dashed ;
        }
        .circleRight{
            width: 12px;
            height: 24px;
            background-color: #ff9d00;
            border-radius: 12px 0 0 12px;
        }

        /* Ticket Bouncing Animation */
        @keyframes bouncingCard {
            from { transform: translateY(0);}
            to {transform: translateY(-18px);}
        }
        @keyframes bouncingShadow {
            from { transform: translateY(0px);}
            to {transform: translateY(4px);}
        }

        /* Back Link Styling */
        .backLink{
            text-decoration: none;
            font-size: 1.2rem;
            color: #ff9d00;
            padding: 10px 20px;
            background-color: white;
            border-radius: 20px;
            border: 2px solid #ff9d00;
            transition: background-color 0.3s, color 0.3s;
        }
        .backLink:hover{
            background-color: #ff9d00;
            color: white;
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
            <div class="code"><%= voterId %></div> <!-- Display voterId from session -->
            <div class="date"> Dec 7<sup>th</sup> 2024</div>
        </div>
    </div>
    <div class="ticketShadow"></div>

    <a href="voterviewticket" class="backLink">Back to Tickets</a>
</div>

</body>
</html>
