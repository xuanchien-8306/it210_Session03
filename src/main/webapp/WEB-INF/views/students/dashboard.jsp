<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>

    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #74ebd5, #ACB6E5);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            background: #fff;
            padding: 30px 40px;
            border-radius: 15px;
            width: 350px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
            text-align: center;
        }

        h2 {
            margin-bottom: 20px;
            color: #333;
        }

        .stat {
            background: #f5f7fa;
            margin: 10px 0;
            padding: 12px;
            border-radius: 10px;
            font-size: 16px;
            display: flex;
            justify-content: space-between;
        }

        .label {
            font-weight: 600;
            color: #555;
        }

        .value {
            color: #007bff;
            font-weight: bold;
        }

        .top {
            background: #ffeaa7;
            color: #d35400;
            font-weight: bold;
        }

        .empty {
            color: #999;
            font-style: italic;
        }

        .back {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            padding: 10px 15px;
            border-radius: 8px;
            background: #007bff;
            color: white;
            transition: 0.3s;
        }

        .back:hover {
            background: #0056b3;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>📊 Dashboard</h2>

    <div class="stat">
        <span class="label">Tổng</span>
        <span class="value">${total}</span>
    </div>

    <div class="stat">
        <span class="label">GPA TB</span>
        <span class="value">${stats.avgGpa}</span>
    </div>

    <c:choose>
        <c:when test="${not empty top}">
            <div class="stat top">
                <span>🏆 Thủ khoa</span>
                <span>${top.fullName}</span>
            </div>
        </c:when>
        <c:otherwise>
            <div class="stat empty">
                Chưa có dữ liệu
            </div>
        </c:otherwise>
    </c:choose>

    <div class="stat">
        <span class="label">Đang học</span>
        <span class="value">${stats.dangHoc}</span>
    </div>

    <div class="stat">
        <span class="label">Bảo lưu</span>
        <span class="value">${stats.baoLuu}</span>
    </div>

    <div class="stat">
        <span class="label">Tốt nghiệp</span>
        <span class="value">${stats.totNghiep}</span>
    </div>

    <a href="/students" class="back">← Quay lại</a>
</div>

</body>
</html>