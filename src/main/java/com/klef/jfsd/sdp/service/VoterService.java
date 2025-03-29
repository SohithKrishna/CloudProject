package com.klef.jfsd.sdp.service;

import com.klef.jfsd.sdp.model.Voter;

public interface VoterService {
    public String registerVoter(Voter voter);
    public Voter checkVoterLogin(String email, String password);
    public String updatevoter(Voter v);
}
