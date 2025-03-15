<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - TOC Computer</title>
    <style>
        /* General Styling */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
        }
        body {
            background-color: #ffffff;
            color: #1d1d1f;
        }
        
        /* Header */
        .header {
            background: #1e3c72;
            color: white;
            padding: 20px;
            text-align: center;
            font-size: 24px;
            font-weight: bold;
        }
        
        /* Hero Section */
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 60px 20px;
            text-align: center;
        }
        .hero {
            font-size: 50px;
            font-weight: 700;
            color: #1e3c72;
            margin-bottom: 20px;
            animation: fadeIn 1s ease-in-out;
        }
        .subtext {
            font-size: 20px;
            color: #555;
            max-width: 800px;
            margin: 0 auto 40px;
            line-height: 1.6;
        }
        
        /* Image Section */
        .image-container {
            margin-top: 40px;
        }
        .image-container img {
            width: 100%;
            max-width: 1000px;
            border-radius: 20px;
            box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.1);
        }

        /* Grid Features */
        .grid {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
            margin-top: 50px;
        }
        .grid-item {
            flex: 1 1 300px;
            max-width: 350px;
            padding: 20px;
            background: #f5f5f7;
            border-radius: 12px;
            text-align: center;
            transition: transform 0.3s ease-in-out;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.1);
        }
        .grid-item:hover {
            transform: scale(1.05);
        }
        .grid-item h3 {
            font-size: 20px;
            font-weight: 600;
            margin-bottom: 10px;
            color: #1e3c72;
        }
        .grid-item p {
            font-size: 16px;
            color: #6e6e73;
        }

        /* Testimonials */
        .testimonials {
            margin-top: 60px;
            padding: 40px;
            background: #1e3c72;
            color: white;
            text-align: center;
            border-radius: 20px;
        }
        .testimonial-item {
            max-width: 800px;
            margin: auto;
            font-style: italic;
            font-size: 18px;
            line-height: 1.6;
        }
        .testimonial-item span {
            display: block;
            font-size: 16px;
            font-weight: bold;
            margin-top: 10px;
            color: #ffcc00;
        }

        /* Call to Action */
        .cta {
            margin-top: 50px;
            text-align: center;
        }
        .cta a {
            text-decoration: none;
            font-size: 18px;
            font-weight: 600;
            background: #bebebe;
            color: #1e3c72;
            padding: 15px 30px;
            border-radius: 12px;
            transition: background 0.3s;
        }
        .cta a:hover {
            background: #d7d8d9;
        }

        /* Footer */
        .footer {
            background: #222;
            color: white;
            text-align: center;
            padding: 20px;
            margin-top: 50px;
            font-size: 14px;
        }

        /* Animations */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Responsive */
        @media (max-width: 768px) {
            .hero {
                font-size: 36px;
            }
            .subtext {
                font-size: 18px;
            }
            .grid-item {
                max-width: 100%;
            }
        }
    </style>
</head>
<body>

    <jsp:include page="header.jsp" />

    <div class="container">
        <h1 class="hero">Innovate. Connect. Elevate.</h1>
        <p class="subtext">
            At <strong>COT Computer</strong>, we are passionate about the latest technology gadgets and accessories. Whether you're looking for high-performance laptops, smartphones, smartwatches, gaming peripherals, or cutting-edge accessories, we have you covered.
        </p>
        
        <div class="image-container">
            <img src="sources/images/aboutus.jpg" alt="Technology and Innovation">
        </div>

        <div class="grid">
            <div class="grid-item">
                <h3>Premium Products</h3>
                <p>High-quality, high-performance gadgets tailored to your needs.</p>
            </div>
            <div class="grid-item">
                <h3>Seamless Experience</h3>
                <p>Designed for efficiency, reliability, and future-ready solutions.</p>
            </div>
            <div class="grid-item">
                <h3>Exceptional Support</h3>
                <p>Our team is always here to help you with expert advice.</p>
            </div>
        </div>

        <div class="testimonials">
            <h2>What Our Customers Say</h2>
            <p class="testimonial-item">
                "The best place to get high-end tech accessories! Their customer service is top-notch." 
                <span>- Alex R.</span>
            </p>
            <p class="testimonial-item">
                "Fast delivery and amazing quality. I love my new gaming headset!" 
                <span>- Sarah M.</span>
            </p>
        </div>

        <div class="cta">
            <a href="product.jsp">Explore Our Products</a>
        </div>
    </div>

    <jsp:include page="footer.jsp" />

</body>
</html>