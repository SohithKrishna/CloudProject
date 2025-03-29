<%@ page import="com.klef.jfsd.sdp.model.Voter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Voter v = (Voter)session.getAttribute("voter");
if(v == null) {
    response.sendRedirect("sessionfail");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Voter</title>
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

<%@ include file="voternavbar.jsp" %> <!-- Include Voter Navbar -->

<div class="form-container">
    <h3>Update Profile</h3>
    <form method="post" action="voterupdate">
        <table>
            <tr>
                <td><label for="vid">Aadhaar</label></td>
                <td><input type="number" id="vid" name="vid" value="<%=v.getVoterId()%>" readonly required /></td>
            </tr>
            <tr>
                <td><label for="vname">Name</label></td>
                <td><input type="text" id="vname" name="vname" value="<%=v.getName()%>" required /></td>
            </tr>
            <tr>
                <td><label for="vemail">Email</label></td>
                <td><input type="text" id="vemail" name="vemail" value="<%=v.getEmail()%>" readonly required /></td>
            </tr>
            <tr>
                <td><label for="vpassword">Enter Password</label></td>
                <td><input type="text" id="vpassword" value="<%=v.getPassword()%>" name="vpassword" required /></td>
            </tr>
            <tr>
                <td><label for="vaddress">Enter Address</label></td>
                <td><input type="text" id="vaddress" name="vaddress" value="<%=v.getAddress()%>" required /></td>
            </tr>
            <tr>
                <td><label for="vphone">Enter Phone</label></td>
                <td><input type="text" id="vphone" name="vphone" value="<%=v.getPhoneNumber()%>" required /></td>
            </tr>
            <tr>
                <td><label for="vconstituency">Enter Constituency</label></td>
                <td><input type="text" id="vconstituency" name="vconstituency" value="<%=v.getConstituency()%>" required /></td>
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
