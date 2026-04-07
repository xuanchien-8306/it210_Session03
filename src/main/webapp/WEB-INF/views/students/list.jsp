<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh sách sinh viên</title>

    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: #f4f6f9;
        }

        .container {
            width: 95%;
            margin: 30px auto;
        }

        h2 {
            margin-bottom: 10px;
        }

        .top-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
        }

        .btn {
            text-decoration: none;
            padding: 8px 12px;
            border-radius: 6px;
            background: #007bff;
            color: white;
            font-size: 14px;
            transition: 0.3s;
            border: none;
            cursor: pointer;
        }

        .btn:hover {
            background: #0056b3;
        }

        .sort a {
            margin-right: 10px;
            text-decoration: none;
            color: #007bff;
        }

        .sort a:hover {
            text-decoration: underline;
        }

        .search-box {
            margin-bottom: 15px;
        }

        .search-box input, .search-box select {
            padding: 6px;
            border-radius: 6px;
            border: 1px solid #ccc;
            margin-right: 5px;
        }

        .info {
            margin: 10px 0;
            color: #555;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }

        th {
            background: #007bff;
            color: white;
            padding: 12px;
            text-align: left;
        }

        td {
            padding: 10px;
            border-bottom: 1px solid #eee;
        }

        tr:hover {
            background: #f1f7ff;
        }

        a.name {
            color: #007bff;
            text-decoration: none;
            font-weight: 500;
        }

        a.name:hover {
            text-decoration: underline;
        }

        .badge {
            padding: 5px 10px;
            border-radius: 12px;
            font-size: 12px;
            color: white;
        }

        .danghoc {
            background: #28a745;
        }

        .baoluu {
            background: #f39c12;
        }

        .totnghiep {
            background: #3498db;
        }
    </style>
</head>

<body>

<div class="container">
    <h2>📋 Danh sách sinh viên</h2>

    <div class="top-bar">
        <a class="btn" href="${pageContext.request.contextPath}/students/dashboard">
            📊 Dashboard
        </a>

        <div class="sort">
            <a href="?sortBy=name">Sắp xếp tên</a>
            <a href="?sortBy=gpa">Sắp xếp GPA</a>
        </div>
    </div>

    <!-- 🔍 SEARCH + FILTER -->
    <form method="get" action="${pageContext.request.contextPath}/students" class="search-box">
        <input type="text" name="search" placeholder="Tìm theo tên..."
               value="${param.search}">

        <select name="faculty">
            <option value="">-- Tất cả khoa --</option>
            <option value="CNTT" ${param.faculty == 'CNTT' ? 'selected' : ''}>CNTT</option>
            <option value="Kinh tế" ${param.faculty == 'Kinh tế' ? 'selected' : ''}>Kinh tế</option>
        </select>

        <button class="btn" type="submit">Tìm</button>
    </form>

    <!-- ℹ️ INFO -->
    <p class="info">
        <c:if test="${not empty param.search}">
            Từ khóa: "<b>${param.search}</b>" -
        </c:if>

        <c:if test="${not empty param.faculty}">
            Khoa: "<b>${param.faculty}</b>" -
        </c:if>

        Tìm thấy <b>${count}</b> sinh viên
    </p>

    <table>
        <tr>
            <th>STT</th>
            <th>Mã SV</th>
            <th>Họ tên</th>
            <th>Khoa</th>
            <th>Năm</th>
            <th>GPA</th>
            <th>Trạng thái</th>
        </tr>

        <c:forEach items="${students}" var="s" varStatus="i">
            <tr>
                <td>${i.index + 1}</td>
                <td>${s.studentCode}</td>

                <td>
                    <a class="name"
                       href="${pageContext.request.contextPath}/students/detail?id=${s.id}">
                            ${s.fullName}
                    </a>
                </td>

                <td>${s.faculty}</td>
                <td>${s.enrollmentYear}</td>
                <td><b>${s.gpa}</b></td>

                <td>
                    <c:choose>
                        <c:when test="${s.status == 'Đang học'}">
                            <span class="badge danghoc">${s.status}</span>
                        </c:when>
                        <c:when test="${s.status == 'Bảo lưu'}">
                            <span class="badge baoluu">${s.status}</span>
                        </c:when>
                        <c:otherwise>
                            <span class="badge totnghiep">${s.status}</span>
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>

</body>
</html>
```
