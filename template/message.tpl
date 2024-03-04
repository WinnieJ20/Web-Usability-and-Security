<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title> Serac | {{message}} </title>
		<link rel="icon" href="img/web_logo_n.png">
		<link rel="stylesheet" href="css/message.css">
	</head>
	<body>
		<section class="header">
			<nav>
				<!-- <a href="homepage.html"><img src="img/web_logo.png"></a> -->
				<a href="/homepage"><img src="img/web_logo_w.png"></a>
				<div class="nav-links" id="navLinks">
					<ul>
						<li><a href="/home">HOME</a></li>
						<li><a href="/forum">FORUM</a></li>
						<li><a href="/competition-description">COMPETITION</a></li>
						<li><a href="/logout">LOGOUT</a></li>
					</ul>
				</div>
			</nav>
		</section>
		<div class="box" action="/login" method="POST">
			<div class="title">
				<h1>{{message}}</h1>
			</div>
			% if message == "Register: Invalid Username":
				<p>Sorry, the username provided is not valid:</p>
				<ul>
					<li>The username can only contain English characters and numbers</li>
					<li>The first letter of the username should be a character</li>
				</ul>
				<a href="/register"><input type="button" name="" value="Regiester Again"></a>
			% end
			% if message == "User Already Exist":
				<p>It looks like you are already one of our members, please login to continue your journey</p>
				<a href="/login"><input type="button" name="" value="To Login"></a>
			% end
			% if message == "Register Successful":
				<p>Thank you for being a valued member of the Serac Acedemic Study Plateform, please login to continue your journey</p>
				<a href="/login"><input type="button" name="" value="Login"></a>
			% end
			% if message == "Not Yet a Member":
				<p>Welcome to Serac Acedemic Study Plateform, it seems like you a not a member yet, join now!!</p>
				<a href="/register"><input type="button" name="" value="Join Now"></a>
			% end
			% if message == "Access Denied":
				<p>Be a member of our Serac Acedemic Study Plateform to view the contents, if you are an existing member, please sign in to continue, otherwise, welcome to join now!!</p>
				<div class="multi_button">
					<a href="/login"><input type="button" name="" value="Login"></a>
					<a href="/register"><input type="button" name="" value="Join Now"></a>
				</div>
		</div>
	</body>
</html>