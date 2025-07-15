package com.demo.hdemo.ERepository;

import org.springframework.data.jpa.repository.JpaRepository;
//import org.springframework.data.jpa.repository.JpaRepository;
//import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.demo.hdemo.EModel.User;

@Repository
public interface UserRepos extends JpaRepository<User, Long> {
}