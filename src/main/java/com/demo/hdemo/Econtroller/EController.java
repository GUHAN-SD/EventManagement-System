package com.demo.hdemo.Econtroller;

import com.demo.hdemo.EModel.Event;
import com.demo.hdemo.EModel.User;
<<<<<<< HEAD
import com.demo.hdemo.EService.EventService;
import com.demo.hdemo.EService.UserService;
=======
import com.demo.hdemo.ERepository.EventRepo;
import com.demo.hdemo.ERepository.UserRepos;
>>>>>>> 95fba36c798bdc48cef0d2b4941b5114f6134d2d

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
<<<<<<< HEAD
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.*;
=======

import java.util.List;
>>>>>>> 95fba36c798bdc48cef0d2b4941b5114f6134d2d

@Controller
public class EController {

    @Autowired
<<<<<<< HEAD
    private EventService eventService;

    @Autowired
    private UserService userService;
=======
    private EventRepo eventRepo;

    @Autowired
    private UserRepos userRepository;
>>>>>>> 95fba36c798bdc48cef0d2b4941b5114f6134d2d

    // ---------- HOME ----------
    @GetMapping("/")
    public String home() {
<<<<<<< HEAD
        return "index";
    }

    // ---------- ADMIN ----------
    @GetMapping("/admin")
    public String adminDashboard(Model model) {
        List<Event> eventList = eventService.findAllEvents();
        String[] bgClasses = {"bg1", "bg2", "bg3", "bg4", "bg5", "bg6"};
=======
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

>>>>>>> 95fba36c798bdc48cef0d2b4941b5114f6134d2d
        for (int i = 0; i < eventList.size(); i++) {
            eventList.get(i).setBgClass(bgClasses[i % bgClasses.length]);
        }

        model.addAttribute("eventList", eventList);
<<<<<<< HEAD
        model.addAttribute("event", new Event());
        return "admin";
=======
        return "admin";  // admin.jsp
>>>>>>> 95fba36c798bdc48cef0d2b4941b5114f6134d2d
    }

    @PostMapping("/admin/add")
    public String addEvent(@ModelAttribute Event event) {
<<<<<<< HEAD
        eventService.save(event);
=======
        eventRepo.save(event);
>>>>>>> 95fba36c798bdc48cef0d2b4941b5114f6134d2d
        return "redirect:/admin";
    }

    @PostMapping("/admin/update")
    public String updateEvent(@ModelAttribute Event event) {
<<<<<<< HEAD
        eventService.save(event);
=======
        eventRepo.save(event);
>>>>>>> 95fba36c798bdc48cef0d2b4941b5114f6134d2d
        return "redirect:/admin";
    }

    @PostMapping("/admin/delete")
    public String deleteEvent(@RequestParam Long id) {
<<<<<<< HEAD
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
=======
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
>>>>>>> 95fba36c798bdc48cef0d2b4941b5114f6134d2d
    }

    @PostMapping("/deleteUser")
    public String deleteUser(@RequestParam("id") Long id) {
<<<<<<< HEAD
        userService.deleteById(id);
        return "redirect:/admin";
    }
=======
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


    
    
    
    
    
    
    
    
>>>>>>> 95fba36c798bdc48cef0d2b4941b5114f6134d2d
}
