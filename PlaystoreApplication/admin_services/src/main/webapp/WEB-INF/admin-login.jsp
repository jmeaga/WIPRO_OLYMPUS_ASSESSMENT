<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>ADMIN LOGIN</title>

    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #ffe6f0, #e0f7fa); /* pastel gradient */
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }

        /* Header */
        .header {
            font-size: 36px;
            font-weight: bold;
            color: #ff6f91; /* pastel coral */
            margin-bottom: 30px;
            letter-spacing: 1px;
        }

        .login-container {
            background-color: #ffffff;
            padding: 50px 40px;
            border-radius: 20px;
            box-shadow: 0px 10px 30px rgba(0,0,0,0.1);
            width: 380px;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .login-container:hover {
            transform: translateY(-5px);
            box-shadow: 0px 15px 35px rgba(0,0,0,0.15);
        }

        h2 {
            text-align: center;
            color: #6c5ce7; /* pastel purple */
            margin-bottom: 25px;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        input[type="text"], 
        input[type="password"] {
            padding: 12px;
            margin: 10px 0 20px 0;
            border: 1px solid #ddd;
            border-radius: 12px;
            font-size: 16px;
            background-color: #fef6e4; /* pastel yellow */
            transition: all 0.3s ease-in-out;
        }

        input[type="text"]:focus, 
        input[type="password"]:focus {
            border-color: #74b9ff; 
            box-shadow: 0 0 8px rgba(116, 185, 255, 0.3);
            outline: none;
        }

        button {
            padding: 12px;
            background: linear-gradient(135deg, #81ecec, #74b9ff); /* pastel blue */
            color: #2d3436;
            border: none;
            font-size: 16px;
            border-radius: 12px;
            cursor: pointer;
            transition: all 0.3s;
            font-weight: bold;
        }

        button:hover {
            background: linear-gradient(135deg, #74b9ff, #81ecec);
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
        }

        p {
            text-align: center;
            margin-top: 20px;
            font-size: 14px;
            color: #636e72;
        }

        a {
            color: #fab1a0;
            text-decoration: none;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
            color: #e17055;
        }

        .error {
            color: #e74c3c;
            text-align: center;
            margin-bottom: 15px;
            font-weight: bold;
        }
    </style>

</head>

<body>

    <!-- Header -->
    <div class="header">APP STORE</div>

    <div class="login-container">
        <h2>Admin Login</h2>

        <!-- Show error if exists -->
        <c:if test="${not empty error}">
            <div class="error">${error}</div>
        </c:if>

        <form action="${pageContext.request.contextPath}/admin/login" method="post">
            <input type="text" name="userName" placeholder="Username" required>
            <input type="password" name="password" placeholder="Password" required>
            <button type="submit">Login</button>
        </form>

        <p>
            Don't have an account? 
            <a href="${pageContext.request.contextPath}/admin/add">Register here</a>
        </p>
    </div>

</body>

</html>
