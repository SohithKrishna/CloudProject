package com.klef.jfsd.sdp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.klef.jfsd.sdp.model.Voter;
import com.klef.jfsd.sdp.Repository.VoterRepository;

@Service
public class VoterServiceImpl implements VoterService {
    @Autowired
    private VoterRepository voterRepository;

    @Override
    public String registerVoter(Voter voter) {
        voterRepository.save(voter);
        return "Voter Registered Successfully";
    }

    @Override
    public Voter checkVoterLogin(String email, String password) {
        return voterRepository.checkVoterLogin(email, password);
    }

    @Override
    public String updatevoter(Voter v) 
    {
     Voter vot = voterRepository.findById(v.getVoterId()).get();
     
     vot.setName(v.getName());
     vot.setPassword(v.getPassword());
     vot.setAddress(v.getAddress());
     vot.setPhoneNumber(v.getPhoneNumber());
     vot.setConstituency(v.getConstituency());

     
     voterRepository.save(v);
     
     return "Voter Updated Successfully";
    }
}
