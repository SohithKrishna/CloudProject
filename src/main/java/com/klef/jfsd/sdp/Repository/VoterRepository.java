package com.klef.jfsd.sdp.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import com.klef.jfsd.sdp.model.Voter;

@Repository
public interface VoterRepository extends JpaRepository<Voter, Long> {
    @Query("select v from Voter v where v.email=?1 and v.password=?2")
    public Voter checkVoterLogin(String email, String password);

	public Voter findByConstituency(String constituency);
}
