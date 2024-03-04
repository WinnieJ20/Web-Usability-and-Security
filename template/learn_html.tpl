<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="with=device-width, initial-scale=1.0">
		<title> Serac | Intro to HTML & CSS </title>
		<link rel="icon" href="../img/web_logo_n.png">
		<link rel="stylesheet" type="text/css" href="css/hp.css">
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@200;300;400;600;700&display=swap" rel="stylesheet">
	</head>
	<body>
	    <section class="sub-header">
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
			<h1>Intro to HTML & CSS</h1>
		</section>
		
		
		<section class="learn-html">
            <div class="row">
                <div class="about-col">
                <h1>What is HTML and CSS?</h1>
                <p> <b> HyperText Markup Language (HTML)</b> is the set of markup symbols or codes inserted into a file intended for display on the Internet. 
                The markup tells web browsers how to display a web page's words and images. Stands for "Hypertext Markup Language." 
                HTML is the language used to create webpages. "Hypertext" refers to the hyperlinks that an HTML page may contain. 
                "Markup language" refers to the way tags are used to define the page layout and elements within the page.
                </p>
                
                <p> <b>Cascading Style Sheets (CSS)</b> is a computer language for laying out and structuring web pages (HTML or XML). This language contains 
                coding elements and is composed of these “cascading style sheets” which are equally called CSS files (.css). It describes how HTML elements 
                should be displayed.
                </p>
                
                <!-- <a href="">EXPLORE NOW</a> -->
                <h1>HTML Basics</h1>
                <p> HTML stands for Hyper Text Markup Language.
                    It is the standard markup language for creating Web pages.
                    HTML describes the structure of a Web page.
                    For each page written by html, it consists of a series of HTML elements.
                    HTML elements tell the browser how to display the content and label pieces 
                    of content such as "this is a heading", "this is a paragraph", "this is a link", etc.
                </p>
                
                <p>Even though most web pages look different from one another, every web page follows a common structure.
                Each webpage you create should instruct the browser the version of HTML you're using, provide general information about the page like the title for example.
                And define where to display the visible content of the page like images, text and links. You can code along with me by clicking the launch work space button next to the video.
                This will bring up the text editor we're going to use to build our simple website using HTML.
                </p>
                
                <p>In this section, we will generally give bunch of example to illustrate the application scence of several common HTML elements.
                </p>
                </div>
                <div class="about-col">
                    <img src="img/html_css.jpg" alt="">
                    <img src="img/html-example.png" alt="">
                </div>
            </div>
            <div class="paragraph-section">
                <h1>HTML &lt;body&gt; Tag</h1>
                <p>The &lt;body&gt; tag, as one of the most widely used tag in HTML,  defines the document's body. The &lt;body&gt;
                element contains all the contents of an HTML document, such as headings, paragraphs, Images, hyperlinks,table, lists, etc. 
                Note: There can only be one &lt;body&gt; element in an HTML document. The &lt;body&gt; tag also supports the Event Attributes in HTML.</p>
                <p>A simple HTML document example is shown below:</p>
                <img src="img/html_sample_1.png" alt="">
                
                <h1>HTML &lt;button&gt; Tag</h1>
                <p>The &lt;button&gt; tag defines clickable button. Inside a  &lt;button&gt;
                element you can put text (and tags like &lt;button&gt;, &lt;i&gt;, &lt;b&gt;, &lt;strong&gt;, &lt;br&gt;, &lt;img&gt; etc.)
                That is not possible with a button created with the &lt;input&gt; element. Besides that, please always specify the type attribute for a
                &lt;button&gt; element, to tell browsers what type of button it is. You can easily style buttons with CSS! Look at the examples below or 
                visit our CSS Buttons tutorial.</p>
                <img src="img/html_sample_2.png" alt="">
            </div>
		</section>
	</body>
</html>