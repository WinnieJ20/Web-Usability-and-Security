<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="with=device-width, initial-scale=1.0">
		<title> Serac | How the Web works </title>
		<link rel="icon" href="../img/web_logo_n.png">
		<link rel="stylesheet" type="text/css" href="css/hp.css">
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@200;300;400;600;700&display=swap" rel="stylesheet">
	</head>
	<body>
	    <section class="sub-header" style="background-image: linear-gradient(rgba(4, 9, 30, 0.431),rgba(4,9,30,0.7)), url(../img/test2.png);">
			<nav>
				<a href="/homepage"><img src="img/web_logo.png"></a>
				<div class="nav-links" id="navLinks">
					<ul>
						<li><a href="/home">HOME</a></li>
						<li><a href="/forum">FORUM</a></li>
						<li><a href="competition-description">COMPETITION</a></li>
						<li><a href="/logout">LOGOUT</a></li>
					</ul>
				</div>
			</nav>
			<h1>How the Web works</h1>
		</section>
		
		
		<section class="learn-html">
            <div class="row">
                <div class="about-col">
                <p>How the web works provides a simplified view of what happens when you view a webpage in a web browser on your computer or phone.
                This theory is not essential to writing web code in the short term, but before long you'll really start to benefit from understanding 
                what's happening in the background.</p>
                <h1>Clients and servers</h1>
                <p> Computers connected to the web are called clients and servers. <b>Clients</b> are the typical web user's internet-connected devices 
                (for example, your computer connected to your Wi-Fi, or your phone connected to your mobile network) and web-accessing software 
                available on those devices (usually a web browser like Firefox or Chrome). <b>Servers</b> are computers that store webpages, sites, or 
                apps. When a client device wants to access a webpage, a copy of the webpage is downloaded from the server onto the client machine 
                to be displayed in the user's web browser.
                </p>
                
                <h1>The other parts of the toolbox</h1>
                <p> The client and server we've described above don't tell the whole story. There are many other parts involved, and we'll describe them below.
                For now, let's imagine that the web is a road. On one end of the road is the client, which is like your house. On the other end of the road is 
                the server, which is a shop you want to buy something from.
                </p>
                <p><b>Your internet connection:</b> Allows you to send and receive data on the web. It's basically like the street between your house and the shop.
                <br><br><b>TCP/IP</b>: Transmission Control Protocol and Internet Protocol are communication protocols that define how data should travel across the internet. 
                This is like the transport mechanisms that let you place an order, go to the shop, and buy your goods. In our example, this is like a car or a 
                bike (or however else you might get around).
                <br><br><b>DNS:</b> Domain Name Servers are like an address book for websites. When you type a web address in your browser, the browser looks at the DNS 
                to find the website's real address before it can retrieve the website. The browser needs to find out which server the website lives on, so it can 
                send HTTP messages to the right place (see below). This is like looking up the address of the shop so you can access it.
                <br><br><b>HTTP:</b> Hypertext Transfer Protocol is an application protocol that defines a language for clients and servers to speak to each other. This is 
                like the language you use to order your goods.</p>
                </div>
                <div class="about-col">
                    <img src="img/technology-stack-diagram.jpg" alt="">
                    <br><br><br><br><br><br><br><br><br><br>
                    <img src="img/tcp_ip.jpg" alt="">
                </div>
            </div>
		</section>
	</body>
</html>