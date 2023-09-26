<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- SEO Meta Tags -->
    <meta name="description" content="Your description">
    <meta name="author" content="Your name">

    <!-- OG Meta Tags to improve the way the post looks when you share the page on Facebook, Twitter, LinkedIn -->
    <meta property="og:site_name" content="" /> <!-- website name -->
    <meta property="og:site" content="" /> <!-- website link -->
    <meta property="og:title" content=""/> <!-- title shown in the actual shared post -->
    <meta property="og:description" content="" /> <!-- description shown in the actual shared post -->
    <meta property="og:image" content="" /> <!-- image link, make sure it's jpg -->
    <meta property="og:url" content="" /> <!-- where do you want your post to link to -->
    <meta name="twitter:card" content="summary_large_image"> <!-- to have large image post format in Twitter -->

    <!-- Webpage Title -->
    <title>Webpage Title</title>

    <!-- Styles -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,400;0,500;0,700;1,400&display=swap" rel="stylesheet">
    <link href="css/fontawesome-all.min.css" rel="stylesheet">
    <link href="css/styles.css" rel="stylesheet">

    <!-- Favicon  -->
    <link rel="icon" href="images/favicon.png">

    <style>* {
        box-sizing: border-box;
        padding: 0;
        margin: 0;
    }

    body,
    html {
        width: 100%;
        height: 100%;
    }

    body, p {
        color: #667077;
        font: 400 1rem/1.625rem "Poppins", sans-serif;
    }

    h1 {
        color: #044184FF;
        font-weight: 500;
        font-size: 3.25rem;
        line-height: 4rem;
    }

    h2 {
        color: #044184FF;
        font-weight: 500;
        font-size: 2.5rem;
        line-height: 3.25rem;
    }

    h3 {
        color: #044184FF;
        font-weight: 500;
        font-size: 1.875rem;
        line-height: 2.5rem;
    }

    h4 {
        color: #044184FF;
        font-weight: 500;
        font-size: 1.5rem;
        line-height: 2rem;
    }

    h5 {
        color: #044184FF;
        font-weight: 500;
        font-size: 1.25rem;
        line-height: 1.625rem;
    }

    h6 {
        color: #044184FF;
        font-weight: 500;
        font-size: 1rem;
        line-height: 1.375rem;
    }

    .p-large {
        font-size: 1.125rem;
        line-height: 1.75rem;
    }

    .container {
        margin: 0 auto;
        padding: 0 15px;
        height: 200px;
    }

    .flex {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100%;
    }

    .grid {
        display: grid;
        gap: 20px;
        justify-content: center;
        align-items: center;
        height: 100%;
    }

    img {
        max-width: 100%;
        vertical-align: middle; /* solves a gap when inside image-container */
    }

    ul {
        list-style-type: none;
    }

    .li-space-lg li {
        margin-bottom: 0.5rem;
    }

    a {
        color: #667077;
        text-decoration: underline;
    }

    a:hover {
        color: #667077;
        text-decoration: underline;
    }

    .bg-gray {
        background-color: #f9fbfe;
    }

    .btn-solid-reg {
        display: inline-block;
        padding: 1.5rem 2.375rem 1.5rem 2.375rem;
        border: 2px solid #044184FF;
        border-radius: 32px;
        background-color: #044184FF;
        color: #ffffff;
        font-weight: 400;
        font-size: 0.875rem;
        line-height: 0;
        text-decoration: none;
        transition: all 0.2s;
    }

    .btn-solid-reg:hover {
        background-color: transparent;
        color: #044184FF; /* needs to stay here because of the color property of a tag */
        text-decoration: none;
    }



    .btn-outline-lg {
        display: inline-block;
        padding: 1.875rem 3rem 1.875rem 3rem;
        border: 2px solid #044184FF;
        border-radius: 32px;
        background-color: transparent;
        color: #044184FF;
        font-weight: 400;
        font-size: 1rem;
        line-height: 0;
        text-decoration: none;
        transition: all 0.2s;
    }

    .btn-outline-lg:hover {
        background-color: #044184FF;
        color: #ffffff;
        text-decoration: none;
    }



    ::placeholder {
        color: #667077;
        opacity: 1; /* Firefox */
    }




    /**********************/
    /*     Navigation     */
    /**********************/
    .navbar {
        position: absolute;
        right: 0;
        left: 0;
        margin-top: -36px;
        color: #ffffff;
        height: 60px;
        backdrop-filter: blur(2px);
        background-color: rgba(255, 255, 255, .15);
    }

    .navbar .flex {
        flex-direction: column;
    }

    .navbar a {
        text-decoration: none;
    }

    .navbar .logo-image {
        margin-top: 50px !important;
        width: 134px;
        height: 30px;
        margin-top: 0.5rem;
        margin-bottom: 1.25rem;
    }

    .navbar .logo-text {
        margin-bottom: 0.5rem;
        color: #ffffff;
        font-weight: 500;
        font-size: 2rem;
        line-height: 1.875rem;
    }

    .navbar ul {
        margin-top: 50px !important;
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        padding: 0.5rem 0.75rem 0 0.75rem;
        background-color: rgba(0, 0, 0, 0.2);
    }

    .navbar ul li {
        padding: 0 0.75rem 0.5rem 0.75rem;
    }

    .navbar ul a {
        color: #ffffff;
    }

    .navbar ul a:hover {
        border-bottom: 2px #ffffff solid;
    }


    /******************/
    /*     Header     */
    /******************/
    header {
        padding-top: 10rem;
        padding-bottom: 9rem;
        background: linear-gradient(to bottom right, rgba(28, 54, 51, 0.7), rgba(28, 54, 51, 0.7)), url('images/image.jpg') center center no-repeat;
        background-size: cover;
        text-align: center;
    }

    header .h1-large {
        margin-bottom: 2.5rem;
        color: #ffffff;
    }

    header .btn-outline-lg {
        border: 2px solid #ffffff;
        color: #ffffff;
    }

    header .btn-outline-lg:hover {
        background-color: #ffffff;
        color: #044184FF;
    }


    /********************/
    /*     Services     */
    /********************/
    .services {
        padding-top: 9rem;
        padding-bottom: 6rem;
        text-align: center;
    }

    .services .p-large {
        margin-bottom: 5rem;
    }

    .services .fas {
        margin-bottom: 1.5rem;
        color: #044184FF;
        font-size: 4.75rem;
    }

    .services h4 {
        margin-bottom: 3rem;
    }


    /********************/
    /*     Benefits     */
    /********************/
    .benefits {
        padding-top: 9rem;
        padding-bottom: 9rem;
    }

    .benefits .image-container {
        margin-bottom: 3rem;
    }

    .benefits h2 {
        margin-bottom: 1.5rem;
    }

    .benefits p {
        margin-bottom: 1.25rem;
    }


    /******************/
    /*     Footer     */
    /******************/
    footer {
        padding-top: 5.5rem;
        padding-bottom: 4.5rem;
        background-color: #044184FF;
        text-align: center;
    }

    footer .logo-image {
        display: block;
        width: 160px;
        height: 100%;
        margin-bottom: 0.75rem;
        opacity: 0.7;
    }

    footer .logo-text {
        display: block;
        margin-bottom: 1rem;
        color: #ffffff;
        font-weight: 500;
        font-size: 2.5rem;
        text-decoration: none;
    }

    footer p,
    footer ul li a,
    footer ul li a:hover,
    footer .fab {
        color: #ffffff;
        opacity: 0.7;
        text-decoration: none;
    }

    footer p {
        margin-bottom: 1.5rem;
    }

    footer ul {
        margin-bottom: 2.25rem;
    }

    footer .fab {
        margin-right: 0.5rem;
        margin-left: 0.5rem;
        font-size: 2rem;
    }


    /******************************/
    /*     Back To Top Button     */
    /******************************/
    #myBtn {
        position: fixed;
        z-index: 99;
        bottom: 10px;
        right: 10px;
        display: none;
        width: 46px;
        height: 46px;
        border: none;
        border-radius: 50%;
        outline: none;
        background-color: #323137;
        line-height: 44px;
        text-align: center;
        cursor: pointer;
    }

    #myBtn:hover {
        background-color: #0f0f11;
    }

    #myBtn img {
        width: 18px;
    }


    /*************************/
    /*     Media Queries     */
    /*************************/
    /* Min-width 992px */
    @media (min-width: 992px) {

        /* General Styles */
        .container {
            max-width: 1140px;
        }

        .grid {
            grid-template-columns: repeat(2, 1fr);
        }

        .grid-3 {
            grid-template-columns: repeat(3, 1fr);
        }

        .p-heading {
            width: 36rem;
            margin-right: auto;
            margin-left: auto;
        }
        /* end of general styles */


        /* Navigation */
        .navbar {
            top: 36px;
        }

        .navbar .flex {
            flex-direction: row;
            justify-content: space-between;
            margin-top: -20px;
        }

        .navbar .logo-image {
            margin: 0;
        }

        .navbar .logo-text {
            margin-bottom: 0;
        }

        .navbar ul {
            padding: 0;
            background: none;
        }

        .navbar ul li {
            margin-bottom: 0;
            padding-bottom: 0;
        }

        .navbar ul li:last-of-type a {
            margin-right: 0;
            padding-right: 0;
        }
        /* end of navigation */


        /* Header */
        header {
            padding-top: 19.5rem;
            padding-bottom: 18rem;
        }

        header .h1-large {
            width: 50rem;
            margin-right: auto;
            margin-left: auto;
            font-size: 4.75rem;
            line-height: 5.75rem;
        }
        /* end of header */


        /* Services */
        .services .p-large {
            width: 40rem;
            margin-right: auto;
            margin-left: auto;
        }

        .services h4 {
            width: 19rem;
            margin-right: auto;
            margin-left: auto;
        }
        /* end of services */


        /* Benefits */
        .benefits .grid {
            grid-template-columns: repeat(3, 1fr);
        }

        .benefits .grid > *:first-child {
            grid-column: 1 / span 2;
        }

        .benefits .image-container {
            margin-right: 5rem;
            margin-bottom: 0;
        }
        /* end of benefits */


        /* Invite */
        .invite .text-container {
            margin-bottom: 0;
        }

        .invite .grid {
            gap: 80px;
        }
        /* end of invite */


        /* Features */
        .features .grid {
            grid-template-columns: repeat(3, 1fr);
        }

        .features .grid > *:last-child {
            grid-column: 2 / span 2;
        }

        .features .text-container {
            margin-bottom: 0;
            margin-top: -300px !important;
        }

        .features .image-container {
            margin-left: 5rem;
            text-align: right;
        }
        /* end of benefits */


        /* Contact */
        form {
            width: 820px;
            margin-right: auto;
            margin-left: auto;
        }
        /* end of contact */


        /* Footer */
        footer {
            text-align: left;
        }

        footer p,
        footer ul {
            margin-bottom: 0;
        }

        footer ul {
            text-align: center;
        }

        footer .grid div:nth-of-type(3) {
            text-align: right;
        }

        footer .fab {
            margin-right: 0.75rem;
            margin-left: 0.75rem;
        }
        /* end of footer */


        /* Back To Top Button */
        #myBtn {
            bottom: 20px;
            right: 20px;
            width: 52px;
            height: 52px;
            line-height: 50px;
        }
        /* end of back To Top Button */

    }
    /* end of min-width 992px */</style>
