<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Manager Product</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="styles/manager.css" rel="stylesheet" type="text/css"/>
        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
    <body>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2> <b>Invoice</b></h2>
                        </div>
                        <div class="col-sm-6">
                            <a href="home.jsp" class="btn btn-primary"><i class="material-icons">home</i><span>Back to home</span></a>
                        </div>
                    </div>
                </div>
                <c:if test="${sessionScope.accc != null}">
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>
                                    <span class="custom-checkbox">
                                        <input type="checkbox" id="selectAll">
                                        <label for="selectAll"></label>
                                    </span>
                                </th>
                                <th>No</th>
                                <th>Email</th>
                                <th>Name</th>
                                <th>Date</th>
                                <th>Price</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${invoices}" var="invoice">
                                <tr>
                                    <td>
                                        <span class="custom-checkbox">
                                            <input type="checkbox" id="checkbox1" name="options[]" value="1">
                                            <label for="checkbox1"></label>
                                        </span>
                                    </td>
                                    <td>${invoice.invoiceID}</td>
                                    <td>${invoice.account.email}</td>
                                    <td>${invoice.account.firstName}</td>
                                    <td>${invoice.invoiceDate}</td>
                                    <td>${invoice.totalPay}</td>
                                    <td>
                                        <form action="invoiceDetail" method="post">
                                            <input type="hidden" name="invoiceID"
                                                   value="${invoice.invoiceID}">
                                            <input type="submit" value="View Detail">
                                        </form>
                                    </td>

                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>  
                </c:if>
                <c:if test="${sessionScope.acc != null}">
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>
                                    <span class="custom-checkbox">
                                        <input type="checkbox" id="selectAll">
                                        <label for="selectAll"></label>
                                    </span>
                                </th>
                                <th>No</th>
                                <th>Date</th>
                                <th>Price</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${invoices}" var="invoice">
                                <tr>
                                    <td>
                                        <span class="custom-checkbox">
                                            <input type="checkbox" id="checkbox1" name="options[]" value="1">
                                            <label for="checkbox1"></label>
                                        </span>
                                    </td>
                                    <td>${invoice.invoiceID}</td>
                                    <td>${invoice.invoiceDate}</td>
                                    <td>${invoice.totalPay}</td>
                                    <td>
                                        <form action="invoiceDetail" method="post">
                                            <input type="hidden" name="invoiceID"
                                                   value="${invoice.invoiceID}">
                                            <input type="submit" value="View Detail">
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>  
                </c:if>
            </div>
        </div>
        <script src="js/manager.js" type="text/javascript"></script>
    </body>
</html>