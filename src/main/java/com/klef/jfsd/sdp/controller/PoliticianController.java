package com.klef.jfsd.sdp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.sdp.model.Politician;
import com.klef.jfsd.sdp.model.Ticket;
import com.klef.jfsd.sdp.service.PoliticianService;
import com.klef.jfsd.sdp.service.TicketService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class PoliticianController {

    @Autowired
    private PoliticianService politicianService;
    
    @Autowired
    private TicketService ticketService;

    @GetMapping("/politicianreg")
    public ModelAndView politicianReg() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("politicianreg");
        return mv;
    }

    @PostMapping("/insertpolitician")
    public ModelAndView insertPolitician(HttpServletRequest request) {
        String politicianAadhar = request.getParameter("politicianAadhar");
        String politicianNumber = request.getParameter("politicianNumber");
        String name = request.getParameter("politicianName");
        String email = request.getParameter("politicianEmail");
        String password = request.getParameter("politicianPassword");
        String party = request.getParameter("politicianParty");
        String constituency = request.getParameter("politicianConstituency");

        Politician politician = new Politician();
        politician.setPoliticianAadhar(Long.parseLong(politicianAadhar));
        politician.setPoliticianNumber(politicianNumber);
        politician.setName(name);
        politician.setEmail(email);
        politician.setPassword(password);
        politician.setParty(party);
        politician.setConstituency(constituency);

        String msg = politicianService.registerPolitician(politician);

        ModelAndView mv = new ModelAndView("regsuccess");
        mv.addObject("message", msg);
        return mv;
    }

    @GetMapping("/politicianlogin")
    public ModelAndView politicianLogin() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("politicianlogin");
        return mv;
    }

    @PostMapping("/checkpoliticianlogin")
    public ModelAndView checkPoliticianLogin(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Politician politician = politicianService.checkPoliticianLogin(email, password);

        if (politician != null) {
            HttpSession session = request.getSession(true);
            session.setAttribute("politician", politician);
            mv.setViewName("redirect:politicianhome");
        } else {
            mv.setViewName("loginfail");
            mv.addObject("message", "Login failed");
        }

        return mv;
    }

    @GetMapping("/politicianhome")
    public ModelAndView politicianHome() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("politicianhome");
        return mv;
    }

    @GetMapping("/politicianprofile")
    public ModelAndView politicianProfile(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        ModelAndView mv = new ModelAndView();
        if (session != null && session.getAttribute("politician") != null) {
            Politician politician = (Politician) session.getAttribute("politician");
            mv.addObject("politician", politician);
            mv.setViewName("politicianprofile");
        } else {
            mv.setViewName("sessionfail");
        }
        return mv;
    }

    @GetMapping("/politicianlogout")
    public ModelAndView politicianLogout(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        ModelAndView mv = new ModelAndView();
        mv.setViewName("login");
        return mv;
    }

    @GetMapping("/viewpoliticiantickets")
    public ModelAndView viewPoliticianTickets(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        ModelAndView mv = new ModelAndView();

        if (session != null && session.getAttribute("politician") != null) {
            Politician politician = (Politician) session.getAttribute("politician");

            // Fetch tickets assigned to this politician (receiverId is the politician's ID)
            List<Ticket> tickets = ticketService.getTicketsByReceiverId(politician.getPoliticianAadhar());

            mv.addObject("tickets", tickets);
            mv.setViewName("politicianticketview");
        } else {
            mv.setViewName("sessionfail");
        }
        return mv;
    }

    @GetMapping("/pviewticket")
    public ModelAndView viewTicket(HttpServletRequest request) {
        long ticketId = Long.parseLong(request.getParameter("requestId"));
        Ticket ticket = ticketService.getTicketById(ticketId);
        
        ModelAndView mv = new ModelAndView();
        if (ticket != null) {
            mv.addObject("ticket", ticket);
            mv.setViewName("pviewticket");
        } else {
            mv.setViewName("error");
            mv.addObject("message", "Ticket not found.");
        }
        return mv;
    }

    @PostMapping("/addcomment")
    public ModelAndView addComment(HttpServletRequest request) {
        long ticketId = Long.parseLong(request.getParameter("requestId"));
        String comment = request.getParameter("comment");

        Ticket ticket = ticketService.getTicketById(ticketId);
        if (ticket != null) {
            ticket.setComment(comment);
            ticketService.saveTicket(ticket);
        }

        return new ModelAndView("redirect:pviewticket?requestId=" + ticketId);
    }

    @PostMapping("/closeticket")
    public ModelAndView closeTicket(HttpServletRequest request) {
        long ticketId = Long.parseLong(request.getParameter("requestId"));
        Ticket ticket = ticketService.getTicketById(ticketId);
        if (ticket != null) {
            ticket.setStatus("Closed");
            ticketService.saveTicket(ticket);
        }

        return new ModelAndView("redirect:viewpoliticiantickets");}
        
        @PostMapping("/openticket")
        public ModelAndView oprnTicket(HttpServletRequest request) {
            long ticketId = Long.parseLong(request.getParameter("requestId"));
            Ticket ticket = ticketService.getTicketById(ticketId);
            if (ticket != null) {
                ticket.setStatus("Open");
                ticketService.saveTicket(ticket);
            }

            return new ModelAndView("redirect:viewpoliticiantickets");
    }
        @GetMapping("updatep")
        public ModelAndView updatepolitician()
        {
         ModelAndView mv = new ModelAndView();
         mv.setViewName("updatepolitician");
         return mv;
        }
        
        @PostMapping("politicianupdate")
           public ModelAndView update(HttpServletRequest request)
           {
              long paadhaar =Long.parseLong(request.getParameter("pid"));
              String pnumber = request.getParameter("pnum");
              String pname = request.getParameter("name");
              String ppassword = request.getParameter("password");
              String pparty = request.getParameter("party");
              String pconstituency = request.getParameter("constituency");

              Politician p = new Politician();
              p.setPoliticianAadhar(paadhaar);
              p.setPoliticianNumber(pnumber);
              p.setName(pname);
              p.setPassword(ppassword);
              p.setParty(pparty);
              p.setConstituency(pconstituency);
              
              String msg = politicianService.updatepolitician(p);
              
              ModelAndView mv = new ModelAndView("redirect:politicianlogout");
              mv.addObject("message", msg);
            
              return mv;

           }
}
