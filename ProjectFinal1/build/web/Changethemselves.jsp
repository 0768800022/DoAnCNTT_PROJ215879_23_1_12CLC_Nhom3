<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Profile</title><link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <link rel="stylesheet" type="text/css" href="styles/update.css">
            <style>
                .gradient-custom {
                    background: #f6d365;
                    background: -webkit-linear-gradient(to right bottom, rgba(246, 211, 101, 1), rgba(253, 160, 133, 1));
                    background: linear-gradient(to right bottom, rgba(246, 211, 101, 1), rgba(253, 160, 133, 1))
                }
                .color {
                    color: #abcaef;
                }
                .cancel {
                    color: white;
                }
                .cancel:hover {
                    text-decoration: none;
                    color: white;
                }
                .fix {
                    text-decoration: none;
                    color: #abcaef;
                }
                .fix:hover {
                    text-decoration: none;
                    color: #abcaef;
                }
            </style>
        </head>

        <body>
            <div class="container">
                <div class="row gutters">
                    <div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12">
                        <div class="card h-100">
                            <div class="card-body">
                                <div class="account-settings">
                                    <div class="user-profile">
                                        <div class="user-avatar">
                                            <img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="Maxwell Admin">
                                        </div>
                                        <h6 class="user-email"><a class="fix" href="#">${account.email}</a></h6>
                                    </div>
                                    <div class="about">
                                        <p class="color">You can change your information!</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
                        <div class="card h-100">
                            <form action="changeInfor" method="post">
                                <input type="hidden" name="action" value="update">
                                <div class="card-body">
                                    <div class="row gutters">
                                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                            <h6 class="mb-2 text-primary">Personal Details</h6>
                                        </div>
                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                            <div class="form-group">
                                                <label for="eMail">Email</label>
                                                <input class="form-control" type="email" name="email" value="${account.email}" disabled>
                                            </div>
                                        </div>
                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                            <div class="form-group">
                                                <label for="eMail">Password</label>
                                                <input class="form-control" type="text" name="password" value="${account.password}" required>
                                            </div>
                                        </div>
                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                            <div class="form-group">
                                                <label for="fullName">First Name</label>
                                                <input class="form-control" type="text" name="firstName" value="${account.firstName}" required>
                                            </div>
                                        </div>

                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                            <div class="form-group">
                                                <label for="phone">Last Name</label>
                                                <input class="form-control" type="text" name="lastName" value="${account.lastName}" required>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row gutters">
                                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                            <h6 class="mt-3 mb-2 text-primary">Address</h6>
                                        </div>
                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                            <div class="form-group">
                                                <label for="Street">Phone Number</label>
                                                <input class="form-control" type="text" name="phoneNumber" value="${account.phoneNumber}" required>
                                            </div>
                                        </div>
                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                            <div class="form-group">
                                                <label for="ciTy">Address</label>
                                                <input class="form-control" type="text" name="address" value="${account.address}" required>
                                            </div>
                                        </div>
                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                            <div class="form-group">
                                                <label for="sTate">City</label>
                                                <input class="form-control" type="text" name="city" value="${account.city}" required>
                                            </div>
                                        </div>
                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                            <div class="form-group">
                                                <label for="zIp">Province</label>
                                                <input class="form-control" type="text" name="province" value="${account.province}" required>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row gutters">
                                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                            <div class="text-right">
                                                <!--<input type="button" id="submit" name="submit" class="btn btn-secondary"><a href="home.jsp">Cancel</a>-->
                                                <button type="button" id="submit" name="submit" class="btn btn-secondary"><a class="cancel" href="home.jsp">Cancel</a></button>
                                                <input type="submit" value="Update" class="btn btn-primary">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </body>
    </html>
