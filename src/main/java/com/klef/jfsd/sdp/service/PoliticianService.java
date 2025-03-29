package com.klef.jfsd.sdp.service;

import com.klef.jfsd.sdp.model.Politician;

public interface PoliticianService {
    public String registerPolitician(Politician politician);
    public Politician checkPoliticianLogin(String email, String password);
    public String updatepolitician(Politician p);
}
