package com.example.demo.service;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;


import com.example.demo.model.User;
import com.example.demo.repo.UserRepository;



@Service
public class UserService {

    @Autowired
    private UserRepository repo;
    
    @Autowired
    private UserAppsService userAppsService;
    @Autowired
    private BCryptPasswordEncoder passwordEncoder;
//    public User register(User user) {
//        return repo.save(user);
//    }

//    public User login(String userName, String password) {
//        return repo.findByUserNameAndPassword(userName, password);
//    }
   
    public List<User> getAllUsers() {
        return repo.findAll();
    }
    public void deleteUser(Integer userId) {
        repo.deleteById(userId);
    }
    public void register(User user) {

        // check if username already exists
        User existing = repo.findByUserName(user.getUserName());

        if (existing != null) {
            throw new RuntimeException("Username already exists");
        }

        // encrypt password
        user.setPassword(passwordEncoder.encode(user.getPassword()));

        repo.save(user);
    }


    // Login check
    public User login(String userName, String rawPassword) {
        User user = repo.findByUserName(userName);

        if (user != null && passwordEncoder.matches(rawPassword, user.getPassword())) {
            return user;
        }
        return null;
    }


}

