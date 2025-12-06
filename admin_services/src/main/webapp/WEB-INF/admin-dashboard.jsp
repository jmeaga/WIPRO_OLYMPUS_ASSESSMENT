<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>

    <style>
        /* Body and Overall Theme */
        body {
            font-family: "Segoe UI", Arial, sans-serif;
            background: linear-gradient(145deg, #2c3e50, #4ca1af);
            color: #fff;
            margin: 0;
            padding: 30px 20px;
        }

        /* Welcome Admin Text */
     #welcomeAdmin {
    font-size: 34px;
    font-weight: 300;
    color: #fffacd; /* light cream */
    text-align: left;
    margin-bottom: 20px;
    padding: 10px 20px;
    border-left: 6px solid #ff6ec7;
    border-radius: 4px;
    background-color: rgba(255, 255, 255, 0.05);
    font-family: 'Segoe UI', Arial, sans-serif;
}

        /* Top Navigation Buttons */
        .top-btn {
            padding: 10px 18px;
            margin-right: 10px;
            background: #ff6ec7;
            color: white;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 500;
            transition: 0.3s;
        }

        .top-btn:hover {
            background: #ff3fb5;
            box-shadow: 0 4px 12px rgba(255, 62, 181, 0.5);
        }

        /* Stats Cards */
        .stats-container {
            display: flex;
            gap: 20px;
            margin-bottom: 25px;
            justify-content: center;
        }

        .stat-card {
            flex: 1;
            max-width: 200px;
            background: linear-gradient(135deg, #ffafbd, #ffc3a0);
            padding: 14px;
            border-radius: 12px;
            text-align: center;
            color: #333;
            font-weight: bold;
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.3);
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .stat-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.4);
        }

        .stat-card h3 {
            margin: 0;
            font-size: 28px;
        }

        .stat-card p {
            margin: 5px 0 0;
            font-size: 14px;
        }

        /* Search Input */
        #searchContainer {
            text-align: center;
            margin-bottom: 20px;
        }

        #searchInput {
            padding: 10px 15px;
            width: 100%;
            max-width: 400px;
            border-radius: 25px;
            border: none;
            font-size: 16px;
            outline: none;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
            transition: 0.3s;
        }

        #searchInput:focus {
            box-shadow: 0 4px 12px rgba(255, 222, 89, 0.4);
        }

        /* Table Styling */
        table {
            width: 100%;
            border-collapse: collapse;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.4);
            background: rgba(0, 0, 0, 0.65);
        }

        th, td {
            padding: 12px 15px;
            text-align: center;
            color: #fff;
        }

        th {
            background: rgba(255, 110, 199, 0.85);
            font-weight: bold;
        }

        tr:nth-child(even) td {
            background: rgba(255, 255, 255, 0.1);
        }

        tr:hover td {
            background: rgba(255, 222, 89, 0.15);
        }

        /* Action Buttons in Table */
        td div.action-btns {
            display: flex;
            justify-content: center;
            gap: 10px;
        }

        a.action-btn {
            padding: 6px 12px;
            background-color: #28a745;
            color: #fff;
            text-decoration: none;
            border-radius: 6px;
            font-weight: bold;
            transition: 0.3s;
        }

        a.action-btn:hover {
            background-color: #218838;
            transform: translateY(-2px);
        }

        a.delete-btn {
            background-color: #dc3545;
        }

        a.delete-btn:hover {
            background-color: #b71c1c;
            transform: translateY(-2px);
        }
          #allAppsHeader {
        font-size: 24px;       /* Bigger text */
        color: #ffde59;        /* Bright gold/yellow color */
        font-weight: 700;      /* Bold */
        margin-bottom: 15px;
        text-shadow: 1px 1px 3px rgba(0,0,0,0.4); /* Optional subtle shadow */
    }
    </style>

    <script>
        function filterApps() {
            let input = document.getElementById("searchInput").value.toLowerCase();
            let table = document.querySelector("table");
            let rows = table.getElementsByTagName("tr");

            for (let i = 1; i < rows.length; i++) {
                let nameColumn = rows[i].getElementsByTagName("td")[1];

                if (nameColumn) {
                    let nameText = nameColumn.innerText.toLowerCase();
                    rows[i].style.display = nameText.includes(input) ? "" : "none";
                }
            }
        }
    </script>

</head>

<body>

    <!-- Welcome Admin -->
    <div id="welcomeAdmin">Welcome Admin, ${sessionScope.adminName}</div>

    <!-- Top Buttons -->
    <div style="text-align: right; margin-bottom: 20px;">
        <a class="top-btn" href="${pageContext.request.contextPath}/admin/add-app">Add New App</a>
        <a class="top-btn" href="${pageContext.request.contextPath}/admin/users">View Users</a>
        <a class="top-btn" href="${pageContext.request.contextPath}/admin/logout">Logout</a>
    </div>

    <hr>

    <!-- Stats -->
    <div class="stats-container">
        <div class="stat-card">
            <h3>${totalApps}</h3>
            <p>TOTAL APPS</p>
        </div>
        <div class="stat-card">
            <h3>${totalUsers}</h3>
            <p>TOTAL USERS</p>
        </div>
        <div class="stat-card">
            <h3>${totalDownloads}</h3>
            <p>TOTAL DOWNLOADS</p>
        </div>
    </div>

    <hr>

    <!-- Search -->
    <h3 id="allAppsHeader">ALL APPS</h3>
    <div id="searchContainer">
        <input type="text" id="searchInput" placeholder="Search apps..." onkeyup="filterApps()">
    </div>

    <!-- Apps Table -->
    <table>
        <tr>
            <th>App ID</th>
            <th>Name</th>
            <th>Description</th>
            <th>Genre</th>
            <th>Version</th>
            <th>Rating</th>
            <th>ReleaseDate</th>
            <th>Downloads</th>
            <th>Actions</th>
        </tr>

        <c:forEach var="app" items="${allApps}">
            <tr>
                <td>${app.appId}</td>
                <td>${app.appName}</td>
                <td>${app.description}</td>
                <td>${app.genre}</td>
                <td>${app.version}</td>
                <td>${app.rating}</td>
                <td>${app.releaseDate}</td>
                <td>${app.downloadCount}</td>
                <td>
                    <div class="action-btns">
                        <a class="action-btn"
                            href="${pageContext.request.contextPath}/admin/update-app/${app.appId}">Update</a>
                        <a class="action-btn delete-btn"
                            href="${pageContext.request.contextPath}/admin/delete-app/${app.appId}">Delete</a>
                    </div>
                </td>
            </tr>
        </c:forEach>
    </table>

</body>
</html>
