<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title> Serac | Admin </title>
		<link rel="icon" href="img/web_logo_n.png">
		<!-- <link rel="preconnect" href="https://fonts.gstatic.com"> -->
		<link rel="stylesheet" href="css/admin.css">
	</head>
	<body>
		<section class="header">
			<nav>
				<!-- <a href="homepage.html"><img src="img/web_logo.png"></a> -->
				<a href="/about"><img src="img/web_logo_w.png"></a>
				<div class="nav-links" id="navLinks">
					<ul>
						<li><a href="/admin">ADMIN</a></li>
						<li><a href="/forum">FORUM</a></li>
						<li><a href="/logout">LOGOUT</a></li>
					</ul>
				</div>
			</nav>
		</section>

		<div class="content">
			<div class="users">
				<div class="title">Current Users</div>
				<div class="list">
					% for user in users:
						<form name="form" method="GET">
							<input name="username" type="text" value="{{user}}" readonly>
							<input name="modify" type="submit" value="Modify">
						</form>
					% end
				</div>
			</div>
			<div class="details">
				<div class="personal_details">
					<div class="title">Personal Details</div>
					% if username == None:
						<p class="no_user">No user is currently displayed</p>
					% else:
						<div class="list">
							<form>
								<span>Username: &nbsp&nbsp&nbsp&nbsp {{username}} </span>
							</form>
							<form name="form" method="GET">
								<input name="username" type="text" value="{{username}}" style="display: None">
								<span>password: <input name="password" type="text" value="{{password}}"></span>
								<input name="get_password" type="submit" value="Modify">
							</form>
							<form name="form" method="GET">
								<input name="username" type="text" value="{{username}}" style="display: None">
								<span>Access level:
								<select name="access">
									<option value="{{access_level}}">{{access_level_str}}</option>
									<option value="0">User</option>
									<option value="1">Admin</option>
									<option value="2">Superuser</option>
								</select></span>
								<input name="get_access" type="submit" value="Modify">
							</form>
							<form name="form" method="GET">
								<input name="username" type="text" value="{{username}}" style="display: None">
								<input name="delete" type="submit" value="Delete User">
								<p class="error"> {{error}} </p>
							</form>
						</div>
					%end
				</div>
				<div class="contacts">
					<div class="title">Contacts</div>
					% if contacts == None:
						<p class="no_user">No user is currently displayed</p>
					% elif len(contacts) == 0:
						<p class="no_user">The user currently have no contacts</p>
					% else:
					<div class="list">
						% for contact in contacts:
							<form name="mute_user" method="GET">
								<input name="username" type="text" value="{{username}}" style="display: None">
								<input name="receiver" type="text" value="{{contact}}" readonly>
								<input name="mute" type="submit" value="Mute">
							</form>
						% end
					</div>
					% end
				</div>
			</div>
		</div>

	</body>
</html>