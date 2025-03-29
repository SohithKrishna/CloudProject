package com.klef.jfsd.sdp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.sdp.model.Admin;
import com.klef.jfsd.sdp.model.Politician;
import com.klef.jfsd.sdp.model.Voter;
import com.klef.jfsd.sdp.service.AdminService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {

    @Autowired
    private AdminService adminService;

    @PostMapping("/checkadminlogin")
    public ModelAndView checkAdminLogin(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mv = new ModelAndView();
        String username = request.getParameter("email");
        String password = request.getParameter("password");

        Admin admin = adminService.checkAdminLogin(username, password);

        if (admin != null) {
            HttpSession session = request.getSession(true);
            session.setAttribute("admin", admin);
            mv.setViewName("redirect:adminhome");
        } else {
            mv.setViewName("loginfail");
            mv.addObject("message", "Login failed");
        }

        return mv;
    }

    @GetMapping("/adminhome")
    public ModelAndView adminHome() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("adminhome");
        return mv;
    }
    @GetMapping("/adminlogout")
    public ModelAndView voterLogout(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        ModelAndView mv = new ModelAndView();
        mv.setViewName("login");
        return mv;
    }

 @GetMapping("/adminsessionfail")
    public ModelAndView sessionfail() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("sessionfail");
        return mv;
    }
    
    @GetMapping("/adminprofile")
    public ModelAndView adminprofile() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("adminprofile");
        return mv;
    }
    @GetMapping("/viewallpoliticians")
    public ModelAndView viewallemps() 
       {
        ModelAndView mv = new ModelAndView();
        List<Politician> plist = adminService.ViewAllPoliticians();
        mv.setViewName("viewallpoliticians");
        mv.addObject("plist", plist);
        return mv;
    }
  

  
    
    @GetMapping("/viewallvoters")
    public ModelAndView viewallvoters() 
       {
        ModelAndView mv = new ModelAndView();
        List<Voter> vlist = adminService.ViewAllVoters();
        mv.setViewName("viewallvoters");
        mv.addObject("vlist", vlist);
        return mv;
    }
    
    @GetMapping("/deletepolitician")
    public String deleteUser(@RequestParam("id") long pid)
    {
        adminService.deletePolitician(pid); 
        return "redirect:/viewallpoliticians"; 
    }
    @GetMapping("/editpolitician")
    public ModelAndView editPolitician(@RequestParam("politicianAadhar") Long politicianAadhar) {
        ModelAndView mv = new ModelAndView();
        Politician politician = adminService.findPoliticianByAadhar(politicianAadhar);
        if (politician != null) {
            mv.setViewName("editpolitician");
            mv.addObject("politician", politician);
        } else {
            mv.setViewName("error");
            mv.addObject("message", "Politician not found");
        }
        return mv;
    }
    @PostMapping("/updatepolitician")
    public ModelAndView updatePolitician(@ModelAttribute Politician politician) {
        adminService.savePolitician(politician);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("redirect:/viewallpoliticians");
        return mv;
    }

}
