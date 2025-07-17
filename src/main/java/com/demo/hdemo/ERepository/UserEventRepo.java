package com.demo.hdemo.ERepository;


import com.demo.hdemo.EModel.UserEvent;

import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface UserEventRepo extends JpaRepository<UserEvent, Long> {
    List<UserEvent> findByUserId(Long userId);
    boolean existsByUserIdAndEventId(Long userId, Long eventId);
}
