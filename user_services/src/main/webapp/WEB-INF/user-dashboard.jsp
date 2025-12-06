<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Dashboard</title>

<style>
    body { 
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; 
        margin: 20px; 
        background-color: #F5E9FF;
    }
    h2, h3 { color: #2f3640; }

    button { 
        padding: 10px 20px; margin: 5px 5px 15px 0; border: none; 
        border-radius: 5px; cursor: pointer; background-color: #ff6ec7;
        color: white; transition: 0.3s; font-weight: bold;
    }
    button:hover { background-color: #ff99aa; }

    .danger { background-color: #e84118; }
    .danger:hover { background-color: #c23616; }

    table { border-collapse: collapse; width: 100%; margin-top: 10px; }
    th, td { border: 1px solid #ddd; padding: 10px; text-align: left; }
    th { background-color: #dcdde1; }

    .section { margin-bottom: 30px; }
    #profileSection, #downloadsSection { display: none; }

    /* ================= SEARCH BOX ================= */
    #searchContainer {
        text-align: center;
        margin-bottom: 20px;
    }
    #searchInput {
        padding: 10px 15px; 
        width: 100%; max-width: 400px; 
        border-radius: 25px; border: 1px solid #ccc;
        font-size: 16px; outline: none;
        box-shadow: 0 2px 6px rgba(0,0,0,0.1);
        transition: 0.3s;
    }
    #searchInput:focus {
        border-color: #4CAF50;
        box-shadow: 0 4px 12px rgba(76, 175, 80, 0.3);
    }

    /* ================= CARD STYLES ================= */
    .cards-container {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
        gap: 20px;
    }

    .app-card {
        background: #fff;
        border-radius: 15px;
        padding: 20px;
        box-shadow: 0 4px 12px rgba(0,0,0,0.08);
        position: relative;
        transition: transform 0.3s, box-shadow 0.3s;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
    }
    /* Pastel card colors */
    .app-card:nth-child(3n+1) { background: #fff3e0; }
    .app-card:nth-child(3n+2) { background: #e0f7fa; }
    .app-card:nth-child(3n+3) { background: #f3e5f5; }

    .app-card:hover { 
        transform: translateY(-5px); 
        box-shadow: 0 12px 25px rgba(0,0,0,0.15); 
    }

    .app-title {
        font-size: 20px;
        font-weight: bold;
        color: #2f3640;
        margin-bottom: 15px;
        text-align: center;
    }

    .btn-row {
        display: flex;
        justify-content: space-between;
        margin-top: auto;
    }

    .info-btn { 
        background-color: #3498db; 
        color: white; 
        border-radius: 8px; 
        padding: 8px 12px; 
        font-size: 14px;
    }
    .info-btn:hover { background-color: #2980b9; }

    .download-btn { 
        background-color: #2ecc71; 
        color: white; 
        border-radius: 8px; 
        padding: 8px 12px; 
        font-size: 14px;
    }
    .download-btn:hover { background-color: #27ae60; }

    /* ================= POPUP ================= */
    .info-popup {
        display: none;
        position: absolute;
        top: -5px;
        left: 50%;
        transform: translateX(-50%) translateY(-100%);
        width: 260px;
        background: #ffffff;
        border-radius: 12px;
        border: 1px solid #ccc;
        padding: 12px;
        font-size: 14px;
        z-index: 10;
        box-shadow: 0 8px 20px rgba(0,0,0,0.2);
    }

    .close-popup {
        position: absolute;
        top: 2px;
        right: 6px;
        border: none;
        background: none;
        font-weight: bold;
        cursor: pointer;
        color: #c0392b;
        font-size: 16px;
    }
    .close-popup:hover { color: #e74c3c; }

    /* ================= WELCOME USER ================= */
    #welcomeUser {
        font-size: 34px;
        font-weight: 700;
        color: #333;
        text-align: left;
        margin-bottom: 20px;
        padding: 10px 20px;
        border-left: 6px solid #ff6ec7;
        border-radius: 4px;
        background-color: rgba(255, 255, 255, 0.3);
    }

    #buttonContainer {
        display: flex;
        justify-content: flex-end;
        margin-bottom: 5px;
        gap: 15px;
    }
</style>

<script>
function toggleProfile() {
    var profile = document.getElementById('profileSection');
    var downloads = document.getElementById('downloadsSection');
    var otherSections = document.getElementsByClassName('otherSection');
    if (profile.style.display === "none" || profile.style.display === "") {
        profile.style.display = "block"; 
        downloads.style.display = "none"; 
        for (let sec of otherSections) sec.style.display = "none"; 
    } else {
        profile.style.display = "none"; 
        for (let sec of otherSections) sec.style.display = "block"; 
    }
}

function toggleDownloads() {
    var downloads = document.getElementById('downloadsSection');
    var profile = document.getElementById('profileSection');
    var otherSections = document.getElementsByClassName('otherSection');
    if (downloads.style.display === "none" || downloads.style.display === "") {
        downloads.style.display = "block"; 
        profile.style.display = "none"; 
        for (let sec of otherSections) sec.style.display = "none"; 
    } else {
        downloads.style.display = "none"; 
        for (let sec of otherSections) sec.style.display = "block"; 
    }
}

function downloadApp(userId, appId) {
    fetch('${pageContext.request.contextPath}/user/apps/download/' + userId + '/' + appId, { method: 'POST' })
    .then(resp => resp.json())
    .then(data => { alert('App downloaded successfully!'); location.reload(); })
    .catch(err => console.error(err));
}

function deleteAccount(userId) {
    if (confirm("Are you sure you want to delete your account? This action cannot be undone!")) {
        fetch('${pageContext.request.contextPath}/user/delete/' + userId, { method: 'POST' })
        .then(resp => resp.text())
        .then(msg => { alert("Your account has been deleted."); window.location.href = "${pageContext.request.contextPath}/user/login"; })
        .catch(err => console.error(err));
    }
}

function toggleInfo(appId) {
    var popup = document.getElementById('info-' + appId);
    var allPopups = document.getElementsByClassName('info-popup');
    for (let p of allPopups) {
        if (p.id !== popup.id) p.style.display = 'none';
    }
    popup.style.display = (popup.style.display === 'block') ? 'none' : 'block';
}

function closeInfo(appId) {
    document.getElementById('info-' + appId).style.display = 'none';
}

function filterApps() {
    var input = document.getElementById('searchInput').value.toLowerCase();
    var cards = document.getElementById('cardsContainer').getElementsByClassName('app-card');
    for (let card of cards) {
        var title = card.getElementsByClassName('app-title')[0].innerText.toLowerCase();
        card.style.display = title.includes(input) ? "flex" : "none";
    }
}
</script>

</head>
<body>

<h2 id="welcomeUser">Welcome, ${user.firstName}👋</h2>

<div id="buttonContainer">
    <button type="button" onclick="toggleProfile()">My Profile</button>
    <button type="button" onclick="toggleDownloads()">My Downloads</button>
    <button type="button" onclick="window.location.href='${pageContext.request.contextPath}/user/logout'">Logout</button>
</div>

<div class="section" id="profileSection">
    <h3>My Profile</h3>
    <table>
        <tr><th>First Name</th><td>${user.firstName}</td></tr>
        <tr><th>Last Name</th><td>${user.lastName}</td></tr>
        <tr><th>DOB</th><td>${user.dob}</td></tr>
        <tr><th>Email</th><td>${user.email}</td></tr>
        <tr><th>Mobile</th><td>${user.mobileNo}</td></tr>
        <tr><th>Address</th><td>${user.address1}, ${user.address2}, ${user.city}, ${user.state}, ${user.zipCode}, ${user.country}</td></tr>
    </table>
    <form action="${pageContext.request.contextPath}/user/delete/${user.userId}" 
          method="post" 
          onsubmit="return confirm('Are you sure you want to delete your account? This action cannot be undone!');">
        <button type="submit" class="danger">Delete My Account</button>
    </form>
</div>
<hr>

<div class="section otherSection" style="display:block;">
    <h3>ALL AVAILABLE APPS</h3>

    <div id="searchContainer">
        <input type="text" id="searchInput" placeholder="Search apps..." onkeyup="filterApps()">
    </div>

    <div class="cards-container" id="cardsContainer">
        <c:forEach var="app" items="${allApps}">
            <div class="app-card">
                <div class="app-title">${app.appName}📱</div>

                <div class="btn-row">
                    <button class="info-btn" type="button" onclick="toggleInfo(${app.appId})">Info</button>
                    <button class="download-btn" type="button" onclick="downloadApp(${user.userId}, ${app.appId})">⬇️Download</button>
                </div>

                <!-- Popup details -->
                <div class="info-popup" id="info-${app.appId}">
                    <button class="close-popup" type="button" onclick="closeInfo(${app.appId})">&times;</button>
                    <p><b>ID:</b> ${app.appId}</p>
                    <p><b>Genre:</b> ${app.genre}</p>
                    <p><b>Version:</b> ${app.version}</p>
                    <p><b>Description:</b> ${app.description}</p>

                    <!-- Stars below description with numeric rating -->
                    <p>
                        <b>Rating:</b> 
                        <span id="stars-${app.appId}" style="color:#f1c40f; font-size:16px;"></span>
                        (<span id="ratingValue-${app.appId}" style="font-size:14px; color:#555;"></span>)
                    </p>

                    <p><b>Release:</b> ${app.releaseDate}</p>
                </div>

                <!-- Render stars and numeric value -->
                <script>
                    (function() {
                        let rating = ${app.rating};
                        let fullStars = Math.floor(rating);
                        let halfStar = (rating % 1 >= 0.5) ? 1 : 0;
                        let emptyStars = 5 - fullStars - halfStar;
                        let stars = '';
                        for(let i=0; i<fullStars; i++) stars += '★';
                        if(halfStar) stars += '⯨';
                        for(let i=0; i<emptyStars; i++) stars += '☆';
                        
                        document.getElementById('stars-${app.appId}').innerText = stars;
                        document.getElementById('ratingValue-${app.appId}').innerText = rating.toFixed(1);
                    })();
                </script>
            </div>
        </c:forEach>
    </div>
</div>

<div class="section" id="downloadsSection">
    <h3>My Downloads</h3>
    <table>
        <tr>
            <th>App ID</th>
            <th>App Name</th>
            <th>Download Date</th>
        </tr>
        <c:forEach var="ua" items="${downloads}">
            <tr>
                <td>${ua.appId}</td>
                <td>${ua.appName}</td>
                <td>${ua.downloadDate}</td>
            </tr>
        </c:forEach>
    </table>
</div>

</body>
</html>
