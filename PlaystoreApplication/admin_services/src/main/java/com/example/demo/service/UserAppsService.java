package com.example.demo.service;



import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.model.UserApps;
import com.example.demo.repo.UserAppsRepository;



@Service
public class UserAppsService {

    @Autowired
    private UserAppsRepository repo;

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
   

        public Integer getDownloadCount(Integer appId) {
            return repo.countByAppId(appId);
        }
    }


