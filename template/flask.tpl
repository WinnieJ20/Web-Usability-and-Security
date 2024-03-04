<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="with=device-width, initial-scale=1.0">
		<title> Serac | Intro to Flask </title>
		<link rel="icon" href="../img/web_logo_n.png">
		<link rel="stylesheet" type="text/css" href="css/hp.css">
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@200;300;400;600;700&display=swap" rel="stylesheet">
	</head>
	<body>
	    <section class="sub-header" style="background-image: linear-gradient(rgba(4, 9, 30, 0.431),rgba(4,9,30,0.7)), url(../img/flask-back.png);">
			<nav>
				<a href="/homepage"><img src="img/web_logo.png"></a>
				<div class="nav-links" id="navLinks">
					<ul>
						<li><a href="/home">HOME</a></li>
						<li><a href="/forum">FORUM</a></li>
						<li><a href="/competition-description">COMPETITION</a></li>
						<li><a href="/logout">LOGOUT</a></li>
					</ul>
				</div>
			</nav>
			<h1>Intro to Flask</h1>
		</section>
		
		
		<section class="learn-html">
            <div class="row">
                <div class="about-col">
                <h1>A Breif Look of Flask</h1>
                <p> Flask is a micro web framework written in Python. It is classified as a microframework because it 
                does not require particular tools or libraries. It has no database abstraction layer, form validation, 
                or any other components where pre-existing third-party libraries provide common functions. Wikipedia
                </p>
                <!-- <a href="">EXPLORE NOW</a> -->
                <h1>Quick Start</h1>
                <p> A minimal Flask application looks something like this:
                </p>
                <img src="img/flask-sample.png" alt="">
                <p>So what did that code do? 
                <br>1. First we imported the Flask class. An instance of this class will be our WSGI application.
                <br>2. Next we create an instance of this class. The first argument is the name of the application’s module or package. 
                If you are using a single module (as in this example), you should use __name__ because depending on if it’s started as 
                application or imported as module the name will be different ('__main__' versus the actual import name). This is needed 
                so that Flask knows where to look for templates, static files, and so on. For more information have a look at the Flask 
                documentation.
                <br>3. We then use the route() decorator to tell Flask what URL should trigger our function.
                <br>4. The function is given a name which is also used to generate URLs for that particular function, and returns the message 
                we want to display in the user’s browser.<br>
                Just save it as hello.py or something similar. Make sure to not call your application flask.py because this would conflict with Flask itself.
                To run the application you can either use the flask command or python’s -m switch with Flask. Before you can do that you need to tell your 
                terminal the application to work with by exporting the FLASK_APP environment variable:</p>
                <img src="img/flask-sample2.png" alt="">
                </div>
                <div class="about-col">
                    <img src="img/flask-back2.png" alt="" style="margin-top:100px;">
                    <img src="img/flask-back3.png" alt="" style="margin-top:90px;">
                </div>
            </div>
		</section>
	</body>
</html>