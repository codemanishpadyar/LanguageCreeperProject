import 'package:flutter/material.dart';

class GuidesPageHtml extends StatelessWidget {
  const GuidesPageHtml({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HTML Guides'),
        backgroundColor: const Color(0xFFADBC9F),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: GuidesScreenHtml(),
    );
  }
}

class GuidesScreenHtml extends StatelessWidget {
  GuidesScreenHtml({Key? key}) : super(key: key);

  final List<Map<String, String>> guides = const [
    {
      'title': 'HTML Basics',
      'description': 'Understand the essential elements and structure of HTML documents.'
    },
    {
      'title': 'HTML Lists',
      'description': 'Learn how to create ordered, unordered, and definition lists in HTML.'
    },
    {
      'title': 'HTML Tables',
      'description': 'Explore how to create and format tables in HTML.'
    },
    {
      'title': 'HTML Basic Tags',
      'description': 'Get familiar with common HTML tags used for web content.'
    },
    {
      'title': 'HTML Formatting',
      'description': 'Learn how to format text and content in HTML.'
    },
    {
      'title': 'HTML Forms',
      'description': 'Understand how to create forms and handle user input.'
    },
    {
      'title': 'HTML Advanced Concepts',
      'description': 'Dive deeper into advanced HTML techniques and best practices.'
    },
    {
      'title': 'HTML Media Elements',
      'description': 'Learn how to embed audio, video, and other media elements in a web page.'
    },
    {
      'title': 'HTML References',
      'description': 'Get a reference guide for various HTML elements and attributes.'
    },
    {
      'title': 'HTML Miscellaneous',
      'description': 'Explore additional HTML topics and techniques.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: guides.length,
      itemBuilder: (context, index) {
        return Card(
          color: const Color(0xFFADBC9F),
          margin: const EdgeInsets.all(10.0),
          child: ListTile(
            contentPadding: const EdgeInsets.all(10.0),
            title: Text(
              guides[index]['title']!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(guides[index]['description']!),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GuideDetailScreenHtml(
                    guideTitle: guides[index]['title']!,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class GuideDetailScreenHtml extends StatefulWidget {
  final String guideTitle;

  const GuideDetailScreenHtml({Key? key, required this.guideTitle}) : super(key: key);

  @override
  _GuideDetailScreenHtmlState createState() => _GuideDetailScreenHtmlState();
}

class _GuideDetailScreenHtmlState extends State<GuideDetailScreenHtml> {
  String selectedItem = '';
  String description = '';
  String example = '';

  final Map<String, List<Map<String, String>>> dropdownContent = {
    'HTML Basics': [
      {
        'title': 'HTML Structure',
        'description': 'HTML is structured with elements that define the content and layout of a web page.',
        'example': '<!DOCTYPE html>\n<html>\n<head>\n<title>Page Title</title>\n</head>\n<body>\n<h1>My First Heading</h1>\n<p>My first paragraph.</p>\n</body>\n</html>'
      },
      {
        'title': 'HTML Tags Overview',
        'description': 'HTML uses tags to describe elements, with opening and closing tags like <tag>content</tag>.',
        'example': '<h1>This is a heading</h1>\n<p>This is a paragraph.</p>'
      },
      {
        'title': 'Basic HTML Page',
        'description': 'A simple HTML page includes a <!DOCTYPE>, <html>, <head>, and <body> tags.',
        'example': '<!DOCTYPE html>\n<html>\n<head>\n<title>Page Title</title>\n</head>\n<body>\n<h1>My First Heading</h1>\n<p>My first paragraph.</p>\n</body>\n</html>'
      },
      {
        'title': 'HTML Comments',
        'description': 'Comments in HTML are written using <!-- comment --> and are not displayed in the browser.',
        'example': '<!-- This is a comment -->\n<p>This is a paragraph.</p>'
      },
      {
        'title': 'Introduction to HTML',
        'description': 'Introduction to HTML covers its significance, usage, and structure for web development.',
        'example': '<!DOCTYPE html>\n<html>\n<head>\n<title>Introduction to HTML</title>\n</head>\n<body>\n<h1>Welcome to HTML</h1>\n<p>HTML is the standard markup language for creating web pages.</p>\n</body>\n</html>'
      },
      {
        'title': 'HTML Editors',
        'description': 'Learn about different editors you can use to write HTML, such as VS Code, Sublime, and Notepad.',
        'example': '<!-- Open your favorite editor and start coding HTML -->'
      },
      {
        'title': 'HTML Elements',
        'description': 'HTML elements define the structure of web content and can be nested or standalone.',
        'example': '<div>\n<h1>This is a heading</h1>\n<p>This is a paragraph inside a div.</p>\n</div>'
      },
      {
        'title': 'HTML Attributes',
        'description': 'Attributes provide additional information about HTML elements, such as id and class.',
        'example': '<p id="intro">This is an introductory paragraph.</p>'
      },
      {
        'title': 'HTML Doctypes',
        'description': 'The <!DOCTYPE> declaration specifies the version of HTML to be used.',
        'example': '<!DOCTYPE html>'
      },
      {
        'title': 'HTML Heading',
        'description': 'HTML headings (<h1> to <h6>) are used to define headings in a document.',
        'example': '<h1>Heading 1</h1>\n<h2>Heading 2</h2>\n<h3>Heading 3</h3>'
      },
      {
        'title': 'HTML Paragraphs',
        'description': 'HTML paragraphs are defined using the <p> element and represent blocks of text.',
        'example': '<p>This is a paragraph.</p>\n<p>This is another paragraph.</p>'
      },
      {
        'title': 'HTML Links',
        'description': 'HTML links (<a>) enable navigation between different web pages.',
        'example': '<a href="https://www.example.com">Visit Example.com</a>'
      },
      {
        'title': 'HTML Images',
        'description': 'The <img> tag embeds images in web pages, with attributes like src and alt.',
        'example': '<img src="image.jpg" alt="Description of image">'
      },
      {
        'title': 'HTML Semantics',
        'description': 'Semantic HTML introduces meaningful tags like <article>, <footer>, and <section>.',
        'example': '<article>\n<h2>Article Title</h2>\n<p>Article content goes here.</p>\n</article>'
      },
      {
        'title': 'HTML Entities',
        'description': 'HTML entities represent reserved characters in HTML using special codes.',
        'example': '<p>This is a &lt;paragraph&gt;.</p>'
      },
      {
        'title': 'HTML Symbols',
        'description': 'HTML symbols represent special characters or glyphs using entities like &copy; and &amp;.',
        'example': '<p>Copyright &copy; 2023</p>'
      }
    ],
    'HTML Lists': [
      {
        'title': 'What are Lists in HTML?',
        'description': 'Lists in HTML are used to group a collection of related items.',
        'example': '<ul>\n<li>Item 1</li>\n<li>Item 2</li>\n</ul>'
      },
      {
        'title': 'Ordered Lists in HTML',
        'description': 'Ordered lists (<ol>) display items in a sequentially numbered format.',
        'example': '<ol>\n<li>First item</li>\n<li>Second item</li>\n</ol>'
      },
      {
        'title': 'Unordered Lists in HTML',
        'description': 'Unordered lists (<ul>) display items with bullet points.',
        'example': '<ul>\n<li>Item 1</li>\n<li>Item 2</li>\n</ul>'
      },
      {
        'title': 'Description Lists in HTML',
        'description': 'Description lists (<dl>) present terms and their descriptions.',
        'example': '<dl>\n<dt>Term 1</dt>\n<dd>Description 1</dd>\n<dt>Term 2</dt>\n<dd>Description 2</dd>\n</dl>'
      }
    ],
    'HTML Tables': [
      {
        'title': 'What is a Table in HTML?',
        'description': 'Tables in HTML are used to organize data in rows and columns using the <table> element.',
        'example': '<table>\n<tr>\n<th>Header 1</th>\n<th>Header 2</th>\n</tr>\n<tr>\n<td>Data 1</td>\n<td>Data 2</td>\n</tr>\n</table>'
      },
      {
        'title': 'Add a Table Row in HTML',
        'description': 'Use the <tr> element to add a row to an HTML table.',
        'example': '<tr>\n<td>Row 1, Cell 1</td>\n<td>Row 1, Cell 2</td>\n</tr>'
      },
      {
        'title': 'Add a Table Header in HTML',
        'description': 'Use the <th> element to define a table header cell in an HTML table.',
        'example': '<th>Header</th>'
      },
      {
        'title': 'Add a Table Cell in HTML',
        'description': 'Use the <td> element to add a standard data cell within an HTML table row.',
        'example': '<td>Data</td>'
      },
      {
        'title': 'Set captions in HTML Table',
        'description': 'The <caption> element is used to specify a title or caption for the table.',
        'example': '<caption>Table Caption</caption>'
      },
      {
        'title': 'Group Columns in HTML',
        'description': 'The <colgroup> and <col> elements allow you to group and style columns in a table.',
        'example': '<colgroup>\n<col style="background-color:yellow">\n<col style="background-color:green">\n</colgroup>'
      }
    ],
    'HTML Basic Tags': [
      {
        'title': 'Add a Paragraph in HTML',
        'description': 'Use the <p> tag to add paragraphs to your HTML document.',
        'example': '<p>This is a paragraph.</p>'
      },
      {
        'title': 'Create a Link in HTML',
        'description': 'Use the <a> tag to create hyperlinks that navigate to different pages or sections.',
        'example': '<a href="https://www.example.com">Visit Example.com</a>'
      },
      {
        'title': 'Div Tag in HTML',
        'description': 'The <div> tag is used as a container for grouping content and applying styles.',
        'example': '<div>\n<h1>This is a heading</h1>\n<p>This is a paragraph inside a div.</p>\n</div>'
      },
      {
        'title': 'Span Tag in HTML',
        'description': 'The <span> tag is an inline container used for styling parts of text or content.',
        'example': '<p>This is a <span style="color:red;">red</span> word.</p>'
      },
      {
        'title': 'Add a Header on a Webpage',
        'description': 'Headers are added using tags from <h1> to <h6> for titles of different sizes.',
        'example': '<h1>Heading 1</h1>\n<h2>Heading 2</h2>'
      },
      {
        'title': 'Add a Footer on a Webpage',
        'description': 'The <footer> tag is used to define a footer for a document or section.',
        'example': '<footer>\n<p>Footer content goes here.</p>\n</footer>'
      },
      {
        'title': 'Line Break in HTML',
        'description': 'The <br> tag is used to insert a line break in content.',
        'example': '<p>This is a line of text.<br>This is another line of text.</p>'
      },
      {
        'title': 'Add Navigation Bar in HTML',
        'description': 'Use the <nav> tag to create a navigation bar containing links.',
        'example': '<nav>\n<a href="/">Home</a>\n<a href="/about">About</a>\n</nav>'
      },
      {
        'title': 'Link JavaScript to HTML',
        'description': 'Link JavaScript to HTML using the <script> tag.',
        'example': '<script src="script.js"></script>'
      },
      {
        'title': 'HTML Tags – A to Z List',
        'description': 'Explore the complete list of HTML tags with their usage and syntax.',
        'example': '<a href="https://www.w3schools.com/tags/">HTML Tags Reference</a>'
      }
    ],
    'HTML Formatting': [
      {
        'title': 'Make Text Italic in HTML',
        'description': 'Use the <i> or <em> tag to make text italic.',
        'example': '<p><i>This text is italic.</i></p>'
      },
      {
        'title': 'Create Small Text in HTML',
        'description': 'The <small> tag is used to create smaller text in HTML.',
        'example': '<p><small>This text is small.</small></p>'
      },
      {
        'title': 'Mark Text in HTML',
        'description': 'The <mark> tag is used to highlight text by marking it.',
        'example': '<p>This is <mark>highlighted</mark> text.</p>'
      },
      {
        'title': 'Add a Subscript in HTML',
        'description': 'Use the <sub> tag to add subscript text in HTML.',
        'example': '<p>H<sub>2</sub>O</p>'
      },
      {
        'title': 'Strong Tag in HTML',
        'description': 'The <strong> tag is used to emphasize strong importance, typically displayed in bold.',
        'example': '<p><strong>This text is strong.</strong></p>'
      },
      {
        'title': 'Bold Text in HTML',
        'description': 'Use the <b> tag to make text bold without adding semantic importance.',
        'example': '<p><b>This text is bold.</b></p>'
      },
      {
        'title': 'Highlight Text in HTML',
        'description': 'The <mark> tag highlights important text within content.',
        'example': '<p>This is <mark>highlighted</mark> text.</p>'
      },
      {
        'title': 'Show a Deleted Text in HTML',
        'description': 'The <del> tag represents deleted text and often shows it with a strikethrough.',
        'example': '<p><del>This text is deleted.</del></p>'
      },
      {
        'title': 'How to Emphasize Text in HTML',
        'description': 'Use the <em> tag to add emphasis, typically shown in italics.',
        'example': '<p><em>This text is emphasized.</em></p>'
      },
      {
        'title': 'Add a Superscript in HTML',
        'description': 'The <sup> tag is used to create superscript text.',
        'example': '<p>E = mc<sup>2</sup></p>'
      }
    ],
    'HTML Forms': [
      {
        'title': 'What is a Form in HTML?',
        'description': 'Forms in HTML are used to collect user inputs and send them to a server.',
        'example': '<form>\n<label for="name">Name:</label>\n<input type="text" id="name" name="name">\n</form>'
      },
      {
        'title': 'Add an Input Field in HTML',
        'description': 'The <input> tag is used to create input fields like text boxes, checkboxes, and radio buttons.',
        'example': '<input type="text" name="username" placeholder="Enter your username">'
      },
      {
        'title': 'Label Tag in HTML',
        'description': 'The <label> tag is used to associate a text label with an input field.',
        'example': '<label for="email">Email:</label>\n<input type="email" id="email" name="email">'
      },
      {
        'title': 'Add a Button in HTML',
        'description': 'Use the <button> or <input type="button"> to add clickable buttons to forms.',
        'example': '<button type="submit">Submit</button>'
      },
      {
        'title': 'Add a Dropdown in HTML',
        'description': 'The <select> tag is used to create dropdown menus in forms.',
        'example': '<select>\n<option value="1">Option 1</option>\n<option value="2">Option 2</option>\n</select>'
      },
      {
        'title': 'Add a Textarea in HTML',
        'description': 'The <textarea> tag is used to create The <textarea> tag is used to create multi-line text input fields in forms.',
        'example': '<textarea rows="4" cols="50">Enter your text here...</textarea>'
      },
      {
        'title': 'Fieldset Tag in HTML',
        'description': 'The <fieldset> tag is used to group related elements in a form.',
        'example': '<fieldset>\n<legend>Personal Information</legend>\n<label for="name">Name:</label>\n<input type="text" id="name" name="name">\n</fieldset>'
      },
      {
        'title': 'Legend Tag in HTML',
        'description': 'The <legend> tag is used to define a caption for the <fieldset> element.',
        'example': '<fieldset>\n<legend>Login</legend>\n<label for="username">Username:</label>\n<input type="text" id="username" name="username">\n</fieldset>'
      },
      {
        'title': 'Datalist Tag in HTML',
        'description': 'The <datalist> tag is used to provide autocomplete options for an input field.',
        'example': '<input list="browsers">\n<datalist id="browsers">\n<option value="Chrome">\n<option value="Firefox">\n<option value="Safari">\n</datalist>'
      }
    ],
    'HTML Advanced Concepts': [
      {
        'title': 'iframe in HTML',
        'description': 'The <iframe> tag is used to embed another webpage within the current HTML page.',
        'example': '<iframe src="https://www.example.com" width="600" height="400"></iframe>'
      },
      {
        'title': 'File Paths',
        'description': 'File paths in HTML specify the location of files such as images, stylesheets, and scripts.',
        'example': '<img src="images/photo.jpg" alt="Photo">'
      },
      {
        'title': 'Favicon',
        'description': 'A favicon is a small icon displayed in the browser tab, defined using the <link> element.',
        'example': '<link rel="icon" type="image/x-icon" href="/images/favicon.ico">'
      },
      {
        'title': 'Computer Code Elements',
        'description': 'Tags like <code>, <pre>, and <kbd> are used to display computer code in HTML.',
        'example': '<code>console.log("Hello, World!");</code>'
      },
      {
        'title': 'Add Emojis in HTML',
        'description': 'Emojis can be added using Unicode characters or HTML entities.',
        'example': '<p>😀 This is a smiley face.</p>'
      },
      {
        'title': 'Charsets in HTML',
        'description': 'The <meta charset="UTF-8"> tag defines the character set used by a webpage.',
        'example': '<meta charset="UTF-8">'
      },
      {
        'title': 'URL Encoding in HTML',
        'description': 'URL encoding converts special characters into a format that can be safely transmitted.',
        'example': '<a href="https://www.example.com/search?q=HTML%20Basics">Search HTML Basics</a>'
      },
      {
        'title': 'Responsive Web Design',
        'description': 'Responsive design ensures that webpages look good on different screen sizes using CSS media queries.',
        'example': '<meta name="viewport" content="width=device-width, initial-scale=1.0">'
      },
      {
        'title': 'HTML Layout',
        'description': 'HTML layout techniques involve elements such as <header>, <footer>, <section>, and <aside>.',
        'example': '<header>\n<h1>Header</h1>\n</header>\n<section>\n<p>Content goes here.</p>\n</section>\n<footer>\n<p>Footer</p>\n</footer>'
      }
    ],
    'HTML Media Elements': [
      {
        'title': 'Add Audio to a Webpage',
        'description': 'Use the <audio> tag to embed audio content on a webpage. It supports formats like MP3, WAV, and Ogg.',
        'example': '<audio controls>\n<source src="audio.mp3" type="audio/mpeg">\nYour browser does not support the audio element.\n</audio>'
      },
      {
        'title': 'Add Video to a Webpage',
        'description': 'The <video> tag is used to embed video content on a webpage. It supports formats such as MP4, WebM, and Ogg.',
        'example': '<video width="320" height="240" controls>\n<source src="video.mp4" type="video/mp4">\nYour browser does not support the video tag.\n</video>'
      }
    ],
    'HTML References': [
      {
        'title': 'Tags Reference',
        'description': 'A comprehensive list of HTML tags along with their descriptions and usage.',
        'example': '<a href="https://www.w3schools.com/tags/">HTML Tags Reference</a>'
      },
      {
        'title': 'Attributes Reference',
        'description': 'A complete guide to HTML attributes, which define properties and behavior for HTML elements.',
        'example': '<p id="intro" class="highlight">This is a paragraph.</p>'
      },
      {
        'title': 'Global Attributes Reference',
        'description': 'Global attributes can be applied to almost all HTML elements, such as id, class, and style.',
        'example': '<p id="unique" class="text" style="color:red;">This is a styled paragraph.</p>'
      },
      {
        'title': 'Event Attributes Reference',
        'description': 'Event attributes enable interactive behavior by handling events such as onclick, onchange, and more.',
        'example': '<button onclick="alert(\'Hello!\')">Click Me</button>'
      },
      {
        'title': 'DOM Reference',
        'description': 'The Document Object Model (DOM) provides an interface for accessing and manipulating HTML documents.',
        'example': '<script>\ndocument.getElementById("demo").innerHTML = "Hello, World!";\n</script>'
      },
      {
        'title': 'DOM Audio/Video Reference',
        'description': 'A guide to DOM methods and properties for controlling audio and video elements in HTML.',
        'example': '<video id="myVideo" width="320" height="240" controls>\n<source src="video.mp4" type="video/mp4">\n</video>\n<button onclick="document.getElementById(\'myVideo\').play()">Play</button>'
      },
      {
        'title': 'HTML5 Reference',
        'description': 'A reference guide for new features and elements introduced in HTML5.',
        'example': '<article>\n<h2>HTML5 Article</h2>\n<p>HTML5 introduces new semantic elements like <article>.</p>\n</article>'
      }
    ],
    'HTML Miscellaneous': [
      {
        'title': 'Structure of HTML Document',
        'description': 'Learn the essential components of an HTML document, including DOCTYPE, head, and body elements.',
        'example': '<!DOCTYPE html>\n<html>\n<head>\n<title>Page Title</title>\n</head>\n<body>\n<h1>My First Heading</h1>\n<p>My first paragraph.</p>\n</body>\n</html>'
      },
      {
        'title': 'Design a Web Page',
        'description': 'Understand the steps involved in creating a fully functional and visually appealing webpage using HTML.',
        'example': '<!DOCTYPE html>\n<html>\n<head>\n<title>My Web Page</title>\n</head>\n<body>\n<h1>Welcome to My Web Page</h1>\n<p>This is a sample web page.</p>\n</body>\n</html>'
      },
      {
        'title': 'Most Commonly Used HTML Tags',
        'description': 'Explore the most frequently used HTML tags and their practical applications in web design.',
        'example': '<h1>Heading</h1>\n<p>Paragraph</p>\n<a href="#">Link</a>\n<img src="image.jpg" alt="Image">'
      },
      {
        'title': 'HTML Form Design',
        'description': 'Learn how to design user-friendly and responsive forms with input fields, buttons, and validation.',
        'example': '<form>\n<label for="name">Name:</label>\n<input type="text" id="name" name="name">\n<button type="submit">Submit</button>\n</form>'
      },
      {
        'title': 'Design Your First Website in Just 1 Week',
        'description': 'A step-by-step guide to help beginners design and launch their first website in just one week.',
        'example': '<!DOCTYPE html>\n<html>\n<head>\n<title>My First Website</title>\n</head>\n<body>\n<h1>Welcome to My Website</h1>\n<p>This is my first website!</p>\n</body>\n</html>'
      },
      {
        'title': 'Simple Portfolio Website Design',
        'description': 'Create a basic portfolio website to showcase your skills, projects, and achievements.',
        'example': '<!DOCTYPE html>\n<html>\n<head>\n<title>My Portfolio</title>\n</head>\n<body>\n<h1>My Portfolio</h1>\n<p>Here are my projects.</p>\n</body>\n</html>'
      },
      {
        'title': 'Design a Portfolio Gallery',
        'description': 'Learn how to create an interactive and visually engaging gallery to display portfolio projects.',
        'example': '<div class="gallery">\n<img src="project1.jpg" alt="Project 1">\n<img src="project2.jpg" alt="Project 2">\n</div>'
      },
      {
        'title': '10 Best HTML Coding Practices You Must Know',
        'description': 'Follow essential coding practices to write clean, maintainable, and efficient HTML code.',
        'example': '<!DOCTYPE html>\n<html>\n<head>\n<title>Best Practices</title>\n</head>\n<body>\n<h1>Best Practices</h1>\n<p>Always use semantic HTML.</p>\n</body>\n</html>'
      },
      {
        'title': 'Design a Login Form to an Image using HTML',
        'description': 'Learn how to create a visually appealing login form overlaying an image.',
        'example': '<div style="background-image: url(\'background.jpg\');">\n<form>\n<label for="username">Username:</label>\n<input type="text" id="username" name="username">\n<button type="submit">Login</button>\n</form>\n</div>'
      }
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBFADA),
      appBar: AppBar(
        title: Text(widget.guideTitle),
        backgroundColor: const Color(0xFFADBC9F),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.guideTitle,
              style: const TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            DropdownButton<String>(
              isExpanded: true,
              value: selectedItem.isEmpty ? null : selectedItem,
              items: dropdownContent[widget.guideTitle]?.map((topic) {
                return DropdownMenuItem<String>(
                  value: topic['title'],
                  child: Text(topic['title']!),
                );
              }).toList(),
              hint: const Text('Select a topic'),
              onChanged: (newValue) {
                setState(() {
                  selectedItem = newValue!;
                  description = dropdownContent[widget.guideTitle]!
                      .firstWhere((item) => item['title'] == newValue)['description']!;
                  example = dropdownContent[widget.guideTitle]!
                      .firstWhere((item) => item['title'] == newValue)['example']!;
                });
              },
            ),
            const SizedBox(height: 20.0),
            if (description.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    description,
                    style: const TextStyle(fontSize: 18.0),
                  ),
                  const SizedBox(height: 20.0),
                  if (example.isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Example:',
                          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10.0),
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Text(
                            example,
                            style: const TextStyle(fontFamily: 'monospace', fontSize: 16.0),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFADBC9F)),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back to Guides'),
            ),
          ],
        ),
      ),
    );
  }
}