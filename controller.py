import database as db
from bottle import static_file, route, run, debug, template, TEMPLATE_PATH, get, post, request, redirect, error

#-----------------------------------------------------------------------------
# Static file paths
#-----------------------------------------------------------------------------

# Read template from /template folder
# TEMPLATE_PATH is a list
TEMPLATE_PATH.insert(0, 'template')
db.initialise()

# Allow image loading
@route('/message/img/<picture:path>')
@route('/forum/img/<picture:path>')
@route('/img/<picture:path>')
def serve_pictures(picture):
    '''
        serve_pictures
        Serves images from static/img/
        :: picture :: A path to the requested picture
        Returns a static file object containing the requested picture
    '''
    return static_file(picture, root='img/')

#-----------------------------------------------------------------------------

# Allow CSS
@route('/message/css/<css:path>')
@route('/forum/css/<css:path>')
@route('/css/<css:path>')
def serve_css(css):
    '''
        serve_css
        Serves css from static/css/
        :: css :: A path to the requested css
        Returns a static file object containing the requested css
    '''
    return static_file(css, root='css/')

#-----------------------------------------------------------------------------

# # contacts = ["Random person"] * 10
# # messages = [("Visitor 2", "She didn't like the food. She never did. She made the usual complaints and started the tantrum he knew was coming. But this time was different. Instead of trying to placate her and her unreasonable demands, he just stared at her and watched her meltdown without saying a word."), 
# # ("Visitor 1", "There are only three ways to make this work. The first is to let me take care of everything. The second is for you to take care of everything. The third is to split everything 50 / 50. I think the last option is the most preferable, but I'm certain it'll also mean the end of our marriage."),
# # ("Visitor 3", "")]
# # messages.reverse()

# db.add_user("psui3905", "1234567", 1)
# db.add_user("Visitor 1", "1234567", 0)
# db.add_user("Visitor 2", '1234567', 0)
# db.add_user("Visitor 3", '1234567', 0)
# db.add_user("Visitor 4", '1234567', 0)

# db.add_contact("psui3905", "Visitor 1")
# db.add_contact("psui3905", "Visitor 2")
# db.add_contact("psui3905", "Visitor 3")
# # db.add_contact("psui3905", "Visitor 4")

# db.send_message("Visitor 1", "psui3905", "Hello there, nice to meet you")
# db.send_message("Visitor 2", "psui3905", "Hey")
# db.send_message("Visitor 2", "psui3905", "Another hello")
# db.send_message("Visitor 3", "psui3905", "Nice to meet you")
# db.send_message("Visitor 2", "psui3905", "Here's another message")

@route('/register', method="GET")
def register():
	error = ""
	if request.GET.register:
		username = request.GET.username
		password = request.GET.password
		password_ag = request.GET.password_ag
		if not db.username_valid(username):
			redirect("/message/Register: Invalid Username")
		if password != password_ag:
			error="* Those passwords didin't match."
			return template('register.tpl', error=error)
		if " " in password:
			error="* Password cannot contain empty spaces"
			return template('register.tpl', error=error)
		if not db.add_user(username, password):
			redirect("/message/User Already Exist")
		redirect("/message/Register Successful")
	return template('register.tpl', error=error)

@route('/', method="GET")
@route('/login', method="GET")
def login():
	error = ""
	if request.GET.login:
		username = request.GET.username
		password = request.GET.password
		if not db.user_exist(username):
			redirect("/message/Not Yet a Member")
		if not db.check_credential(username, password):
			error = "* Incorrect password"
			return template('login.tpl', error=error)
		db.set_current_user(username)
		if db.is_admin(username):
			redirect("/admin")
		redirect("/homepage")
	return template('login.tpl', error=error)

@route('/logout')
def logout():
	db.set_current_user('')
	redirect("/login")

@route('/home')
@route('/homepage')
def homepage():
	if db.get_current_user() == '':
		redirect("/message/Access Denied")
	return template("homepage.tpl")

@route('/learnHTML')
def learn_html():
	if db.get_current_user() == '':
		redirect("/message/Access Denied")
	return template("learn_html.tpl")
	
