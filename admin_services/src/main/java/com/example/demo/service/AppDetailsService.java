package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.model.AppDetails;
import com.example.demo.repo.AppDetailsRepository;

@Service
public class AppDetailsService {

    @Autowired
    private AppDetailsRepository repo;

    public List<AppDetails> getAllApps() {
        return repo.findAll();
    }

    public AppDetails addApp(AppDetails app) {
        return repo.save(app);
    }
    
    public AppDetails getAppById(int id) {
        return repo.findById(id).orElse(null);
    }

    public void deleteApp(int id) {
        repo.deleteById(id);
    }

    public AppDetails updateApp(AppDetails app) {
        return repo.save(app);
    }
   

    
}
