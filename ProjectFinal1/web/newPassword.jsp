<!doctype html>
<html>
    <head>
        <meta charset='utf-8'>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <title>New Password</title>
        <link
            href='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css'
            rel='stylesheet'>
        <link
            href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css'
            rel='stylesheet'>
        <script type='text/javascript'
        src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
        <style>
            .placeicon {
                font-family: fontawesome
            }

            .custom-control-label::before {
                background-color: #dee2e6;
                border: #dee2e6
            }
            .css-button {
                background-color: green;
                color: white;
                padding: 9px 15px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            .css-button:hover {
                color: white;
                background-color: darkgreen;
                text-decoration: none;
            }
            /*            .container {
                            background-image: url(https://media.istockphoto.com/id/1206800961/photo/online-shopping-and-payment-man-using-tablet-with-shopping-cart-icon-digital-marketing.jpg?b=1&s=612x612&w=0&k=20&c=mwZYTXRUffNG-igVygp49KPbBT4Dp0va1MxomnP3j9M=);
                            background-size: cover;
                        }*/
        </style>
    </head>
    <body oncontextmenu='return false' class='snippet-body bg-info'>
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-social/5.1.1/bootstrap-social.css">
        <div>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-12 col-md-9 col-lg-7 col-xl-6 mt-5">
                        <div class="container bg-white rounded mt-2 mb-2 px-0">
                            <div class="row justify-content-center align-items-center pt-3">
                                <h1>
                                    <strong>Reset Password</strong>
                                </h1>
                            </div>
                            <div class="pt-3 pb-3">
                                <form class="form-horizontal" action="newPassword" method="POST">
                                    <div class="form-group row justify-content-center px-3">
                                        <div class="col-9 px-0">
                                            <input type="text" name="password" placeholder="&#xf084; &nbsp; New Password"
                                                   class="form-control border-info placeicon">
                                        </div>
                                    </div>
                                    <div class="form-group row justify-content-center px-3">
                                        <div class="col-9 px-0">
                                            <input type="password" name="confPassword"
                                                   placeholder="&#xf084; &nbsp; Confirm New Password"
                                                   class="form-control border-info placeicon">
                                        </div>
                                    </div>
                                    <div class="form-group row justify-content-center">
                                        <div class="col-3 px-3 mt-3">
                                            <input type="submit" value="Reset"
                                                   class="btn btn-block btn-info">
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="mx-0 px-0 bg-light">
                                <div class="px-4 pt-5">
                                    <hr>
                                </div>
                                <div class="pt-2">
                                    <div class="row justify-content-center">
                                        <h5>
                                            <span><a href="register.jsp" class="css-button "> Register Now!</a></span>
                                        </h5>
                                    </div>
                                    <div
                                        class="row justify-content-center align-items-center pt-4 pb-5">
                                        <div class="col-4">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script type='text/javascript'
        src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js'></script>
    </body>
</html>