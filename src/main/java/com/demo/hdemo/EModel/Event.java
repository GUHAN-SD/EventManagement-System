package com.demo.hdemo.EModel;

import jakarta.persistence.*;

@Entity
@Table(name = "events")  // changed from "students"
public class Event {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String title;
    private String date;
    private String time;
    private String place;
    

    // --- Getters and Setters ---

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }
    
    @Transient
    private String bgClass;

    public String getBgClass() {
        return bgClass;
    }

    public void setBgClass(String bgClass) {
        this.bgClass = bgClass;
    }

}
