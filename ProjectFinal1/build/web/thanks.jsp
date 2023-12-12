<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Update</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <style>
            img{
                width: 200px;
                height: 120px;
            }
            body {
                background-image: url("https://segwitz.com/wp-content/uploads/2021/09/why-ecommerce-need-mobile-apps.jpg");
            }
            .modal-content {
                background: transparent;
                blackdrop-filter: blur(20px);
                color: white;
                border: 2px solid white;
                box-shadow: 0 0 10px green;
            }
            .modal-footer{
                display: flex;
                align-items: center;
                justify-content: center;
                text-decoration: none;
            }
            a:hover{
                text-decoration: none;
            }
            .modal-header {
                border: none;
            }
        </style>
    </head>
    <body>
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">						
                    <h4 class="modal-title">Order Successfully - Đơn hàng đã được đặt thành công</h4>
                </div>
                <div class="modal-header">						
                    <h4>Cảm ơn bạn đã tin tưởng mua hàng</h4>
                </div>
                <a href="home.jsp">
                    <div class="modal-footer">
                        <input type="submit" class="btn btn-success" value="Back Home">
                    </div>
                </a>
            </div>
        </div>
        <script src="js/manager.js" type="text/javascript"></script>
    </body>
</html>