package com.example.demo.repo;



import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.model.User;


public interface UserRepository extends JpaRepository<User, Integer> {
	 User findByUserName(String username);
    User findByUserNameAndPassword(String userName, String password);
}

