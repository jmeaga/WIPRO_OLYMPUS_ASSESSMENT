package com.example.demo.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import com.example.demo.model.User;
import com.example.demo.model.UserApps;

import com.example.demo.model.AppDetails;
import com.example.demo.service.UserService;
import com.example.demo.service.UserAppsService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class HomeController {

    @Autowired
    private UserService userService;
    
    @Autowired
    private UserAppsService userAppsService;

    @Autowired
    private RestTemplate restTemplate;

    // 1️⃣ Show login page
    @GetMapping("/login")
    public String showLogin() {
        return "user-login";
    }

    // 2️⃣ Handle login
    @PostMapping("/login")
    public String login(@RequestParam String userName,
                        @RequestParam String password,
                        HttpSession session,
                        Model model) {

        User user = userService.login(userName, password);

        if (user != null) {
            session.setAttribute("user", user);
            session.setAttribute("userName", user.getFirstName());

            // Fetch all apps from Admin service
            List<AppDetails> allApps = Arrays.asList(
                    restTemplate.getForObject("http://localhost:8082/api/apps/all", AppDetails[].class)
            );

            // Fetch downloaded apps for this user
            List<UserApps> downloads = userAppsService.userDownloads(user.getUserId());

            // Map app names locally using the allApps list
            downloads.forEach(ua -> {
                allApps.stream()
                       .filter(app -> app.getAppId().equals(ua.getAppId()))
                       .findFirst()
                       .ifPresent(app -> ua.setAppName(app.getAppName()));
            });

            model.addAttribute("user", user);
            model.addAttribute("allApps", allApps);
            model.addAttribute("downloads", downloads);

            return "user-dashboard";
        } else {
            model.addAttribute("error", "Invalid username or password");
            return "user-login";
        }
    }

    // 3️⃣ Show registration page
    @GetMapping("/add")
    public String showRegisterForm(Model model) {
        model.addAttribute("user", new User());
        return "add-user";
    }

    // 4️⃣ Handle registration
    @PostMapping("/add")
    public String register(@ModelAttribute User user, Model model) {
        try {
            userService.register(user);
            model.addAttribute("message", "Registration successful! Please login.");
            return "user-login";
        } catch (RuntimeException ex) {
            model.addAttribute("error", ex.getMessage());  // Username exists message
            return "add-user";  // show registration page again
        }
    }

    // 5️⃣ Logout
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/user/login";
    }

    @PostMapping("/delete/{userId}")
    public String deleteAccount(@PathVariable Integer userId, HttpSession session) {

        userAppsService.deleteByUserId(userId);  // ❗ delete downloads first
        userService.deleteUser(userId);          // ❗ delete user

        session.invalidate();
        return "redirect:/user/login?deleted=true";
    }





}
