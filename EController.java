package com.demo.hdemo.Econtroller;

import com.demo.hdemo.EModel.Event;
import com.demo.hdemo.EModel.User;
import com.demo.hdemo.ERepository.EventRepo;
import com.demo.hdemo.ERepository.UserRepos;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class EController {

    @Autowired
    private EventRepo eventRepo;

    @Autowired
    private UserRepos userRepository;

    // ---------- HOME ----------
    @GetMapping("/")
    public String home() {
        return "index";  // index.jsp (homepage with Admin & User options)
    }
    

    @GetMapping("/index")
    public String index() {
        return "index";
    }
  


    // ---------- ADMIN DASHBOARD (with events) ----------
    @GetMapping("/admin")
    public String adminDashboard(Model model) {
        List<Event> eventList = eventRepo.findAll();
        String[] bgClasses = {"bg1", "bg2", "bg3", "bg4", "bg5", "bg6"};

        for (int i = 0; i < eventList.size(); i++) {
            eventList.get(i).setBgClass(bgClasses[i % bgClasses.length]);
        }

        model.addAttribute("eventList", eventList);
        return "admin";  // admin.jsp
    }

    @PostMapping("/admin/add")
    public String addEvent(@ModelAttribute Event event) {
        eventRepo.save(event);
        return "redirect:/admin";
    }

    @PostMapping("/admin/update")
    public String updateEvent(@ModelAttribute Event event) {
        eventRepo.save(event);
        return "redirect:/admin";
    }

    @PostMapping("/admin/delete")
    public String deleteEvent(@RequestParam Long id) {
        eventRepo.deleteById(id);
        return "redirect:/admin";
    }

    // ---------- USER REGISTRATION ----------
    @GetMapping("/user/register")
    public String userRegisterForm(Model model) {
        model.addAttribute("user", new User());
        return "register";  // register.jsp
    }

    @PostMapping("/register")
    public String saveOrUpdateUser(@ModelAttribute("user") User user) {
        userRepository.save(user);
        return "redirect:/viewdetails";
    }

    @GetMapping("/register")
    public String showRegisterForm(@RequestParam(value = "id", required = false) Long id, Model model) {
        User user = (id != null) ? userRepository.findById(id).orElse(new User()) : new User();
        model.addAttribute("user", user);
        return "register";
    }

    // ---------- USER VIEW / SEARCH / DELETE ----------
    @GetMapping("/viewdetails")
    public String showUsers(Model model) {
        model.addAttribute("userList", userRepository.findAll());
        return "viewdetails"; // viewdetails.jsp
    }

    @PostMapping("/deleteUser")
    public String deleteUser(@RequestParam("id") Long id) {
        userRepository.deleteById(id);
        return "redirect:/viewdetails";
    }

    @GetMapping("/searchStudent")
    public String searchStudent(@RequestParam("keyword") String keyword, Model model) {
        List<User> filtered = userRepository.findAll().stream()
                .filter(u -> u.getName() != null && u.getName().toLowerCase().contains(keyword.toLowerCase()))
                .toList();
        model.addAttribute("userList", filtered);
        return "viewdetails";
    }
    
 // ---------- USER VIEW EVENTS ----------
    @GetMapping("/userevent")
    public String userEventPage(Model model) {
        List<Event> events = eventRepo.findAll();
        model.addAttribute("eventList", events);
        return "userevent"; // userevent.jsp
    }


    
    
    
    
    
    
    
    
}
