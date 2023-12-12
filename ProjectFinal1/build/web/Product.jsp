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
        </style>
    </head>
    <body>
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="managerProduct" method="post">
                    <input type="hidden" name="action" value="update_product">  
                    <div class="modal-header">						
                        <h4 class="modal-title">Update Product</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>Name</label>
                            <input name="productName" value="${product.productName}" type="text" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label>Image</label>
                            <input name="productImage" value="${product.productImage}" type="text" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label>Price</label>
                            <input name="productPrice" value="${product.productPrice}" type="text" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label>Category</label>
                            <input name="productCategory" value="${product.productCategory}" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label>Description</label>
                            <input name="productDescription" value="${product.productDescription}" class="form-control" required>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                        <input type="submit" name="action" class="btn btn-success" value="Update">
                    </div>
                </form>
            </div>
        </div>
        <script src="js/manager.js" type="text/javascript"></script>
    </body>
</html>