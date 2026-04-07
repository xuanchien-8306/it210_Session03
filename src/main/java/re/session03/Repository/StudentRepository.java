package re.session03.Repository;

import re.session03.Model.Student;
import org.springframework.stereotype.Repository;

import java.util.*;

@Repository
public class StudentRepository {

    private final List<Student> students = new ArrayList<>();

    public StudentRepository() {
        students.add(new Student(1L, "Nguyen Van C", "SV001", "CNTT", 2022, 3.6, "Đang học"));
        students.add(new Student(2L, "Tran Thi A", "SV002", "CNTT", 2021, 3.9, "Tốt nghiệp"));
        students.add(new Student(3L, "Le Van B", "SV003", "Kinh tế", 2020, 2.8, "Bảo lưu"));
    }

    public List<Student> findAll() {
        return students;
    }

    public Student findById(Long id) {
        return students.stream()
                .filter(s -> s.getId().equals(id))
                .findFirst()
                .orElse(null);
    }
}
