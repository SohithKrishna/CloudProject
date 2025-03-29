package com.klef.jfsd.sdp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.klef.jfsd.sdp.model.Admin;
import com.klef.jfsd.sdp.model.Politician;
import com.klef.jfsd.sdp.model.Voter;
import com.klef.jfsd.sdp.Repository.AdminRepository;
import com.klef.jfsd.sdp.Repository.PoliticianRepository;
import com.klef.jfsd.sdp.Repository.VoterRepository;

@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminRepository adminRepository;
    @Autowired
    private PoliticianRepository politicianRepository;
    
    @Autowired
    private VoterRepository voterRepository;

    @Override
    public Admin checkAdminLogin(String username, String password) {
        return adminRepository.checkAdminLogin(username, password);
    }

	@Override
	public List<Politician> ViewAllPoliticians() 
	{
		return (List<Politician>) politicianRepository.findAll();
	}

	@Override
	public String deletePolitician(long pid) 
	{
		politicianRepository.deleteById(pid);
		return "Politician Deleted Successfully";
	}

	 @Override
	 public List<Voter> ViewAllVoters() 
	 {
	  return voterRepository.findAll();
	 }
	 @Override
	 public Politician findPoliticianByAadhar(Long aadhar) {
	     return politicianRepository.findByPoliticianAadhar(aadhar);
	 }


	 @Override
	 public void savePolitician(Politician politician) {
	     politicianRepository.save(politician);
	 }

	
}
