
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Image Slideshow</title>
    <style>
        /* Basic reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Slideshow container */
        .slideshow-container {
            max-width: 100%;
            position: relative;
            margin: auto;
        }

        /* Hide the images by default */
        .mySlides {
            display: none;
        }

        /* Next & previous buttons */
        .prev, .next {
            cursor: pointer;
            position: absolute;
            top: 50%;
            width: auto;
            margin-top: -22px;
            padding: 16px;
            color: white;
            font-weight: bold;
            font-size: 18px;
            transition: 0.6s ease;
            border-radius: 0 3px 3px 0;
            user-select: none;
        }

        /* Position the "next button" to the right */
        .next {
            right: 0;
            border-radius: 3px 0 0 3px;
        }

        /* On hover, add a black background color with a little bit see-through */
        .prev:hover, .next:hover {
            background-color: rgba(0, 0, 0, 0.8);
        }

        /* Caption text */
        .text {
            color: #f2f2f2;
            font-size: 15px;
            padding: 8px 12px;
            position: absolute;
            bottom: 8px;
            width: 100%;
            text-align: center;
        }

        /* Number text (1/3 etc) */
        .numbertext {
            color: #f2f2f2;
            font-size: 12px;
            padding: 8px 12px;
            position: absolute;
            top: 0;
        }

        /* The dots/bullets/indicators */
        .dot {
            cursor: pointer;
            height: 15px;
            width: 15px;
            margin: 0 2px;
            background-color: #bbb;
            border-radius: 50%;
            display: inline-block;
            transition: background-color 0.6s ease;
        }

        .active, .dot:hover {
            background-color: #717171;
        }

        /* Fading animation */
        .fade {
            animation-name: fade;
            animation-duration: 1.5s;
        }

        @keyframes fade {
            from {opacity: .4}
            to {opacity: 1}
        }

        iframe {
            width: 100%;
            height: 80px; /* Match header height */
            border: none;
        }

        .products-section {
            text-align: center;
            background: #f9f9f9;
            padding: 50px 20px;
        }

        .section-title {
            font-size: 42px;
            color: #333;
            margin-bottom: 30px;
        }

        .products-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 40px;
            max-width: 1200px;
            margin: auto;
        }

        .product-card {
            background: white;
            border-radius: 20px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease-in-out;
            text-align: center;
        }

        .product-card img {
            width: 80px;
            height: 80px;
            margin-bottom: 15px;
        }

        .product-card h2 {
            font-size: 22px;
            color: #444;
            margin-bottom: 10px;
        }

        .product-card p {
            font-size: 14px;
            color: #666;
        }

        .learn-more {
            display: inline-block;
            margin-top: 10px;
            padding: 10px 20px;
            border: 1px solid #333;
            color: #333;
            text-decoration: none;
            border-radius: 5px;
            transition: all 0.3s ease;
        }

        .learn-more:hover {
            background: #333;
            color: white;
        }

        /* New Premium Experience Section */
        .premium-section {
            text-align: center;
            background: #f9f9f9;
            padding: 50px 20px;
        }

        .premium-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            max-width: 1200px;
            margin: auto;
        }

        .premium-card {
            border-radius: 20px;
            padding: 20px;
            text-align: center;
            background-size: cover;
            background-position: center;
            height: 600px;
            position: relative;
            color: white;
            display: flex;
            flex-direction: column;
            justify-content: flex-end;
            text-shadow: 2px 2px 10px rgba(0, 0, 0, 0.7);
        }


        .premium-card img {
            width: 100%;
            height: auto;
            margin-bottom: 15px;
        }

        .premium-card h2 {
            font-size: 26px;
            color: #ffffff;
            margin-bottom: 10px;
        }

        .premium-card p {
            font-size: 14px;
            color: #e7d6d6;
        }

        .premium-learn-more {
            display: inline-block;
            margin-top: 10px;
            padding: 10px 20px;
            border: 1px solid #333;
            color: #dedada;
            text-decoration: none;
            border-radius: 5px;
            transition: all 0.3s ease;
        }

        .premium-learn-more:hover {
            background: #333;
            color: white;
        }

        .faq-container {
            max-width: 1200px;
            margin: auto;
            text-align: left;
            
        }
        .faq-item {
            background: #eceaea;
            margin: 20px 0;
            border-radius: 40px;
            padding: 15px 50px;
            cursor: pointer;
            display: flex;
            justify-content: space-between;
            align-items: center;
            min-height: 80px;
            
        }
        .faq-item h3 {
            margin: 0;
            font-size: 18px;
        }
        .faq-answer {
            display: none;
            padding: 10px;
            font-size: 16px;
        }
        .plus {
            font-size: 24px;
            font-weight: bold;
            transition: transform 0.3s;
        }
        .rotate {
            transform: rotate(45deg);
        }

        .contact-container {
    display: flex;
    max-width: 80%; /* Increase width */
    background: #f9f9f9;
    border-radius: 20px;
    overflow: hidden;
    align-items: center; /* Aligns items vertically */
    padding: 20px;
    text-align: center;
    justify-content: center; 
    position: relative;
    margin: 50px auto; /* Center the container */
}

