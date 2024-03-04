<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="with=device-width, initial-scale=1.0">
		<title> Serac | Intro to Javascript </title>
		<link rel="icon" href="../img/web_logo_n.png">
		<link rel="stylesheet" type="text/css" href="css/hp.css">
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@200;300;400;600;700&display=swap" rel="stylesheet">
	</head>
	<body>
	    <section class="sub-header" style="background-image: linear-gradient(rgba(4, 9, 30, 0.431),rgba(4,9,30,0.7)), url(../img/Javascript.png);">
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
			<h1>Intro to Javascript</h1>
		</section>
		
		
		<section class="learn-html">
            <div class="row">
                <div class="paragraph-section">
                <h1 style="text-align: left;">What is Javascript</h1>
                <p> JavaScript (JS) is a lightweight, interpreted, or just-in-time compiled programming language with first-class functions. 
                While it is most well-known as the scripting language for Web pages, many non-browser environments also use it, such as Node.js, 
                Apache CouchDB and Adobe Acrobat. JavaScript is a prototype-based, multi-paradigm, single-threaded, dynamic language, supporting 
                object-oriented, imperative, and declarative (e.g. functional programming) styles.
                </p>
                <img src="img/js-back.jpg" alt="">
                
                <h1 style="text-align: left;">Javascript Syntax</h1>
                <p> Let's look at by far the most common type of conditional statement you'll use in JavaScript. <code>if...else</code> statement.
                The keyword if followed by some parentheses. A condition to test, placed inside the parentheses (typically "is this value bigger 
                than this other value?", or "does this value exist?"). The condition makes use of the comparison operators we discussed in the 
                last module and returns true or false. A set of curly braces, inside which we have some code — this can be any code we like, and 
                it only runs if the condition returns true. The keyword else. And another set of curly braces, inside which we have some more code 
                — this can be any code we like, and it only runs if the condition is not true — or in other words, the condition is false.
                </p>
                <p> This code is pretty human-readable — it is saying "if the condition returns true, run code A, else run code B". You should note 
                that you don't have to include the else and the second curly brace block — the following is also perfectly legal code:</p>
                
                <p><This is perfectly valid code, but using it is not recommended — it is much easier to read the code and work out what is going 
                on if you use the curly braces to delimit the blocks of code, and use multiple lines and indentation.</p>
                
                <p>To understand this syntax better, let's consider a real example. Imagine a child being asked for help with a chore by their mother
                or father. The parent might say "Hey sweetheart! If you help me by going and doing the shopping, I'll give you some extra allowance so 
                you can afford that toy you wanted." In JavaScript, we could represent this like so:</p>
                <img src="img/js-sample.png" alt="">
                
                <p>This code as shown always results in the shoppingDone variable returning false, meaning disappointment for our poor child. 
                It'd be up to us to provide a mechanism for the parent to set the shoppingDone variable to true if the child did the shopping.</p>
                
                <h1>Else if</h1>
                <p>The last example provided us with two choices, or outcomes — but what if we want more than two?</p>
                <p>There is a way to chain on extra choices/outcomes to your if...else — using else if. Each extra choice 
                requires an additional block to put in between if() { ... } and else { ... } — check out the following more 
                involved example, which could be part of a simple weather forecast application:</p>
                <img src="img/html-sample2.png" alt="">
                <img src="img/js-sample2.png" alt="">
                <p>Here we've got an HTML &lt;select&gt; element allowing us to make different weather choices, and a simple paragraph.
                In the JavaScript, we are storing a reference to both the &lt;select&gt; and &lt;p&gt; elements, and adding an event listener to the 
                &lt;select&gt; element so that when its value is changed, the setWeather() function is run. When this function is run, we first set 
                a variable called choice to the current value selected in the &lt;select&gt; element. We then use a conditional statement to show different 
                text inside the paragraph depending on what the value of choice is. Notice how all the conditions are tested in else if() {...} blocks, 
                except for the first one, which is tested in an if() {...} block.</p>
                </div>
            </div>
		</section>
	</body>
</html>