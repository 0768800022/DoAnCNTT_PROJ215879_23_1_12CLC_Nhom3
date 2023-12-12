<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    .banner {
        position: relative;
        overflow: hidden;
        height: 500px;
    }

    .banner-image {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        opacity: 0;
        transition: opacity 0.5s ease;
    }

    .banner-image.active {
        opacity: 1;
    }
    .logo{
        width: 80px;
        border-radius: 30%;
    }
</style>
<aside class="site-off desktop-hide">
    <div class="off-canvas">
        <div class="canvas-head flexitem">
            <div class="logo"><a href="home.jsp"><span class="circle">.Store</span></a></div>
            <a href="./home.jsp" class="t-close flexcenter"><i class="ri-close-line"></i></a>
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
                    <div class="logo"><a href="./home.jsp"><span class="circle">.Store</span></a></div>
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
                        <form action="" class="search">
                            <span class="icon-large"><i class="ri-search-line"></i></span>
                            <input type="search" placeholder="Search for products">
                            <button type="submit">Search</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Header -->