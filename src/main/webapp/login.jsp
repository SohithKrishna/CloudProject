<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/64d58efce2.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/login.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <title>Sign in & Sign up Form</title>
</head>
<body>
    <div class="container">
        <div class="forms-container">
            <div class="signin-signup">
                <!-- Sign-In Form -->
                <form id="loginForm" class="sign-in-form" method="post">
                    <h2 class="title">Sign in</h2>
                    <div class="input-field">
                        <i class="fas fa-user"></i>
                        <input type="email" placeholder="Email" name="email" required>
                    </div>
                    <div class="input-field">
                        <i class="fas fa-lock"></i>
                        <input type="password" placeholder="Password" name="password" required>
                    </div>
                    <div class="input-field">
                        <div class="input-block">
                            <select id="roleSelect" name="role" required>
                                <option value="">Select Role</option>
                                <option value="admin">Admin</option>
                                <option value="voter">Voter</option>
                                <option value="politician">Politician</option>
                            </select>
                        </div>
                    </div>
                    <input type="submit" value="Login" class="btn solid">
                    <p class="social-text">Or Sign in with social platforms</p>
                    <div class="social-media">
                        <a href="#" class="social-icon"><i class="fab fa-facebook-f"></i></a>
                        <a href="#" class="social-icon"><i class="fab fa-twitter"></i></a>
                        <a href="#" class="social-icon"><i class="fab fa-google"></i></a>
                        <a href="#" class="social-icon"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                </form>

                <!-- Sign-Up Form -->
                <form id="signupForm" class="sign-up-form" method="post" action="insertvoter">
    <h2 class="title">Sign up</h2>

    <div class="input-field">
        <i class="fas fa-id-card"></i>
        <input type="number" name="voterId" id="voter-id" placeholder="Enter your voter ID" 
               pattern="\d{10}" title="Voter ID must be 10 digits" required>
    </div>

    <div class="input-field">
        <i class="fas fa-user"></i>
        <input type="text" name="voterName" id="voter-name" placeholder="Enter your name" required>
    </div>

    <div class="input-field">
        <i class="fas fa-envelope"></i>
        <input type="email" name="voterEmail" id="voter-email" placeholder="Enter your email" required>
    </div>

    <div class="input-field">
        <i class="fas fa-lock"></i>
        <input type="password" name="voterPassword" id="voter-password" placeholder="Enter your password" required>
    </div>

    <div class="input-field">
        <i class="fas fa-phone"></i>
        <input type="tel" name="voterPhone" id="voter-phone" placeholder="Enter your phone number" required>
    </div>

    <div class="input-field">
        <i class="fas fa-home"></i>
        <input type="text" name="voterAddress" id="voter-address" placeholder="Enter your address" required>
    </div>

    <div class="input-field">
        <i class="fas fa-map-marker-alt"></i>
        <select name="constituency" id="voter-constituency" required>
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

    <input type="submit" class="btn" value="Sign up">
    <p class="social-text">Or Sign up with social platforms</p>
    <div class="social-media">
        <a href="#" class="social-icon"><i class="fab fa-facebook-f"></i></a>
        <a href="#" class="social-icon"><i class="fab fa-twitter"></i></a>
        <a href="#" class="social-icon"><i class="fab fa-google"></i></a>
        <a href="#" class="social-icon"><i class="fab fa-linkedin-in"></i></a>
    </div>
</form>

            </div>
        </div>

        <div class="panels-container">
            <div class="panel left-panel">
                <div class="content">
                    <h3>New here?</h3>
                    <p>Join us today and explore a world of opportunities.</p>
                    <button class="btn transparent" id="sign-up-btn">Sign up</button>
                </div>
                <img src="img/log.svg" class="image" alt="">
            </div>
            <div class="panel right-panel">
                <div class="content">
                    <h3>One of us?</h3>
                    <p>Welcome back! Please log in to your account.</p>
                    <button class="btn transparent" id="sign-in-btn">Sign in</button>
                </div>
                <img src="img/register.svg" class="image" alt="">
            </div>
        </div>
    </div>

    <script>
        const sign_in_btn = document.querySelector("#sign-in-btn");
        const sign_up_btn = document.querySelector("#sign-up-btn");
        const container = document.querySelector(".container");

        sign_up_btn.addEventListener("click", () => {
            container.classList.add("sign-up-mode");
        });

        sign_in_btn.addEventListener("click", () => {
            container.classList.remove("sign-up-mode");
        });

        const loginForm = document.querySelector("#loginForm");
        const roleSelect = document.querySelector("#roleSelect");

        loginForm.addEventListener("submit", (event) => {
            const role = roleSelect.value;
            if (role === 'admin') {
                loginForm.action = '/checkadminlogin';
            } else if (role === 'voter') {
                loginForm.action = '/checkvoterlogin';
            } else if (role === 'politician') {
                loginForm.action = '/checkpoliticianlogin';
            } else {
                event.preventDefault();
                alert("Please select a valid role.");
            }
        });

        const signupForm = document.querySelector("#signupForm");
        signupForm.addEventListener("submit", () => {
            signupForm.action = '/insertvoter';
        });
    </script>
</body>
</html>