</head>
<body>

<!-- Navigation -->
<div class="navbar">
    <div class="container flex">
        <!-- Image Logo -->
        <a class="logo-image" href="index.html"><span style="color: #5e9693;">MY</span><span style="color: #fff;">TODO</span></a>
        <!-- Text Logo - Use this if you don't have a graphic logo -->
        <!-- <a class="logo-text" href="index.html">Name</a> -->
        <nav>
            <ul >
                <li><a href="#">Benefits</a></li>
                <li><a href="/LoginServlet">Se connecter</a></li>
                <li><a href="/SigninServlet">S'inscrire</a></li>
            </ul>
        </nav>
    </div> <!-- end of container -->
</div> <!-- end of navbar -->
<!-- end of navigation -->


<!-- Header -->
<header>
    <div class="container">
        <div style="margin-top: -100px !important;" class="text-container">
            <h1 class="h1-large">MyTodo votre gestionnaire de taches</h1>
            <a class="btn-outline-lg" href="/SigninServlet">Regoignez-nous</a>
        </div> <!-- end of text-container -->
    </div> <!-- end of container -->
</header> <!-- end of header -->
<!-- end of header -->


<!-- Services -->
<div id="services" class="services">
    <div class="container">
        <p class="p-large">Lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua remva</p>

        <div class="grid grid-3">
            <div>
                <i class="fas fa-rocket"></i>
                <h4>Lorem ipsum dolor sitreva amet consectet adipiscing elitse</h4>
            </div>
            <div>
                <i class="fas fa-cloud"></i>
                <h4>Lorem ipsum dolor sitreva amet consectet adipiscing elitse</h4>
            </div>
            <div>
                <i class="fas fa-server"></i>
                <h4>Lorem ipsum dolor sitreva amet consectet adipiscing elitse</h4>
            </div>
        </div> <!-- end of grid-->
    </div> <!-- end of container -->