.contact-form {
    flex: 1;
    padding: 40px;
    background: #ededed;
    border-radius: 20px;
}

.contact-form h2 {
    margin-bottom: 20px;
}

.contact-form label {
    display: block;
    font-weight: bold;
    margin-top: 10px;
}

.contact-form input, .contact-form textarea {
    width: 100%;
    padding: 12px;
    margin-top: 5px;
    border: 1px solid #ccc;
    border-radius: 10px;
}

.contact-form textarea {
    height: 120px; /* Slightly larger textarea */
}

.send-button {
    display: block;
    width: 100%;
    padding: 12px;
    background: #bebebe;
    color: white;
    border: none;
    border-radius: 20px;
    margin-top: 15px;
    font-size: 16px;
    font-weight: bold;
    cursor: pointer;
}

.send-button:hover {
    background: #d7d8d9;
}

.contact-image {
    flex: 1;
    display: flex;
    justify-content: center;
    align-items: center;
    border-radius: 20px;
    padding: 20px;
}

.contact-image img {
    width: 100%;
    height: auto;
    max-height: 400px; /* Prevents it from getting too large */
    object-fit: cover;
    border-radius: 20px;
}

/* Responsive Adjustments */
@media (max-width: 900px) {
    .contact-container {
        flex-direction: column;
        text-align: center;
        align-items: flex-start;
    }
    
    .contact-image img {
        max-width: 100%;
        height: auto;
    }
}

/* Horizontal Scrollable Container */
.scrollable-container {
    display: flex;
    overflow-x: auto;
    scroll-behavior: smooth;
    padding: 20px 0;
    gap: 20px;
    max-width: 1200px;
    margin: 0 auto;
    /* Hide scrollbar for Chrome, Safari, and Opera */
    -ms-overflow-style: none; /* Internet Explorer and Edge */
}


.scrollable-container {
    display: flex;
    overflow-x: auto;
    scroll-behavior: smooth;
    padding: 20px 0;
    gap: 20px;
    max-width: 1200px;
    margin: 0 auto;
}

.scrollable-container::-webkit-scrollbar {
    height: 8px;
}

.scrollable-container::-webkit-scrollbar-thumb {
    background: #888;
    border-radius: 10px;
}

.scrollable-container::-webkit-scrollbar-track {
    background: #f1f1f1;
}

.scrollable-card {
    flex: 0 0 auto;
    width: 300px;
    background: white;
    border-radius: 20px;
    padding: 20px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    text-align: center;
}

.scrollable-card img {
    width: 100%;
    height: 200px;
    object-fit: cover;
    border-radius: 15px;
    margin-bottom: 15px;
}

