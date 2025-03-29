<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Fail</title>
    <link rel="stylesheet" href="css/loginfail.css"> 

<body>
    <div class="cont_principal">
        <div class="cont_error">
            <h1>Session Expired..</h1>
            <p>please login again</p> 
            <a href="login">login Again</a> 
        </div>
        <div class="cont_aura_1"></div>
        <div class="cont_aura_2"></div>
    </div>

    <script>
        window.onload = function() {
            document.querySelector('.cont_principal').className = "cont_principal cont_error_active";
        };
    </script>
</body>
</html>
