package com.example.demo.service;



import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.example.demo.model.User;
import com.example.demo.model.UserApps;
import com.example.demo.repo.UserAppsRepository;
import com.example.demo.repo.UserRepository;



@Service
public class UserAppsService {

    @Autowired
    private UserAppsRepository repo;
    @Autowired
    private UserRepository userRepository;
   
    
    public UserApps downloadApp(Integer userId, Integer appId) {
        UserApps ua = new UserApps();
        ua.setUserId(userId);
        ua.setAppId(appId);
        ua.setDownloadDate(LocalDate.now().toString());
        return repo.save(ua);
    }

    public java.util.List<UserApps> userDownloads(Integer userId) {
        return repo.findByUserId(userId);
    }
    public User findUserByUsername(String username) {
        return userRepository.findByUserName(username); // assumes your UserRepository has this method
    }
    
public void deleteByUserId(Integer userId) {
    repo.deleteByUserId(userId);
}
}
