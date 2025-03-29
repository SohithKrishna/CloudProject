package com.klef.jfsd.sdp.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import com.klef.jfsd.sdp.model.Politician;

@Repository
public interface PoliticianRepository extends JpaRepository<Politician, Long> {
    @Query("select p from Politician p where p.email = ?1 and p.password = ?2")
    public Politician checkPoliticianLogin(String email, String password);
  
    @Query("select p from Politician p where p.constituency = ?1")
    public Politician findByConstituency(String constituency);
    
    Politician findByPoliticianAadhar(Long politicianAadhar);
}