.scrollable-card h2 {
    font-size: 20px;
    color: #333;
    margin-bottom: 10px;
}

.scrollable-card p {
    font-size: 14px;
    color: #666;
}

    </style>
</head>
<body>
   <jsp:include page="header.jsp" />


    <!-- Slideshow container -->
    <div class="slideshow-container">
        <!-- Full-width images with number and caption text -->
        <div class="mySlides fade">
            <div class="numbertext">1 / 3</div>
            <img src="sources/images/imgslider1.avif" style="width:100%; height: 50%;">
            <div class="text">Caption Text</div>
        </div>

        <div class="mySlides fade">
            <div class="numbertext">2 / 3</div>
            <img src="sources/images/imgslider2.webp" style="width:100%;height: 50%;">
            <div class="text">Caption Two</div>
        </div>

        <div class="mySlides fade">
            <div class="numbertext">3 / 3</div>
            <img src="sources/images/imgslider3.jpeg" style="width:100%;height: 50%;">
            <div class="text">Caption Three</div>
        </div>

        <!-- Next and previous buttons -->
        <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
        <a class="next" onclick="plusSlides(1)">&#10095;</a>
    </div>
    <br>

    <!-- The dots/circles -->
    <div style="text-align:center">
        <span class="dot" onclick="currentSlide(1)"></span>
        <span class="dot" onclick="currentSlide(2)"></span>
        <span class="dot" onclick="currentSlide(3)"></span>
    </div>

    
<section class="scrollable-section">
    <h1 class="section-title" style="text-align:center;">Explore More</h1>
    <div class="scrollable-container">
        <!-- Cards -->
        <div class="scrollable-card">
            <img src="sources/images/products/lp_1_a.png" alt="Card 1">
            <h2>High-Performance Desktops</h2>
            <p>Powerful desktops for gaming and productivity.</p>
        </div>
        <div class="scrollable-card">
            <img src="sources/images/card2.jpg" alt="Card 2">
            <h2>Ultra-Portable Laptops</h2>
            <p>Lightweight laptops for on-the-go professionals.</p>
        </div>
        <div class="scrollable-card">
            <img src="sources/images/card3.jpg" alt="Card 3">
            <h2>Gaming Accessories</h2>
            <p>Enhance your gaming experience with our accessories.</p>
        </div>
        <div class="scrollable-card">
            <img src="sources/images/card4.jpg" alt="Card 4">
            <h2>Smart Home Devices</h2>
            <p>Upgrade your home with the latest smart devices.</p>
        </div>
        <div class="scrollable-card">
            <img src="sources/images/card5.jpg" alt="Card 5">
            <h2>Monitors & Displays</h2>
            <p>Crystal-clear displays for work and entertainment.</p>
        </div>
    </div>
