import 'package:flutter/material.dart';

class GuidesPageJavaScript extends StatelessWidget {
  const GuidesPageJavaScript({Key? key}) : super(key: key);

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
      body: GuidesScreenJavaScript(),
    );
  }
}

class GuidesScreenJavaScript extends StatelessWidget {
  GuidesScreenJavaScript({Key? key}) : super(key: key);

  final List<Map<String, String>> guides = const [
    {
      'title': 'JavaScript Basics',
      'description': 'Explore the foundational concepts of JavaScript programming.',
    },
    {
      'title': 'JS Variables & Datatypes',
      'description': 'Learn about variables and different datatypes in JavaScript.',
    },
    {
      'title': 'JS Operators',
      'description': 'Understand the operators available in JavaScript and their usage.',
    },
    {
      'title': 'JS Loops',
      'description': 'Learn how to use loops to execute repetitive tasks in JavaScript.',
    },
    {
      'title': 'JS Statements',
      'description': 'Discover various JavaScript statements and their functionalities.',
    },
    {
      'title': 'JS Perfomance & Debugging',
      'description': 'Optimize and debug JavaScript code for better performance.',
    },
    {
      'title': 'JS Object',
      'description': 'Understand objects and how to work with them in JavaScript.',
    },
    {
      'title': 'JS Function',
      'description': 'Learn how to define and use functions in JavaScript.',
    },
    {
      'title': 'JS Array',
      'description': 'Explore arrays and methods to manipulate array data in JavaScript.',
    },
    {
      'title': 'JS String',
      'description': 'Understand strings and string methods available in JavaScript.',
    },
    {
      'title': 'JS Numbers',
      'description': 'Learn about numbers and numeric operations in JavaScript.',
    },
    {
      'title': 'JS Math',
      'description': 'Explore the Math object for mathematical operations in JavaScript.',
    },
    {
      'title': 'JS Set',
      'description': 'Understand Set objects and their unique value properties.',
    },
    {
      'title': 'JS Objects',
      'description': 'Learn about objects and advanced operations in JavaScript.',
    },
    {
      'title': 'JS Advance',
      'description': 'Explore advanced JavaScript concepts and patterns.',
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
                  builder: (context) => GuideDetailScreenJavaScript(
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

class GuideDetailScreenJavaScript extends StatefulWidget {
  final String guideTitle;

  GuideDetailScreenJavaScript({Key? key, required this.guideTitle}) : super(key: key);

  @override
  _GuideDetailScreenJavaScriptState createState() =>
      _GuideDetailScreenJavaScriptState();
}

class _GuideDetailScreenJavaScriptState extends State<GuideDetailScreenJavaScript> {
  String selectedItem = '';
  String description = '';

  final Map<String, List<Map<String, String>>> dropdownContent = {
    'JavaScript Basics': [
      {
        'title': 'Introduction to JavaScript',
        'description': 'JavaScript is a versatile programming language primarily used to make web pages dynamic and interactive. It is supported by all modern browsers and can be used for both front-end and back-end development. Example: console.log("Hello, World!");'
      },
      {
        'title': 'JavaScript Versions',
        'description': 'Key versions of JavaScript include ES5 (2009) and ES6 (2015), which introduced major updates such as arrow functions, classes, and template literals. Example: const greet = () => "Hello, World!";'
      },
      {
        'title': 'How to Add JavaScript in HTML Document?',
        'description': 'JavaScript can be added using inline events, internal <script> tags, or external files linked with the <script src="file.js"></script> element. Example: <script>alert("Hello!");</script>'
      },
      {
        'title': 'JavaScript Syntax',
        'description': 'JavaScript syntax involves using statements, variables, functions, and control structures. Example: let message = "Hello"; console.log(message);'
      },
      {
        'title': 'JavaScript Output',
        'description': 'You can display output using methods like console.log(), alert(), and document.write(). Example: document.write("Hello, World!");'
      },
      {
        'title': 'JavaScript Comments',
        'description': 'Use // for single-line comments and /* */ for multi-line comments to explain code or disable execution temporarily. Example: // This is a single-line comment'
      },
    ],
    'JS Variables & Datatypes': [
      {
        'title': 'Variables and Datatypes in JavaScript',
        'description': 'JavaScript variables store data values and can hold different data types such as strings, numbers, booleans, objects, and arrays. Example: let name = "Mayu"; let age = 20;'
      },
      {
        'title': 'Global and Local Variables in JavaScript',
        'description': 'Global variables are accessible throughout the entire script, while local variables are accessible only within a specific block or function. Example: let globalVar = "I am global"; function test() { let localVar = "I am local"; }'
      },
      {
        'title': 'JavaScript Let',
        'description': 'let allows you to declare block-scoped variables, which are restricted to the block, statement, or expression where they are defined. Example: if (true) { let x = 10; }'
      },
      {
        'title': 'JavaScript Const',
        'description': 'const is used to declare block-scoped variables that cannot be reassigned after their initial value has been set. Example: const PI = 3.14;'
      },
      {
        'title': 'JavaScript var',
        'description': 'var declares variables globally or locally to an entire function regardless of block scope. It is hoisted to the top of its scope. Example: var x = 10;'
      }
    ],
    'JS Operators': [
      {
        'title': 'JavaScript Operators',
        'description': 'Operators in JavaScript are used to perform operations on values or variables, such as arithmetic, logical, or comparison operations. Example: let sum = 10 + 5;'
      },
      {
        'title': 'Operator Precedence in JavaScript',
        'description': 'Operator precedence determines the order in which operations are performed in an expression. For example, multiplication has higher precedence than addition. Example: let result = 10 + 5 * 2; // result is 20'
      },
      {
        'title': 'JavaScript Arithmetic Operators',
        'description': 'Arithmetic operators perform mathematical operations like addition (+), subtraction (-), multiplication (*), and division (/). Example: let result = 10 / 2;'
      },
      {
        'title': 'JavaScript Assignment Operators',
        'description': 'Assignment operators assign values to variables. Example: x = 10 assigns 10 to the variable x. Example: let x = 10; x += 5; // x is now 15'
      },
      {
        'title': 'JavaScript Comparison Operators',
        'description': 'Comparison operators compare two values and return a boolean result. Examples: ==, ===, !=, >, <, etc. Example: let isEqual = (10 === "10"); // false'
      },
      {
        'title': 'JavaScript Logical Operators',
        'description': 'Logical operators combine multiple conditions. Examples include && (AND), || (OR), and ! (NOT). Example: let result = (10 > 5) && (5 < 3); // false'
      },
      {
        'title': 'JavaScript Bitwise Operators',
        'description': 'Bitwise operators perform operations on binary numbers. Examples: & (AND), | (OR), ^ (XOR), and ~ (NOT). Example: let result = 5 & 3; // 1'
      },
      {
        'title': 'JavaScript Ternary Operator',
        'description': 'The ternary operator (condition ? expr1 : expr2) evaluates a condition and returns one of two values based on the condition. Example: let result = (10 > 5) ? "Yes" : "No";'
      },
      {
        'title': 'JavaScript Comma Operator',
        'description': 'The comma operator (,) evaluates multiple expressions and returns the result of the last expression. Example: let result = (5, 10); // result is 10'
      },
      {
        'title': 'JavaScript Unary Operators',
        'description': 'Unary operators operate on a single operand. Examples include typeof, delete, and the negation operator -. Example: let x = 10; console.log(-x); // -10'
      },
      {
        'title': 'JavaScript in and instanceof Operators',
        'description': 'The in operator checks if a property exists in an object, and instanceof checks if an object is an instance of a constructor. Example: let obj = { name: "Mayu" }; console.log("name" in obj); // true'
      },
      {
        'title': 'JavaScript String Operators',
        'description': 'String operators include concatenation (+) and template literals using backticks (`). Example: let name = "Mayu"; console.log(Hello, \${name}!);'
      }
    ],
    'JS Statements': [
      {
        'title': 'JavaScript Statements',
        'description': 'JavaScript statements are instructions that a browser executes, such as declaring variables, controlling flow, and calling functions. Example: let x = 10; if (x > 5) { console.log("x is greater than 5"); }'
      },
      {
        'title': 'JavaScript if-else',
        'description': 'The if-else statement allows you to execute different code based on a condition. Example: if (x > 10) { console.log("Greater"); } else { console.log("Smaller"); }'
      },
      {
        'title': 'JavaScript switch Statement',
        'description': 'The switch statement evaluates an expression and matches the result against different case blocks to execute specific code. Example: switch (day) { case "Monday": console.log("Start of the week"); break; }'
      },
      {
        'title': 'JavaScript Break Statement',
        'description': 'The break statement terminates a loop, switch, or label statement when executed. Example: for (let i = 0; i < 10; i++) { if (i === 5) break; }'
      },
      {
        'title': 'JavaScript Continue Statement',
        'description': 'The continue statement skips the rest of the current loop iteration and proceeds with the next one. Example: for (let i = 0; i < 10; i++) { if (i === 5) continue; }'
      },
      {
        'title': 'JavaScript return Statement',
        'description': 'The return statement stops execution of a function and returns a value to the function caller. Example: function add(a, b) { return a + b; }'
      }
    ],
    'JS Loops': [
      {
        'title': 'JavaScript Loops',
        'description': 'Loops in JavaScript are used to execute a block of code multiple times based on certain conditions. Types of loops include for, while, and do...while. Example: for (let i = 0; i < 5; i++) { console.log(i); }'
      },
      {
        'title': 'JavaScript For Loop',
        'description': 'The for loop is used to execute a block of code a set number of times. Example: for (let i = 0; i < 5; i++) { console.log(i); }'
      },
      {
        'title': 'JavaScript While Loop',
        'description': 'The while loop executes a block of code as long as the specified condition evaluates to true. Example: while (x < 5) { console.log(x); x++; }'
      },
      {
        'title': 'JavaScript For In Loop',
        'description': 'The for...in loop is used to iterate over the properties of an object. Example: for (let key in obj) { console.log(key); }'
      },
      {
        'title': 'JavaScript for...of Loop',
        'description': 'The for...of loop is used to iterate over iterable objects like arrays. Example: for (let item of arr) { console.log(item); }'
      },
      {
        'title': 'JavaScript do...while Loop',
        'description': 'The do...while loop executes a block of code once before checking the condition and then continues executing as long as the condition is true. Example: do { console.log(x); x++; } while (x < 5);'
      }
    ],
    'JS Performance & Debugging': [
      {
        'title': 'JavaScript | Performance',
        'description': 'Performance in JavaScript can be optimized through techniques like minimizing DOM manipulations, using asynchronous code, and reducing network latency. Example: Use requestAnimationFrame for smooth animations.'
      },
      {
        'title': 'Debugging in JavaScript',
        'description': 'Debugging involves identifying and fixing errors in the code. Tools like console.log(), breakpoints in the browser’s developer tools, and IDE debuggers can help. Example: console.log(variable);'
      },
      {
        'title': 'JavaScript Errors Throw and Try to Catch',
        'description': 'Use throw to manually generate errors and try...catch to handle exceptions, providing better error management and preventing program crashes. Example: try { throw "Error"; } catch (e) { console.log(e); }'
      }
    ],
    'JS Object': [
      {
        'title': 'Objects in JavaScript',
        'description': 'Objects in JavaScript are collections of key-value pairs, where each key is a string (or symbol), and the value can be any data type, including functions. Example: let person = { name: "Mayu", age: 20 };'
      },
      {
        'title': 'Introduction to Object-Oriented Programming in JavaScript',
        'description': 'JavaScript supports object-oriented programming, where objects represent real-world entities and methods define actions that those objects can perform. Example: class Person { constructor(name) { this.name = name; } }'
      },
      {
        'title': 'JavaScript Objects',
        'description': 'JavaScript objects store data and functions as properties and methods. Example: let person = { name: "Mayu", age: 20 };'
      },
      {
        'title': 'Creating Objects in JavaScript',
        'description': 'Objects in JavaScript can be created using object literals, the new Object() syntax, or by using a constructor function. Example: let obj = new Object(); obj.name = "Mayu";'
      },
      {
        'title': 'JavaScript JSON Objects',
        'description': 'JSON (JavaScript Object Notation) is a lightweight data interchange format, and JavaScript provides JSON.parse() and JSON.stringify() to convert between JSON and objects. Example: let json = JSON.stringify({ name: "Mayu" });'
      },
      {
        'title': 'JavaScript Object Reference',
        'description': 'In JavaScript, objects are reference types, meaning when you assign an object to a variable, the reference to the object is copied, not the object itself. Example: let obj1 = { name: "Mayu" }; let obj2 = obj1;'
      }
    ],
    'JS Function': [
      {
        'title': 'Functions in JavaScript',
        'description': 'Functions in JavaScript are reusable blocks of code designed to perform a particular task. They can be defined using the function keyword or as arrow functions. Example: function greet() { console.log("Hello!"); }'
      },
      {
        'title': 'How to Write a Function in JavaScript?',
        'description': 'To write a function, use the function keyword followed by the function name, parentheses for parameters, and curly braces for the function body. Example: function greet() { console.log("Hello!"); }'
      },
      {
        'title': 'JavaScript Function Call',
        'description': 'A function can be called by using its name followed by parentheses. Example: greet();'
      },
      {
        'title': 'Different Ways of Writing Functions in JavaScript',
        'description': 'Functions can be written as function declarations, expressions, or arrow functions. Example: const add = (a, b) => a + b;'
      },
      {
        'title': 'Difference between Methods and Functions in JavaScript',
        'description': 'In JavaScript, methods are functions that are properties of an object, while functions are standalone blocks of code. Example: let obj = { greet: function() { console.log("Hello!"); } };'
      },
      {
        'title': 'Explain the Different Function States in JavaScript',
        'description': 'Functions in JavaScript can be in different states such as declared, invoked, or returned, affecting their scope and behavior. Example: function greet() { return "Hello!"; }'
      },
      {
        'title': 'JavaScript Function Complete Reference',
        'description': 'The complete reference for JavaScript functions includes function declaration, expression, scope, closure, and various advanced concepts like callbacks and recursion. Example: function factorial(n) { return n <= 1 ? 1 : n * factorial(n - 1); }'
      }
    ],
    'JS Array': [
      {
        'title': 'JavaScript Arrays',
        'description': 'Arrays in JavaScript are used to store multiple values in a single variable. They can hold different data types and are indexed starting from 0. Example: let arr = [1, 2, 3];'
      },
      {
        'title': 'JavaScript Array Methods',
        'description': 'JavaScript provides several built-in methods to manipulate arrays, such as .push(), .pop(), .shift(), .unshift(), and .concat(). Example: arr.push(4); // [1, 2, 3, 4]'
      },
      {
        'title': 'Best-Known JavaScript Array Methods',
        'description': 'Some of the most commonly used JavaScript array methods include .map(), .filter(), .reduce(), .forEach(), and .slice(). Example: let doubled = arr.map(x => x * 2);'
      },
      {
        'title': 'Important Array Methods of JavaScript',
        'description': 'Important array methods include .find(), .sort(), .splice(), .concat(), and .join(), each offering unique functionality to handle arrays efficiently. Example: let found = arr.find(x => x > 2);'
      },
      {
        'title': 'JavaScript Array Reference',
        'description': 'Arrays in JavaScript are reference types, meaning when you assign an array to another variable, both variables refer to the same array in memory. Example: let arr2 = arr1;'
      }
    ],
    'JS String': [
      {
        'title': 'JavaScript Strings',
        'description': 'Strings in JavaScript are used to store and manipulate text data. Strings are enclosed in single, double, or backticks (template literals). Example: let str = "Hello, World!";'
      },
      {
        'title': 'JavaScript String Methods',
        'description': 'JavaScript provides a variety of methods to work with strings, including .toUpperCase(), .toLowerCase(), .slice(), .replace(), and .split(). Example: let upper = str.toUpperCase();'
      },
      {
        'title': 'JavaScript String Reference',
        'description': 'Strings in JavaScript are immutable, meaning their values cannot be changed after they are created. Any modification creates a new string. Example: let newStr = str.replace("Hello", "Hi");'
      }
    ],
    'JS Numbers': [
      {
        'title': 'JavaScript Numbers',
        'description': 'Numbers in JavaScript are used to represent numeric values, including both integers and floating-point numbers. Example: let num = 10.5;'
      },
      {
        'title': 'How Numbers are Stored in JavaScript?',
        'description': 'In JavaScript, numbers are stored as 64-bit floating point values, following the IEEE 754 standard, meaning both integers and decimals are treated similarly. Example: let num = 10.5;'
      },
      {
        'title': 'How to Create a Number Object Using JavaScript?',
        'description': 'You can create a Number object using the new Number() constructor. Example: let numObj = new Number(100);'
      },
      {
        'title': 'JavaScript Number Reference',
        'description': 'JavaScript provides methods and properties for numbers such as .toFixed(), .toPrecision(), and .valueOf() to perform various number-related operations. Example: let num = 10.567; console.log(num.toFixed(2)); // 10.57'
      },
    ],
    'JS Math': [
      {
        'title': 'JavaScript Math Object',
        'description': 'The JavaScript Math object provides mathematical constants and functions, such as Math.PI, Math.sqrt(), and Math.random(), to perform complex calculations. Example: let pi = Math.PI;'
      },
      {
        'title': 'What is the Use of Math Object in JavaScript?',
        'description': 'The Math object is used for performing mathematical operations like trigonometry, logarithms, random number generation, and rounding numbers. Example: let random = Math.random();'
      },
      {
        'title': 'JavaScript Math Reference',
        'description': 'The JavaScript Math object includes methods like .abs(), .round(), .pow(), .max(), and .min() for performing common mathematical tasks. Example: let rounded = Math.round(10.5);'
      }
    ],
    'JS Set': [
      {
        'title': 'Set in JavaScript',
        'description': 'A Set in JavaScript is a collection of unique values. It can store values of any type, including primitive types and object references. Example: let set = new Set([1, 2, 3]);'
      },
      {
        'title': 'How are Elements Ordered in a Set in JavaScript?',
        'description': 'Elements in a Set are ordered by insertion order. When iterated over, the elements appear in the order in which they were added. Example: let set = new Set(); set.add(1); set.add(2);'
      },
      {
        'title': 'Iterate over Set in JavaScript',
        'description': 'You can iterate over a Set using methods like .forEach() or using a for...of loop to access each value in the Set. Example: set.forEach(value => console.log(value));'
      },
      {
        'title': 'How to Sort a Set in JavaScript?',
        'description': 'A Set in JavaScript does not have a built-in sorting method. You need to convert it to an array using Array.from() or the spread operator and then use .sort() to sort it. Example: let sorted = Array.from(set).sort();'
      },
      {
        'title': 'JavaScript Set Reference',
        'description': 'The Set object in JavaScript provides several methods like .add(), .delete(), .has(), and .clear() to manipulate the collection of unique elements. Example: set.add(4); set.delete(1);'
      }
    ],
    'JS Objects': [
      {
        'title': 'JavaScript Date',
        'description': 'The Date object in JavaScript is used to handle dates and times. It can represent a specific date or time or the current date and time. Example: let date = new Date();'
      },
      {
        'title': 'JavaScript Promise',
        'description': 'A Promise in JavaScript represents the eventual completion (or failure) of an asynchronous operation and its resulting value. Example: let promise = new Promise((resolve, reject) => { resolve("Success!"); });'
      },
      {
        'title': 'JavaScript BigInt',
        'description': 'BigInt is a built-in object in JavaScript that allows representation of integers larger than Number.MAX_SAFE_INTEGER. Example: let bigNum = BigInt(9007199254740991);'
      },
      {
        'title': 'JavaScript Boolean',
        'description': 'The Boolean object in JavaScript represents a value of true or false. It is a wrapper object around the primitive true and false values. Example: let bool = new Boolean(true);'
      },
      {
        'title': 'JavaScript Proxy/Handler',
        'description': 'A Proxy is an object that wraps another object and intercepts operations like property access, assignment, and method invocation using a handler object. Example: let proxy = new Proxy(target, handler);'
      },
      {
        'title': 'JavaScript WeakMap',
        'description': 'A WeakMap is a collection of key-value pairs where the keys are objects and the values can be any arbitrary value. The references to the keys are weak, meaning they do not prevent garbage collection. Example: let weakMap = new WeakMap();'
      },
      {
        'title': 'JavaScript WeakSet',
        'description': 'A WeakSet is similar to a Set, but its values are objects, and the references to those objects are weak, meaning they do not prevent garbage collection. Example: let weakSet = new WeakSet();'
      },
      {
        'title': 'JavaScript Function Generator',
        'description': 'Generators in JavaScript are functions that can be paused and resumed, allowing you to manage asynchronous code more efficiently using the yield keyword. Example: function* generator() { yield 1; yield 2; }'
      },
      {
        'title': 'JavaScript JSON',
        'description': 'JSON (JavaScript Object Notation) is a lightweight data interchange format that is easy for humans to read and write and easy for machines to parse and generate. It is often used to send data between a server and a client. Example: let json = JSON.stringify({ name: "Mayu" });'
      }
    ],
    'JS Advance': [
      {
        'title': 'Arrow Functions in JavaScript',
        'description': 'Arrow functions provide a concise syntax for writing functions. They do not have their own this, so they inherit this from the surrounding context. Example: const greet = () => "Hello, World!";'
      },
      {
        'title': 'JavaScript this Keyword',
        'description': 'The this keyword in JavaScript refers to the context in which a function is executed. Its value depends on how the function is called. Example: let obj = { name: "Mayu", greet: function() { console.log(this.name); } };'
      },
      {
        'title': '"use strict" in JavaScript',
        'description': 'The "use strict" directive is used to enable strict mode in JavaScript, which helps catch common coding errors by throwing exceptions for actions that are normally ignored. Example: "use strict"; x = 10; // Error'
      },
      {
        'title': 'Introduction to ES6',
        'description': 'ES6 (ECMAScript 2015) introduced many features to JavaScript, including classes, modules, arrow functions, template literals, and more, making code more modern and easier to write. Example: let name = "Mayu"; console.log(Hello, \${name}!);'
      },
      {
        'title': 'JavaScript Hoisting',
        'description': 'Hoisting is JavaScript’s default behavior of moving all variable and function declarations to the top of their containing scope during the compile phase. Example: console.log(x); var x = 10; // undefined'
      },
      {
        'title': 'Async and Await in JavaScript',
        'description': 'The async and await keywords are used to handle asynchronous code in a more readable and synchronous-looking manner, making it easier to work with Promises. Example: async function fetchData() { let data = await fetch(url); }'
      }
    ]
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
                return DropdownMenuItem<String>(value: topic['title'], child: Text(topic['title']!));
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