package com.demo.hdemo.ERepository;

<<<<<<< HEAD
import com.demo.hdemo.EModel.User;
import com.demo.hdemo.EModel.Event;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface UserRepos extends JpaRepository<User, Long> {
    Optional<User> findByEmail(String email);
    List<User> findByEventsContaining(Event event);
}
=======
import org.springframework.data.jpa.repository.JpaRepository;
//import org.springframework.data.jpa.repository.JpaRepository;
//import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.demo.hdemo.EModel.User;

@Repository
public interface UserRepos extends JpaRepository<User, Long> {
}
>>>>>>> 95fba36c798bdc48cef0d2b4941b5114f6134d2d
