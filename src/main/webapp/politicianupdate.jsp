<%@ page import="com.klef.jfsd.sdp.model.Politician"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Politician p = (Politician) session.getAttribute("politician");
if (p == null) {
    response.sendRedirect("sessionfail");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Politician</title>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:600,700" rel="stylesheet">
    <style>
        * {
            font-family: 'Open Sans', sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            background: linear-gradient(to left, #ffffff, #ffcc80);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .form-container {
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 600px;
        }

        h3 {
            text-align: center;
            color: #ff9800;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            margin-top: 20px;
        }

        table td {
            padding: 10px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        input[type="text"], input[type="password"], input[type="number"] {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .button-container {
            text-align: center;
            margin-top: 20px;
        }

        input[type="submit"], input[type="reset"] {
            padding: 10px 20px;
            font-size: 14px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            color: white;
        }

        input[type="submit"] {
            background-color: #ff9800;
        }

        input[type="reset"] {
            background-color: #dc3545;
        }

        input[type="submit"]:hover, input[type="reset"]:hover {
            opacity: 0.9;
        }

        .footer-link {
            text-align: center;
            margin-top: 20px;
        }

        .footer-link a {
            color: #ff9800;
            font-weight: bold;
            text-decoration: none;
        }

        .footer-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<%@ include file="politiciannavbar.jsp" %> <!-- Include Politician Navbar -->

<div class="form-container">
    <h3>Update Politician</h3>
    <form method="post" action="politicianupdate">
        <table>
            <tr>
                <td><label for="pid">Aadhaar Number</label></td>
                <td><input type="number" id="pid" name="pid" value="<%=p.getPoliticianAadhar()%>" readonly required /></td>
            </tr>
            <tr>
                <td><label for="pnum">Enter Number</label></td>
                <td><input type="number" id="pnum" name="pnum" value="<%=p.getPoliticianNumber()%>" required /></td>
            </tr>
            <tr>
                <td><label for="name">Enter Name</label></td>
                <td><input type="text" id="name" name="name" value="<%=p.getName()%>" required /></td>
            </tr>
            <tr>
                <td><label for="password">Enter Password</label></td>
                <td><input type="password" id="password" name="password" value="<%=p.getPassword()%>" required /></td>
            </tr>
            <tr>
                <td><label for="party">Enter Party</label></td>
                <td><input type="text" id="party" name="party" value="<%=p.getParty()%>" required /></td>
            </tr>
            <tr>
                <td><label for="constituency">Enter Constituency</label></td>
                <td><input type="text" id="constituency" name="constituency" value="<%=p.getConstituency()%>" required /></td>
            </tr>
            <tr>
                <td colspan="2" class="button-container">
                    <input type="submit" value="Update" />
                </td>
            </tr>
        </table>
    </form>
</div>

</body>
</html>
