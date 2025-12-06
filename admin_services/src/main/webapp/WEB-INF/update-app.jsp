<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Update App</title>

  
    <style>
        body {
            font-family: "Segoe UI", Arial, sans-serif;
            background: linear-gradient(135deg, #1f1c2c, #928dab);
            margin: 0;
            padding-top: 60px;
            display: flex;
            justify-content: center;
            color: #ffffff;
        }

        .container {
            width: 450px;
            background: rgba(0, 0, 0, 0.85);
            padding: 30px 40px;
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.5);
        }

        h2 {
            text-align: center;
            color: #ff6ec7;
            margin-bottom: 25px;
            font-weight: 600;
            letter-spacing: 1px;
        }

        label {
            display: block;
            margin-top: 12px;
            margin-bottom: 5px;
            font-size: 14px;
            color: #dddddd;
        }

        input {
            width: 100%;
            padding: 10px;
            border: 1px solid #555;
            border-radius: 8px;
            font-size: 14px;
            background: #1f1c2c;
            color: #fff;
            box-sizing: border-box;
            transition: 0.3s;
        }

        input:focus {
            border-color: #ff6ec7;
            box-shadow: 0 0 8px rgba(255, 110, 199, 0.6);
            outline: none;
        }

        button {
            width: 100%;
            padding: 12px;
            margin-top: 20px;
            background: #ff6ec7;
            color: #fff;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 500;
            transition: 0.3s;
        }

        button:hover {
            background: #ff3fb5;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255, 62, 181, 0.4);
        }

        .back {
            display: block;
            text-align: center;
            margin-top: 18px;
            color: #ff6ec7;
            text-decoration: none;
            font-weight: bold;
            transition: 0.3s;
        }

        .back:hover {
            color: #ff3fb5;
            text-decoration: underline;
        }
    </style>

</head>

<body>

<div class="container">

    <h2>Update App</h2>

    <form action="${pageContext.request.contextPath}/admin/update-app" method="post">

        <input type="hidden" name="appId" value="${app.appId}">

        <label>App Name:</label>
        <input type="text" name="appName" value="${app.appName}" required>

        <label>Genre:</label>
        <input type="text" name="genre" value="${app.genre}" required>

        <label>Version:</label>
        <input type="text" name="version" value="${app.version}" required>

        <label>Description:</label>
        <input type="text" name="description" value="${app.description}" required>

        <label>Release Date:</label>
        <input type="date" name="releaseDate" value="${app.releaseDate}" required>

        <label>Rating:</label>
        <input type="number" name="rating" step="0.1" min="0" max="5"
               value="${app.rating}" required>

        <button type="submit">Update</button>
    </form>

    <a class="back" href="${pageContext.request.contextPath}/admin/dashboard">Back to Dashboard</a>

</div>

</body>
</html>
