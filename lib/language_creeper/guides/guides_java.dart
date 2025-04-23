import 'package:flutter/material.dart';

class GuidesPageJava extends StatelessWidget {
  const GuidesPageJava({Key? key}) : super(key: key);

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
      'title': 'Java Basics',
      'description':
      'Learn about Java syntax, variables, and basic data types.',
    },
    {
      'title': 'Java Methods',
      'description': 'Understand how to define and call methods in Java.',
    },
    {
      'title': 'Java Arrays',
      'description': 'Learn how to declare and manipulate arrays in Java.',
    },
    {
      'title': 'Java Strings',
      'description':
      'Explore how to work with strings in Java and manipulate them.',
    },
    {
      'title': 'Java OOPs Concepts',
      'description':
      'Understand Object-Oriented Programming concepts like classes, objects, inheritance, and polymorphism.',
    },
    {
      'title': 'Java Interfaces',
      'description':
      'Learn about interfaces in Java and how to implement them.',
    },
    {
      'title': 'Java Collections',
      'description':
      'Explore Java Collections Framework and commonly used data structures like List, Set, and Map.',
    },
    {
      'title': 'Java Exception Handling',
      'description':
      'Learn how to handle exceptions in Java using try, catch, and finally blocks.',
    },
    {
      'title': 'Java Multithreading',
      'description':
      'Understand how to write multithreaded programs in Java and handle concurrency.',
    },
    {
      'title': 'Java File Handling',
      'description':
      'Learn how to work with files in Java, including reading and writing operations.',
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
  String selectedItem = '';
  String description = '';

  final Map<String, List<Map<String, String>>> dropdownContent = {
    'Java Basics': [
      {
        'title': 'What is Java?',
        'description':
        'Java is a high-level, object-oriented programming language developed by Sun Microsystems. It is platform-independent, meaning Java programs can run on any device with a Java Virtual Machine (JVM). Java is widely used for building web applications, mobile apps, and enterprise-level software.',
      },
      {
        'title': 'Download and Install Java?',
        'description':
        'To start programming in Java, you need to download and install the Java Development Kit (JDK). The JDK includes the Java Runtime Environment (JRE), compiler, and other tools. Follow the official Oracle website or OpenJDK to download the appropriate version for your operating system.',
      },
      {
        'title': 'JDK vs JRE vs JVM',
        'description':
        'JDK (Java Development Kit) is a software development environment used to develop Java applications. JRE (Java Runtime Environment) provides the libraries and JVM (Java Virtual Machine) to run Java programs. JVM is the engine that executes Java bytecode.',
      },
      {
        'title': 'Identifiers',
        'description':
        'Identifiers are names given to variables, methods, classes, and other elements in Java. They must follow specific rules, such as starting with a letter, underscore, or dollar sign, and cannot be a reserved keyword.',
      },
      {
        'title': 'Keywords',
        'description':
        'Keywords are reserved words in Java that have predefined meanings. Examples include `class`, `public`, `static`, and `void`. They cannot be used as identifiers or variable names.',
      },
      {
        'title': 'Data Types',
        'description':
        'Java supports two types of data types: primitive (e.g., `int`, `char`, `boolean`) and non-primitive (e.g., `String`, `Array`, `Class`). Primitive data types store simple values, while non-primitive types store references to objects.',
      },
      {
        'title': 'Variables',
        'description':
        'Variables are containers for storing data values. In Java, variables must be declared with a specific data type, such as `int`, `String`, or `boolean`. They can be initialized at the time of declaration or later in the program.',
      },
      {
        'title': 'Operators',
        'description':
        'Operators are symbols used to perform operations on variables and values. Java supports various operators, including arithmetic (`+`, `-`), relational (`>`, `<`), logical (`&&`, `||`), and assignment (`=`) operators.',
      },
      {
        'title': 'Decision Making (if, if-else, switch, break, continue, jump)',
        'description':
        'Decision-making constructs like `if`, `if-else`, and `switch` allow you to control the flow of your program based on conditions. `break` and `continue` are used to alter the flow of loops, while `return` is used to exit a method.',
      },
      {
        'title': 'Loops',
        'description':
        'Loops are used to repeat a block of code until a specific condition is met. Java supports `for`, `while`, and `do-while` loops. They are essential for iterating over arrays, collections, and performing repetitive tasks.',
      },
    ],
    'Java Methods': [
      {
        'title': 'Introduction to Methods',
        'description':
        'Methods are blocks of code that perform a specific task. They are defined within a class and can be called to execute their functionality. Methods help in organizing code and promoting reusability.',
      },
      {
        'title': 'How to Call Methods?',
        'description':
        'Methods are called using their name followed by parentheses. If the method is defined in another class, you need to create an object of that class to call the method. Static methods can be called directly using the class name.',
      },
      {
        'title': 'Static Methods vs Instance Methods',
        'description':
        'Static methods belong to the class and can be called without creating an object. Instance methods belong to an object and require an instance of the class to be called. Static methods cannot access instance variables directly.',
      },
      {
        'title': 'Access Modifiers',
        'description':
        'Access modifiers control the visibility of methods and variables. Java provides four access modifiers: `public`, `private`, `protected`, and default (no modifier). They determine which parts of the code can access a method or variable.',
      },
      {
        'title': 'Command Line Arguments',
        'description':
        'Command line arguments allow you to pass input to a Java program when it is executed. They are stored in the `String[] args` array in the `main` method and can be accessed using indices.',
      },
      {
        'title': 'Variable Arguments (Varargs)',
        'description':
        'Varargs allow you to pass a variable number of arguments to a method. They are represented by three dots (`...`) after the data type. The arguments are treated as an array within the method.',
      },
    ],
    'Java Arrays': [
      {
        'title': 'Introduction to Arrays',
        'description':
        'Arrays are used to store multiple values of the same data type in a single variable. They are fixed in size and provide efficient access to elements using indices. Arrays are widely used for storing collections of data.',
      },
      {
        'title': 'Declare and Initialize Arrays',
        'description':
        'Arrays can be declared using the syntax `dataType[] arrayName`. They can be initialized at the time of declaration or later using the `new` keyword. Example: `int[] numbers = {1, 2, 3};`.',
      },
      {
        'title': 'Multi-Dimensional Arrays',
        'description':
        'Multi-dimensional arrays are arrays of arrays. They are used to store data in a tabular form. For example, a 2D array can be declared as `int[][] matrix = new int[3][3];`, representing a 3x3 matrix.',
      },
      {
        'title': 'Jagged Arrays',
        'description':
        'Jagged arrays are arrays where each row can have a different number of columns. They are useful when the size of each row is not fixed. Example: `int[][] jaggedArray = new int[3][];`.',
      },
      {
        'title': 'Arrays Class',
        'description':
        'The `Arrays` class in Java provides utility methods for working with arrays. It includes methods like `sort()`, `binarySearch()`, `equals()`, and `toString()` to perform common operations on arrays.',
      },
      {
        'title': 'Final Arrays',
        'description':
        'A final array means that the reference to the array cannot be changed, but the elements of the array can still be modified. Example: `final int[] numbers = {1, 2, 3};`.',
      },
      {
        'title': 'Java Array Programs',
        'description':
        'Practice programs on arrays include sorting, searching, reversing, and merging arrays. These programs help in understanding how to manipulate arrays effectively in Java.',
      },
    ],
    'Java Strings': [
      {
        'title': 'Introduction of Strings',
        'description':
        'Strings are sequences of characters in Java. They are immutable, meaning their values cannot be changed after creation. Strings are widely used for text manipulation and are represented by the `String` class.',
      },
      {
        'title': 'Why Strings are Immutable?',
        'description':
        'Strings are immutable in Java to ensure security, thread safety, and efficient memory management. Immutability allows strings to be shared between multiple threads without synchronization issues.',
      },
      {
        'title': 'Java String Concatenation',
        'description':
        'String concatenation is the process of combining two or more strings. In Java, you can concatenate strings using the `+` operator or the `concat()` method. Example: `String result = "Hello" + " World";`.',
      },
      {
        'title': 'String Class',
        'description':
        'The `String` class in Java provides methods for string manipulation, such as `length()`, `charAt()`, `substring()`, `toLowerCase()`, and `toUpperCase()`. These methods make it easy to work with strings.',
      },
      {
        'title': 'StringBuffer Class',
        'description':
        'The `StringBuffer` class is used to create mutable strings. It is thread-safe and provides methods like `append()`, `insert()`, and `reverse()` for modifying strings efficiently.',
      },
      {
        'title': 'StringBuilder Class',
        'description':
        'The `StringBuilder` class is similar to `StringBuffer` but is not thread-safe. It is faster and is used when thread safety is not a concern. It provides methods for efficient string manipulation.',
      },
      {
        'title': 'Strings vs StringBuffer vs StringBuilder',
        'description':
        'Strings are immutable, while `StringBuffer` and `StringBuilder` are mutable. `StringBuffer` is thread-safe, but `StringBuilder` is faster. Use `StringBuilder` for single-threaded applications and `StringBuffer` for multi-threaded ones.',
      },
      {
        'title': 'Java String Programs',
        'description':
        'Practice programs on strings include reversing a string, checking for palindromes, counting vowels, and finding substrings. These programs help in mastering string manipulation in Java.',
      },
    ],
    'Java OOPs Concepts': [
      {
        'title': 'What are OOPs Concepts?',
        'description':
        'Object-Oriented Programming (OOP) is a programming paradigm based on the concept of objects. It focuses on encapsulation, inheritance, polymorphism, and abstraction to create modular and reusable code.',
      },
      {
        'title': 'Classes and Objects',
        'description':
        'A class is a blueprint for creating objects. It defines the properties (attributes) and behaviors (methods) of an object. Objects are instances of a class and represent real-world entities.',
      },
      {
        'title': 'Constructors',
        'description':
        'Constructors are special methods used to initialize objects. They have the same name as the class and do not have a return type. Java provides a default constructor if no constructor is defined.',
      },
      {
        'title': 'Object Class',
        'description':
        'The `Object` class is the root class of all Java classes. It provides methods like `toString()`, `equals()`, and `hashCode()` that are inherited by all other classes.',
      },
      {
        'title': 'Abstraction',
        'description':
        'Abstraction is the process of hiding implementation details and showing only the necessary features of an object. It is achieved using abstract classes and interfaces in Java.',
      },
      {
        'title': 'Encapsulation',
        'description':
        'Encapsulation is the bundling of data (attributes) and methods (behaviors) into a single unit (class). It is achieved by declaring attributes as private and providing public getter and setter methods.',
      },
      {
        'title': 'Inheritance',
        'description':
        'Inheritance allows a class to inherit properties and methods from another class. It promotes code reusability and is implemented using the `extends` keyword in Java.',
      },
      {
        'title': 'Polymorphism',
        'description':
        'Polymorphism allows objects to take on multiple forms. It is achieved through method overriding (runtime polymorphism) and method overloading (compile-time polymorphism).',
      },
    ],
    'Java Interfaces': [
      {
        'title': 'Defining Interfaces',
        'description':
        'Interfaces in Java are used to define a contract for classes. They contain abstract methods (methods without a body) that must be implemented by any class that implements the interface.',
      },
      {
        'title': 'Interface Inheritance',
        'description':
        'Interfaces can inherit from other interfaces using the `extends` keyword. This allows you to create a hierarchy of interfaces, where a child interface inherits the methods of its parent interface.',
      },
      {
        'title': 'Interfaces and Inheritance',
        'description':
        'A class can implement multiple interfaces, but it can only extend one class. This allows Java to support multiple inheritance of type (interfaces) while avoiding the diamond problem.',
      },
      {
        'title': 'Class vs Interface',
        'description':
        'A class is a blueprint for creating objects, while an interface is a contract that defines methods to be implemented. Classes can have concrete methods, but interfaces can only have abstract methods (before Java 8).',
      },
      {
        'title': 'Functional Interface',
        'description':
        'A functional interface is an interface with a single abstract method. It is used to implement lambda expressions in Java. Examples include `Runnable` and `Comparator`.',
      },
      {
        'title': 'Nested Interface',
        'description':
        'A nested interface is an interface defined within another interface or class. It is used to group related interfaces and improve code organization.',
      },
      {
        'title': 'Marker Interface',
        'description':
        'A marker interface is an interface with no methods. It is used to mark a class as having a specific capability. Examples include `Serializable` and `Cloneable`.',
      },
      {
        'title': 'Comparator Interface',
        'description':
        'The `Comparator` interface is used to define custom sorting logic for objects. It provides the `compare()` method, which compares two objects and returns an integer value.',
      },
    ],
    'Java Collections': [
      {
        'title': 'Java Collection Framework',
        'description':
        'The Java Collection Framework provides a set of interfaces and classes to store and manipulate groups of objects. It includes interfaces like `List`, `Set`, and `Map` and classes like `ArrayList`, `HashSet`, and `HashMap`.',
      },
      {
        'title': 'Collections Class',
        'description':
        'The `Collections` class provides utility methods for working with collections, such as `sort()`, `reverse()`, and `shuffle()`. These methods make it easy to manipulate collections.',
      },
      {
        'title': 'Collection Interface',
        'description':
        'The `Collection` interface is the root interface of the collection hierarchy. It defines methods for adding, removing, and querying elements in a collection.',
      },
      {
        'title': 'List Interface',
        'description':
        'The `List` interface represents an ordered collection of elements. It allows duplicate elements and provides methods for accessing elements by index. Common implementations include `ArrayList` and `LinkedList`.',
      },
      {
        'title': 'SortedSet Interface',
        'description':
        'The `SortedSet` interface represents a set of elements that are sorted in ascending order. It is implemented by classes like `TreeSet`, which automatically sorts elements.',
      },
      {
        'title': 'Comparator Interface',
        'description':
        'The `Comparator` interface is used to define custom sorting logic for objects. It is often used with sorted collections like `TreeSet` and `TreeMap`.',
      },
      {
        'title': 'Comparable Interface',
        'description':
        'The `Comparable` interface is used to define the natural ordering of objects. It provides the `compareTo()` method, which compares the current object with another object.',
      },
      {
        'title': 'Comparator vs Comparable',
        'description':
        'The `Comparable` interface defines the natural ordering of objects, while the `Comparator` interface allows custom sorting logic. `Comparable` is implemented by the class itself, while `Comparator` is external.',
      },
      {
        'title': 'Iterator',
        'description':
        'The `Iterator` interface is used to traverse through elements in a collection. It provides methods like `hasNext()` and `next()` to iterate over elements sequentially.',
      },
    ],
    'Java Exception Handling': [
      {
        'title': 'Java Exceptions',
        'description':
        'Exceptions are events that disrupt the normal flow of a program. Java provides a robust mechanism to handle exceptions using `try`, `catch`, `finally`, and `throw` keywords.',
      },
      {
        'title': 'Checked vs Unchecked Exceptions',
        'description':
        'Checked exceptions are checked at compile time and must be handled using `try-catch` or `throws`. Unchecked exceptions occur at runtime and do not require explicit handling.',
      },
      {
        'title': 'Try Catch Block',
        'description':
        'The `try-catch` block is used to handle exceptions. Code that may throw an exception is placed in the `try` block, and the `catch` block handles the exception if it occurs.',
      },
      {
        'title': 'Final, Finally and Finalize',
        'description':
        'The `final` keyword is used to make variables, methods, or classes immutable. The `finally` block is used to execute code after a `try-catch` block, regardless of whether an exception occurred. The `finalize()` method is called before an object is garbage collected.',
      },
      {
        'title': 'Throw and Throws',
        'description':
        'The `throw` keyword is used to explicitly throw an exception, while `throws` is used in method signatures to indicate that the method may throw an exception.',
      },
      {
        'title': 'Customized Exception Handling',
        'description':
        'Custom exceptions can be created by extending the `Exception` class. They are used to handle specific error conditions in a program.',
      },
      {
        'title': 'Chained Exceptions',
        'description':
        'Chained exceptions allow you to associate one exception with another. This is useful for tracking the root cause of an exception.',
      },
      {
        'title': 'Null Pointer Exceptions',
        'description':
        'A `NullPointerException` occurs when you try to access a method or property of a null object. It is one of the most common runtime exceptions in Java.',
      },
      {
        'title': 'Exception Handling with Method Overriding',
        'description':
        'When overriding a method, the subclass method can throw the same, subclass, or no exception, but it cannot throw a broader exception than the superclass method.',
      },
    ],
    'Java Multithreading': [
      {
        'title': 'Introduction to Java Multithreading',
        'description':
        'Multithreading allows a program to execute multiple threads concurrently. It is used to improve performance and responsiveness in applications.',
      },
      {
        'title': 'Threads',
        'description':
        'A thread is the smallest unit of execution in a program. Java provides the `Thread` class and `Runnable` interface to create and manage threads.',
      },
      {
        'title': 'Thread Class',
        'description':
        'The `Thread` class provides methods to create and control threads, such as `start()`, `sleep()`, and `join()`. It is the primary way to create threads in Java.',
      },
      {
        'title': 'Runnable Interface',
        'description':
        'The `Runnable` interface is used to define a task that can be executed by a thread. It is implemented by classes that need to be executed in a separate thread.',
      },
      {
        'title': 'Lifecycle and States of a Thread',
        'description':
        'A thread goes through various states in its lifecycle, including `NEW`, `RUNNABLE`, `BLOCKED`, `WAITING`, `TIMED_WAITING`, and `TERMINATED`. These states represent the thread\'s progress.',
      },
      {
        'title': 'Main Thread',
        'description':
        'The main thread is the default thread created when a Java program starts. It is responsible for executing the `main()` method and can create additional threads.',
      },
      {
        'title': 'Thread Priority in Multithreading',
        'description':
        'Thread priority determines the order in which threads are scheduled for execution. Java assigns a priority between 1 (lowest) and 10 (highest) to each thread.',
      },
      {
        'title': 'Naming & Fetching Name of Current Thread',
        'description':
        'Threads can be assigned names using the `setName()` method, and the current thread\'s name can be fetched using `Thread.currentThread().getName()`.',
      },
      {
        'title': 'Thread.start() vs Thread.run() Method',
        'description':
        'The `start()` method creates a new thread and calls the `run()` method, while the `run()` method executes the thread\'s task in the current thread.',
      },
      {
        'title': 'Thread.sleep() Method',
        'description':
        'The `sleep()` method pauses the execution of a thread for a specified amount of time. It is used to introduce delays in thread execution.',
      },
      {
        'title': 'Daemon Thread',
        'description':
        'Daemon threads are background threads that do not prevent the JVM from exiting. They are used for tasks like garbage collection.',
      },
      {
        'title': 'Thread Safety',
        'description':
        'Thread safety ensures that shared resources are accessed in a way that prevents race conditions. It is achieved using synchronization, locks, and atomic variables.',
      },
      {
        'title': 'Thread Pools',
        'description':
        'Thread pools manage a group of worker threads. They are used to limit the number of threads and improve performance by reusing threads.',
      },
    ],
    'Java File Handling': [
      {
        'title': 'File Handling',
        'description':
        'File handling in Java allows you to read from and write to files. It is essential for working with data stored in files, such as text files, CSV files, and binary files.',
      },
      {
        'title': 'File Class',
        'description':
        'The `File` class represents a file or directory path. It provides methods for creating, deleting, and querying files and directories.',
      },
      {
        'title': 'Create Files',
        'description':
        'Files can be created using the `createNewFile()` method of the `File` class. This method returns `true` if the file was successfully created.',
      },
      {
        'title': 'Read Files',
        'description':
        'Files can be read using classes like `FileReader`, `BufferedReader`, and `Scanner`. These classes provide methods to read data from files line by line or character by character.',
      },
      {
        'title': 'Write on Files',
        'description':
        'Files can be written using classes like `FileWriter` and `BufferedWriter`. These classes provide methods to write data to files in text or binary format.',
      },
      {
        'title': 'Delete File',
        'description':
        'Files can be deleted using the `delete()` method of the `File` class. This method returns `true` if the file was successfully deleted.',
      },
      {
        'title': 'FileReader Class',
        'description':
        'The `FileReader` class is used to read character data from files. It reads data character by character and is often wrapped in a `BufferedReader` for efficient reading.',
      },
      {
        'title': 'FileWriter Class',
        'description':
        'The `FileWriter` class is used to write character data to files. It writes data character by character and is often wrapped in a `BufferedWriter` for efficient writing.',
      },
      {
        'title': 'FilePermission Class',
        'description':
        'The `FilePermission` class is used to control access to files and directories. It is part of Java\'s security framework and is used to enforce file access permissions.',
      },
      {
        'title': 'FileDescriptor Class',
        'description':
        'The `FileDescriptor` class represents an open file or socket. It is used to access low-level file operations and is rarely used directly by developers.',
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
              style:
              const TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
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
                  description = dropdownContent[widget.guideTitle]!.firstWhere(
                          (item) => item['title'] == newValue)['description']!;
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