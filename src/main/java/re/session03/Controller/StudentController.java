package re.session03.Controller;

import re.session03.Model.Student;
import re.session03.Service.StudentService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/students")
public class StudentController {

    private final StudentService service;

    public StudentController(StudentService service) {
        this.service = service;
    }

    @GetMapping
    public String list(
            @RequestParam(required = false) String sortBy,
            @RequestParam(required = false) String search,
            @RequestParam(required = false) String faculty,
            Model model) {

        List<Student> list = service.getAll(sortBy, search, faculty);

        model.addAttribute("students", list);
        model.addAttribute("count", list.size());

        return "students/list";
    }

    @GetMapping("/detail")
    public String detail(@RequestParam Long id, Model model) {
        model.addAttribute("student", service.getById(id));
        return "students/detail";
    }

    @GetMapping("/dashboard")
    public String dashboard(Model model) {
        model.addAttribute("stats", service.getStats());
        model.addAttribute("total", service.getTotalStudents());
        model.addAttribute("top", service.getTopStudent());
        return "students/dashboard";
    }
}