import 'package:flutter/material.dart';

class GuidesPageC extends StatelessWidget {
  const GuidesPageC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guides'),
        backgroundColor: const Color(0xFFADBC9F),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the main page
          },
        ),
      ),
      body: GuidesScreen(),
    );
  }
}

class GuidesScreen extends StatelessWidget {
  GuidesScreen({Key? key}) : super(key: key);

  final List<Map<String, String>> guides = const [
    {
      'title': 'Introduction to C',
      'description': 'Learn the basics of C programming, including features, syntax, and installation.',
    },
    {
      'title': 'Variables and Data Types',
      'description': 'Understand C variables and different data types with examples.',
    },
    {
      'title': 'C Data Types',
      'description': 'Learn about the different data types in C and how they are used.',
    },
    {
      'title': 'C Input/Output',
      'description': 'Learn how to handle input and output in C using functions like scanf and printf.',
    },
    {
      'title': 'C Operators',
      'description': 'Explore the different operators in C, including arithmetic, relational, and logical operators.',
    },
    {
      'title': 'C Control Statements Decision-Making',
      'description': 'Learn about decision-making statements like if, else, and switch.',
    },
    {
      'title': 'C Functions',
      'description': 'Understand how functions work in C, including function declaration, definition, and calling.',
    },
    {
      'title': 'C Arrays and Strings',
      'description': 'Learn about arrays and strings in C, how to work with them, and perform operations.',
    },
    {
      'title': 'C Pointers',
      'description': 'Understand pointers in C, memory addresses, and how they are used to manipulate data.',
    },
    {
      'title': 'C User-Defined Data Types',
      'description': 'Learn how to create your own data types using structs, enums, and typedef in C.',
    },
    {
      'title': 'C File-Handling',
      'description': 'Learn how to handle files in C, including reading from and writing to files.',
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
                  builder: (context) => GuideDetailScreen(
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

class GuideDetailScreen extends StatefulWidget {
  final String guideTitle;

  GuideDetailScreen({Key? key, required this.guideTitle}) : super(key: key);

  @override
  _GuideDetailScreenState createState() => _GuideDetailScreenState();
}

class _GuideDetailScreenState extends State<GuideDetailScreen> {
  String? selectedItem;
  String description = '';

  final Map<String, List<Map<String, String>>> dropdownContent = {
    'Introduction to C': [
      {
        'title': 'Features of C Programming Language',
        'description': """
Why Choose C?  
- *Low-level memory access*: C allows direct interaction with hardware, making it suitable for system-level programming.
- *Simple syntax*: C has a minimal set of keywords, making it easier for beginners to learn.
- *Structured and modular*: C encourages code reusability through functions, enhancing maintainability.
- *High-performance computing*: C is ideal for performance-critical applications, such as operating systems and embedded systems.

*Key Features of C Language*  
1. *Procedural Language*: C follows a procedural approach, where the program is divided into functions, promoting modularity.
2. *Fast and Efficient*: C programs execute directly on hardware, offering superior performance compared to interpreted languages.
3. *Modularity*: C supports libraries, allowing developers to reuse code and reduce redundancy.
4. *Statically Typed*: Variable types are checked at compile-time, which helps catch errors early.
5. *General-Purpose Language*: C is versatile and used in various domains, including operating systems, databases, and embedded systems.
6. *Rich Set of Built-in Operators*: C provides a variety of operators for efficient programming.
7. *Libraries with Rich Functions*: The C standard library offers numerous functions for various tasks, enhancing productivity.
8. *Middle-Level Language*: C combines features of both high-level and low-level languages, making it powerful for system programming.
9. *Portability*: C programs can run on different platforms with minimal changes.
10. *Easy to Extend*: C allows for easy modification and addition of new features without restructuring existing code.

*Conclusion*: C remains a powerful and widely used language due to its performance, portability, and efficiency. Mastering C is a valuable skill for any programmer.
"""
      },
    ],
    'Variables and Data Types': [
      {
        'title': 'Variables in C',
        'description': """
Variables are used to store data in C. Each variable has a type that determines the size and layout of the variable's memory. 

*Example*:
```c
int age = 30; // Integer variable
float salary = 50000.50; // Floating-point variable
char grade = 'A'; // Character variable
Understanding variables is fundamental for programming in C. """ }, { 'title': 'Data Types in C', 'description': """ C supports several data types, which can be categorized into:

Basic Data Types: int, char, float, double.
Derived Data Types: Arrays, pointers, structures, unions.
Enumeration Types: User-defined types that consist of a set of named integer constants.
Example:

c
Run
Copy code
int age = 25; // Integer
char grade = 'A'; // Character
float height = 5.9; // Floating point
double pi = 3.14159; // Double precision floating point
Understanding data types is crucial for memory management and performance optimization in C. """ }, ], 'C Data Types': [ { 'title': 'Literals in C', 'description': """ Literals are constant values used in C programs. They can be classified as:

Integer Literals: Whole numbers, e.g., 5, -10.
Floating-Point Literals: Decimal numbers, e.g., 3.14, -0.001.
Character Literals: Single characters enclosed in single quotes, e.g., 'a', 'Z'.
String Literals: Sequences of characters enclosed in double quotes, e.g., "Hello, World!".
Example:

c
Run
Copy code
int num = 10; // Integer literal
float pi = 3.14; // Floating-point literal
char letter = 'A'; // Character literal
char name[] = "John Doe"; // String literal
Literals are essential for initializing variables and performing operations in C. """ }, ], 'C Input/Output': [ { 'title': 'Basic Input and Output in C', 'description': """ In C, input and output operations are performed using standard functions like printf and scanf.

printf: Used to display output to the console.
scanf: Used to read input from the user.
Example:

c
Run
Copy code
#include <stdio.h>

int main() {
    int age;
    printf("Enter your age: ");
    scanf("%d", &age);
    printf("You are %d years old.\n", age);
    return 0;
}
Understanding input and output is fundamental for interacting with users in C programs. """ }, ], 'C Operators': [ { 'title': 'Operators in C', 'description': """ Operators in C are symbols that perform operations on variables and values. They can be categorized into:

Arithmetic Operators: +, -, *, /, %.
Relational Operators: ==, !=, >, <, >=, <=.
Logical Operators: &&, ||, !.
Bitwise Operators: &, |, ^, ~, <<, >>.
Example:

c
Run
Copy code
int a = 10, b = 20;
int sum = a + b; // Arithmetic
if (a < b) { // Relational
    printf("a is less than b\n");
}
Understanding operators is crucial for performing calculations and making decisions in C. """ }, ], 'C Control Statements Decision-Making': [ { 'title': 'C Control Statements Decision-Making', 'description': """ Control statements in C allow you to dictate the flow of execution based on certain conditions. The main types include:

if statement: Executes a block of code if the condition is true.
else statement: Executes a block of code if the condition is false.
switch statement: Selects one of many code blocks to execute based on a variable's value.
Example:

c
Run
Copy code
int num = 10;
if (num > 0) {
    printf("Positive number\n");
} else {
    printf("Negative number\n");
}
Control statements are essential for decision-making in programming. """ }, ], 'C Functions': [ { 'title': 'C Functions', 'description': """ Functions in C are blocks of code that perform a specific task. They help in organizing code and promoting reusability.

Function Declaration: Tells the compiler about the function's name, return type, and parameters.
Function Definition: Contains the actual code to be executed.
Function Call: Invokes the function to execute its code.
Example:
#include <stdio.h>

void greet() {
    printf("Hello, World!\n");
}

int main() {
    greet(); // Function call
    return 0;
}
Understanding functions is key to writing modular and maintainable code in C. """ }, ], 'C Arrays and Strings': [ { 'title': 'C Arrays', 'description': """ Arrays in C are collections of variables of the same type, stored in contiguous memory locations. They can be one-dimensional or multi-dimensional.

Example:
int numbers[5] = {1, 2, 3, 4, 5}; // One-dimensional array
int matrix[2][3] = {{1, 2, 3}, {4, 5, 6}}; // Two-dimensional array
Arrays are useful for storing multiple values in a single variable and are fundamental for data manipulation. """ }, { 'title': 'Strings in C', 'description': """ Strings in C are arrays of characters terminated by a null character (\0). They are used to represent text.

Example:
char name[20] = "John Doe"; // String initialization
printf("Name: %s\n", name); // Printing string
Understanding how to work with strings is essential for handling text data in C. """ }, ], 'C Pointers': [ { 'title': 'C Pointers', 'description': """ Pointers are variables that store memory addresses. They are powerful tools in C for dynamic memory management and efficient data manipulation.

Example:
int a = 10;
int *p = &a; // Pointer p stores the address of variable a
printf("Value of a: %d\n", *p); // Dereferencing pointer to get value
Understanding pointers is crucial for advanced programming techniques in C. """ }, ], 'C User-Defined Data Types': [ { 'title': 'C Structures', 'description': """ Structures in C allow you to group variables of different types under a single name. They are useful for organizing complex data.

Example:
struct Person {
    char name[50];
    int age;
};

struct Person p1;
strcpy(p1.name, "John Doe");
p1.age = 30;
Structures are essential for creating custom data types in C. """ }, ], 'C File-Handling': [ { 'title': 'Basics of File Handling in C', 'description': """ File handling in C allows you to read from and write to files. The main functions used are:

fopen: Opens a file.
fclose: Closes a file.
fprintf: Writes formatted output to a file.
fscanf: Reads formatted input from a file.
Example:
#include <stdio.h>

int main() {
    FILE *file = fopen("example.txt", "w");
    fprintf(file, "Hello, File!\n");
    fclose(file);
    return 0;
}
Understanding file handling is crucial for data persistence in C applications. """ }, ], };

  @override Widget build(BuildContext context) { return Scaffold( backgroundColor: const Color(0xFFFBFADA), appBar: AppBar( title: Text(widget.guideTitle), backgroundColor: const Color(0xFFADBC9F), ), body: SingleChildScrollView( padding: const EdgeInsets.all(16.0), child: Column( crossAxisAlignment: CrossAxisAlignment.start, children: [ Text( widget.guideTitle, style: const TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold), ), const SizedBox(height: 10.0), Container( padding: const EdgeInsets.symmetric(horizontal: 12.0), decoration: BoxDecoration( border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(8.0), ), child: DropdownButton<String>( isExpanded: true, value: selectedItem, items: dropdownContent[widget.guideTitle]?.map((topic) { return DropdownMenuItem<String>( value: topic['title'], child: Text(topic['title']!), ); }).toList(), hint: const Text('Select a topic'), onChanged: (newValue) { setState(() { selectedItem = newValue; description = dropdownContent[widget.guideTitle]! .firstWhere((item) => item['title'] == newValue)['description']!; }); }, ), ), const SizedBox(height: 20.0), Text( description, style: const TextStyle(fontSize: 18.0), ), const SizedBox(height: 20.0), ElevatedButton( style: ElevatedButton.styleFrom( backgroundColor: const Color(0xFFADBC9F), ), onPressed: () { Navigator.pop(context); }, child: const Text('Back to Guides'), ), ], ), ), ); } }

void main() => runApp(MaterialApp(home: GuidesPageC()));