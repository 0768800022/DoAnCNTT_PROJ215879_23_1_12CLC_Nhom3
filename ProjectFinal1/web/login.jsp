<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Login Page</title><link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
            <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
            <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
            <link rel="stylesheet" type="text/css" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
            <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
            <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
            <link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
            <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
            <link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
            <link rel="stylesheet" type="text/css" href="css/util.css">
            <link rel="stylesheet" type="text/css" href="css/main.css">
        </head>

        <body>
            <div class="limiter">
                <div class="container-login100">
                    <div class="wrap-login100">
                        <div class="login100-form-title" style="background-image: url(images/bg-01.jpg);">
                            <span class="login100-form-title-1">
                                Sign In
                            </span>
                        </div>

                        <form class="login100-form validate-form" id="loginForm" action="#" method="POST">
                            <input type="hidden" name="action" value="add"> 
                            <div class="radio-group">
                                <input type="radio" name="role" value="admin" id="adminRadio">
                                <label for="adminRadio" class="radio-label">Admin</label>

                                <input type="radio" name="role" value="login" id="userRadio" class="radio-group-margin" checked>
                                <label for="userRadio" class="radio-label">User</label>
                            </div>
                            <p class="text-danger">${message}</p>
                            <div class="wrap-input100 validate-input m-b-26" data-validate="Username is required">
                                <span class="label-input100">Username</span>
                                <input class="input100" type="email" name="email" value="${user.email}" placeholder="Enter your name" required>
                                <span class="focus-input100"></span>
                            </div>

                            <div class="wrap-input100 validate-input m-b-18" data-validate = "Password is required">
                                <span class="label-input100">Password</span>
                                <input class="input100" type="password" name="password" value="${user.password}" placeholder="Enter password" required>
                                <span class="focus-input100"></span>
                            </div>

                            <div class="flex-sb-m w-full p-b-30">
                                <div class="contact100-form-checkbox">
                                    <input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me">
                                    <label class="label-checkbox100" for="ckb1">
                                        Remember me
                                    </label>
                                </div>
                                <div>
                                    <a href="register.jsp"> <p class="txt1">Sign Up Now?</p></a>
                                    <a href="forgotPassword.jsp"> <p class="txt1">Forgot Password?</p></a>
                                </div>
                            </div>

                            <div class="container-login100-form-btn">
                                <input type="button" class="login100-form-btn" value="Login" onclick="submitForm()">
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
            <script src="vendor/animsition/js/animsition.min.js"></script>
            <script src="vendor/bootstrap/js/popper.js"></script>
            <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
            <script src="vendor/select2/select2.min.js"></script>
            <script src="vendor/daterangepicker/moment.min.js"></script>
            <script src="vendor/daterangepicker/daterangepicker.js"></script>
            <script src="vendor/countdowntime/countdowntime.js"></script>
            <script src="js/main.js"></script>
            <script>
                                    function submitForm() {
                                        var role = document.querySelector('input[name="role"]:checked').value;
                                        document.getElementById('loginForm').action = role === 'admin' ? 'admin' : 'login';
                                        document.getElementById('loginForm').submit();
                                    }
            </script>
        </body>
    </html>
