<%@page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="styles/style.css">
        <link href="https://cdn.jsdelivr.net/npm/remixicon@3.5.0/fonts/remixicon.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
    </head>

    <body>
        <div id="page" class="site page-cart">
            <jsp:include page="header.jsp"></jsp:include>
                <main>
                    <div class="single-cart">
                        <div class="container">
                            <div class="wrapper">
                                <div class="page-title">
                                    <h1>Shopping Cart</h1>
                                </div>
                                <div class="products one cart">
                                <c:if test="${cart != null }">
                                    <div class="flexwrap">
                                        <div class="item">
                                            <table id="cart-table">
                                                <thead>
                                                    <tr>
                                                        <th>No</th>
                                                        <th>Item</th>
                                                        <th>Price</th>
                                                        <th>Qty</th>
                                                        <th>Subtotal</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:set var="cart" value="${sessionScope.cart}" />
                                                    <c:set var="t" value="0" />
                                                    <c:forEach var="item" items="${cart.items}">
                                                        <c:set var="t" value="${t+1}" />    
                                                        <tr>
                                                            <td>${t}</td>
                                                            <td class="flexitem">
                                                                <div class="thumbnail object-cover">
                                                                    <a href="#"><img src="${item.product.productImage}" alt=""></a>
                                                                </div>
                                                                <div class="content">
                                                                    <strong><a href="#">${item.product.productName}</a></strong>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <fmt:formatNumber value="${item.product.productPrice}" type="currency" currencySymbol="$" />
                                                            </td>
                                                            <td>
                                                                <a href="process?num=-1&productId=${item.product.productId}">-</a>${item.quantity}<a href="process?num=1&productId=${item.product.productId}">+</a>
                                                            </td>
                                                            <td>
                                                                <fmt:formatNumber value="${item.total}" type="currency" currencySymbol="$" />
                                                            </td>
                                                            <td>
                                                                <form action="process" method="post">
                                                                    <input type="hidden" name="productId" value="${item.product.productId}" >
                                                                    <input type="submit" value="Remove" >
                                                                </form>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="cart-summary styled">
                                            <div class="item">
                                                <div class="coupon">
                                                    <input type="text" placeholder="Enter coupon">
                                                    <button>Apply</button>
                                                </div>
                                                <div class="cart-total">
                                                    <table>
                                                        <tbody>
                                                            <tr>
                                                                <th>Subtotal</th>
                                                                <td>${cart.totalPrice}</td>
                                                            </tr>
                                                            <tr class="grand-total">
                                                                <th>TOTAL</th>
                                                                <td><strong># ${cart.totalPrice}</strong></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                    <a href="./checkout.jsp" class="secondary-button">
                                                        <input type="hidden" name="action" value="checkout">
                                                        Checkout
                                                    </a> 
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>

                                <c:if test="${cart == null }">
                                    <div class="cartnull">
                                        <div class="snlrc5 --3Iu+">
                                            <div class="background"></div>
                                            <div class="title">Giỏ hàng của bạn còn trống</div>
                                            <a href="./home.jsp" class="image">
                                                <button class="button-solid button-primary">
                                                    <span class="buy">MUA NGAY</span>
                                                </button>
                                            </a>
                                        </div>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
            <!-- Main -->
            <jsp:include page="footer.jsp"></jsp:include>

            <div class="menu-bottom desktop-hide">
                <div class="container">
                    <div class="wrapper">
                        <nav>
                            <ul class="flexitem">
                                <li>
                                    <a href="#">
                                        <i class="ri-bar-chart-line"></i>
                                        <span>Trending</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <i class="ri-user-6-line"></i>
                                        <span>Account</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <i class="ri-heart-line"></i>
                                        <span>Wishlist</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="#0" class="t-search">
                                        <i class="ri-search-line"></i>
                                        <span>Search</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="#0" class="cart-trigger">
                                        <i class="ri-shopping-cart-line"></i>
                                        <span>Cart</span>
                                        <div class="fly-item">
                                            <span class="item-number">0</span>
                                        </div>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
            <!-- Menu bottom -->
            <div class="search-bottom desktop-hide">
                <div class="container">
                    <div class="wrapper">
                        <form action="" class="search">
                            <a href="#" class="t-close search-close flexcenter"><i class="ri-close-line"></i></a>
                            <span class="icon-large"><i class="ri-search-line"></i></span>
                            <input type="search" placeholder="Your Email Address" required>
                            <button type="submit">Search</button>
                        </form>
                    </div>
                </div>
            </div>
            <!-- search bottom -->
            <div class="overlay"></div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/fslightbox/3.3.1/index.js"></script>
        <script src="js/script.js"></script>
        <script>
            const FtoShow = '.filter'
            const Fpopup = document.querySelector(FtoShow)
            const Ftrigger = document.querySelector('.filter-trigger')

            Ftrigger.addEventListener('click', () => {
                setTimeout(() => {
                    if (!Fpopup.classList.contains('show')) {
                        Fpopup.classList.add('show')
                    }
                }, 250)
            })
            document.addEventListener('click', (e) => {
                const isCloset = e.target.closest(FtoShow)
                if (!isCloset && Fpopup.classList.contains('show')) {
                    Fpopup.classList.remove('show')
                }
            })
        </script>
    </body>
</html>