<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <div id="page" class="site page-single">
            <jsp:include page="header.jsp"></jsp:include>
                <main>
                    <div class="single-product">
                        <div class="container">
                            <div class="wrapper">
                                <div class="column">
                                    <div class="products one">
                                        <div class="flexwrap">
                                            <div class="row">
                                                <div class="item is_sticky">
                                                    <div class="price">
                                                        <span class="discount">32%<br>OFF</span>
                                                    </div>
                                                    <div class="big-image">
                                                        <div class="big-image-wrapper swiper-wrapper">

                                                            <div class="image-show swiper-slide">
                                                                <a data-fslightbox href="assets/products/shoe1.jpg"><img
                                                                        src="${detail.productImage}" alt=""></a>
                                                        </div>
                                                        <div class="image-show swiper-slide">
                                                            <a data-fslightbox href="assets/products/shoe1-1.jpg"><img
                                                                    src="assets/products/shoe1-1.jpg" alt=""></a>
                                                        </div>
                                                        <div class="image-show swiper-slide">
                                                            <a data-fslightbox href="assets/products/shoe1-2.jpg"><img
                                                                    src="assets/products/shoe1-2.jpg" alt=""></a>
                                                        </div>
                                                        <div class="image-show swiper-slide">
                                                            <a data-fslightbox href="assets/products/shoe1-3.jpg"><img
                                                                    src="assets/products/shoe1-3.jpg" alt=""></a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="item">
                                                <h1>${detail.productName}</h1>
                                                <h2>Description</h2>
                                                <p>${detail.productDescription}</p>
                                                <div class="content">
                                                    <div class="rating">
                                                        <div class="stars"></div>
                                                        <a href="#" class="mini-text">2.251 reviews</a>
                                                        <a href="#" class="add-review mini-text">Add Your Review</a>
                                                    </div>
                                                    <div class="stock-sku">
                                                        <span class="available">In Stock</span>
                                                        <span class="sku mini-text">SKU-881</span>
                                                    </div>
                                                    <div class="price">
                                                        <span class="current">${detail.productPrice}</span>
                                                    </div>
                                                    <div class="actions">
<!--                                                        <div class="qty-control flexitem">
                                                            <button class="minus circle">-</button>
                                                            <input type="text" value="1">
                                                            <button class="plus circle">+</button>
                                                        </div>-->
                                                        <form action="cart" method="post" class="button-cart">
                                                            <!--                                                            <input type="hidden" name="action" value="update">-->
                                                            <input type="hidden" name="productId" value="${detail.productId}">
<!--                                                            <input type=text name="quantity" value="<c:out value='${item.quantity}'/>" id="quantity">-->
                                                            <button class="primary-button">Add to cart</button>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
            </main>
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
