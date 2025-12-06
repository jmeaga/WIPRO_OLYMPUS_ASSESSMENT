package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.model.AppDetails;
import com.example.demo.service.AppDetailsService;

@RestController
@RequestMapping("/api/apps")
public class AppAPIController {

    @Autowired
    private AppDetailsService service;

    @GetMapping("/all")
    public List<AppDetails> allApps() {
        return service.getAllApps();
    }
}

