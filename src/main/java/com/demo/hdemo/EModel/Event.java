package com.demo.hdemo.EModel;

import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Entity
public class Event {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String title;
    private String date;
    private String time;
    private String place;
    private String bgClass;
    private String description;

    @ManyToMany(mappedBy = "events", cascade = CascadeType.ALL)
    private Set<User> users = new HashSet<>(); 


    // --- Getters and Setters ---
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getDate() { return date; }
    public void setDate(String date) { this.date = date; }

    public String getTime() { return time; }
    public void setTime(String time) { this.time = time; }

    public String getPlace() { return place; }
    public void setPlace(String place) { this.place = place; }

    public String getBgClass() { return bgClass; }
    public void setBgClass(String bgClass) { this.bgClass = bgClass; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public Set<User> getUsers() { return users; }
    public void setUsers(Set<User> users) { this.users = users; }
    
    public void addUser(User user) {
        this.users.add(user);
        user.getEvents().add(this);
    }
}
