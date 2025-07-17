package com.demo.hdemo.EService;

import com.demo.hdemo.EModel.Event;
import com.demo.hdemo.EModel.User;
import com.demo.hdemo.ERepository.UserRepos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class UserService {

    @Autowired
    private UserRepos userRepo;

    public User save(User user) {
        return userRepo.save(user);
    }

    public Optional<User> findById(Long id) {
        return userRepo.findById(id);
    }

    public Optional<User> findByEmail(String email) {
        return userRepo.findByEmail(email);
    }

    public List<User> findAll() {
        return userRepo.findAll();
    }

    
    public void deleteById(Long id) {
        userRepo.deleteById(id);
    }

    public List<User> getUsersByEvent(Event event) {
        // Option 1: If you have a custom query in UserRepos
        return userRepo.findByEventsContaining(event);

        // Option 2 (fallback if no custom query):
        // return userRepo.findAll().stream()
        //         .filter(user -> user.getEvents().contains(event))
        //         .toList();
    }
    
}
