<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>USER LOGIN</title>

    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #ffe6f0, #e0f7fa);
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }

        /* Stylish Header */
        .header {
            font-size: 42px;
            font-weight: 900;
            letter-spacing: 3px;
            background: linear-gradient(90deg, #ff6f91, #6c5ce7);
            -webkit-background-clip: text;
            color: transparent;
            margin-bottom: 30px;
            text-transform: uppercase;
        }

        .highlight {
            background: linear-gradient(90deg, #74b9ff, #81ecec);
            -webkit-background-clip: text;
            color: transparent;
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
            box-shadow: 0 15px 35px rgba(0,0,0,0.15);
        }

        h2 {
            text-align: center;
            color: #6c5ce7;
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
            background-color: #fef6e4;
            font-size: 16px;
        }

        input:focus {
            border-color: #74b9ff;
            box-shadow: 0 0 8px rgba(116, 185, 255, 0.3);
            outline: none;
        }

        button {
            padding: 12px;
            background: linear-gradient(135deg, #81ecec, #74b9ff);
            border: none;
            border-radius: 12px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            transition: 0.3s;
        }

        button:hover {
            background: linear-gradient(135deg, #74b9ff, #81ecec);
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
            transform: translateY(-2px);
        }

        p {
            text-align: center;
            margin-top: 20px;
            font-size: 14px;
            color: #636e72;
        }

        a {
            color: #ff6f91;
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

<div class="header">APP STORE</div>

<div class="login-container">
    <h2>Welcome Back, Login</h2>

    <!-- Show error if exists -->
        <c:if test="${not empty error}">
            <div class="error">${error}</div>
        </c:if>

    <form action="${pageContext.request.contextPath}/user/login" method="post">
        <input type="text" name="userName" placeholder="Username" required>
        <input type="password" name="password" placeholder="Password" required>
        <button type="submit">Login</button>
    </form>

    <p>Don't have an account? <a href="${pageContext.request.contextPath}/user/add">Create here</a></p>
</div>

</body>
</html>
