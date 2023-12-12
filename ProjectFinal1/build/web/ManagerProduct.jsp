<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Manager Product</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css" />
        <style>
            img {
                width: 200px;
                height: 120px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Manage <b>Product</b></h2>
                        </div>
                        <div class="col-sm-6">
                            <a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"><i
                                    class="material-icons">&#xE147;</i> <span>Add New Product</span></a>
                            <a href="home.jsp" class="btn btn-primary"><i class="material-icons">home</i><span>Back to
                                    home</span></a>
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>
                                <span class="custom-checkbox">
                                    <input type="checkbox" id="selectAll">
                                    <label for="selectAll"></label>
                                </span>
                            </th>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Image</th>
                            <th>Price</th>
                            <th>Description</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${products}" var="product">
                            <tr>
                                <td>
                                    <span class="custom-checkbox">
                                        <input type="checkbox" id="checkbox1" name="options[]" value="1">
                                        <label for="checkbox1"></label>
                                    </span>
                                </td>
                                <td>${product.productId}</td>
                                <td>${product.productName}</td>
                                <td>
                                    <img src="${product.productImage}">
                                </td>
                                <td>${product.productPrice}</td>
                                <td>${product.productDescription} </td>
                                <td>
                                    <a href="managerProduct?action=delete_product&amp;productId=${product.productId}" class="add">Delete</a>
                                </td>
                                <td>
                                    <a href="managerProduct?action=display_product&amp;productId=${product.productId}" class="add">Update</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <a href="managerProduct?action=display_products"><span>Refresh Product List</span></a>
                <div class="clearfix">  
                    <ul class="pagination">
                        <c:forEach begin="1" end="${totalPages}" varStatus="loop">
                            <li class="page-item ${loop.index == currentPage ? 'active' : ''}">
                                <a href="<c:url value='manage'><c:param name='page' value='${loop.index}'/></c:url>" class="page-link">${loop.index}</a>
                                </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="managerProduct" method="post">
                        <div class="modal-header">
                            <h4 class="modal-title">Add Product</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>

                        <input type="hidden" name="action" value="add">
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Name</label>
                                <input name="productName" value="${product.productName}" type="text" class="form-control"
                                       required>
                            </div>
                            <div class="form-group">
                                <label>Image</label>
                                <input name="productImage" value="${product.productImage}" type="text" class="form-control"
                                       required>
                            </div>
                            <div class="form-group">
                                <label>Price</label>
                                <input name="productPrice" value="${product.productPrice}" type="text" class="form-control"
                                       required>
                            </div>
                            <div class="form-group">
                                <label>Category</label>
                                <textarea name="productCategory" value="${product.productCategory}" class="form-control"
                                          required></textarea>
                            </div>
                            <div class="form-group">
                                <label>Description</label>
                                <textarea name="productDescription" value="${product.productDescription}"
                                          class="form-control" required></textarea>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" name="action" class="btn btn-success" value="add">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script src="js/manager.js" type="text/javascript"></script>
    </body>

</html>