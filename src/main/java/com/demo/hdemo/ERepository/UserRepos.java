package com.demo.hdemo.ERepository;

import com.demo.hdemo.EModel.User;
import com.demo.hdemo.EModel.Event;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface UserRepos extends JpaRepository<User, Long> {
    Optional<User> findByEmail(String email);
    List<User> findByEventsContaining(Event event);
}
