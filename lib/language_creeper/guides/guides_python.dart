import 'package:flutter/material.dart';

class GuidesPagePython extends StatelessWidget {
  const GuidesPagePython({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guides'),
        backgroundColor: const Color(0xFFADBC9F),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: GuidesScreenPython(),
    );
  }
}

class GuidesScreenPython extends StatelessWidget {
  GuidesScreenPython({Key? key}) : super(key: key);

  final List<Map<String, String>> guides = const [
    {
      'title': 'Python Fundamentals',
      'description': 'Understand the core basics of Python programming including syntax and simple operations.',
    },
    {
      'title': 'Python Data Types',
      'description': 'Learn about different data types in Python such as int, float, str, list, and more.',
    },
    {
      'title': 'Python Conditional Statements and Loops',
      'description': 'Explore how to control program flow using if statements, loops like for and while.',
    },
    {
      'title': 'Python Functions',
      'description': 'Learn how to create and use functions, including lambda expressions in Python.',
    },
    {
      'title': 'Python OOPs Concepts',
      'description': 'Understand Object-Oriented Programming concepts such as classes and objects in Python.',
    },
    {
      'title': 'Python Exception Handling',
      'description': 'Handle errors and exceptions gracefully in Python using try-except blocks.',
    },
    {
      'title': 'File Handling',
      'description': 'Learn how to read, write, and manage files in Python.',
    },
    {
      'title': 'Python Collections',
      'description': 'Understand specialized data structures like lists, sets, dictionaries, and tuples.',
    },
    {
      'title': 'Python Database Handling',
      'description': 'Learn how to connect and interact with databases using Python.',
    },
    {
      'title': 'Python Packages or Libraries',
      'description': 'Explore Python packages and libraries to extend program functionality.',
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
                  builder: (context) => GuideDetailScreenPython(
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

class GuideDetailScreenPython extends StatefulWidget {
  final String guideTitle;

  const GuideDetailScreenPython({Key? key, required this.guideTitle}) : super(key: key);

  @override
  _GuideDetailScreenPythonState createState() => _GuideDetailScreenPythonState();
}

class _GuideDetailScreenPythonState extends State<GuideDetailScreenPython> {
  String selectedItem = '';
  String description = '';

  final Map<String, List<Map<String, String>>> dropdownContent = {
    'Python Fundamentals': [
      {
        'title': 'Introduction',
        'description': 'Python is a high-level, interpreted programming language known for its simplicity and readability. It is widely used for web development, data analysis, artificial intelligence, and more.\n\nExample:\npython\nprint("Hello, World!")\n',
      },
      {
        'title': 'Input and Output',
        'description': 'Python provides built-in functions like input() for taking user input and print() for displaying output. These are essential for interactive programs.\n\nExample:\npython\nname = input("Enter your name: ")\nprint("Hello, " + name)\n',
      },
      {
        'title': 'Variables',
        'description': 'Variables in Python are used to store data values. They do not require explicit declaration and can hold different types of data, such as integers, strings, and floats.\n\nExample:\npython\nx = 10\ny = "Python"\nprint(x, y)\n',
      },
      {
        'title': 'Keywords',
        'description': 'Python has reserved keywords like if, else, for, and while that define the structure and logic of a program. These keywords cannot be used as variable names.\n\nExample:\npython\nif 5 > 2:\n    print("Five is greater than two!")\n',
      },
      {
        'title': 'Operators',
        'description': 'Python supports various operators, including arithmetic (+, -), relational (==, >), and logical (and, or). These are used to perform operations on variables and values.\n\nExample:\npython\na = 5\nb = 3\nprint(a + b)  # Output: 8\n',
      },
    ],

    'Python Data Types': [
      {
        'title': 'Numbers',
        'description': 'Python supports integers, floating-point numbers, and complex numbers. These are used for mathematical operations and calculations.\n\nExample:\npython\nnum1 = 10\nnum2 = 3.14\nprint(num1 + num2)  # Output: 13.14\n',
      },
      {
        'title': 'Boolean',
        'description': 'The Boolean data type in Python represents True or False values. It is often used in conditional statements and logical operations.\n\nExample:\npython\nis_python_fun = True\nprint(is_python_fun)  # Output: True\n',
      },
      {
        'title': 'Strings',
        'description': 'Strings in Python are sequences of characters enclosed in quotes. They are immutable and support various operations like slicing and concatenation.\n\nExample:\npython\ngreeting = "Hello, Python!"\nprint(greeting[0:5])  # Output: Hello\n',
      },
      {
        'title': 'Type Casting',
        'description': 'Type casting allows you to convert one data type to another. Python provides functions like int(), float(), and str() for this purpose.\n\nExample:\npython\nnum = "10"\nprint(int(num) + 5)  # Output: 15\n',
      },
      {
        'title': 'List',
        'description': 'Lists are ordered, mutable collections of items. They can store elements of different data types and support operations like appending and removing items.\n\nExample:\npython\nfruits = ["apple", "banana", "cherry"]\nprint(fruits[1])  # Output: banana\n',
      },
      {
        'title': 'Tuples',
        'description': 'Tuples are similar to lists but are immutable. They are used to store collections of items that should not change during program execution.\n\nExample:\npython\ncoordinates = (10, 20)\nprint(coordinates[0])  # Output: 10\n',
      },
      {
        'title': 'Dictionary',
        'description': 'Dictionaries store data as key-value pairs. They are unordered and mutable, making them ideal for fast lookups and data retrieval.\n\nExample:\npython\nperson = {"name": "Alice", "age": 25}\nprint(person["name"])  # Output: Alice\n',
      },
      {
        'title': 'Sets',
        'description': 'Sets are unordered collections of unique elements. They are useful for operations like union, intersection, and difference.\n\nExample:\npython\nnumbers = {1, 2, 3, 3}\nprint(numbers)  # Output: {1, 2, 3}\n',
      },
      {
        'title': 'Arrays',
        'description': 'Arrays in Python are used to store collections of elements of the same type. They are more memory-efficient than lists for large datasets.\n\nExample:\npython\nimport array as arr\nnumbers = arr.array("i", [1, 2, 3])\nprint(numbers[0])  # Output: 1\n',
      },
    ],

    'Python Functions': [
      {
        'title': 'def keyword',
        'description': 'The def keyword is used to define functions in Python. Functions are reusable blocks of code that perform specific tasks.\n\nExample:\npython\ndef greet(name):\n    print("Hello, " + name)\ngreet("Alice")\n',
      },
      {
        'title': 'Use of pass Statement in Function',
        'description': 'The pass statement is a placeholder for future code. It allows you to define a function without implementing its logic.\n\nExample:\npython\ndef my_function():\n    pass\n',
      },
      {
        'title': 'Return statement',
        'description': 'The return statement is used to exit a function and return a value to the caller. It can return any data type, including lists and dictionaries.\n\nExample:\npython\ndef add(a, b):\n    return a + b\nprint(add(5, 3))  # Output: 8\n',
      },
      {
        'title': 'Global and Local Variables',
        'description': 'Global variables are defined outside functions and can be accessed anywhere, while local variables are defined inside functions and are only accessible within them.\n\nExample:\npython\nx = 10  # Global\ndef my_func():\n    y = 5  # Local\n    print(x + y)\nmy_func()\n',
      },
      {
        'title': 'Recursion in Python',
        'description': 'Recursion is a technique where a function calls itself to solve a problem. It is commonly used for tasks like calculating factorials.\n\nExample:\npython\ndef factorial(n):\n    if n == 1:\n        return 1\n    return n * factorial(n - 1)\nprint(factorial(5))  # Output: 120\n',
      },
      {
        'title': '‘Self’ as Default Argument',
        'description': 'In Python classes, self is a default argument that refers to the instance of the class. It is used to access class attributes and methods.\n\nExample:\npython\nclass MyClass:\n    def __init__(self, name):\n        self.name = name\nobj = MyClass("Alice")\nprint(obj.name)  # Output: Alice\n',
      },
      {
        'title': 'First Class Function',
        'description': 'In Python, functions are first-class objects, meaning they can be assigned to variables, passed as arguments, and returned from other functions.\n\nExample:\npython\ndef greet(name):\n    return "Hello, " + name\nmy_func = greet\nprint(my_func("Alice"))  # Output: Hello, Alice\n',
      },
      {
        'title': 'Lambda Function',
        'description': 'Lambda functions are anonymous functions defined with the lambda keyword. They are often used for short, one-line operations.\n\nExample:\npython\nadd = lambda a, b: a + b\nprint(add(5, 3))  # Output: 8\n',
      },
      {
        'title': 'Filter Function',
        'description': 'The filter() function is used to filter elements from an iterable based on a condition. It returns an iterator containing the filtered elements.\n\nExample:\npython\nnumbers = [1, 2, 3, 4, 5]\neven = list(filter(lambda x: x % 2 == 0, numbers))\nprint(even)  # Output: [2, 4]\n',
      },
      {
        'title': 'Inner Function',
        'description': 'Inner functions are functions defined inside another function. They are useful for encapsulating logic that is only relevant within the outer function.\n\nExample:\npython\ndef outer():\n    def inner():\n        print("Inside inner function")\n    inner()\nouter()\n',
      },
      {
        'title': 'Decorators',
        'description': 'Decorators are functions that modify the behavior of other functions. They are often used for logging, access control, and more.\n\nExample:\npython\ndef my_decorator(func):\n    def wrapper():\n        print("Before function call")\n        func()\n        print("After function call")\n    return wrapper\n@my_decorator\ndef say_hello():\n    print("Hello!")\nsay_hello()\n',
      },
    ],

    'Python OOPs Concepts': [
      {
        'title': 'Classes and Objects',
        'description': 'Classes are blueprints for creating objects, which are instances of a class. They encapsulate data and behavior.\n\nExample:\npython\nclass Dog:\n    def __init__(self, name):\n        self.name = name\nmy_dog = Dog("Buddy")\nprint(my_dog.name)  # Output: Buddy\n',
      },
      {
        'title': 'Polymorphism',
        'description': 'Polymorphism allows methods to behave differently based on the object calling them. It is a key feature of object-oriented programming.\n\nExample:\npython\nclass Cat:\n    def speak(self):\n        print("Meow")\nclass Dog:\n    def speak(self):\n        print("Woof")\nanimals = [Cat(), Dog()]\nfor animal in animals:\n    animal.speak()\n',
      },
      {
        'title': 'Inheritance',
        'description': 'Inheritance allows a class to inherit attributes and methods from another class. It promotes code reuse and modularity.\n\nExample:\npython\nclass Animal:\n    def speak(self):\n        print("Animal sound")\nclass Dog(Animal):\n    def speak(self):\n        print("Woof")\nmy_dog = Dog()\nmy_dog.speak()  # Output: Woof\n',
      },
      {
        'title': 'Abstract',
        'description': 'Abstract classes cannot be instantiated and are used as base classes. They enforce the implementation of certain methods in derived classes.\n\nExample:\npython\nfrom abc import ABC, abstractmethod\nclass Animal(ABC):\n    @abstractmethod\n    def speak(self):\n        pass\nclass Dog(Animal):\n    def speak(self):\n        print("Woof")\nmy_dog = Dog()\nmy_dog.speak()  # Output: Woof\n',
      },
      {
        'title': 'Encapsulation',
        'description': 'Encapsulation is the concept of hiding data within a class and providing controlled access through methods. It ensures data integrity.\n\nExample:\npython\nclass BankAccount:\n    def __init__(self, balance):\n        self.__balance = balance\n    def deposit(self, amount):\n        self.__balance += amount\n    def get_balance(self):\n        return self.__balance\naccount = BankAccount(100)\naccount.deposit(50)\nprint(account.get_balance())  # Output: 150\n',
      },
      {
        'title': 'Iterators',
        'description': 'Iterators are objects that allow you to traverse through all elements of a collection. They implement the __iter__() and __next__() methods.\n\nExample:\npython\nmy_list = [1, 2, 3]\nmy_iter = iter(my_list)\nprint(next(my_iter))  # Output: 1\n',
      },
    ],

    'Python Exception Handling': [
      {
        'title': 'Exception handling',
        'description': 'Exception handling in Python is done using try, except, and finally blocks. It helps manage errors gracefully.\n\nExample:\npython\ntry:\n    result = 10 / 0\nexcept ZeroDivisionError:\n    print("Cannot divide by zero!")\n',
      },
      {
        'title': 'Try and Except',
        'description': 'The try block contains code that might raise an exception, while the except block handles the exception.\n\nExample:\npython\ntry:\n    num = int("abc")\nexcept ValueError:\n    print("Invalid input!")\n',
      },
      {
        'title': 'Built-in Exception',
        'description': 'Python provides built-in exceptions like ValueError, TypeError, and IndexError to handle common errors.\n\nExample:\npython\ntry:\n    my_list = [1, 2, 3]\n    print(my_list[5])\nexcept IndexError:\n    print("Index out of range!")\n',
      },
      {
        'title': 'User defined Exception',
        'description': 'You can create custom exceptions by defining a new class that inherits from Python’s Exception class.\n\nExample:\npython\nclass MyError(Exception):\n    pass\nraise MyError("Something went wrong!")\n',
      },
    ],

    'Python File Handling': [
      {
        'title': 'File Handling',
        'description': 'File handling in Python involves opening, reading, writing, and closing files. It is essential for working with external data.\n\nExample:\npython\nfile = open("example.txt", "w")\nfile.write("Hello, Python!")\nfile.close()\n',
      },
      {
        'title': 'Different File Modes',
        'description': 'Python supports various file modes like r (read), w (write), and a (append). Each mode serves a specific purpose.\n\nExample:\npython\nfile = open("example.txt", "r")\ncontent = file.read()\nprint(content)\nfile.close()\n',
      },
      {
        'title': 'Read Files',
        'description': 'Reading files in Python can be done using methods like read(), readline(), and readlines().\n\nExample:\npython\nfile = open("example.txt", "r")\nprint(file.readline())\nfile.close()\n',
      },
      {
        'title': 'Write/Create Files',
        'description': 'You can create new files or write data to existing files using the w mode. This overwrites the file if it already exists.\n\nExample:\npython\nfile = open("new_file.txt", "w")\nfile.write("This is a new file.")\nfile.close()\n',
      },
      {
        'title': 'OS Module',
        'description': 'The os module provides functions for interacting with the operating system, such as creating directories and listing files.\n\nExample:\npython\nimport os\nos.mkdir("new_folder")\n',
      },
      {
        'title': 'pathlib Module',
        'description': 'The pathlib module offers an object-oriented approach to handling file paths. It is more intuitive than the os module.\n\nExample:\npython\nfrom pathlib import Path\npath = Path("example.txt")\nprint(path.exists())\n',
      },
      {
        'title': 'Directory Management',
        'description': 'Directory management involves creating, deleting, and navigating directories. The os and pathlib modules are commonly used for this.\n\nExample:\npython\nimport os\nos.rmdir("new_folder")\n',
      },
    ],

    'Python Collections': [
      {
        'title': 'Counters',
        'description': 'The Counter class from the collections module is used to count occurrences of elements in an iterable.\n\nExample:\npython\nfrom collections import Counter\nmy_list = ["apple", "banana", "apple"]\ncount = Counter(my_list)\nprint(count)  # Output: Counter({"apple": 2, "banana": 1})\n',
      },
      {
        'title': 'Heapq',
        'description': 'The heapq module provides functions to implement heaps, which are useful for priority queues.\n\nExample:\npython\nimport heapq\nnumbers = [5, 3, 8, 1]\nheapq.heapify(numbers)\nprint(heapq.heappop(numbers))  # Output: 1\n',
      },
      {
        'title': 'Deque',
        'description': 'The deque class from the collections module is a double-ended queue that allows fast appends and pops from both ends.\n\nExample:\npython\nfrom collections import deque\nmy_deque = deque([1, 2, 3])\nmy_deque.append(4)\nprint(my_deque)  # Output: deque([1, 2, 3, 4])\n',
      },
      {
        'title': 'OrderedDict',
        'description': 'The OrderedDict class maintains the order in which items are inserted, unlike regular dictionaries.\n\nExample:\npython\nfrom collections import OrderedDict\nmy_dict = OrderedDict()\nmy_dict["a"] = 1\nmy_dict["b"] = 2\nprint(my_dict)  # Output: OrderedDict([("a", 1), ("b", 2)])\n',
      },
      {
        'title': 'Defaultdict',
        'description': 'The defaultdict class provides a default value for non-existent keys, making it easier to handle missing keys.\n\nExample:\npython\nfrom collections import defaultdict\nmy_dict = defaultdict(int)\nmy_dict["a"] += 1\nprint(my_dict["a"])  # Output: 1\n',
      },
    ],

    'Python Database Handling': [
      {
        'title': 'Python MongoDB Tutorial',
        'description': 'MongoDB is a NoSQL database that stores data in JSON-like documents. Python’s pymongo library is used to interact with MongoDB.\n\nExample:\npython\nfrom pymongo import MongoClient\nclient = MongoClient("mongodb://localhost:27017/")\ndb = client["mydatabase"]\n',
      },
      {
        'title': 'Python MySQL Tutorial',
        'description': 'MySQL is a relational database management system. Python’s mysql-connector library is used to connect and interact with MySQL databases.\n\nExample:\npython\nimport mysql.connector\nmydb = mysql.connector.connect(\n  host="localhost",\n  user="root",\n  password="password"\n)\n',
      },
    ],

    'Python Packages or Libraries': [
      {
        'title': 'Built-in Modules in Python',
        'description': 'Python comes with many built-in modules like math, random, and datetime that provide useful functionality without requiring external libraries.\n\nExample:\npython\nimport math\nprint(math.sqrt(16))  # Output: 4.0\n',
      },
      {
        'title': 'Python DSA Libraries',
        'description': 'Python libraries like collections and heapq provide implementations of common data structures and algorithms.\n\nExample:\npython\nfrom collections import deque\nmy_queue = deque()\nmy_queue.append(1)\nprint(my_queue)  # Output: deque([1])\n',
      },
      {
        'title': 'Machine Learning',
        'description': 'Python is widely used in machine learning with libraries like TensorFlow, Scikit-learn, and PyTorch for building and training models.\n\nExample:\npython\nfrom sklearn.linear_model import LinearRegression\nmodel = LinearRegression()\n',
      },
      {
        'title': 'Python GUI Libraries',
        'description': 'Libraries like Tkinter and PyQt are used to create graphical user interfaces (GUIs) in Python.\n\nExample:\npython\nfrom tkinter import Tk, Label\nroot = Tk()\nLabel(root, text="Hello, Tkinter!").pack()\nroot.mainloop()\n',
      },
      {
        'title': 'Web Scraping Packages',
        'description': 'Python packages like BeautifulSoup and Scrapy are used for web scraping, allowing you to extract data from websites.\n\nExample:\npython\nfrom bs4 import BeautifulSoup\nsoup = BeautifulSoup("<html><body><p>Hello</p></body></html>", "html.parser")\nprint(soup.p.text)  # Output: Hello\n',
      },
      {
        'title': 'Game Development Packages',
        'description': 'Pygame is a popular library for developing games in Python. It provides functionality for graphics, sound, and user input.\n\nExample:\npython\nimport pygame\npygame.init()\nwindow = pygame.display.set_mode((800, 600))\n',
      },
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
            const SizedBox(height: 20.0),
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
                });
              },
            ),
            const SizedBox(height: 20.0),
            Text(
              description,
              style: const TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFADBC9F),
              ),
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