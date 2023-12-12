<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Fashion</title>
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
            .search {
                height: 32px;
                margin-top: -16px;
                border-radius: 4px;
                width: 60%;
                color: #000;
            }
            .button-S {
                height: 32px;
                margin-top: -16px;
                color: #000;
                border-radius: 3px;
            }
            .searchU {
                margin-top: 6px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Manager <b>Account</b></h2>
                        </div>
                        <div class="col-sm-6">
                            <a href="AddUser.jsp" class="btn btn-success">
                                <i class="material-icons">&#xE147;</i>
                                    Add User
                            </a>

                            <form action="searchU" class="searchU" method="post">
                                <span class="icon-large"><i class="ri-search-line"></i></span>
                                <input class="search" oninput="searchUserByName(this)" type="search" value="${txtU}"  name="txt" placeholder="    Search for accounts">
                                <button class="button-S" type="submit" name="action"><a href="managerAccount?action=display_users&amp;email=${account.email}">Search</a></button>
                            </form>

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
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Email</th>
                            <th>Password</th>
                            <th>Phone Number</th>
                            <th>Address</th>
                            <th>City</th>
                            <th colspan="3">Province</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                        <c:forEach var="account" items="${accounts}">
                            <tr>
                                <td>
                                    <span class="custom-checkbox">
                                        <input type="checkbox" id="checkbox1" name="options[]" value="1">
                                        <label for="checkbox1"></label>
                                    </span>
                                </td>
                                <td>${account.firstName}</td>
                                <td>${account.lastName}</td>
                                <td>${account.email}</td>
                                <td>${account.password}</td>
                                <td>${account.phoneNumber}</td>
                                <td>${account.address}</td>
                                <td>${account.city}</td>
                                <td>${account.province}</td>
                                <td><a href="managerAccount?action=display_user&amp;email=${account.email}">Update</a></td>
                                <td class="add"><a href="managerAccount?action=delete_user&amp;email=${account.email}">Delete</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>                



                <div class="account">
                    <p><a href="managerAccount?action=display_users&amp;email=${account.email}">Refresh</a></p>
                    <p class="account-margin"><a href="home.jsp">Comeback Home</a></p>
                </div>

                <div class="clearfix">
                    <ul class="pagination">
                        <c:forEach begin="1" end="${totalPages}" varStatus="loop">
                            <li class="page-item ${loop.index == currentPage ? 'active' : ''}">
                                <a href="<c:url value='paginationUser'><c:param name='page' value='${loop.index}'/></c:url>"
                                   class="page-link">${loop.index}</a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>                

    </body>
</html>