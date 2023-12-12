<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@page contentType="text/html" pageEncoding="UTF-8"%>--%>
<%@ page import="java.util.List" %>
<%@ page import="project.business.Product" %>
<%@ page import="project.data.UserDB" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Home</title>
        <link rel="stylesheet" href="styles/style.css">
        <link href="https://cdn.jsdelivr.net/npm/remixicon@3.5.0/fonts/remixicon.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <style>
            .primary-button{
                display: inline-block;
                outline: none;
                border: none;
                cursor: pointer;
            }
        </style>
        <!--    <script>
                // Function to load products and features when the page is ready
                $(document).ready(function () {
                    loadFeatures();
                });
        
                // Function to send an AJAX request to load features
                // Function to load features when the page is ready
                function loadFeatures() {
                    $.ajax({
                        type: "GET",
                        url: "home", // URL of your HomeServlet
                        dataType: "html",
                        success: function (response) {
                            // Extract the content within the features section from the response
                            var featuresContent = $(response).find('.features').html();
        
                            // Update the content of the features container with the new data
                            $(".features").html(featuresContent);
        
                            // Initialize Swiper after loading features
                            var swiper = new Swiper('.swiper-container', {
                                // Swiper configuration options
                                slidesPerView: 3,
                                spaceBetween: 10,
                                loop: true,
                                pagination: {
                                    el: '.swiper-pagination',
                                    clickable: true,
                                },
                                navigation: {
                                    nextEl: '.swiper-button-next',
                                    prevEl: '.swiper-button-prev',
                                },
                            });
                        },
                        error: function (error) {
                            console.log("Error loading features: " + error);
                        }
                    });
        }
            </script>-->
    </head>
    <body>
        <div id="page" class="site page-home">
            <aside class="site-off desktop-hide">
                <div class="off-canvas">
                    <div class="canvas-head flexitem">
                        <div class="logo"><a href="home.jsp"><span class="circle">.Store</span></a></div>
                        <a href="home.jsp" class="t-close flexcenter"><i class="ri-close-line"></i></a>
                    </div>
                    <div class="departments"></div>
                    <nav></nav>
                    <div class="thetop-nav"></div>
                </div>
            </aside>

            <header>
                <div class="header-top mobile-hide">
                    <div class="container">
                        <div class="wrapper flexitem">
                            <div class="left">
                                <ul class="flexitem main-links">
                                    <li><a href="#">Welcome to our store!</a></li>
                                </ul>
                            </div>
                            <div class="right">
                                <ul class="flexitem main-links">
                                    <c:choose>
                                        <c:when test="${sessionScope.accc != null}">
                                            <!-- Additional admin-only links -->
                                            <li class="nav-item">
                                                <a class="nav-link" href="ManagerProduct.jsp">Manager Product</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="ManagerAccount.jsp">Manager Account</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="#">Hello, ${sessionScope.accc.email}</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="logout">Logout</a>
                                            </li>
                                            <li><a href="invoice?action=admin">Order Tracking</a></li>
                                            </c:when>


                                        <c:when test="${sessionScope.acc != null}">
                                            <li class="nav-item">
                                                <a class="nav-link" href="changeInfor?action=display_user&amp;email=${sessionScope.acc.email}">My Account</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="#">Hello, ${sessionScope.acc.email}</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="logout">Logout</a>
                                            </li>
                                            <li><a href="invoice?action=account">Order Tracking</a></li>
                                            </c:when>

                                        <c:otherwise>
                                            <li class="nav-item">
                                                <a class="nav-link" href="./register.jsp">Sign up</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="./login.jsp">Login</a>
                                            </li>
                                        </c:otherwise>
                                    </c:choose>

                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- header-top -->
                <div class="header-nav">
                    <div class="container">
                        <div class="wrapper flexitem">
                            <a href="#" class="trigger desktop-hide"><span class="i ri-menu-2-line"></span></a>
                            <div class="left flexitem">
                                <div class="logo"><a href="/"><span class="circle">.Store</span></a></div>
                                <nav class="mobile-hide">
                                    <ul class="flexitem second-links">
                                        <li><a href="home">Home</a></li>
                                        <li><a href="#">Shop</a></li>
                                        <li class="has-child">
                                            <a href="#">Women
                                                <div class="icon-small"><i class="ri-arrow-down-s-line"></i></div>
                                            </a>
                                            <div class="mega">
                                                <div class="container">
                                                    <div class="wrapper">
                                                        <div class="flexcol">
                                                            <div class="row">
                                                                <h4>Women's Clothing</h4>
                                                                <ul>
                                                                    <li><a href="#">Dresses</a></li>
                                                                    <li><a href="#">Tops & Tees</a></li>
                                                                    <li><a href="#">Jackets & Coats</a></li>
                                                                    <li><a href="#">Pants & Capris</a></li>
                                                                    <li><a href="#">Sweaters</a></li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <div class="flexcol">
                                                            <div class="row">
                                                                <h4>Jewelry</h4>
                                                                <ul>
                                                                    <li><a href="#">Accessories</a></li>
                                                                    <li><a href="#">Bags & Purses</a></li>
                                                                    <li><a href="#">Rings</a></li>
                                                                    <li><a href="#">Body Jewelry</a></li>
                                                                    <li><a href="#">Earrings</a></li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <div class="flexcol">
                                                            <div class="row">
                                                                <h4></h4>
                                                                <ul>
                                                                    <li><a href="#">Accessories</a></li>
                                                                    <li><a href="#">Bags & Purses</a></li>
                                                                    <li><a href="#">Rings</a></li>
                                                                    <li><a href="#">Body Jewelry</a></li>
                                                                    <li><a href="#">Earrings</a></li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <div class="flexcol">
                                                            <div class="row">
                                                                <h4>Top Brands</h4>
                                                                <ul class="women-brands">
                                                                    <li><a href="#">Nike</a></li>
                                                                    <li><a href="#">Adidas</a></li>
                                                                    <li><a href="#">H&M</a></li>
                                                                    <li><a href="#">Louis Vuitton</a></li>
                                                                    <li><a href="#">Gucci</a></li>
                                                                </ul>
                                                                <a href="#" class="view-all">View ALl Brand <i
                                                                        class="ri-arrow-right-line"></i></a>
                                                            </div>
                                                        </div>
                                                        <div class="flexcol products">
                                                            <div class="row">
                                                                <div class="media">
                                                                    <div class="thumbnail object-cover">
                                                                        <a href="#">
                                                                            <img src="assets/products/apparel4.jpg" alt="">
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                                <div class="text-content">
                                                                    <h4>Most wanted</h4>
                                                                    <a href="#" class="primary-button">Order Now</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li><a href="#">Men</a></li>
                                        <li>
                                            <a href="#">Sports
                                                <div class="fly-item"><span>New!</span></div>
                                            </a>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                            <div class="right">
                                <ul class="flexitem second-links">
                                    <li class="mobile-hide"><a href="#">
                                            <div class="icon-large"><i class="ri-heart-line"></i></div>
                                            <div class="fly-item"><span class="item-number">0</span></div>
                                        </a></li>
                                    <li><a href="cart.jsp" class="iscart">
                                            <div class="icon-large">
                                                <i class="ri-shopping-cart-line"></i>
                                                <div class="fly-item"><span class="item-number">(${size})</span></div>
                                            </div>
                                            <div class="icon-text">
                                                <div class="mini-text">Total</div>
                                                <div class="cart-total">$${cart.totalPrice}</div>
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="header-main mobile-hide">
                    <div class="container">
                        <div class="wrapper flexitem">
                            <div class="left">
                                <div class="dpt-cat">
                                    <div class="dpt-head">
                                        <div class="main-text">All Departments</div>
                                        <mini-text class="mini-text mobile-hide">Total 1059 Products</mini-text>
                                        <a href="#" class="dpt-trigger mobile-hide">
                                            <i class="ri-menu-3-line ri-xl"></i>
                                        </a>
                                    </div>
                                    <div class="dpt-menu">
                                        <ul class="second-links">
                                            <li class="has-child beauty">
                                                <a href="#">
                                                    <div class="icon-large"><i class="ri-bear-smile-line"></i></div>
                                                    Beauty
                                                    <div class="icon-small"><i class="ri-arrow-right-s-line"></i></div>
                                                </a>
                                                <ul>
                                                    <li><a href="#">Makeup</a></li>
                                                    <li><a href="#">Skin Care</a></li>
                                                    <li><a href="#">Hair Care</a></li>
                                                    <li><a href="#">Fragrance</a></li>
                                                    <li><a href="#">Foot & Hand Care</a></li>
                                                    <li><a href="#">Tools & Accessories</a></li>
                                                    <li><a href="#">Shave & Hair Removal</a></li>
                                                    <li><a href="#">Personal Care</a></li>
                                                </ul>
                                            </li>

                                            <li class="has-child fashion">
                                                <a href="#">
                                                    <div class="icon-large"><i class="ri-t-shirt-air-line"></i></div>
                                                    Women's Fashion
                                                    <div class="icon-small"><i class="ri-arrow-right-s-line"></i></div>
                                                </a>
                                                <ul>
                                                    <li><a href="#">Clothing</a></li>
                                                    <li><a href="#">Shoes</a></li>
                                                    <li><a href="#">Jewelry</a></li>
                                                    <li><a href="#">Watches</a></li>
                                                    <li><a href="#">HandBags</a></li>
                                                </ul>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <div class="icon-large"><i class="ri-shirt-line"></i></div>
                                                    Men's Fashion
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <div class="icon-large"><i class="ri-user-5-line"></i></div>
                                                    Girl's Fashion
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <div class="icon-large"><i class="ri-user-6-line"></i></div>
                                                    Boy's Fashion
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <div class="icon-large"><i class="ri-basketball-line"></i></div>
                                                    Sports
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="right">
                                <div class="search-box">
                                    <form action="search" class="search" method="post">
                                        <span class="icon-large"><i class="ri-search-line"></i></span>
                                        <input oninput="searchByName(this)" type="search" value="${txtS}"  name="txt" placeholder="Search for products">
                                        <button type="submit" name="action">Search</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </header>
            <!-- Header -->

            <main>
                <div class="slider">
                    <div class="container">
                        <div class="wrapper">
                            <div class="myslider swiper">
                                <div class="swiper-wrapper">
                                    <div class="swiper-slide">
                                        <div class="item">
                                            <div class="image object-cover">
                                                <img src="assets/slider/slider0.jpg" alt="">
                                            </div>
                                            <div class="text-content flexcol">
                                                <h4>Shoes Fashion</h4>
                                                <h2><span>Come and Get it!</span><br><span>Brand New Shoes</span></h2>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="swiper-slide">
                                        <div class="item">
                                            <div class="image object-cover">
                                                <img src="assets/slider/slider1.jpg" alt="">
                                            </div>
                                            <div class="text-content flexcol">
                                                <h4>Quick Fashion</h4>
                                                <h2><span>Fit Your Wardrobe</span><br><span>Brand New Shoes</span></h2>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="swiper-slide">
                                        <div class="item">
                                            <div class="image object-cover">
                                                <img src="assets/slider/slider2.jpg" alt="">
                                            </div>
                                            <div class="text-content flexcol">
                                                <h4>Quick Offer</h4>
                                                <h2><span>Wooden Minimal Spfa</span><br><span>Brand New Shoes</span></h2>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="swiper-slide">
                                        <div class="item">
                                            <div class="image object-cover">
                                                <img src="assets/slider/slider3.jpg" alt="">
                                            </div>
                                            <div class="text-content flexcol">
                                                <h4>Best Deal</h4>
                                                <h2><span>Home Workout Accessories</span><br><span>Brand New Shoes</span>
                                                </h2>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="swiper-pagination"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Slider -->

                <div class="brands">
                    <div class="container">
                        <div class="wrapper flexitem">
                            <div class="item">
                                <a href="#">
                                    <img src="assets/brands/zara.png" alt="">
                                </a>
                            </div>
                            <div class="item">
                                <a href="#">
                                    <img src="assets/brands/samsung.png" alt="">
                                </a>
                            </div>
                            <div class="item">
                                <a href="#">
                                    <img src="assets/brands/oppo.png" alt="">
                                </a>
                            </div>
                            <div class="item">
                                <a href="#">
                                    <img src="assets/brands/asus.png" alt="">
                                </a>
                            </div>
                            <div class="item">
                                <a href="#">
                                    <img src="assets/brands/hurley.png" alt="">
                                </a>
                            </div>
                            <div class="item">
                                <a href="#">
                                    <img src="assets/brands/dng.png" alt="">
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Brands -->
                <!-- Trending -->
                <!-- Featured products-->
                <div class="features">
                    <div class="container">
                        <div class="wrapper">
                            <div class="column">
                                <div class="sectop flexitem">
                                    <h2><span class="circle"></span><span>Featured Products</span></h2>
                                </div>
                                <div class="products main flexwrap" id="productsContainer">
                                    <c:forEach items="${products}" var="product">
                                        <!--<a href="home?action=display_products">-->
                                        <div class="item">
                                            <div class="media">
                                                <div class="thumbnail object-cover">
                                                    <a href="#">
                                                        <img src="${product.productImage}" alt="">
                                                    </a>
                                                </div>
                                                <div class="hoverable">
                                                    <ul>
                                                        <li class="active"><a href="#"><i class="ri-heart-line"></i></a></li>
                                                        <li><a href="#"><i class="ri-eye-line"></i></a></li>
                                                        <li><a href="#"><i class="ri-shuffle-line"></i></a></li>
                                                    </ul>
                                                </div>
                                                
                                            </div>
                                            <div class="content">
                                                <div class="rating">
                                                    <div class="stars"></div>
                                                    <span class="mini-text">(2.548)</span>
                                                </div>

                                                <h3 class="main-links"><a href="DetailProductServlet?productId=${product.productId}">${product.productName}</a> 
                                                </h3> 
                                                <h4>${product.productDescription}</h4>

                                                <div class="price">
                                                    <span class="current">${product.productPrice}</span>
                                                    
                                                </div>
                                            </div>
                                            <td><form action="cart" method="post" class="button-cart">
                                                    <input type="hidden" name="productId" value="${product.productId}">
                                                    <button class="primary-button">Add to cart</button>
                                                </form></td>

                                        </div>
                                        <!--</a>-->
                                    </c:forEach>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="banners">
                    <div class="container">
                        <div class="wrapper">
                            <div class="column">
                                <div class="banner flexwrap">
                                    <div class="row">
                                        <div class="item">
                                            <div class="image">
                                                <img src="assets/banner/banner1.jpg" alt="">
                                            </div>
                                            <div class="text-content flexcol">
                                                <h4>Brutal Sale!</h4>
                                                <h3><span>Get the deal in here</span><br>Living Room Chair</h3>
                                            </div>
                                            <a href="#" class="over-link"></a>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="item get-gray">
                                            <div class="image">
                                                <img src="assets/banner/banner2.jpg" alt="">
                                            </div>
                                            <div class="text-content flexcol">
                                                <h4>Brutal Sale!</h4>
                                                <h3><span>Discount everyday</span><br>Office Outfit</h3>
                                            </div>
                                            <a href="#" class="over-link"></a>
                                        </div>
                                    </div>
                                </div>
                                <!-- banners -->

                                <div class="products-categories flexwrap">
                                    <div class="row">
                                        <div class="item">
                                            <div class="image">
                                                <img src="assets/banner/procat1.jpg" alt="">
                                            </div>
                                            <div class="content mini-links">
                                                <h4>Beauty</h4>
                                                <ul class="flexcol">
                                                    <li><a href="#">Makeup</a></li>
                                                    <li><a href="#">Skin Care</a></li>
                                                    <li><a href="#">Hair Care</a></li>
                                                    <li><a href="#">Fragrance</a></li>
                                                    <li><a href="#">Foot & Hand Care</a></li>
                                                </ul>
                                                <div class="second-links">
                                                    <a href="#" class="view-all">View All<i
                                                            class="ri-arrow-right-line"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="item">
                                            <div class="image">
                                                <a href="#">
                                                    <img src="assets/banner/procat2.jpg" alt="">
                                                </a>
                                            </div>
                                            <div class="content mini-links">
                                                <h4><a href="#">Gatdets</a></h4>
                                                <ul class="flexcol">
                                                    <li><a href="#">Camera</a></li>
                                                    <li><a href="#">Cell Phones</a></li>
                                                    <li><a href="#">Computers</a></li>
                                                    <li><a href="#">GPS & Navigation</a></li>
                                                    <li><a href="#">Headphone</a></li>
                                                </ul>
                                                <div class="second-links">
                                                    <a href="#" class="view-all">View All<i
                                                            class="ri-arrow-right-line"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="item">
                                            <div class="image">
                                                <a href="#">
                                                    <img src="assets/banner/procat3.jpg" alt="">
                                                </a>
                                            </div>
                                            <div class="content mini-links">
                                                <h4><a href="#">Gatdets</a></h4>
                                                <ul class="flexcol">
                                                    <li><a href="#">Camera</a></li>
                                                    <li><a href="#">Cell Phones</a></li>
                                                    <li><a href="#">Computers</a></li>
                                                    <li><a href="#">GPS & Navigation</a></li>
                                                    <li><a href="#">Headphone</a></li>
                                                </ul>
                                                <div class="second-links">
                                                    <a href="#" class="view-all">View All<i
                                                            class="ri-arrow-right-line"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Banners -->


            </main>
            <!-- Main -->

            <footer>
                <div class="newsletter">
                    <div class="container">
                        <div class="wrapper">
                            <div class="box">
                                <div class="content">
                                    <h3>Join Our Newsletter</h3>
                                    <p>Get E-mail updates about our latest shop and <strong>special offers</strong></p>
                                </div>
                                <form action="" class="search">
                                    <span class="icon-large"><i class="ri-mail-line"></i></span>
                                    <input type="mail" placeholder="Your Email Address" required>
                                    <button type="submit">Sign Up</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- newsletter -->

                <div class="widgets">
                    <div class="container">
                        <div class="wrapper">
                            <div class="flexwrap">
                                <div class="row">
                                    <div class="item mini-links">
                                        <h4>Help & Contact</h4>
                                        <ul class="flexcol">
                                            <li><a href="#">Your Account</a></li>
                                            <li><a href="#">Your Orders</a></li>
                                            <li><a href="#">Shipping Rates</a></li>
                                            <li><a href="#">Returns</a></li>
                                            <li><a href="#">Assistant</a></li>
                                            <li><a href="#">Help</a></li>
                                            <li><a href="#">Contact us</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="item mini-links">
                                        <h4>Product Categories</h4>
                                        <ul class="flexcol">
                                            <li><a href="#">Beauty</a></li>
                                            <li><a href="#">Electronic</a></li>
                                            <li><a href="#">Sports</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="item mini-links">
                                        <h4>Payment Info</h4>
                                        <ul class="flexcol">
                                            <li><a href="#">Bussiness Card</a></li>
                                            <li><a href="#">Shop with Points</a></li>
                                            <li><a href="#">Reload Your Balance</a></li>
                                            <li><a href="#">Paypal</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="item mini-links">
                                        <h4>About Us</h4>
                                        <ul class="flexcol">
                                            <li><a href="#">Company Info</a></li>
                                            <li><a href="#">News</a></li>
                                            <li><a href="#">Investors</a></li>
                                            <li><a href="#">Careers</a></li>
                                            <li><a href="#">Customer reviews</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- widgets -->

                <div class="footer-info">
                    <div class="container">
                        <div class="wrapper">
                            <div class="flexcol">
<!--                                <div class="logo">
                                    <a href="#"><span class="circle"></span>.Store</a>
                                </div>-->
                                <div class="socials">
                                    <ul class="flexitem">
                                        <li><a href="#"><i class="ri-twitter-line"></i></a></li>
                                        <li><a href="#"><i class="ri-facebook-line"></i></a></li>
                                        <li><a href="#"><i class="ri-instagram-line"></i></a></li>
                                        <li><a href="#"><i class="ri-linkedin-line"></i></a></li>
                                        <li><a href="#"><i class="ri-youtube-line"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                            <p class="mini-text">Copyright 2023 @ .Store. All right reserved.</p>
                        </div>
                    </div>
                </div>
                <!-- footer-info -->

            </footer>
            <!-- Footer -->

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
                                    <a href="#0">
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
        <script src="js/script.js"></script>
        <script type="text/javascript">
            function add(productId) {
                document.Add
            }
        </script>
    </body>

</html>