<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title> Serac | Register </title>
		<link rel="icon" href="img/web_logo_n.png">
		<link rel="preconnect" href="https://fonts.gstatic.com">
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
		<form class="box" method="GET">
			<div class="title">
				<h1> Register </h1>
			</div>
			<div class="input-box">
				<input type="text" name="username" placeholder="Username" id="username" required title="* required&#13* can only contain English characters and numbers&#13* first letter should be a character">
				<input type="password" name="password" placeholder="Password" id="password" required title="* required&#13* Please enter a password">
				<input type="password" name="password_ag" placeholder="Enter your password again" id="password_ag" required title="* required&#13* Confirm your password by re-entering">
				<p class="error">{{error}}</p>
			</div>
			
			<div class="term-condition">
				<input type="checkbox" name="" id="checkbox" required>
				<span class="note">
					I understand and agree to <a href="https://www.termsfeed.com/public/uploads/2019/04/privacy-policy-template.pdf" target="_blank">Terms of Use and Privacy Policy</a>
				</span>
			</div>
			<!-- create a submit button -->
			<div class="output">
				<input type="submit" name="register" value="Register">
				<a class="note" href="/login">Click here to log in</a>
			</div>
		</form>
	</body>
</html>