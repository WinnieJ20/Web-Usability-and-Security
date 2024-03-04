<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="with=device-width, initial-scale=1.0">
		<link rel="icon" href="img/web_logo_n.png">
		<title> Serac | Forum </title>
		<link rel="icon" href="../img/web_logo_n.png">
		<link rel="stylesheet" type="text/css" href="css/forum.css">
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@200;300;400;600;700&display=swap" rel="stylesheet">
	</head>

	<body>
		<section class="header">
			<nav>
				<!-- <a href="homepage.html"><img src="img/web_logo.png"></a> -->
				<a href="homepage.html"><img src="img/web_logo_w.png"></a>
				<div class="nav-links" id="navLinks">
					<ul>
						% if is_admin:
							<li><a href="/admin">ADMIN</a></li>
							<li><a href="/forum">FORUM</a></li>
							<li><a href="/logout">LOGOUT</a></li>
						% else:
							<li><a href="/home">HOME</a></li>
							<li><a href="/forum">FORUM</a></li>
							<li><a href="/competition-description">COMPETITION</a></li>
							<li><a href="/logout">LOGOUT</a></li>
						% end
					</ul>
				</div>
			</nav>
		</section>

		<div class="forum">
			<div class="contacts">
				<div class="title">
					<p>Contacts <a href="#search" title="Add contact">+</a></p>
				</div>
				<form name="form" id="search" method="GET">
					<a class="close" href="#" title="close">X</a>
					<div class="input_box">
						<input type="text" name="contact" placeholder="Add contact">
						<button type="submit" name="search"><img src="img/search_bold.png"></button>
					</div>
					<p class="error">{{error}}</p>
				</form>
				% for contact in contacts:
					<a href="/forum/{{contact}}" class=contact>
						<!-- img class="profile_pic" src="img/blank_profile_pic.png" -->
						<p class="username">{{contact}}</p>
					</a>
				% end
			</div>
			<div class="messages">
				% for username, message in messages:
					<form name="form" class="message" method="GET">
						<!--img class="profile_pic" src="img/blank_profile_pic.png"-->
						<p class="username">{{username}}</p>
						<input type="text" name="username" value="{{username}}" readonly>
						<p>{{message}}</p>
						<textarea name="msg" required rows="1" placeholder="Enter your message to {{username}} ..."></textarea>
						<input type="submit" name="send" value="Send">
						<p class="error">{{error_mute}}</p>
					</form>
				% end
			</div>
			
		</div>	
	</body>
</html>			