@route('/how_web_work')
def how_web_work():
	if db.get_current_user() == '':
		redirect("/message/Access Denied")
	return template("how_web_work.tpl")
	
@route('/intro_javascript')
def intro_javascript():
	if db.get_current_user() == '':
		redirect("/message/Access Denied")
	return template("intro_javascript.tpl")
	
@route('/angular')
def angular():
	if db.get_current_user() == '':
		redirect("/message/Access Denied")
	return template("angular.tpl")
	
@route('/jquery')
def jquery():
	if db.get_current_user() == '':
		redirect("/message/Access Denied")
	return template("jquery.tpl")
	
@route('/flask')
def flask():
	if db.get_current_user() == '':
		redirect("/message/Access Denied")
	return template("flask.tpl")


@route('/flask')
def flask():
	if db.get_current_user() == '':
		redirect("/message/Access Denied")
	return template("flask.tpl")

@route('/competition-description')
def competition_description():
	if db.get_current_user() == '':
		redirect("/message/Access Denied")
	return template("competition-description.tpl")
	
	
@route('/competition-evaluation')
def competition_description():
	if db.get_current_user() == '':
		redirect("/message/Access Denied")
	return template("competition-evaluation.tpl")


@route('/forum', method="GET")
def forum():
	try:
		contacts = db.get_all_contacts(db.get_current_user())
		messages = db.get_all_messages(db.get_current_user())
		is_admin = db.is_admin(db.get_current_user())
		error = ""
		error_mute = ""
	except:
		redirect("/message/Access Denied")
	if contacts == None:
		contacts = []
	if messages == None:
		messages = []
	messages.reverse()
	if request.GET.msg.strip():
		receiver = request.GET.username
		message = request.GET.msg
		db.change_mute(db.get_current_user(), receiver, 1)
		if db.is_muted(db.get_current_user(), receiver):
			error_mute = f'* You do not have permission to send "{receiver}" a message'
			print(error_mute)
			# return template('forum.tpl', error=error, error_mute=error_mute, contacts=contacts, messages=messages)
		else:
			db.send_message(db.get_current_user(), receiver, message)
			redirect("/forum")
	if request.GET.contact:
		contact = request.GET.contact
		if not db.user_exist(contact):
			error = f"* There are no such users as {contact}"
		else:
			if not db.add_contact(db.get_current_user(), contact):
				error = f"* You've already add {contact} as a friend"
			else:
				redirect("/forum")
	return template('forum.tpl', is_admin=is_admin, error=error, error_mute=error_mute, contacts=contacts, messages=messages)

@route('/forum/<receiver>', method="GET")
def new_forum(receiver):
	try:
		contacts = db.get_all_contacts(db.get_current_user())
		messages = db.get_all_messages(db.get_current_user())
		is_admin = db.is_admin(db.get_current_user())
		error = ""
		error_mute = ""
	except:
		redirect("/message/Access Denied")
	if contacts == None:
		contacts = []
	if messages == None:
		messages = []
	messages.append((receiver, ''))
	messages.reverse()
	if request.GET.msg.strip():
		receiver = request.GET.username
		message = request.GET.msg
		if db.is_muted(db.get_current_user(), receiver):
			error_mute = f'* You do not have permission to send "{receiver}" a message'
			print(error_mute)
			# return template('forum.tpl', error=error, error_mute=error_mute, contacts=contacts, messages=messages)
		else:
			db.send_message(db.get_current_user(), receiver, message)
			redirect("/forum")
	if request.GET.contact:
		contact = request.GET.contact
		if not db.user_exist(contact):
			error = f"* There are no such users as {contact}"
		else:
			if not db.add_contact(db.get_current_user(), contact):
				error = f"* You've already add {contact} as a friend"
			else:
				redirect("/forum")
	return template('forum.tpl', is_admin=is_admin, error=error, error_mute=error_mute, contacts=contacts, messages=messages)

