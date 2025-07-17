package com.demo.hdemo.EModel;

import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "students")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    private String email;
    private String phone;
    private String department;
    private String college;

    @ManyToMany
    @JoinTable(
        name = "user_event",
        joinColumns = @JoinColumn(name = "user_id"),
        inverseJoinColumns = @JoinColumn(name = "event_id")
    )
    private Set<Event> events = new HashSet<>();

    public User() {}

    public User(Long id, String name, String email, String phone, String department, String college) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.department = department;
        this.college = college;
    }

    // --- Getters and Setters ---
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getDepartment() { return department; }
    public void setDepartment(String department) { this.department = department; }

    public String getCollege() { return college; }
    public void setCollege(String college) { this.college = college; }

    public Set<Event> getEvents() { return events; }
    public void setEvents(Set<Event> events) { this.events = events; }

    public void registerEvent(Event event) {
        if (!this.events.contains(event)) {
            this.events.add(event);
            event.getUsers().add(this);
        }
    }
}
