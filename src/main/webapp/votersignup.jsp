<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Voter Signup</title>
    <link rel="stylesheet" href="css/signup.css">
</head>
<body>

    <section class="form-section">
        <div class="form-wrapper">
            <form action="insertvoter" method="POST">
                <div class="input-block">
                    <label for="voter-id">Voter ID</label>
                    <input type="number" id="voter-id" name="voterId" placeholder="Enter your voter ID" 
                           pattern="\d{10}" title="Voter ID must be 10 digits" required>
                </div>

                <div class="input-block">
                    <label for="voter-name">Name</label>
                    <input type="text" id="voter-name" name="voterName" placeholder="Enter your name" required>
                </div>
                
                <div class="input-block">
                    <label for="voter-email">Email</label>
                    <input type="email" id="voter-email" name="voterEmail" placeholder="Enter your email" required>
                </div>
                
                <div class="input-block">
                    <label for="voter-password">Password</label>
                    <input type="password" id="voter-password" name="voterPassword" placeholder="Enter your password" required>
                </div>
                
                <div class="input-block">
                    <label for="voter-phone">Phone</label>
                    <input type="tel" id="voter-phone" name="voterPhone" placeholder="Enter your phone number" required>
                </div>
                
                <div class="input-block">
                    <label for="voter-address">Address</label>
                    <input type="text" id="voter-address" name="voterAddress" placeholder="Enter your address" required>
                </div>
                
                <div class="input-block">
                    <label for="voter-constituency">Constituency</label>
                    <select id="voter-constituency" name="constituency" required>
                        <option value="">Select your constituency</option>
                        <option value="Ananthapur">Ananthapur</option>
                        <option value="Chittoor">Chittoor</option>
                        <option value="East Godavari">East Godavari</option>
                        <option value="Guntur">Guntur</option>
                        <option value="Krishna">Krishna</option>
                        <option value="Kurnool">Kurnool</option>
                        <option value="Nellore">Nellore</option>
                        <option value="Prakasam">Prakasam</option>
                        <option value="Srikakulam">Srikakulam</option>
                        <option value="Visakhapatnam">Visakhapatnam</option>
                        <option value="Vizianagaram">Vizianagaram</option>
                        <option value="West Godavari">West Godavari</option>
                        <option value="YSR Kadapa">YSR Kadapa</option>
                    </select>
                </div>

                <button class="btn-login" type="submit">Sign Up</button>
            </form>
        </div>
    </section>
    
</body>
</html>
