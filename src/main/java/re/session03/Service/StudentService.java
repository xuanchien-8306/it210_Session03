package re.session03.Service;

import re.session03.Model.Student;
import re.session03.Repository.StudentRepository;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

@Service
public class StudentService {

    private final StudentRepository repo;

    public StudentService(StudentRepository repo) {
        this.repo = repo;
    }

    private String getLastName(String fullName) {
        if (fullName == null || fullName.trim().isEmpty()) return "";

        String[] parts = fullName.trim().split("\\s+");
        return parts[parts.length - 1];
    }

    // UC-01 + UC-03
    public List<Student> getAll(String sortBy, String search, String faculty) {

        List<Student> list = new ArrayList<>(repo.findAll());

        // SEARCH
        if (search != null && !search.isEmpty()) {
            list = list.stream()
                    .filter(s -> s.getFullName().toLowerCase().contains(search.toLowerCase()))
                    .collect(Collectors.toList());
        }

        // FILTER
        if (faculty != null && !faculty.isEmpty()) {
            list = list.stream()
                    .filter(s -> s.getFaculty().equalsIgnoreCase(faculty))
                    .collect(Collectors.toList());
        }

        // SORT
        if ("name".equals(sortBy)) {
            list.sort(Comparator.comparing(s -> getLastName(s.getFullName())));
        }

        if ("gpa".equals(sortBy)) {
            list.sort(Comparator.comparing(Student::getGpa).reversed());
        }

        return list;
    }

    // UC-02
    public Student getById(Long id) {
        return repo.findById(id);
    }

    // UC-04
    public Map<String, Double> getStats() {
        List<Student> list = repo.findAll();

        Map<String, Double> m = new HashMap<>();

        double total = list.size();

        if (total == 0) {
            m.put("dangHoc", 0.0);
            m.put("baoLuu", 0.0);
            m.put("totNghiep", 0.0);
            m.put("avgGpa", 0.0);
            return m;
        }

        double dangHoc = list.stream()
                .filter(s -> s.getStatus().equals("Đang học"))
                .count() * 100.0 / total;

        double baoLuu = list.stream()
                .filter(s -> s.getStatus().equals("Bảo lưu"))
                .count() * 100.0 / total;

        double totNghiep = list.stream()
                .filter(s -> s.getStatus().equals("Tốt nghiệp"))
                .count() * 100.0 / total;

        double avg = list.stream()
                .mapToDouble(Student::getGpa)
                .average()
                .orElse(0);

        m.put("dangHoc", dangHoc);
        m.put("baoLuu", baoLuu);
        m.put("totNghiep", totNghiep);
        m.put("avgGpa", avg);

        return m;
    }
    public int getTotalStudents() {
        return repo.findAll().size();
    }
    public Student getTopStudent() {
        return repo.findAll().stream()
                .max(Comparator.comparing(Student::getGpa))
                .orElse(null);
    }
}
