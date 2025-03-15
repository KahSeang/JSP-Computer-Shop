<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Contact Us - Harvey Norman</title>
    <style>
        body { font-family: Arial, sans-serif; }
        .container {
            width: 80%; 
            margin: auto; 
            text-align: center; 
            border-radius: 15px; 
            padding: 20px; 
            background: #f8f9fa;
            opacity: 0;
            transform: translateY(20px);
            animation: fadeIn 1s forwards;
        }
        @keyframes fadeIn {
            to { opacity: 1; transform: translateY(0); }
        }
        .contact-section { 
            display: flex; 
            justify-content: space-between; 
            margin: 20px 0; 
            gap: 20px; 
        }
        .contact-box {
            width: 22%; 
            padding: 20px; 
            background: #72bcd4; 
            color: white; 
            border-radius: 15px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .contact-box h3{
            font-size: 20px;
            margin-bottom: 10px;
        }
        .contact-box p{
            font-size: 15px;
            margin: 5px;
        }
        .contact-box:hover {
            transform: scale(1.05);
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }
        .contact-box a { color: #fff; text-decoration: underline; }
        .form-container {
            background: #f4f4f4; 
            padding: 20px; 
            border-radius: 15px; 
        }
        .form-container input, .form-container select, .form-container textarea {
            width: 100%; 
            padding: 10px; 
            margin: 10px 0; 
            border: 1px solid #ccc; 
            border-radius: 5px;
            transition: all 0.3s ease;
        }
        .form-container input:focus, .form-container textarea:focus, .form-container select:focus {
            border-color: #0055A4;
            box-shadow: 0 0 8px rgba(0, 85, 164, 0.5);
        }
        .submit-btn {
            background: #003366; 
            color: white; 
            border: none; 
            padding: 10px 15px; 
            cursor: pointer; 
            border-radius: 5px; 
            transition: background 0.3s;
        }
        .submit-btn:hover {
            background: #0055A4;
        }
        img{
            height: 50px;
            weight: 50px;
            margin-bottom: 10px;
            
        }
    </style>
</head>
<body>
    <jsp:include page="header.jsp" />

    <div class="container">
        <h1>Contact Us</h1>
        <div class="contact-section">
            <div class="contact-box">
                <img src="sources/images/contact/call-phone.png" alt="CallPhone">
                <h3>Call Us</h3>
                <p>Customer Service</p>
                <p><a href="tel:1800185200">1800-18-5200</a></p>
                <p>10:30AM - 7:00PM (Closed on Weekends and Public Holidays)</p>
            </div>
            <div class="contact-box" style="background: #adcae6;">
                <img src="sources/images/contact/help.png" alt="faq">
                <h3>FAQ</h3>
                <p><a href="home.jsp#faq" onclick="scrollToSection('faq')">Find answers to common questions</a></p>
            </div>
            <div class="contact-box">
                <img src="sources/images/contact/mail.png" alt="mail">
                <h3>Email Us</h3>
                <p><a href="mailto:customerfirst@support.cot.com">customerfirst@support.cot.com</a></p>
            </div>
            <div class="contact-box" style="background: #adcae6;">
                <img src="sources/images/contact/store.png" alt="store">
                <h3>Find Our Stores</h3>
                <p><a href="findstore.jsp">Use our store finder</a></p>
            </div>
        </div>

        <div class="form-container">
            <h2>Send Us a Message</h2>
            <form action="contact_process.jsp" method="post">
                <input type="text" name="name" placeholder="Name" required>
                <input type="email" name="email" placeholder="Email Address" required>
                <input type="text" name="phone" placeholder="Daytime Phone Number">
                <select name="query" required>
                    <option value="">Select a Query Type</option>
                    <option value="store">Store or Product Enquiry</option>
                    <option value="order">Online Order</option>
                    <option value="corporate">Corporate Enquiry</option>
                    <option value="website">Website Issues & Feedback</option>
                </select>
                <textarea name="message" placeholder="Your Message" rows="5" required></textarea>
                <p style="font-size: 10px; margin: 2px; text-align: justify;">Your Privacy is Important to us! Computer of Outstanding Technology Sdn Bhd, trading as Harvey Norman Malaysia, does not sell or rent your personal information to third parties. 
                Any information collected would be for usage by Elitetrax Marketing Sdn Bhd. Your personal information may be shared with current or future Elitetrax Marketing Sdn Bhd entities or subsidiaries, legal, financial and regulatory institutions. 
                In limited circumstances, we may need to share your information with selected third parties to carry out certain services on our behalf. Our third parties service providers are bound by confidentiality obligations to keep all data confidential.</p>
                <input type="checkbox" name="consent" required> I agree to the privacy policy.
                <br>
                <button type="submit" class="submit-btn" style="margin: 10px;">Submit</button>
            </form>
        </div>
    </div>
    
    <jsp:include page="footer.jsp" />
</body>
</html>