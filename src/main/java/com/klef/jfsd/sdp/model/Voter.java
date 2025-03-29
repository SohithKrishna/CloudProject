package com.klef.jfsd.sdp.model;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "voter_table")
public class Voter {
    @Id
    @Column(name = "voter_id", nullable = false)
    private Long voterId; // Unique voter ID

    @Column(name = "voter_name", length = 100, nullable = false)
    private String name;

    @Column(name = "voter_email", length = 100, nullable = false, unique = true)
    private String email;

    @Column(name = "voter_password", length = 50, nullable = false) // Password for voters
    private String password;

    @Column(name = "voter_address", length = 200, nullable = false)
    private String address;

    @Column(name = "voter_phone", length = 15, nullable = false)
    private String phoneNumber;

    @Column(name = "constituency", length = 100, nullable = false)
    private String constituency; // Connects voters to politicians

    public Long getVoterId() {
        return voterId;
    }

    public void setVoterId(Long voterId) {
        this.voterId = voterId;
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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getConstituency() {
        return constituency;
    }

    public void setConstituency(String constituency) {
        this.constituency = constituency;
    }
}