</section>
    <!-- New Premium Experience Section -->
    <section class="premium-section">
        <h1 class="section-title">Premium Experience</h1>
        
        <div class="premium-container">
            <div class="premium-card" style="background-image: url(sources/images/zenbook.jpeg);">
                
                <h2>Premium Desktops</h2>
                <p>Experience unparalleled performance with our premium desktops designed for professionals and enthusiasts.</p>
                <a href="#" class="premium-learn-more">Learn more</a>
            </div>
    
            <div class="premium-card" style="background-image: url(sources/images/mac-1.jpg);">
                
                <h2>Premium Laptops</h2>
                <p>Discover our range of premium laptops that combine power, portability, and style for the ultimate experience.</p>
                <a href="#" class="premium-learn-more">Learn more</a>
            </div>
    
            <div class="premium-card" style="background-image: url(sources/images/macbook2.jpeg);">
                
                <h2>Premium Accessories</h2>
                <p>Enhance your setup with our premium accessories designed to complement your high-end devices.</p>
                <a href="#" class="premium-learn-more">Learn more</a>
            </div>
    
            
        </div>
    </section>
    <section class="products-section">
        <h1 class="section-title">Laptops & Accessories</h1>
        
        <div class="products-container">
            <div class="product-card">
                <img src="https://assets.nicepagecdn.com/7af5dab4/6465582/images/2933190.png" alt="Desktops">
                <h2>Performance Desktops</h2>
                <p>Power meets efficiency. Explore our premium range of desktops built for work, gaming, and creativity.</p>
                <a href="#" class="learn-more">Learn more</a>
            </div>
    
            <div class="product-card">
                <img src="https://assets.nicepagecdn.com/7af5dab4/6465582/images/689396.png" alt="Laptops">
                <h2>Cutting-Edge Laptops</h2>
                <p>Portable, powerful, and stylish. Find the perfect laptop for your business, studies, or gaming needs.</p>
                <a href="#" class="learn-more">Learn more</a>
            </div>
    
            <div class="product-card">
                <img src="https://assets.nicepagecdn.com/7af5dab4/6465582/images/9848998.png" alt="Accessories">
                <h2>Essential Accessories</h2>
                <p>Enhance your setup. From keyboards to monitors, discover accessories that boost your productivity.</p>
                <a href="#" class="learn-more">Learn more</a>
            </div>
    
            <div class="product-card">
                <img src="https://assets.nicepagecdn.com/7af5dab4/6465582/images/5861186.png" alt="Tech Gadgets">
                <h2>Latest Tech Gadgets</h2>
                <p>Stay ahead of the curve. Shop smart devices and innovative gadgets that complement your lifestyle.</p>
                <a href="#" class="learn-more">Learn more</a>
            </div>
        </div>
    </section>
    <!-- Horizontal Scrollable Container Section -->


    <h1 style="text-align: center;">FAQs</h1>
    <div class="faq-container" id="faq">
        <div class="faq-item">
            <h3>How much do your desktops cost?</h3>
            <span class="plus">+</span>
        </div>
        <div class="faq-answer">Our desktops range from $500 to $3000, depending on specifications.</div>

        <div class="faq-item">
            <h3>What are the key features of your desktops?</h3>
            <span class="plus">+</span>
        </div>
        <div class="faq-answer">We offer high-performance processors, SSD storage, and top-tier graphics cards.</div>

        <div class="faq-item">
            <h3>Do you offer customization options?</h3>
            <span class="plus">+</span>
        </div>
        <div class="faq-answer">Yes! You can customize RAM, storage, and GPU to fit your needs.</div>

        <div class="faq-item">
            <h3>Do your desktops come with a warranty?</h3>
            <span class="plus">+</span>
        </div>
        <div class="faq-answer">All desktops come with a 1-year warranty. Extended plans available.</div>

        <div class="faq-item">
            <h3>What accessories do you recommend for desktops?</h3>
            <span class="plus">+</span>
        </div>
        <div class="faq-answer">We recommend mechanical keyboards, ergonomic mice, and dual monitors.</div>
    </div>

    <div class="contact-container">
        <div class="contact-form">
            <h2>We are here to help</h2>
            <label for="name">Name</label>
            <input type="text" id="name" placeholder="Enter your Name">
    
            <label for="email">Email</label>
            <input type="email" id="email" placeholder="Enter a valid email address">
    
            <label for="message">Message</label>
            <textarea id="message" placeholder="Enter your message"></textarea>
    
            <button class="send-button">SEND</button>
        </div>
        <div class="contact-image">
            <img src="sources/images/macbook.webp" alt="Workspace">
        </div>
    </div>


    <div id="fotter-placeholder">
        <!-- Fallback if fetch fails -->
        <iframe src="footer.jsp" style="width:100%; height:100px; border:none;"></iframe>
    </div>

    
    

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Fetch and insert the header content
            fetch('header.jsp')
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.text();
                })
                .then(data => {
                    // Insert the header content into the placeholder
                    document.getElementById('header-placeholder').innerHTML = data;
                })
                .catch(error => {
                    console.error('Error loading header:', error);
                    // If fetch fails, the iframe fallback will be used
                });
    
            // Fetch and insert the footer content
            fetch('footer.jsp')
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.text();
                })
                .then(data => {
                    // Insert the footer content into the placeholder
                    document.getElementById('fotter-placeholder').innerHTML = data;
                })
                .catch(error => {
                    console.error('Error loading footer:', error);
                    // If fetch fails, the iframe fallback will be used
                });
    
            // Slideshow functionality
            let slideIndex = 0;
            showSlides();
    
            function showSlides() {
                let i;
                let slides = document.getElementsByClassName("mySlides");
                let dots = document.getElementsByClassName("dot");
                for (i = 0; i < slides.length; i++) {
                    slides[i].style.display = "none";
                }
                slideIndex++;
                if (slideIndex > slides.length) { slideIndex = 1 }
                for (i = 0; i < dots.length; i++) {
                    dots[i].className = dots[i].className.replace(" active", "");
                }
                slides[slideIndex - 1].style.display = "block";
                dots[slideIndex - 1].className += " active";
                setTimeout(showSlides, 5000); // Change image every 5 seconds
            }
    
            function plusSlides(n) {
                showSlides(slideIndex += n);
            }
    
            function currentSlide(n) {
                showSlides(slideIndex = n);
            }
    
            // Fade-in functionality for product and premium cards
            const productCards = document.querySelectorAll(".product-card");
            const premiumCards = document.querySelectorAll(".premium-card");
    
            function fadeInElements() {
                productCards.forEach((card, index) => {
                    const rect = card.getBoundingClientRect();
                    if (rect.top < window   .innerHeight - 50) {
                        setTimeout(() => {
                            card.style.opacity = "1";
                            card.style.transform = "scale(1)";
                        }, index * 150);
                    }
                });
    
                premiumCards.forEach((card, index) => {
                    const rect = card.getBoundingClientRect();
                    if (rect.top < window.innerHeight - 50) {
                        setTimeout(() => {
                            card.style.opacity = "1";
                            card.style.transform = "scale(1)";
                        }, index * 150);
                    }
                });
            }
    
            fadeInElements(); // Run on page load
            window.addEventListener("scroll", fadeInElements); // Run on scroll
        });

        document.querySelectorAll(".faq-item").forEach(item => {
            item.addEventListener("click", function () {
                let answer = this.nextElementSibling;
                let plusIcon = this.querySelector(".plus");

                if (answer.style.display === "block") {
                    answer.style.display = "none";
                    plusIcon.classList.remove("rotate");
                } else {
                    document.querySelectorAll(".faq-answer").forEach(ans => ans.style.display = "none");
                    document.querySelectorAll(".plus").forEach(icon => icon.classList.remove("rotate"));

                    answer.style.display = "block";
                    plusIcon.classList.add("rotate");
                }
            });
        });
        
        // Slider Functionality
let sliderIndex = 0;
showSlides(sliderIndex, 'slider');

function showSlides(n, sliderType) {
    let i;
    let slides = document.querySelectorAll(`.${sliderType}-slide`);
    let dots = document.querySelectorAll(`.${sliderType}-dot`);

    if (n >= slides.length) { sliderIndex = 0; }
    if (n < 0) { sliderIndex = slides.length - 1; }

    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
    }
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }

    slides[sliderIndex].style.display = "block";
    dots[sliderIndex].className += " active";
}

function plusSlides(n, sliderType) {
    showSlides(sliderIndex += n, sliderType);
}

function currentSlide(n, sliderType) {
    showSlides(sliderIndex = n - 1, sliderType);
}

// Auto-advance the slider
setInterval(() => {
    plusSlides(1, 'slider');
}, 5000); // Change slide every 5 seconds
    </script>
</body>
</html>
