package com.example.demo.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.model.Admin;
import com.example.demo.model.AppDetails;
import com.example.demo.repo.AdminRepository;
import com.example.demo.repo.AppDetailsRepository;

@Service
public class AdminService {

    @Autowired
    private AdminRepository adminRepo;

    @Autowired
    private AppDetailsRepository appRepo;

    // Register admin (used for addAdmin)
    public Admin addAdmin(Admin admin) {
        return adminRepo.save(admin);
    }

    // Login admin
    public Admin login(String userName, String password) {
        return adminRepo.findByUserNameAndPassword(userName, password);
    }

    // Add new app
    public AppDetails addApp(AppDetails app) {
        return appRepo.save(app);
    }

    // Get all apps
    public List<AppDetails> getAllApps() {
        return appRepo.findAll();
    }

    // Get apps by genre
 
}