</div> <!-- end of services -->
<!-- end of services -->



<!-- Footer -->
<footer>
    <div class="container grid grid-3">
        <div>

            <!-- Image Logo -->
            <a class="logo-image" href="index.html"><img src="images/logo.svg" alt="alternative"></a>

            <!-- Text Logo -->
            <!-- <a class="logo-text" href="index.html">Name</a> -->

            <p>Copyright © 2022</p>
        </div>
        <div>
            <ul class="li-space-lg">
                <li><a href="#services">Services</a></li>
                <li><a href="#benefits">Benefits</a></li>
                <li><a href="#features">Features</a></li>
                <li><a href="#contact">Contact</a></li>
            </ul>
        </div>
        <div>
            <a href="#"><i class="fab fa-twitter"></i></a>
            <a href="#"><i class="fab fa-facebook-f"></i></a>
            <a href="#"><i class="fab fa-linkedin-in"></i></a>
            <a href="#"><i class="fab fa-instagram"></i></a>
        </div>
    </div> <!-- end of container -->
</footer> <!-- end of footer -->
<!-- end of footer -->


<!-- Back To Top Button -->
<a id="myBtn" href="#" data-scroll>
    <img src="images/up-arrow.png" alt="alternative">
</a>
<!-- end of back to top button -->

<!-- Scripts -->
<script src="js/smooth-scroll.polyfills.min.js"></script> <!-- Smooth Scroll -->
<script src="js/scripts.js"></script> <!-- Custom scripts -->
</body>
</html>