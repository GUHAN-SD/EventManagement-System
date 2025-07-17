package com.demo.hdemo.EService;

import com.demo.hdemo.EModel.Event;
import com.demo.hdemo.ERepository.EventRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class EventService {

    @Autowired
    private EventRepo eventRepo;

    public List<Event> findAllEvents() {
        return eventRepo.findAll();
    }

    public Optional<Event> findById(Long id) {
        return eventRepo.findById(id);
    }

    public Event save(Event event) {
        return eventRepo.save(event);
    }

    public void deleteById(Long id) {
        eventRepo.deleteById(id);
    }
}
