package re.session03.Model;

import javax.validation.constraints.*;

public class Student {

    private Long id;

    @NotBlank(message = "Tên không được để trống")
    private String fullName;

    @NotBlank(message = "Mã SV không được để trống")
    private String studentCode;

    @NotBlank(message = "Khoa không được để trống")
    private String faculty;

    @Min(value = 2000, message = "Năm không hợp lệ")
    @Max(value = 2100, message = "Năm không hợp lệ")
    private int enrollmentYear;

    @DecimalMin(value = "0.0", message = "GPA >= 0")
    @DecimalMax(value = "4.0", message = "GPA <= 4")
    private double gpa;

    @NotBlank(message = "Trạng thái không được để trống")
    private String status;

    public Student() {}

    public Student(Long id, String fullName, String studentCode,
                   String faculty, int enrollmentYear,
                   double gpa, String status) {
        this.id = id;
        this.fullName = fullName;
        this.studentCode = studentCode;
        this.faculty = faculty;
        this.enrollmentYear = enrollmentYear;
        this.gpa = gpa;
        this.status = status;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getStudentCode() {
        return studentCode;
    }

    public void setStudentCode(String studentCode) {
        this.studentCode = studentCode;
    }

    public String getFaculty() {
        return faculty;
    }

    public void setFaculty(String faculty) {
        this.faculty = faculty;
    }

    public int getEnrollmentYear() {
        return enrollmentYear;
    }

    public void setEnrollmentYear(int enrollmentYear) {
        this.enrollmentYear = enrollmentYear;
    }

    public double getGpa() {
        return gpa;
    }

    public void setGpa(double gpa) {
        this.gpa = gpa;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    // getters setters
}
