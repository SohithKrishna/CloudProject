<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.klef.jfsd.sdp.model.Voter" %>

<%
    Voter voter = (Voter) session.getAttribute("voter");
    if (voter == null) {
        response.sendRedirect("loginfail");
        return;
    }
%>

<jsp:include page="voternavbar.jsp"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Raise a Ticket</title>
    <link href="https://fonts.googleapis.com/css?family=Sniglet|Raleway:900" rel="stylesheet">
    <style>
        body, html {
            height: 100%;
            padding: 0;
            margin: 0;
            font-family: 'Sniglet', cursive;
            background-color: #98d4f3;
        }

        header {
            height: 160px;
            background: url('http://www.geertjanhendriks.nl/codepen/form/golf.png') repeat-x bottom;
        }

        h1 {
            font-weight: normal;
            font-size: 4em;
            font-family: 'Raleway', sans-serif;
            margin: 0 auto;
            margin-top: 30px;
            width: 500px;
            color: #F90;
            text-align: center;
        }

        #form {
            height: 100%;
            overflow: hidden;
            position: relative;
        }

        .fish {
            background-image: url('http://www.geertjanhendriks.nl/codepen/form/fish.png');
            width: 235px;
            height: 104px;
            margin-left: -235px;
            position: absolute;
            animation: swim 24s infinite linear;
        }

        #fish {
            top: 120px;
        }

        #fish2 {
            top: 260px;
            animation-delay: 12s;
        }

        @keyframes swim {
            0% {margin-left: -235px;}
            70% {margin-left: 100%;}
            100% {margin-left: 100%;}
        }

        form {
            margin: 0 auto;
            width: 500px;
            padding-top: 40px;
            color: white;
            position: relative;
        }

        input, textarea {
            width: 100%;
            border: none;
            border-radius: 20px;
            outline: none;
            padding: 10px;
            font-family: 'Sniglet', cursive;
            font-size: 1em;
            color: #676767;
            border: solid 3px #98d4f3;
            transition: border 0.5s;
            box-sizing: border-box;
        }

        input:focus, textarea:focus {
            border: solid 3px yellow;
        }

        textarea {
            height: 100px;
            resize: none;
            overflow: auto;
        }

        input[type="submit"] {
            background-color: #F90;
            color: white;
            height: 50px;
            cursor: pointer;
            margin-top: 30px;
            font-size: 1.29em;
            font-family: 'Sniglet', cursive;
            transition: background-color 0.5s;
        }

        input[type="submit"]:hover {
            background-color: #e58f0e;
        }
    </style>
</head>
<body>
    <header>
        <h1>Raise a Ticket</h1>
    </header>
    <div id="form">
        <div class="fish" id="fish"></div>
        <div class="fish" id="fish2"></div>
        <form id="waterform" action="raiseticket" method="post">
            <div class="formgroup">
                <label for="title">Ticket Title*</label>
                <input type="text" id="title" name="title" placeholder="Enter ticket title" required>
            </div>
            <div class="formgroup">
                <label for="description">Description*</label>
                <textarea id="description" name="description" placeholder="Enter ticket description" required></textarea>
            </div>
            <input type="submit" value="Raise Ticket">
        </form>
    </div>
</body>
</html>
