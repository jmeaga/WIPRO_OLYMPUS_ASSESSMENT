<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.jsp.*" %>

<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>User Registration</title>
   <style>
       body {
           font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
           background: linear-gradient(135deg, #fff3f8, #f4fcff); /* lighter pastel gradient */
           display: flex;
           flex-direction: column;
           align-items: center;
           justify-content: center;
           height: 100vh;
           margin: 0;
       }

       .header {
           font-size: 38px;
           font-weight: bold;
           color: #ff9bb3;  /* softer pastel coral */
           margin-bottom: 20px;
           letter-spacing: 1px;
       }

       .container {
           background-color: #ffffff;
           padding: 40px 30px;
           border-radius: 20px;
           box-shadow: 0px 10px 30px rgba(0,0,0,0.1);
           width: 700px;
           transition: transform 0.3s, box-shadow 0.3s;
       }

       .container:hover {
           transform: translateY(-4px);
           box-shadow: 0px 15px 35px rgba(0,0,0,0.12);
       }

       h2 {
           text-align: center;
           color: #9d7bff; /* soft pastel purple */
           margin-bottom: 25px;
       }

       form {
           display: flex;
           flex-wrap: wrap;
           gap: 20px;
       }

       .form-group {
           flex: 1 1 45%;
           display: flex;
           flex-direction: column;
       }

       /* Lightened pastel shades */
       input:nth-child(odd) {
           background-color: #fff0f3; /* extra light pink */
       }
       input:nth-child(even) {
           background-color: #eaf7ff; /* extra light blue */
       }
       select {
           background-color: #fff7eb; /* extra light pastel orange */
       }

       input, select {
           padding: 12px;
           border: 1px solid #ddd;
           border-radius: 12px;
           font-size: 16px;
           transition: all 0.3s ease-in-out;
       }

       input:focus, select:focus {
           border-color: #a5d8ff; /* lighter blue focus */
           box-shadow: 0 0 8px rgba(165, 216, 255, 0.4);
           outline: none;
       }

       button {
           padding: 12px;
           margin-top: 15px;
           width: 100%;
           background: linear-gradient(135deg, #c8f9ff, #b7d8ff); /* lighter pastel blue */
           color: #2d3436;
           border: none;
           font-size: 16px;
           border-radius: 12px;
           cursor: pointer;
           transition: all 0.3s;
           font-weight: bold;
       }

       button:hover {
           background: linear-gradient(135deg, #b7d8ff, #c8f9ff);
           transform: translateY(-2px);
           box-shadow: 0 8px 20px rgba(0,0,0,0.08);
       }

       p {
           text-align: center;
           margin-top: 20px;
           font-size: 14px;
           color: #6d6d6d;
           width: 100%;
       }

       a {
           color: #f7bfb4; /* soft peach pink */
           text-decoration: none;
           font-weight: bold;
       }

       a:hover {
           text-decoration: underline;
           color: #e19b90;
       }

       @media screen and (max-width: 750px) {
           .container {
               width: 90%;
           }
           .form-group {
               flex: 1 1 100%;
           }
       }
   </style>
</head>
<body>

<div class="header">App Store</div>

<div class="container">
    <h2>USER REGISTERATION</h2>

    <form action="${pageContext.request.contextPath}/user/add" method="post">
        <div class="form-group"><input type="text" name="firstName" placeholder="First Name" required></div>
        <div class="form-group"><input type="text" name="lastName" placeholder="Last Name" required></div>
        <div class="form-group"><input type="date" name="dob" required></div>
        <div class="form-group"><input type="date" name="dateOfOpen" required></div>
        <div class="form-group"><input type="text" name="address1" placeholder="Address 1" required></div>
        <div class="form-group"><input type="text" name="address2" placeholder="Address 2"></div>
        <div class="form-group"><input type="text" name="city" placeholder="City" required></div>
        <div class="form-group"><input type="text" name="state" placeholder="State" required></div>
        <div class="form-group"><input type="text" name="zipCode" placeholder="Zip Code" required></div>
        <div class="form-group"><input type="text" name="country" placeholder="Country" required></div>
        <div class="form-group"><input type="text" name="userName" placeholder="Username" required></div>
        <div class="form-group"><input type="password" name="password" placeholder="Password" required></div>
        <div class="form-group"><input type="text" name="mobileNo" placeholder="Mobile No" required></div>
        <div class="form-group"><input type="email" name="email" placeholder="Email" required></div>
        
        <div class="form-group" style="flex: 1 1 100%;">
            <button type="submit">Register</button>
        </div>
    </form>

    <p>Already registered? <a href="${pageContext.request.contextPath}/user/login">Login here</a></p>
</div>

</body>
</html>
