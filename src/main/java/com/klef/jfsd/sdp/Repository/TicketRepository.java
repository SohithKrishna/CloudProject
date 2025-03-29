package com.klef.jfsd.sdp.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.klef.jfsd.sdp.model.Ticket;

import java.util.List;

public interface TicketRepository extends JpaRepository<Ticket, Long> {
    List<Ticket> findBySenderId(long senderId);
    List<Ticket> findByReceiverId(long receiverId);
}
