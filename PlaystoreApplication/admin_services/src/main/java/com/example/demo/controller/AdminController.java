package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.model.Admin;
import com.example.demo.model.AppDetails;
import com.example.demo.model.User;
import com.example.demo.service.AdminService;
import com.example.demo.service.AppDetailsService;
import com.example.demo.service.UserAppsService;
import com.example.demo.service.UserService;
import com.example.demo.config.MailSend;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;

    @Autowired
    private AppDetailsService appService;

    @Autowired
    private UserAppsService userAppsService;

    @Autowired
    private UserService userService;

    // --------------------- LOGIN ------------------------
    @GetMapping("/login")
    public String showLogin() {
        return "admin-login";
    }

    @PostMapping("/login")
    public String login(@RequestParam String userName,
                        @RequestParam String password,
                        HttpSession session) {

        Admin admin = adminService.login(userName, password);

        if (admin != null) {
            session.setAttribute("adminName", admin.getAdminName());
            return "redirect:/admin/dashboard";
        } else {
            return "admin-login";
        }
    }

    // --------------------- DASHBOARD ------------------------
    @GetMapping("/dashboard")
    public String showDashboard(Model model) {
        // Fetch apps
        List<AppDetails> apps = appService.getAllApps();
        apps.forEach(app -> app.setDownloadCount(userAppsService.getDownloadCount(app.getAppId())));

        // Fetch users
        List<User> users = userService.getAllUsers();
        int totalDownloads = apps.stream()
                .mapToInt(AppDetails::getDownloadCount)
                .sum();
        model.addAttribute("allApps", apps);
        model.addAttribute("totalApps", apps.size());
        model.addAttribute("totalUsers", users.size());
        model.addAttribute("totalDownloads", totalDownloads); 

        return "admin-dashboard";
    }

    // --------------------- VIEW USERS ------------------------
    @GetMapping("/users")
    public String getAllUsers(Model model) {
        List<User> users = userService.getAllUsers();
        model.addAttribute("users", users);
        return "admin-view-users";
    }

    // --------------------- DELETE USER ------------------------
    @GetMapping("/delete-user/{id}")
    public String deleteUser(@PathVariable int id) {
        userService.deleteUser(id);
        return "redirect:/admin/users";
    }

    // --------------------- ADD/UPDATE/DELETE APP ------------------------
    @GetMapping("/add-app")
    public String showAddApp() { return "add-app"; }

    @PostMapping("/add-app")
    public String addApp(@ModelAttribute AppDetails app, RedirectAttributes redirectAttributes) {
        appService.addApp(app);
        MailSend.sendMail(
            "727721euit088@skcet.ac.in",
            "New App Added",
            "The app '" + app.getAppName() + "' was added successfully.Here user,can access the app Happily....."
        );
        redirectAttributes.addFlashAttribute("success", "App added successfully!");
        return "redirect:/admin/dashboard";
    }

    @GetMapping("/update-app/{id}")
    public String showUpdatePage(@PathVariable int id, Model model) {
        model.addAttribute("app", appService.getAppById(id));
        return "update-app";
    }

    @PostMapping("/update-app")
    public String updateApp(@ModelAttribute AppDetails app, RedirectAttributes redirectAttributes) {
        appService.updateApp(app);
        redirectAttributes.addFlashAttribute("success", "App updated successfully!");
        return "redirect:/admin/dashboard";
    }

    @GetMapping("/delete-app/{id}")
    public String deleteApp(@PathVariable int id, RedirectAttributes redirectAttributes) {
        appService.deleteApp(id);
        redirectAttributes.addFlashAttribute("success", "App deleted successfully!");
        return "redirect:/admin/dashboard";
    }

    // --------------------- LOGOUT ------------------------
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/admin/login";
    }
    @GetMapping("/add")
    public String showAddAdmin(Model model) {
        model.addAttribute("admin", new Admin());
        return "add-admin";  // your JSP file name
    }
    @PostMapping("/add")
    public String saveAdmin(@ModelAttribute Admin admin, RedirectAttributes redirectAttributes) {
        adminService.addAdmin(admin);
        redirectAttributes.addFlashAttribute("success", "Admin registered successfully!");
        return "redirect:/admin/login";
    }

   

}
