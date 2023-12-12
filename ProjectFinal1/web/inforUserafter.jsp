<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Profile</title><link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
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
            <style>
                .gradient-custom {
                    background: #f6d365;
                    background: -webkit-linear-gradient(to right bottom, rgba(246, 211, 101, 1), rgba(253, 160, 133, 1));
                    background: linear-gradient(to right bottom, rgba(246, 211, 101, 1), rgba(253, 160, 133, 1))
                }
                .color {
                    color: #fda582;
                }
                .css-button{
                    background: none;
                    color: #7e6d68;
                }
            </style>
        </head>

        <body>
            <section class="vh-100" style="background-color: #f4f5f7;">
                <div class="container py-5 h-100">
                    <div class="row d-flex justify-content-center align-items-center h-100">
                        <div class="col col-lg-6 mb-4 mb-lg-0">
                            <div class="card mb-3" style="border-radius: .5rem;">
                                <div class="row g-0">
                                    <div class="col-md-4 gradient-custom text-center text-white"
                                         style="border-top-left-radius: .5rem; border-bottom-left-radius: .5rem;">
                                        <img src="https://login.vivaldi.net/profile/avatar/LucasHahaFunny/KRYnPMEHLbJAHmav.png"
                                             alt="Avatar" class="img-fluid my-5" style="width: 80px;" />
                                        <h5>Profile User</h5>
                                        <p class="css-button"><a href="ManagerAccount.jsp">Comeback Manager</a></p>
                                    </div>
                                    <div class="col-md-8">
                                        <div class="card-body p-4">
                                            <h6>Information that you created</h6>
                                            <hr class="mt-0 mb-4">
                                            <div class="row pt-1">
                                                <div class="col-6 mb-3">
                                                    <h6>Email</h6>
                                                    <span class="color">${user.email}</span>
                                                </div>
                                                <div class="col-6 mb-3">
                                                    <h6>Password</h6>
                                                    <span class="color">${user.password}</span>
                                                </div>
                                                <div class="col-6 mb-3">
                                                    <h6>FirstName</h6>
                                                    <span class="color">${user.firstName}</span>
                                                </div>
                                                <div class="col-6 mb-3">
                                                    <h6>LastName</h6>
                                                    <span class="color">${user.lastName}</span>
                                                </div>
                                            </div>
                                            <h6>Contact/Accommodation</h6>
                                            <hr class="mt-0 mb-4">
                                            <div class="row pt-1">
                                                <div class="col-6 mb-3">
                                                    <h6>Phone</h6>
                                                    <span class="color">${user.phoneNumber}</span>
                                                </div>
                                                <div class="col-6 mb-3">
                                                    <h6>Address</h6>
                                                    <span class="color">${user.address}</span>
                                                </div>
                                                <div class="col-6 mb-3">
                                                    <h6>City</h6>
                                                    <span class="color">${user.city}</span>
                                                </div>
                                                <div class="col-6 mb-3">
                                                    <h6>Province</h6>
                                                    <span class="color">${user.province}</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </body>
    </html>
