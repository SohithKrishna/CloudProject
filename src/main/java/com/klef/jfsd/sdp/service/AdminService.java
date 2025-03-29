package com.klef.jfsd.sdp.service;

import java.util.List;

import com.klef.jfsd.sdp.model.Admin;
import com.klef.jfsd.sdp.model.Politician;
import com.klef.jfsd.sdp.model.Voter;

public interface AdminService 
{
    public Admin checkAdminLogin(String username, String password);
    public List<Politician> ViewAllPoliticians();
    public String deletePolitician(long pid);
    public List<Voter> ViewAllVoters();
    Politician findPoliticianByAadhar(Long aadhar);
    void savePolitician(Politician politician);

}
