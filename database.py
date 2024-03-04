def format_str(str):
	'''
		format_str
		Format a string to all lower cases and replace space with underscore
		e.g. "Random Name" -> "random_name"
		:: str :: the string to be formated
		Returns the formated string
	'''

	return str.replace(" ", "_")

def username_valid(username):
	'''
		username_valid
		Check if a username only contains chars and int and spaces
		NOTE: SPACE -> 32, 0-9 -> 48-57, A-B -> 65-90, a-b -> 97-122
		:: str :: username to be checked
		Return true if username is valid, otherwise false
	'''
	if not (65 <= ord(username[0]) <= 90 or 97 <= ord(username[0])):
		return False
	for c in username:
		if ord(c) == 32 or 48 <= ord(c) <= 57 or 65 <= ord(c) <= 90 or 97 <= ord(c) <= 122:
			continue
		else:
			return False
	return True

def get_current_user():
	with open("data/cur_user.txt", "r") as f:
		cur_user = f.read()
	return cur_user

def set_current_user(username):
	with open("data/cur_user.txt", "w") as f:
		f.write(username)

import sqlite3
db = 'data/userinfo.db'

def clear():
	conn = sqlite3.connect(db)
	c = conn.cursor()
	c.execute("SELECT username FROM userinfo ")
	users = c.fetchall()
	for user in users:
		del_user(user[0])
	c.execute("DROP TABLE IF EXISTS userinfo")
	conn.commit()
	conn.close()

def initialise():
	set_current_user('')
	conn = sqlite3.connect(db)
	c = conn.cursor()
	c.execute('''
			CREATE TABLE IF NOT EXISTS userinfo (
				username TEXT, 
				password TEXT, 
				access_level int)
		''')
	
	conn.commit()
	conn.close()

def user_exist(username):
	conn = sqlite3.connect(db)
	c = conn.cursor()
	c.execute("SELECT username FROM userinfo WHERE username = (?)", (username,))
	if c.fetchone():
		conn.close()
		return True
	conn.close()
	return False

def check_credential(username, password):
	conn = sqlite3.connect(db)
	c = conn.cursor()
	c.execute("SELECT username, password FROM userinfo")
	rows = c.fetchall()
	details = (username, password) #details: (username, password) --> tuple
	for line in rows:
		if details == line:
			conn.close()
			return True
	conn.close()
	return False

def contact_exist(username, contact):
	conn = sqlite3.connect(db)
	c = conn.cursor()
	f_username = format_str(username)
	c.execute("SELECT username FROM {} WHERE username = (?)".format(f_username+'_c'), (contact,))
	info = c.fetchone()
	if info:
		conn.close()
		return True
	conn.close()
	return False

# is admin if access level is 1 or 2
def is_admin(username):
	conn = sqlite3.connect(db)
	c = conn.cursor()
	c.execute("SELECT username, access_level FROM userinfo WHERE username = (?) AND access_level > 0", (username,))
	if c.fetchone():
		conn.close()
		return True
	conn.close()
	return False

# is superuser if access level is 2
def is_superuser(username):
	conn = sqlite3.connect(db)
	c = conn.cursor()
	c.execute("SELECT username, access_level FROM userinfo WHERE username = (?) AND access_level == 2", (username,))
	if c.fetchone():
		conn.close()
		return True
	conn.close()
	return False

def is_muted(sender, receiver):
	conn = sqlite3.connect(db)
	c = conn.cursor()
	f_sender = format_str(sender)
	c.execute("SELECT is_muted FROM {} WHERE username = (?)".format(f_sender+'_c'), (receiver,))
	info = c.fetchone()
	if info:
		conn.close()
		return bool(info[0])
	conn.close()
	return False

def add_user(username, password, access_level=0):
	'''Add a new user to database'''
	conn = sqlite3.connect(db)
	c = conn.cursor()
	if user_exist(username):
		''' The user already exist '''
		conn.close()
		return False
	else:
		f_name = format_str(username)
		c.execute("INSERT INTO userinfo (username, password, access_level) VALUES ( ?, ?, ?)", (username, password, access_level))
		c.execute("CREATE TABLE IF NOT EXISTS {} (username TEXT, is_muted bool)".format(f_name+"_c"))
		c.execute("CREATE TABLE IF NOT EXISTS {} (username TEXT, message TEXT)".format(f_name+"_m"))
	conn.commit()
	conn.close()
	return True

