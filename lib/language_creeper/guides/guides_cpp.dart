import 'package:flutter/material.dart';

class GuidesPageCpp extends StatelessWidget {
  const GuidesPageCpp({Key? key}) : super(key: key);

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
      body: GuidesScreenCpp(),
    );
  }
}

class GuidesScreenCpp extends StatelessWidget {
  GuidesScreenCpp({Key? key}) : super(key: key);

  final List<Map<String, String>> guides = const [
    {'title': 'C++ Overview', 'description': 'Get a high-level understanding of C++ programming and its applications.'},
    {'title': 'C++ Basics', 'description': 'Learn foundational elements such as syntax, structure, and first programs.'},
    {'title': 'C++ Variables and Constants', 'description': 'Understand how to declare variables and constants in C++.'},
    {'title': 'C++ Data Types and Literals', 'description': 'Explore different data types and literals used in C++.'},
    {'title': 'C++ Operators', 'description': 'Study arithmetic, relational, and logical operators in C++.'},
    {'title': 'C++ Input/Output', 'description': 'Learn how to handle user input and display output in C++.'},
    {'title': 'C++ Control Statements', 'description': 'Discover decision-making and loop constructs in C++.'},
    {'title': 'C++ Functions', 'description': 'Understand function declaration, definition, and usage.'},
    {'title': 'C++ Pointers and References', 'description': 'Learn about memory management with pointers and references.'},
    {'title': 'C++ Arrays', 'description': 'Explore array declaration, initialization, and usage.'},
    {'title': 'C++ Strings', 'description': 'Handle and manipulate strings effectively in C++.'},
    {'title': 'C++ Structures and Unions', 'description': 'Learn about structured data types using structs and unions.'},
    {'title': 'C++ Object-Oriented Programming', 'description': 'Dive into classes, objects, and fundamental OOP concepts.'},
    {'title': 'C++ Encapsulation and Abstraction', 'description': 'Understand encapsulation and abstraction principles.'},
    {'title': 'C++ Polymorphism', 'description': 'Study compile-time and runtime polymorphism in C++.'},
    {'title': 'C++ Function Overloading', 'description': 'Learn how to define multiple functions with the same name.'},
    {'title': 'C++ Operator Overloading', 'description': 'Explore how to overload operators for custom behavior.'},
    {'title': 'C++ Inheritance', 'description': 'Understand inheritance and its types in C++.'},
    {'title': 'C++ Virtual Functions', 'description': 'Learn about virtual functions and dynamic binding.'},
    {'title': 'C++ Exception Handling', 'description': 'Handle runtime errors gracefully using exception handling.'},
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
                  builder: (context) => GuideDetailScreenCpp(
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


class GuideDetailScreenCpp extends StatefulWidget {
  final String guideTitle;

  const GuideDetailScreenCpp({Key? key, required this.guideTitle}) : super(key: key);

  @override
  _GuideDetailScreenCppState createState() => _GuideDetailScreenCppState();
}

class _GuideDetailScreenCppState extends State<GuideDetailScreenCpp> {
  String selectedItem = '';
  String description = '';

  final Map<String, List<Map<String, String>>> dropdownContent = {
    'C++ Overview': [
      {
        'title': 'Introduction to C++',
        'description': 'C++ is a powerful, high-level programming language that supports object-oriented programming. It is widely used for system/software development, game development, and in performance-critical applications.\n\nExample:\ncpp\n#include <iostream>\nint main() {\n  std::cout << "Hello, World!";\n  return 0;\n}\n',
      },
      {
        'title': 'Features of C++',
        'description': 'C++ offers features such as object-oriented programming, low-level memory manipulation, and a rich set of libraries. It allows for both high-level and low-level programming, making it versatile for various applications.\n\nExample:\ncpp\n#include <iostream>\nclass Example {\npublic:\n  void display() {\n    std::cout << "C++ Features";\n  }\n};\n',
      },
      {
        'title': 'History of C++',
        'description': 'C++ was developed by Bjarne Stroustrup at Bell Labs in the early 1980s as an extension of the C programming language. It introduced classes and other features to support object-oriented programming.\n\nExample:\ncpp\n// C++ evolved from C\n#include <iostream>\nint main() {\n  std::cout << "C++ History";\n  return 0;\n}\n',
      },
      {
        'title': 'Interesting Facts about C++',
        'description': 'C++ is one of the most widely used programming languages in the world. It has influenced many other languages, including C#, Java, and Python. C++ is known for its performance and efficiency, making it a favorite for game development and systems programming.\n\nExample:\ncpp\n#include <iostream>\nint main() {\n  std::cout << "C++ is fast!";\n  return 0;\n}\n',
      },
      {
        'title': 'Setting up C++ Development Environment',
        'description': 'To start programming in C++, you need a development environment. Popular IDEs include Visual Studio, Code::Blocks, and CLion. You also need a C++ compiler, such as GCC or MSVC, to compile your code.\n\nExample:\ncpp\n// Install GCC and use it to compile:\n// g++ program.cpp -o program\n#include <iostream>\nint main() {\n  std::cout << "Setup Complete!";\n  return 0;\n}\n',
      },
      {
        'title': 'Similarities and Differences between C++ and C',
        'description': 'C++ is an extension of C, meaning it includes all of C’s features while adding support for object-oriented programming. Key differences include the introduction of classes, inheritance, and polymorphism in C++. C++ also has stronger type checking and supports function overloading.\n\nExample:\ncpp\n// C++ supports OOP\nclass MyClass {\npublic:\n  void myMethod() {\n    std::cout << "C++ OOP";\n  }\n};\n',
      },
    ],
    'C++ Basics': [
      {
        'title': 'First C++ Program',
        'description': 'Your first C++ program typically prints "Hello, World!" to the console. This simple program introduces you to the basic structure of a C++ program, including the main function and output statements.\n\nExample:\ncpp\n#include <iostream>\nint main() {\n  std::cout << "Hello, World!";\n  return 0;\n}\n',
      },
      {
        'title': 'C++ Basic Syntax',
        'description': 'C++ syntax includes rules for writing code, such as using semicolons to terminate statements, using braces to define code blocks, and following naming conventions for variables and functions.\n\nExample:\ncpp\n#include <iostream>\nint main() {\n  int number = 10; // Variable declaration\n  std::cout << number;\n  return 0;\n}\n',
      },
      {
        'title': 'C++ Comments',
        'description': 'Comments in C++ are used to annotate code. Single-line comments start with //, while multi-line comments are enclosed between /* and */. Comments are ignored by the compiler and are useful for documentation.\n\nExample:\ncpp\n// This is a single-line comment\n/* This is a\nmulti-line comment */\n#include <iostream>\nint main() {\n  std::cout << "Comments Example";\n  return 0;\n}\n',
      },
      {
        'title': 'C++ Tokens',
        'description': 'Tokens are the smallest elements in C++ code. They include keywords (e.g., int, return), operators (e.g., +, -), identifiers (e.g., variable names), and literals (e.g., 5, "Hello").\n\nExample:\ncpp\n#include <iostream>\nint main() {\n  int number = 5; // int is a keyword, number is an identifier\n  std::cout << number;\n  return 0;\n}\n',
      },
      {
        'title': 'C++ Identifiers',
        'description': 'Identifiers are names given to entities such as variables, functions, and classes. They must start with a letter or underscore and can contain letters, digits, and underscores. Identifiers are case-sensitive.\n\nExample:\ncpp\n#include <iostream>\nint main() {\n  int myVariable = 10; // myVariable is an identifier\n  std::cout << myVariable;\n  return 0;\n}\n',
      },
      {
        'title': 'C++ Keywords',
        'description': 'Keywords are reserved words in C++ that have special meaning. Examples include int, float, if, else, and return. Keywords cannot be used as identifiers.\n\nExample:\ncpp\n#include <iostream>\nint main() {\n  int number = 5; // int is a keyword\n  std::cout << number;\n  return 0;\n}\n',
      },
      {
        'title': 'Difference between Keyword and Identifier',
        'description': 'Keywords are predefined words in C++ that have special meaning, while identifiers are names created by programmers to represent variables, functions, and other entities.\n\nExample:\ncpp\n#include <iostream>\nint main() {\n  int number = 5; // int is a keyword, number is an identifier\n  std::cout << number;\n  return 0;\n}\n',
      },
    ],
    'C++ Variables and Constants': [
      {
        'title': 'C++ Variables',
        'description': 'Variables are used to store data in C++. They must be declared with a specific data type before use. For example, int age; declares a variable named age of type integer.\n\nExample:\ncpp\n#include <iostream>\nint main() {\n  int age = 25; // Variable declaration\n  std::cout << "Age: " << age;\n  return 0;\n}\n',
      },
      {
        'title': 'C++ Constants',
        'description': 'Constants are fixed values that cannot be changed during program execution. You can define constants using the const keyword, e.g., const int MAX = 100;\n\nExample:\ncpp\n#include <iostream>\nint main() {\n  const int MAX = 100; // Constant declaration\n  std::cout << "Max: " << MAX;\n  return 0;\n}\n',
      },
      {
        'title': 'Scope of C++ Variables',
        'description': 'The scope of a variable determines where it can be accessed in the code. Variables can have local scope (accessible only within a function) or global scope (accessible throughout the program).\n\nExample:\ncpp\n#include <iostream>\nint globalVar = 10; // Global variable\nint main() {\n  int localVar = 20; // Local variable\n  std::cout << "Global: " << globalVar << ", Local: " << localVar;\n  return 0;\n}\n',
      },
      {
        'title': 'C++ Storage Classes',
        'description': 'Storage classes in C++ define the lifetime and visibility of variables. Common storage classes include auto (default), static, extern, and register.\n\nExample:\ncpp\n#include <iostream>\nvoid func() {\n  static int count = 0; // Static variable\n  count++;\n  std::cout << "Count: " << count;\n}\nint main() {\n  func(); // Output: Count: 1\n  func(); // Output: Count: 2\n  return 0;\n}\n',
      },
      {
        'title': 'C++ Static Variables',
        'description': 'Static variables retain their value between function calls. They are initialized only once and exist for the lifetime of the program. Use the static keyword to declare a static variable.\n\nExample:\ncpp\n#include <iostream>\nvoid func() {\n  static int count = 0; // Static variable\n  count++;\n  std::cout << "Count: " << count;\n}\nint main() {\n  func(); // Output: Count: 1\n  func(); // Output: Count: 2\n  return 0;\n}\n',
      },
    ],
    'C++ Data Types and Literals': [
      {
        'title': 'C++ Derived Data Types',
        'description': 'Derived data types are built from fundamental data types. Examples include arrays, pointers, and functions. They allow for more complex data structures.\n\nExample:\ncpp\n#include <iostream>\nint main() {\n  int arr[3] = {1, 2, 3}; // Array (derived data type)\n  std::cout << "First element: " << arr[0];\n  return 0;\n}\n',
      },
      {
        'title': 'C++ User-Defined Data Types',
        'description': 'User-defined data types allow programmers to create custom data types using structures, unions, and classes, enhancing code organization and readability.\n\nExample:\ncpp\n#include <iostream>\nstruct Point {\n  int x, y; // User-defined data type\n};\nint main() {\n  Point p = {10, 20};\n  std::cout << "Point: (" << p.x << ", " << p.y << ")";\n  return 0;\n}\n',
      },
      {
        'title': 'C++ Data Type Ranges and Their Macros',
        'description': 'Each data type in C++ has a specific range of values it can hold. Macros like INT_MAX and FLT_MAX can be used to determine these limits.\n\nExample:\ncpp\n#include <iostream>\n#include <climits>\nint main() {\n  std::cout << "Max int: " << INT_MAX;\n  return 0;\n}\n',
      },
      {
        'title': 'C++ Type Modifiers',
        'description': 'Type modifiers such as signed, unsigned, long, and short can be applied to basic data types to alter their size and sign, allowing for more precise data representation.\n\nExample:\ncpp\n#include <iostream>\nint main() {\n  unsigned int positiveNum = 100; // Unsigned modifier\n  std::cout << "Positive Number: " << positiveNum;\n  return 0;\n}\n',
      },
      {
        'title': 'C++ Data Type Conversion',
        'description': 'Data type conversion in C++ can be implicit (automatic) or explicit (manual). Implicit conversion occurs when the compiler automatically converts one data type to another, while explicit conversion is done using casting.\n\nExample:\ncpp\n#include <iostream>\nint main() {\n  double num = 10.5;\n  int intNum = (int)num; // Explicit conversion\n  std::cout << "Integer: " << intNum;\n  return 0;\n}\n',
      },
      {
        'title': 'C++ Typecasting Operators',
        'description': 'Typecasting operators like static_cast, dynamic_cast, const_cast, and reinterpret_cast are used to convert one data type to another in a controlled manner.\n\nExample:\ncpp\n#include <iostream>\nint main() {\n  double num = 10.5;\n  int intNum = static_cast<int>(num); // Static cast\n  std::cout << "Integer: " << intNum;\n  return 0;\n}\n',
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
              style: const TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            DropdownButton<String>(
              value: selectedItem.isEmpty ? null : selectedItem,
              hint: const Text('Select a topic'),
              onChanged: (String? newValue) {
                setState(() {
                  selectedItem = newValue!;
                  description = dropdownContent[widget.guideTitle]!
                      .firstWhere((item) => item['title'] == newValue)['description']!;
                });
              },
              items: dropdownContent[widget.guideTitle]!
                  .map<DropdownMenuItem<String>>((Map<String, String> item) {
                return DropdownMenuItem<String>(
                  value: item['title'],
                  child: Text(item['title']!),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            if (description.isNotEmpty)
              Text(
                description,
                style: const TextStyle(fontSize: 16.0),
              ),
          ],
        ),
      ),
    );
  }
}