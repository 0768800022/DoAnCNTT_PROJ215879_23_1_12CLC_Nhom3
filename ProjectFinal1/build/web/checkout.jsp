<%-- Document : cart Created on : Nov 7, 2023, 4:08:47 PM Author : nguye --%>
<%@page import="java.util.ArrayList" %>
<%--<%@page import="entity.Product" %>--%>
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
            <div class="single-checkout">
                <div class="container">
                    <div class="wrapper">
                        <div class="checkout flexwrap">
                            <div class="item left styled">
                                <h1>Shipping Address</h1>
                                <form action="">
                                    <p>
                                        <label for="email">Email Address <span></span></label>
                                        <input type="email" name="email" id="email" value="${sessionScope.acc.email}" autocomplete="off" required>
                                    </p>
                                    <p>
                                        <label for="fname">First Name <span></span></label>
                                        <input type="text" id="fname" value="${sessionScope.acc.firstName}" required>
                                    </p>
                                    <p>
                                        <label for="lname">Last Name <span></span></label>
                                        <input type="text" id="lname" value="${sessionScope.acc.lastName}" required>
                                    </p>
                                    <p>
                                        <label for="phone">Phone Number <span></span></label>
                                        <input type="number" id="phone" value="${sessionScope.acc.phoneNumber}" required>
                                    </p>
                                    <p>
                                        <label for="adress">Street Address <span></span></label>
                                        <input type="text" id="adress" value="${sessionScope.acc.address}" required>
                                    </p>
                                    <p>
                                        <label for="city">City <span></span></label>
                                        <input type="text" id="city" value="${sessionScope.acc.city}" required>
                                    <p>
                                        <label for="province">Province <span></span></label>
                                        <input type="text" id="province" value="${sessionScope.acc.province}" required>
                                    </p>
                                </form>
                                <div class="primary-checkout">
                                    <form action="checkout" method="post">
                                                
                                    <input type="hidden" name="action" value="checkout">
                                    <button class="primary-button">Place Order</button>
                                               
                                </form>   
                                </div>
                                     
                            </div>
                            <div class="item right">
                                <h2>Order Summary</h2>
                                <div class="summary-order is_sticky">
                                    <div class="summary-totals">
                                        <ul>
                                            <li>
                                                <span>Total</span>
                                                <strong>${cart.totalPrice}</strong>
                                            </li>
                                        </ul>
                                    </div>
                                    <ul class="products mini">
                                        <c:set var="cart" value="${sessionScope.cart}" />
                                        <c:set var="t" value="0" />
                                        <c:forEach var="item" items="${cart.items}">
                                        <c:set var="t" value="${t+1}" />  
                                        <li class="item">
                                            <div class="thumbnail object-cover">
                                                <img src="${item.product.productImage}" alt="">
                                            </div>
                                            <div class="item-content">
                                                <p>${item.product.productName}</p>
                                                <span class="price">
                                                    <span>${item.product.productPrice}</span>
                                                    <span>${item.quantity}</span>
                                                </span>
                                            </div>
                                        </li>

                                    </c:forEach>
                                    </ul>
                                </div>
                            </div>
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
    <script src="script.js"></script>
    <script>
        const FtoShow = '.filter'
        const Fpopup = document.querySelector(FtoShow)
        const Ftrigger = document.querySelector('.filter-trigger')

        Ftrigger.addEventListener('click', () => {
            setTimeout(() => {
                if(!Fpopup.classList.contains('show')) {
                    Fpopup.classList.add('show')
                }
            }, 250)
        })
        document.addEventListener('click', (e) => {
            const isCloset = e.target.closest(FtoShow)
            if(!isCloset && Fpopup.classList.contains('show')) {
                Fpopup.classList.remove('show')
            }
        })
    </script>
</body>
</html>