package com.demo.hdemo.Econtroller;

import com.demo.hdemo.EModel.Event;
import com.demo.hdemo.EModel.User;
import com.demo.hdemo.EService.EventService;
import com.demo.hdemo.EService.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.*;

@Controller
public class EController {

    @Autowired
    private EventService eventService;

    @Autowired
    private UserService userService;

    // ---------- HOME ----------
    @GetMapping("/")
    public String home() {
        return "index";
    }

    // ---------- ADMIN ----------
    @GetMapping("/admin")
    public String adminDashboard(Model model) {
        List<Event> eventList = eventService.findAllEvents();
        String[] bgClasses = {"bg1", "bg2", "bg3", "bg4", "bg5", "bg6"};
        for (int i = 0; i < eventList.size(); i++) {
            eventList.get(i).setBgClass(bgClasses[i % bgClasses.length]);
        }

        model.addAttribute("eventList", eventList);
        model.addAttribute("event", new Event());
        return "admin";
    }

    @PostMapping("/admin/add")
    public String addEvent(@ModelAttribute Event event) {
        eventService.save(event);
        return "redirect:/admin";
    }

    @PostMapping("/admin/update")
    public String updateEvent(@ModelAttribute Event event) {
        eventService.save(event);
        return "redirect:/admin";
    }

    @PostMapping("/admin/delete")
    public String deleteEvent(@RequestParam Long id) {
        eventService.deleteById(id);
        return "redirect:/admin";
    }

    @GetMapping("/admin/registered")
    public String viewRegisteredUsers(@RequestParam("eventId") Long eventId, Model model) {
        Optional<Event> eventOpt = eventService.findById(eventId);
        if (eventOpt.isPresent()) {
            Event event = eventOpt.get();
            List<User> registeredUsers = userService.getUsersByEvent(event);
            model.addAttribute("event", event);
            model.addAttribute("users", registeredUsers);
            return "viewdetails";
        } else {
            model.addAttribute("message", "Event not found!");
            return "error";
        }
    }

    // ---------- USER ----------
    @GetMapping("/userview")
    public String userView(@RequestParam(value = "userId", required = false) Long userId, Model model) {
        List<Event> eventList = eventService.findAllEvents();
        String[] bgClasses = {"bg1", "bg2", "bg3", "bg4", "bg5", "bg6"};

        for (int i = 0; i < eventList.size(); i++) {
            eventList.get(i).setBgClass(bgClasses[i % bgClasses.length]);
        }

        model.addAttribute("eventList", eventList);

        if (userId != null) {
            Optional<User> userOpt = userService.findById(userId);
            if (userOpt.isPresent()) {
                User user = userOpt.get();
                List<Long> registeredEventIds = user.getEvents().stream().map(Event::getId).toList();
                model.addAttribute("userId", userId);
                model.addAttribute("registeredEventIds", registeredEventIds);
            } else {
                model.addAttribute("registeredEventIds", Collections.emptyList());
            }
        } else {
            model.addAttribute("registeredEventIds", Collections.emptyList());
        }

        return "userview";
    }

    // ---------- REGISTRATION ----------
    @GetMapping("/register")
    public String showRegisterForm(@RequestParam("eventId") Long eventId,
                                   @RequestParam(value = "userId", required = false) Long userId,
                                   Model model) {
        User user = (userId != null) ? userService.findById(userId).orElse(new User()) : new User();
        model.addAttribute("user", user);
        model.addAttribute("eventId", eventId);
        model.addAttribute("userId", userId);
        return "register";
    }

    @PostMapping("/register")
    public String registerUser(@ModelAttribute("user") User userForm,
                               @RequestParam("eventId") Long eventId,
                               @RequestParam(value = "userId", required = false) Long userId,
                               RedirectAttributes redirectAttributes) {

        Optional<Event> eventOpt = eventService.findById(eventId);
        if (eventOpt.isEmpty()) {
            return "redirect:/error";
        }

        Event event = eventOpt.get();
        User user;

        if (userId != null) {
            user = userService.findById(userId).orElse(new User());
        } else {
            user = userService.findByEmail(userForm.getEmail()).orElse(new User());
        }

        // Set/update fields
        user.setName(userForm.getName());
        user.setEmail(userForm.getEmail());
        user.setPhone(userForm.getPhone());
        user.setDepartment(userForm.getDepartment());
        user.setCollege(userForm.getCollege());

        if (!user.getEvents().contains(event)) {
            user.registerEvent(event);
        }

        userService.save(user);

        redirectAttributes.addAttribute("userId", user.getId());
        redirectAttributes.addAttribute("eventId", eventId);
        return "redirect:/viewdetails";
    }

    @GetMapping("/viewdetails")
    public String viewDetails(@RequestParam Long eventId,
                              @RequestParam Long userId,
                              Model model) {
        Event event = eventService.findById(eventId).orElse(null);
        User user = userService.findById(userId).orElse(null);

        if (event == null || user == null) {
            model.addAttribute("message", "Invalid user or event");
            return "error";
        }

        model.addAttribute("event", event);
        model.addAttribute("user", user);
        return "viewdetails";
    }

    @PostMapping("/deleteUser")
    public String deleteUser(@RequestParam("id") Long id) {
        userService.deleteById(id);
        return "redirect:/admin";
    }
}
