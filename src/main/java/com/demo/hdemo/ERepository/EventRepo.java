package com.demo.hdemo.ERepository;



import org.springframework.data.jpa.repository.JpaRepository;

import com.demo.hdemo.EModel.Event;

public interface EventRepo extends JpaRepository<Event, Long> {
}
