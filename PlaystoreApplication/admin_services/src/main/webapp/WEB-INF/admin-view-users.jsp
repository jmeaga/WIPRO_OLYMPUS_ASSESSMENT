<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Users</title>

    <style>
        body {
            font-family: "Segoe UI", Arial, sans-serif;
            background: linear-gradient(135deg, #1f1c2c, #928dab);
            color: #fff;
            margin: 0;
            padding: 40px 20px;
        }

        h2 {
            text-align: center;
            color: #ff6ec7;
            font-weight: 600;
            margin-bottom: 20px;
        }

        .btn {
            display: inline-block;
            padding: 10px 18px;
            margin-bottom: 20px;
            background: #ff6ec7;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: 500;
            transition: 0.3s;
        }

        .btn:hover {
            background: #ff3fb5;
            box-shadow: 0 4px 12px rgba(255, 62, 181, 0.4);
        }

        table {
            border-collapse: collapse;
            width: 100%;
            background: rgba(0,0,0,0.8);
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 8px 20px rgba(0,0,0,0.5);
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
        }

        th {
            background: rgba(255, 110, 199, 0.8);
            color: #fff;
        }

        td {
            border-bottom: 1px solid rgba(255,255,255,0.1);
        }

        tr:hover td {
            background: rgba(255, 110, 199, 0.1);
        }

        /* Delete Button Style */
        .delete-btn {
            padding: 6px 12px;
            background-color: #e63946;
            color: white;
            border-radius: 6px;
            text-decoration: none;
            font-weight: bold;
            transition: 0.3s;
        }

        .delete-btn:hover {
            background-color: #b71c1c;
            box-shadow: 0 4px 12px rgba(183, 28, 28, 0.4);
        }
    </style>
</head>

<body>
<center>
<h2>USER DETAILS</h2>
</center>
<hr>

<!-- Back to Dashboard Button -->
<a href="${pageContext.request.contextPath}/admin/dashboard" class="btn">Back to Dashboard</a>

<table>
    <tr>
        <th>ID</th>
        <th>Full Name</th>
        <th>Username</th>
        <th>State</th>
        <th>Mobile</th>
        <th>Email</th>
        <th>Actions</th> <!-- NEW COLUMN -->
    </tr>

    <c:forEach var="u" items="${users}">
        <tr>
            <td>${u.userId}</td>
            <td>${u.firstName} ${u.lastName}</td>
            <td>${u.userName}</td>
            <td>${u.state}</td>
            <td>${u.mobileNo}</td>
            <td>${u.email}</td>

            <!-- DELETE BUTTON -->
            <td>
                <a href="${pageContext.request.contextPath}/admin/delete-user/${u.userId}" 
                   class="delete-btn" 
                   onclick="return confirm('Are you sure you want to delete this user?');">
                   Delete
                </a>
            </td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
