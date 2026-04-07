<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chi tiết sinh viên</title>

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

        .card {
            background: white;
            padding: 30px 40px;
            border-radius: 15px;
            width: 400px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
        }

        .row {
            display: flex;
            justify-content: space-between;
            padding: 10px 0;
            border-bottom: 1px solid #eee;
        }

        .label {
            font-weight: 600;
            color: #555;
        }

        .value {
            font-weight: 500;
            color: #333;
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

        .back {
            display: block;
            margin-top: 20px;
            text-align: center;
            text-decoration: none;
            padding: 10px;
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

<div class="card">
    <h2>👤 Chi tiết sinh viên</h2>

    <div class="row">
        <span class="label">Tên</span>
        <span class="value">${student.fullName}</span>
    </div>

    <div class="row">
        <span class="label">Mã SV</span>
        <span class="value">${student.studentCode}</span>
    </div>

    <div class="row">
        <span class="label">Khoa</span>
        <span class="value">${student.faculty}</span>
    </div>

    <div class="row">
        <span class="label">Năm</span>
        <span class="value">${student.enrollmentYear}</span>
    </div>

    <div class="row">
        <span class="label">GPA</span>
        <span class="value"><b>${student.gpa}</b></span>
    </div>

    <div class="row">
        <span class="label">Trạng thái</span>
        <span class="value">
            <c:choose>
                <c:when test="${student.status == 'Đang học'}">
                    <span class="badge danghoc">${student.status}</span>
                </c:when>
                <c:when test="${student.status == 'Bảo lưu'}">
                    <span class="badge baoluu">${student.status}</span>
                </c:when>
                <c:otherwise>
                    <span class="badge totnghiep">${student.status}</span>
                </c:otherwise>
            </c:choose>
        </span>
    </div>

    <a href="/students" class="back">← Quay lại</a>
</div>

</body>
</html>