def add_contact(username, contact):
	'''
		Add each other as contacts
		If contact is not a user, error
		If they are already contacts, error
	'''
	conn = sqlite3.connect(db)
	c = conn.cursor()
	if user_exist(contact):
		if contact_exist(username, contact):
			return False
		f_username = format_str(username)
		f_contact = format_str(contact)
		if f_username == f_contact:
			# send a message to myself
			c.execute("INSERT INTO {} (username, is_muted) VALUES (?, 0)".format(f_username+"_c"), (contact,))
		else:
			c.execute("INSERT INTO {} (username, is_muted) VALUES (?, 0)".format(f_username+"_c"), (contact,))
			c.execute("INSERT INTO {} (username, is_muted) VALUES (?, 0)".format(f_contact+"_c"), (username,))
	else:
		return False
	conn.commit()
	conn.close()
	return True

def send_message(username, contact, message):
	'''Send message from user to contact'''
	# only if they are contact
	conn = sqlite3.connect(db)
	c = conn.cursor()
	if user_exist(username) and user_exist(contact):
		f_contact = format_str(contact)
		c.execute("INSERT INTO {} (username, message) VALUES (?, ?)".format(f_contact+"_m"), (username, message))
	conn.commit()
	conn.close()

def del_user(username):
	'''Delete a user from database'''
	conn = sqlite3.connect(db)
	c = conn.cursor()
	for user in get_all_users():
		del_contact(username, user)
	c.execute("DELETE FROM userinfo WHERE username = (?)", (username,))
	f_name = format_str(username)
	c.execute("DROP TABLE IF EXISTS {}".format(f_name+"_c"))
	c.execute("DROP TABLE IF EXISTS {}".format(f_name+"_m"))
	conn.commit()
	conn.close()

def del_contact(username, contact):
	'''Delete each other as contacts'''
	conn = sqlite3.connect(db)
	c = conn.cursor()
	if user_exist(username) and user_exist(contact):
		f_username = format_str(username)
		f_contact = format_str(contact)
		c.execute("DELETE FROM {} WHERE username = (?)".format(f_username+"_c"), (contact,))
		c.execute("DELETE FROM {} WHERE username = (?)".format(f_contact+"_c"), (username,))
	conn.commit()
	conn.close()

def change_password(username, password):
	conn = sqlite3.connect(db)
	c = conn.cursor()
	c.execute("UPDATE userinfo SET password = ? WHERE username LIKE ?", (password, username))
	conn.commit()
	conn.close()

def change_access_level(username, access_level):
	conn = sqlite3.connect(db)
	c = conn.cursor()
	c.execute("UPDATE userinfo SET access_level = ? WHERE username LIKE ?", (access_level, username))
	conn.commit()
	conn.close()

def change_mute(sender, receiver, is_mute):
	conn = sqlite3.connect(db)
	c = conn.cursor()
	f_sender = format_str(sender)
	c.execute("UPDATE {} SET is_muted = ? WHERE username LIKE ?".format(f_sender+"_c"), (is_mute, receiver))
	conn.commit()
	conn.close()

def get_access_level_str(access_level):
	levels = ["User", "Admin", "Superuser"]
	return(levels[access_level])

def get_user(username):
	conn = sqlite3.connect(db)
	c = conn.cursor()
	data = c.execute("SELECT username, password, access_level from userinfo WHERE username = (?)", (username,))
	user = c.fetchone()
	if user != None:
		user += (get_access_level_str(user[2]),)
	conn.close()
	return user

def get_all_users():
	conn = sqlite3.connect(db)
	c = conn.cursor()
	data = c.execute("SELECT username from userinfo")
	users = []
	for user in data:
		users.append(user[0])
	conn.close()
	return users

def get_all_contacts(username):
	conn = sqlite3.connect(db)
	c = conn.cursor()
	f_username = format_str(username)
	data = c.execute("SELECT username from {}".format(f_username+'_c'))
	contacts = []
	for contact in data:
		contacts.append(contact[0])
	conn.close()
	return contacts

def get_all_messages(username):
	conn = sqlite3.connect(db)
	c = conn.cursor()
	f_username = format_str(username)
	c.execute("SELECT * from {}".format(f_username+'_m'))
	data = c.fetchall()
	conn.close()
	return data

# clear()
initialise()
add_user("superuser", "123456Gp", 2)
add_user("admin1", "123456Gp", 1)
add_user("admin2", "123456Gp", 1)
add_user("admin3", "123456Gp", 1)
add_user("admin4", "123456Gp", 1)
add_user("user1", "123456Gp", 0)
add_user("user2", "123456Gp", 0)
add_user("user3", "123456Gp", 0)
add_user("user4", "123456Gp", 0)
add_user("user5", "123456Gp", 0)