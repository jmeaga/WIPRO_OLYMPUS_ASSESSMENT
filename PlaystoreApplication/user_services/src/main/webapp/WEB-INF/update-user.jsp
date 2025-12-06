<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f0f4f8;
            padding: 20px;
        }
        .container {
            width: 400px;
            margin: auto;
            background: white;
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }
        input {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            border-radius: 8px;
            border: 1px solid #ccc;
        }
        button {
            width: 100%;
            background: #4CAF50;
            color: white;
            border: none;
            padding: 10px;
            font-size: 16px;
            margin-top: 10px;
            border-radius: 8px;
            cursor: pointer;
        }
        button:hover { background: #45a049; }
    </style>
</head>
<body>

<div class="container">
    <h2>Update Profile</h2>

    <form method="post" action="${pageContext.request.contextPath}/user/update/${user.userId}">
        First Name: <input type="text" name="firstName" value="${user.firstName}" required><br>
        Last Name: <input type="text" name="lastName" value="${user.lastName}" required><br>
        Email: <input type="email" name="email" value="${user.email}" required><br>
        Mobile: <input type="text" name="mobileNo" value="${user.mobileNo}" required><br>
        Address 1: <input type="text" name="address1" value="${user.address1}" required><br>
        Address 2: <input type="text" name="address2" value="${user.address2}"><br>
        City: <input type="text" name="city" value="${user.city}" required><br>
        State: <input type="text" name="state" value="${user.state}" required><br>
        Zip Code: <input type="text" name="zipCode" value="${user.zipCode}" required><br>
        Country: <input type="text" name="country" value="${user.country}" required><br>

        <button type="submit">Update</button>
    </form>
</div>

</body>
</html>