@route("/admin")
def admin():
	if not db.is_admin(db.get_current_user()):
		redirect("/message/Access Denied")

	users = db.get_all_users()

	username = None
	password = None
	access_level = None
	access_level_str = None
	contacts = None

	error = ""

	# display user detail if modify is clicked
	if request.GET.modify:
		username = request.GET.username
		user = db.get_user(username)
		password = user[1]
		access_level = user[2]
		access_level_str = user[3]

		contacts = db.get_all_contacts(username)

	if request.GET.delete:
		username = request.GET.username
		user = db.get_user(username)
		password = user[1]
		access_level = user[2]
		access_level_str = user[3]

		contacts = db.get_all_contacts(username)

		if db.is_superuser(username):
			error = "* Superuser account can not be deleted"
			return template('admin.tpl', users=users, username=username, password=password, access_level=access_level, access_level_str=access_level_str, contacts=contacts, error=error)

		if username == db.get_current_user():
			db.del_user(username)
			redirect("/message/Access Denied")
		
		if db.is_admin(username) and not db.is_superuser(db.get_current_user()):
			error = "* You do not have permission to modify an admin account"
			return template('admin.tpl', users=users, username=username, password=password, access_level=access_level, access_level_str=access_level_str, contacts=contacts, error=error)
		
		db.del_user(username)
		redirect("/admin")
		
	if request.GET.get_password:
		username = request.GET.username
		user = db.get_user(username)
		password = user[1]
		access_level = user[2]
		access_level_str = user[3]

		contacts = db.get_all_contacts(username)

		new_password = request.GET.password
		
		if db.is_superuser(username):
			error = "* Superuser account can not be modified"
			return template('admin.tpl', users=users, username=username, password=password, access_level=access_level, access_level_str=access_level_str, contacts=contacts, error=error)

		if db.is_admin(username) and not db.is_superuser(db.get_current_user()):
			error = "* You do not have permission to modify an admin account"
			return template('admin.tpl', users=users, username=username, password=password, access_level=access_level, access_level_str=access_level_str, contacts=contacts, error=error)

		db.change_password(username, new_password)
		password = new_password
		error = "* password successfully modified"

	if request.GET.get_access:
		username = request.GET.username
		user = db.get_user(username)
		password = user[1]
		access_level = user[2]
		access_level_str = user[3]

		contacts = db.get_all_contacts(username)

		new_access_level = int(request.GET.access)
		
		if db.is_superuser(username):
			error = "* Superuser account can not be modified"
			return template('admin.tpl', users=users, username=username, password=password, access_level=access_level, access_level_str=access_level_str, contacts=contacts, error=error)

		if db.is_admin(username) and not db.is_superuser(db.get_current_user()):
			error = "* You do not have permission to modify an admin account"
			return template('admin.tpl', users=users, username=username, password=password, access_level=access_level, access_level_str=access_level_str, contacts=contacts, error=error)

		db.change_access_level(username, new_access_level)
		access_level = new_access_level
		access_level_str = db.get_access_level_str(access_level)
		
		error = "* access level successfully modified"

	if request.GET.mute:
		username = request.GET.username
		user = db.get_user(username)
		password = user[1]
		access_level = user[2]
		access_level_str = user[3]

		contacts = db.get_all_contacts(username)
		receiver = request.GET.receiver
		
		if db.is_superuser(username):
			error = "* Superuser account can not be modified"
			return template('admin.tpl', users=users, username=username, password=password, access_level=access_level, access_level_str=access_level_str, contacts=contacts, error=error)

		if db.is_admin(username) and not db.is_superuser(db.get_current_user()):
			error = "* You do not have permission to modify an admin account"
			return template('admin.tpl', users=users, username=username, password=password, access_level=access_level, access_level_str=access_level_str, contacts=contacts, error=error)

		db.change_mute(username, receiver, True)
	
	return template('admin.tpl',
		users=users, username=username, password=password,
		access_level=access_level, access_level_str=access_level_str,
		contacts=contacts, error=error)

@error(404)
def not_found(error):
	return template('404_error.tpl')

@route('/message/<message>')
def message(message):
	return template("message.tpl", message=message)

run(debug=True, reloader=True, port=8080)