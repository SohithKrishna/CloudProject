package com.klef.jfsd.sdp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.klef.jfsd.sdp.model.Politician;
import com.klef.jfsd.sdp.Repository.PoliticianRepository;

@Service
public class PoliticianServiceImpl implements PoliticianService {
    
    @Autowired
    private PoliticianRepository politicianRepository;

    @Override
    public String registerPolitician(Politician politician) {
        politicianRepository.save(politician);
        return "Politician Registered Successfully";
    }

    @Override
    public Politician checkPoliticianLogin(String email, String password) {
        return politicianRepository.checkPoliticianLogin(email, password);
    }

    @Override
    public String updatepolitician(Politician p) 
    {
     Politician pol = politicianRepository.findById(p.getPoliticianAadhar()).get();
     
     pol.setPoliticianNumber(p.getPoliticianNumber());
     pol.setName(p.getName());
     pol.setPassword(p.getPassword());
     pol.setParty(p.getParty());
     pol.setConstituency(p.getConstituency());
     
     politicianRepository.save(pol);
     
     return "Politician Updated Successfully";
    }
}
