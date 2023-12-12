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
                                HELLO, WELCOME!
                            </span>
                            <span class="login100-form-title-1">
                                You can add any user.
                            </span>
                        </div>

                        <form class="signup login100-form validate-form" action="adduser" method="post">
                            <input type="hidden" name="action" value="adduser">
                            <p class="text-danger">${message}</p>
                            <div class="wrap-input100 validate-input m-b-26" data-validate="Username is required">
                                <span class="label-input100">Username</span>
                                <input class="input100" type="email" name="email" value="${user.email}" placeholder="Enter your name" required>
                                <span class="focus-input100"></span>
                            </div>
                            <div class="wrap-input100 validate-input m-b-18" data-validate = "Password is required">
                                <span class="label-input100">FirstName</span>
                                <input class="input100" type="text" name="firstName" value="${user.firstName}" placeholder="Enter your firstname" required>
                                <span class="focus-input100"></span>
                            </div>
                            <div class="wrap-input100 validate-input m-b-18" data-validate = "Password is required">
                                <span class="label-input100">LastName</span>
                                <input class="input100" type="text" name="lastName" value="${user.lastName}" placeholder="Enter your lastname" required>
                                <span class="focus-input100"></span>
                            </div>
                            <div class="wrap-input100 validate-input m-b-18" data-validate = "Password is required">
                                <span class="label-input100">Password</span>
                                <input class="input100" type="password" name="password" value="${user.password}" placeholder="Enter your password" required>
                                <span class="focus-input100"></span>
                            </div>
                            <div class="wrap-input100 validate-input m-b-18" data-validate = "Password is required">
                                <span class="label-input100">Phone</span>
                                <input class="input100" type="text" name="phoneNumber" value="${user.phoneNumber}" placeholder="Enter phone" required>
                                <span class="focus-input100"></span>
                            </div>
                            <div class="wrap-input100 validate-input m-b-18" data-validate = "Password is required">
                                <span class="label-input100">Address</span>
                                <input class="input100" type="text" name="address" value="${user.address}" placeholder="Enter your address" required>
                                <span class="focus-input100"></span>
                            </div>
                            <div class="wrap-input100 validate-input m-b-18" data-validate = "Password is required">
                                <span class="label-input100">City</span>
                                <input class="input100" type="text" name="city" value="${user.city}" placeholder="Enter your city" required>
                                <span class="focus-input100"></span>
                            </div>
                            <div class="wrap-input100 validate-input m-b-18" data-validate = "Password is required">
                                <span class="label-input100">Province</span>
                                <input class="input100" type="text" name="province" value="${user.province}" placeholder="Enter your province" required>
                                <span class="focus-input100"></span>
                            </div>
                            <input type="submit" class="login100-form-btn btn btn-primary" value="Add"/>
                            <div class="col-6 col-sm-6">
                                <a class="login100-form-btn" href="home.jsp">Home</a>
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
        </body>
    </html>
