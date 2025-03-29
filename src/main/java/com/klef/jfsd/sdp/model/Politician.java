package com.klef.jfsd.sdp.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "politician_table")
public class Politician {
    @Id
    @Column(name = "politician_aadhar", nullable = false)
    private Long politicianAadhar; // Unique politician ID

    @Column(name = "politician_number", length = 20, nullable = false, unique = true)
    private String politicianNumber; // Unique identifier for politicians

    @Column(name = "politician_name", length = 100, nullable = false)
    private String name;

    @Column(name = "politician_email", length = 100, nullable = false, unique = true)
    private String email;

    @Column(name = "politician_password", length = 64, nullable = false) // Adjust length if hashing
    private String password; // Password for politicians

    @Column(name = "politician_party", length = 50, nullable = false)
    private String party;

    @Column(name = "politician_constituency", length = 100, nullable = false, unique = true)
    private String constituency;

    public Long getPoliticianAadhar() {
        return politicianAadhar;
    }

    public void setPoliticianAadhar(Long politicianAadhar) {
        this.politicianAadhar = politicianAadhar;
    }

    public String getPoliticianNumber() {
        return politicianNumber;
    }

    public void setPoliticianNumber(String politicianNumber) {
        this.politicianNumber = politicianNumber;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password; 
    }

    public String getParty() {
        return party;
    }

    public void setParty(String party) {
        this.party = party;
    }

    public String getConstituency() {
        return constituency;
    }

    public void setConstituency(String constituency) {
        this.constituency = constituency;
    }
}
