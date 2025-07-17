package com.demo.hdemo.Econtroller;

import com.demo.hdemo.EModel.Event;
import com.demo.hdemo.EModel.User;
import com.demo.hdemo.ERepository.EventRepo;
import com.demo.hdemo.ERepository.UserRepos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;
import java.util.Optional;

@Controller
public class EController {

    @Autowired
    private EventRepo eventRepo;

    @Autowired
    private UserRepos userRepo;

    // Home
    @GetMapping("/")
    public String home() {
        return "index";
    }

    // Admin Dashboard
    @GetMapping("/admin")
    public String adminDashboard(Model model) {
        List<Event> eventList = eventRepo.findAll();
        String[] bgClasses = {"bg1", "bg2", "bg3", "bg4", "bg5", "bg6"};
        for (int i = 0; i < eventList.size(); i++) {
            eventList.get(i).setBgClass(bgClasses[i % bgClasses.length]);
        }
        model.addAttribute("eventList", eventList);
        return "admin";
    }

    // Add Event
    @PostMapping("/admin/add")
    public String addEvent(@ModelAttribute Event event) {
        eventRepo.save(event);
        return "redirect:/admin";
    }

    // Update Event
    @PostMapping("/admin/update")
    public String updateEvent(@ModelAttribute Event event) {
        eventRepo.save(event);
        return "redirect:/admin";
    }

    // Delete Event
    @PostMapping("/admin/delete")
    public String deleteEvent(@RequestParam Long id) {
        eventRepo.deleteById(id);
        return "redirect:/admin";
    }

    // View Registered Users
    @GetMapping("/admin/registered")
    public String viewRegisteredUsers(@RequestParam("eventId") Long eventId, Model model) {
        Optional<Event> eventOpt = eventRepo.findById(eventId);
        if (eventOpt.isPresent()) {
            Event event = eventOpt.get();
            List<User> registeredUsers = userRepo.findAll().stream()
                    .filter(user -> user.getEvents().contains(event))
                    .toList();
            model.addAttribute("event", event);
            model.addAttribute("registeredUsers", registeredUsers);
            return "viewdetails";
        } else {
            model.addAttribute("message", "Event not found!");
            return "error";
        }
    }

    // Show Registration Form
 

    // Register User for Event
    @PostMapping("/register")
    public String saveOrUpdateUser(@ModelAttribute("user") User user,
                                   @RequestParam(value = "eventId", required = false) Long eventId,
                                   RedirectAttributes redirectAttributes) {
        if (eventId != null) {
            Event event = eventRepo.findById(eventId).orElse(null);
            if (event != null && !user.getEvents().contains(event)) {
                user.getEvents().add(event);
            }
        }
        userRepo.save(user);
        redirectAttributes.addAttribute("userId", user.getId());
        return "redirect:/userview";
    }

    // View Registered Users (direct call)
    @GetMapping("/viewdetails")
    public String showUsers(@RequestParam("eventId") Long eventId, Model model) {
        Optional<Event> eventOpt = eventRepo.findById(eventId);
        if (eventOpt.isPresent()) {
            Event event = eventOpt.get();
            List<User> users = userRepo.findAll().stream()
                    .filter(u -> u.getEvents().contains(event))
                    .toList();
            model.addAttribute("userList", users);
            model.addAttribute("event", event);
            return "viewdetails";
        }
        return "redirect:/admin";
    }

    // Delete User (optional feature)
    @PostMapping("/deleteUser")
    public String deleteUser(@RequestParam("id") Long id) {
        userRepo.deleteById(id);
        return "redirect:/admin";
    }

    // User View Page
    @GetMapping("/userview")
    public String userView(@RequestParam(value = "userId", required = false) Long userId, Model model) {
        List<Event> eventList = eventRepo.findAll();
        String[] bgClasses = {"bg1", "bg2", "bg3", "bg4", "bg5", "bg6"};
        for (int i = 0; i < eventList.size(); i++) {
            eventList.get(i).setBgClass(bgClasses[i % bgClasses.length]);
        }
        model.addAttribute("eventList", eventList);

        if (userId != null) {
            User user = userRepo.findById(userId).orElse(null);
            List<Long> registeredEventIds = (user != null)
                    ? user.getEvents().stream().map(Event::getId).toList()
                    : List.of();
            model.addAttribute("userId", userId);
            model.addAttribute("registeredEventIds", registeredEventIds);
        } else {
            model.addAttribute("registeredEventIds", List.of());
        }

        return "userview";
    }
    
    @GetMapping("/register")
    public String showRegisterForm(@RequestParam("eventId") Long eventId, Model model) {
        model.addAttribute("eventId", eventId);
        return "register";
    }

}
