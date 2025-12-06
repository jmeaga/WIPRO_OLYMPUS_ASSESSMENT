<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>ADMIN REGISTERATION</title>

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
            margin-bottom: 20px;
        }

        .container {
            background-color: #ffffff;
            padding: 40px 30px;
            border-radius: 20px;
            box-shadow: 0px 10px 30px rgba(0,0,0,0.1);
            width: 420px;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .container:hover {
            transform: translateY(-5px);
            box-shadow: 0px 15px 35px rgba(0,0,0,0.15);
        }

        h2 {
            text-align: center;
            color: #6c5ce7; /* pastel purple */
            margin-bottom: 25px;
        }

        input {
            padding: 12px;
            margin: 10px 0 18px 0;
            width: 100%;
            border: 1px solid #ddd;
            border-radius: 12px;
            font-size: 16px;
            background-color: #fef6e4; /* pastel yellow */
            transition: all 0.3s ease-in-out;
        }

        input:focus {
            border-color: #74b9ff;
            box-shadow: 0 0 8px rgba(116, 185, 255, 0.3);
            outline: none;
        }

        button {
            width: 100%;
            padding: 12px;
            background: linear-gradient(135deg, #81ecec, #74b9ff);
            color: #2d3436;
            border: none;
            border-radius: 12px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s;
            margin-top: 10px;
        }

        button:hover {
            background: linear-gradient(135deg, #74b9ff, #81ecec);
            transform: translateY(-2px);
            box-shadow: 0px 8px 20px rgba(0,0,0,0.1);
        }

        .message {
            color: green;
            text-align: center;
            font-size: 14px;
            margin-top: 10px;
        }

        p {
            text-align: center;
            margin-top: 15px;
            color: #636e72;
            font-size: 14px;
        }

        a {
            color: #fab1a0;
            text-decoration: none;
            font-weight: bold;
        }

        a:hover {
            color: #e17055;
            text-decoration: underline;
        }
    </style>
</head>

<body>

    <!-- Header -->
    <div class="header">APP STORE</div>

    <div class="container">
        <h2>ADMIN REGISTERATION</h2>

        <form action="${pageContext.request.contextPath}/admin/add" method="post">

            <input type="text" name="adminName" placeholder="Admin Name" required>
            <input type="text" name="userName" placeholder="Username" required>
            <input type="password" name="password" placeholder="Password" required>
            <input type="text" name="email" placeholder="Email" required>
            <input type="text" name="mobileNo" placeholder="Mobile Number" required>

            <button type="submit">Register</button>
        </form>

        <p class="message">${message}</p>

        <p>Already registered?
            <a href="${pageContext.request.contextPath}/admin/login">Login here</a>
        </p>
    </div>

</body>

</html>
