package com.klef.jfsd.sdp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.sdp.model.Politician;
import com.klef.jfsd.sdp.model.Ticket;
import com.klef.jfsd.sdp.model.Voter;
import com.klef.jfsd.sdp.Repository.PoliticianRepository;
import com.klef.jfsd.sdp.service.TicketService;
import com.klef.jfsd.sdp.service.VoterService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class VoterController {

    @Autowired
    private VoterService voterService;

    @Autowired
    private TicketService ticketService;

    @Autowired
    private PoliticianRepository politicianRepository;

    // Home page
    @GetMapping("/")
    public ModelAndView home() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("home");
        return mv;
    }

    // Voter Registration page
    @GetMapping("/votersignup")
    public ModelAndView voterSignup() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("votersignup");
        return mv;
    }

    // Register new voter
    @PostMapping("/insertvoter")
    public ModelAndView insertVoter(HttpServletRequest request) {
        String voterId = request.getParameter("voterId");
        String name = request.getParameter("voterName");
        String email = request.getParameter("voterEmail");
        String password = request.getParameter("voterPassword");
        String address = request.getParameter("voterAddress");
        String phoneNumber = request.getParameter("voterPhone");
        String constituency = request.getParameter("constituency");

        Voter voter = new Voter();
        voter.setVoterId(Long.parseLong(voterId)); 
        voter.setName(name);
        voter.setEmail(email);
        voter.setPassword(password);
        voter.setAddress(address);
        voter.setPhoneNumber(phoneNumber);
        voter.setConstituency(constituency);

        String msg = voterService.registerVoter(voter);

        ModelAndView mv = new ModelAndView("regsuccess");
        mv.addObject("message", msg);
        return mv;
    }

    // Voter login page
    @GetMapping("/login")
    public ModelAndView login() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("login");
        return mv;
    }

    // Check voter login credentials
    @PostMapping("/checkvoterlogin")
    public ModelAndView checkVoterLogin(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mv = new ModelAndView();
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Voter voter = voterService.checkVoterLogin(email, password);

        if (voter != null) {
            HttpSession session = request.getSession(true);
            session.setAttribute("voter", voter);
            Politician politician = politicianRepository.findByConstituency(voter.getConstituency());
            session.setAttribute("politician", politician); // Set the Politician in session
            mv.setViewName("redirect:voterhome");
        } else {
            mv.setViewName("loginfail");
            mv.addObject("message", "Login failed");
        }

        return mv;
    }

    // Voter home page after login
    @GetMapping("/voterhome")
    public ModelAndView voterHome(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        Voter voter = (Voter) session.getAttribute("voter");
        ModelAndView mv = new ModelAndView();

        if (voter != null) {
            mv.addObject("voter", voter);
            mv.addObject("tickets", ticketService.getTicketsBySenderId(voter.getVoterId()));
            mv.setViewName("voterhome");
        } else {
            mv.setViewName("sessionfail");
        }

        return mv;
    }

    // Voter logout
    @GetMapping("/voterlogout")
    public ModelAndView voterLogout(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        ModelAndView mv = new ModelAndView();
        mv.setViewName("login");
        return mv;
    }

    // Login failure page
    @GetMapping("/loginfail")
    public ModelAndView loginFail() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("loginfail");
        return mv;
    }

    // Voter profile page
    @GetMapping("/voterprofile")
    public ModelAndView voterProfile() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("voterprofile");
        return mv;
    }

    // Ticket raise page
    @GetMapping("/voterticket")
    public ModelAndView raiseTicketPage() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("voterticket");
        return mv;
    }

    // Raise new ticket
    @PostMapping("/raiseticket")
    public ModelAndView raiseTicket(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        Voter voter = (Voter) session.getAttribute("voter");
        String title = request.getParameter("title");
        String description = request.getParameter("description");

        ModelAndView mv = new ModelAndView();

        if (voter != null) {
            Politician politician = politicianRepository.findByConstituency(voter.getConstituency());
            if (politician != null) {
                Ticket ticket = new Ticket();
                ticket.setSenderId(voter.getVoterId());
                ticket.setReceiverId(politician.getPoliticianAadhar());
                ticket.setTitle(title);
                ticket.setDescription(description);
                ticket.setStatus("Open");

                ticketService.saveTicket(ticket);
                mv.setViewName("redirect:voterviewticket");
            } else {
                mv.addObject("error", "No politician found for your constituency.");
                mv.setViewName("redirect:voterviewticket");
            }
        } else {
            mv.setViewName("sessionfail");
        }

        return mv;
    }
    
    @GetMapping("/viewticket")
    public ModelAndView viewTicket(HttpServletRequest request) {
        String requestIdStr = request.getParameter("requestId");
        if (requestIdStr == null || requestIdStr.isEmpty()) {
            // Handle error if ticket ID is missing
            return new ModelAndView("error", "message", "Ticket ID is missing");
        }

        try {
            long ticketId = Long.parseLong(requestIdStr);
            Ticket ticket = ticketService.getTicketById(ticketId);

            ModelAndView mv = new ModelAndView();
            if (ticket != null) {
                mv.addObject("ticket", ticket);
                mv.setViewName("viewticket");
            } else {
                mv.setViewName("error");
                mv.addObject("message", "Ticket not found");
            }
            return mv;
        } catch (NumberFormatException e) {
            // Handle invalid ticket ID format
            return new ModelAndView("error", "message", "Invalid Ticket ID format");
        }
    }






    @PostMapping("/deleteticket")
    public ModelAndView deleteTicket(HttpServletRequest request) {
        long ticketId = Long.parseLong(request.getParameter("requestId"));
        ticketService.deleteTicketById(ticketId);

        ModelAndView mv = new ModelAndView("redirect:voterviewticket");
        return mv;
    }

    
    @GetMapping("/voterviewticket")
    public ModelAndView voterViewTickets(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        Voter voter = (Voter) session.getAttribute("voter");
        ModelAndView mv = new ModelAndView();

        if (voter != null) {
            long voterId = voter.getVoterId();
            List<Ticket> tickets = ticketService.getTicketsBySenderId(voterId);

            if (tickets != null && !tickets.isEmpty()) {
                mv.addObject("tickets", tickets);
            } else {
                mv.addObject("message", "No tickets found.");
            }
            mv.addObject("voter", voter);
            mv.setViewName("voterviewticket");
        } else {
            mv.setViewName("sessionfail");
        }

        return mv;
    }
    @GetMapping("updatevoter")
    public ModelAndView updatevoter()
    {
     ModelAndView mv = new ModelAndView();
     mv.setViewName("updatevoter");
     return mv;
    }
    
    @PostMapping("voterupdate")
       public ModelAndView update(HttpServletRequest request)
       {
       long id = Long.parseLong(request.getParameter("vid"));
          String name = request.getParameter("vname");
          String email = request.getParameter("vemail");
          String password = request.getParameter("vpassword");
          String address = request.getParameter("vaddress");
          String phone = request.getParameter("vphone");
          String constituency = request.getParameter("vconstituency");

          Voter v = new Voter();
          v.setVoterId(id);
          v.setName(name);
          v.setEmail(email);
          v.setPassword(password);
          v.setAddress(address);
          v.setPhoneNumber(phone);
          v.setConstituency(constituency);
          
          String msg = voterService.updatevoter(v);
          
          ModelAndView mv = new ModelAndView("redirect:voterlogout");
          mv.addObject("message", msg);
          
          
          return mv;
          
          
       }



}
