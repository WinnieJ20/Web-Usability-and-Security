<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title> Serac | Login </title>
		<link rel="icon" href="img/web_logo_n.png">
		<link rel="stylesheet" href="css/login.css">
	</head>
	<body>
		<section class="header">
			<nav>
				<!-- <a href="homepage.html"><img src="img/web_logo.png"></a> -->
				<a href="/about"><img src="img/web_logo_w.png"></a>
				<div class="nav-links" id="navLinks">
					<ul>
						<li><a href="/login">LOGIN</a></li>
						<li><a href="/register">REGISTER</a></li>
					</ul>
				</div>
			</nav>
		</section>
		<form class="box" action="/login" method="GET">
			<div class="title">
				<h1> Sign in </h1>
				<p class="note">New user? <a href="/register">Create an account</button></a></p>
			</div>
			<div class="input-box">
				<input type="text" name="username" placeholder="Username" id="username" required>
				<input type="password" name="password" placeholder="Password" id="password" required>
				<p class="error">{{error}}</p>
			</div>
			<div class="term-condition">
				<input type="checkbox" name="" id="checkbox" required>
				<span class="note">
					I understand and agree to <a href="https://www.termsfeed.com/public/uploads/2019/04/privacy-policy-template.pdf" target="_blank">Terms of Use and Privacy Policy</a>
				</span>
			</div>
			<!-- create a submit button -->
			<input type="submit" name="login" value="Login">
		</form>
	</body>
</html>