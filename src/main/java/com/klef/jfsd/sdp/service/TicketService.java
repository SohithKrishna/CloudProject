package com.klef.jfsd.sdp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.sdp.model.Ticket;
import com.klef.jfsd.sdp.Repository.TicketRepository;

import java.util.List;

@Service
public class TicketService {

    @Autowired
    private TicketRepository ticketRepository;

    public List<Ticket> getTicketsBySenderId(long senderId) {
        return ticketRepository.findBySenderId(senderId);
    }

    public List<Ticket> getTicketsByReceiverId(long receiverId) {
        return ticketRepository.findByReceiverId(receiverId);
    }

    public void saveTicket(Ticket ticket) {
        ticketRepository.save(ticket);
    }

    public Ticket getTicketById(long ticketId) {
        return ticketRepository.findById(ticketId).orElse(null);
    }

    public void closeTicket(Ticket ticket) {
        ticket.setStatus("Closed");
        ticketRepository.save(ticket);
    }

    public void deleteTicketById(long ticketId) {
        ticketRepository.deleteById(ticketId);
    }
}
