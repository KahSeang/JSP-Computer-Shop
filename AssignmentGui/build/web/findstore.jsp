<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Store Finder</title>
    <style>
        body { font-family: Arial, sans-serif; padding: 0; margin-top: 20px;}
        .container { width: 80%; margin: auto; text-align: center; }
        .contact-buttons { display: flex; justify-content: center; gap: 20px; margin: 20px 0; }
        .contact-buttons a { background: #0055A4; color: white; padding: 15px 25px; border-radius: 5px; text-decoration: none; }
        .state-selector { display: flex; justify-content: center; gap: 10px; flex-wrap: wrap; margin-bottom: 20px; }
        .state-selector button { padding: 10px 15px; border: none; background: #f4f4f4; cursor: pointer; border-radius: 5px; }
        .store-section { padding: 20px; border-bottom: 2px solid #ddd; }
        .store-section h2 { background: #f4f4f4; padding: 10px; border-radius: 5px; }
        iframe { width: 100%; height: 300px; border: none; }
        .info { margin: 15px 0; }
        .info p { margin: 5px 0;}
        .info p a{ margin: 5px 0; font-style: normal;}
        .bold { font-weight: bold; color:#0055A4;}
    </style>
    <script>
        function scrollToSection(id) {
            document.getElementById(id).scrollIntoView({ behavior: 'smooth' });
        }
    </script>
</head>
<body>
    <jsp:include page="header.jsp" />
    
    <div class="container">
        <h1>Store Finder</h1>
        <div class="contact-buttons">
            <a href="tel:1800185200">Call Us</a>
            <a href="mailto:customerfirst@support.cot.com">Email Us</a>
        </div>
        
        <div class="state-selector">
            <button onclick="scrollToSection('kuala-lumpur')">Kuala Lumpur</button>
            <button onclick="scrollToSection('penang')">Penang</button>
            <button onclick="scrollToSection('johor')">Johor</button>
            <button onclick="scrollToSection('pahang')">Pahang</button>
            <button onclick="scrollToSection('sabah')">Sabah</button>
        </div>
        
        <div id="kuala-lumpur" class="store-section">
            <h2>Kuala Lumpur</h2>
            <p style="margin: 20px;"><b>COT Kuala Lumpur</b></p>
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3971.760984528147!2d100.28229957482293!3d5.453205194526316!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x304ac2c0305a5483%3A0xfeb1c7560c785259!2sTAR%20UMT%20Penang%20Branch!5e0!3m2!1sen!2smy!4v1741993968018!5m2!1sen!2smy" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
            <div class="info">
                <p class="bold">Address:</p>
                <p>Ground Floor, Bangunan Tan Sri Khaw Kai Boh (Block A), Jalan Genting Kelang, Setapak, 53300 Kuala Lumpur, Federal Territory of Kuala Lumpur</p>
                <p class="bold">Contact:</p>
                <p><a href="tel:0341450123">03-41450123</a></p>
                <p class="bold">Opening Hours:</p>
                <p>10:00am to 10:00pm, Daily</p>
            </div>
        </div>
        
        <div id="penang" class="store-section">
            <h2>Penang</h2>
            <p style="margin: 20px;"><b>COT Penang</b></p>
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3971.760984528147!2d100.28229957482293!3d5.453205194526316!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x304ac2c0305a5483%3A0xfeb1c7560c785259!2sTAR%20UMT%20Penang%20Branch!5e0!3m2!1sen!2smy!4v1741993873498!5m2!1sen!2smy" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
            <div class="info">
                <p class="bold">Address:</p>
                <p>77, Lorong Lembah Permai 3, 11200 Tanjung Bungah, Pulau Pinang</p>
                <p class="bold">Contact:</p>
                <p><a href="tel:048995230">04-8995230</a></p>
                <p class="bold">Opening Hours:</p>
                <p>10:00am to 10:00pm, Daily</p>
            </div>
        </div>
        
        <div id="johor" class="store-section">
            <h2>Johor</h2>
            <p style="margin: 20px;"><b>COT Johor</b></p>
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3986.1293539132093!2d102.9008380748065!3d2.464035097514778!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31d0278a4b717f81%3A0xcf57a74bd59c5835!2sTunku%20Abdul%20Rahman%20University%20of%20Management%20and%20Technology%20(TAR%20UMT)%20Johor%20Branch%20Campus!5e0!3m2!1sen!2smy!4v1741993995667!5m2!1sen!2smy" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
            <div class="info">
                <p class="bold">Address:</p>
                <p>Jalan Segamat / Labis, 85000, Segamat, Johor, 85000 Segamat District, Johor</p>
                <p class="bold">Contact:</p>
                <p><a href="tel:079270801">07-9270801</a></p>
                <p class="bold">Opening Hours:</p>
                <p>10:00am to 10:00pm, Daily</p>
            </div>
        </div>
        
        <div id="pahang" class="store-section">
            <h2>Pahang</h2>
            <p style="margin: 20px;"><b>COT Pahang</b></p>
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3980.8573985795656!2d103.28663097481254!3d3.8407737961330253!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31c8ba3550d6e5a7%3A0x6d32a9539f066a18!2sTunku%20Abdul%20Rahman%20University%20of%20Management%20and%20Technology%20(TAR%20UMT)%20Pahang%20Branch!5e0!3m2!1sen!2smy!4v1741994061421!5m2!1sen!2smy" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
            <div class="info">
                <p class="bold">Address:</p>
                <p>Jalan IM 9/2, Bandar Indera Mahkota, 25200 Kuantan, Pahang</p>
                <p class="bold">Contact:</p>
                <p><a href="tel:01110825631">011-10825631</a></p>
                <p class="bold">Opening Hours:</p>
                <p>10:00am to 10:00pm, Daily</p>
            </div>
        </div>
        
        <div id="sabah" class="store-section">
            <h2>Sabah</h2>
            <p style="margin: 20px;"><b>COT Sabah</b></p>
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3967.7535042134873!2d116.12683327482745!3d6.028532093956975!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x323b665bce325bf1%3A0xfc7bcf77c145bc5f!2sTunku%20Abdul%20Rahman%20University%20Of%20Management%20And%20Technology%2C%20Sabah%20Branch%20(TAR%20UMT)!5e0!3m2!1sen!2smy!4v1741994093640!5m2!1sen!2smy" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
            <div class="info">
                <p class="bold">Address:</p>
                <p>No.1, Jalan Alamesra, Alamesra, 88450 Kota Kinabalu, Sabah</p>
                <p class="bold">Contact:</p>
                <p><a href="tel:088348080">088-348080</a></p>
                <p class="bold">Opening Hours:</p>
                <p>10:00am to 10:00pm, Daily</p>
            </div>
        </div>
    </div>
    
    <jsp:include page="footer.jsp" />
</body>
</html>
