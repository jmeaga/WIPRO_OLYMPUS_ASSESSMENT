package com.example.demo.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.example.demo.model.UserApps;
import com.example.demo.service.UserAppsService;

import java.util.List;

@RestController
@RequestMapping("/user/apps")
public class UserAppController {

    @Autowired
    private UserAppsService service;
  
    @PostMapping("/download/{userId}/{appId}")
    public UserApps download(@PathVariable Integer userId, @PathVariable Integer appId) {
        return service.downloadApp(userId, appId);
    }

    @GetMapping("/list/{userId}")
    public List<UserApps> list(@PathVariable Integer userId) {
        return service.userDownloads(userId);
    }
  

}
