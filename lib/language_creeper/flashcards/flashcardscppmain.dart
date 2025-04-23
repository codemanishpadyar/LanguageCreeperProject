import 'flashcards_cpp.dart';
import 'flashcardscpp_view.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class flashcardscpptrial extends StatelessWidget {
  const flashcardscpptrial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FlashcardScreen(),
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFBFADA), // Background color
        appBarTheme: const AppBarTheme(
          color: Color(0xFFADBC9F), // Title bar color
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white, // Button text color
            backgroundColor: const Color(0xFFADBC9F), // Button background color
          ),
        ),
      ),
    );
  }
}

class FlashcardScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FlashcardScreenState();
}

class _FlashcardScreenState extends State<FlashcardScreen> {
  final List<FlashcardsCpp> _flashcards = [
    FlashcardsCpp(
      question: "What is a pointer in C++?",
      answer: """A variable that stores the memory address of another variable.""",
    ),
    FlashcardsCpp(
      question: "What are the four pillars of OOP in C++?",
      answer: """Encapsulation, Inheritance, Polymorphism, and Abstraction.""",
    ),
    FlashcardsCpp(
      question: "What is the purpose of #include?",
      answer: """It includes header files in your program.""",
    ),
    FlashcardsCpp(
      question: "What is a virtual function in C++?",
      answer: """A function overridden in derived classes for runtime polymorphism.""",
    ),
    FlashcardsCpp(
      question: "What are templates in C++?",
      answer: """Enable generic programming by defining functions or classes for any data type.""",
    ),
    FlashcardsCpp(
      question: "What is the difference between stack and heap memory?",
      answer: """Stack is for static memory allocation; heap is for dynamic memory.""",
    ),
    FlashcardsCpp(
      question: "What is the role of destructors in C++?",
      answer: """Automatically called to release resources when an object goes out of scope.""",
    ),
    FlashcardsCpp(
      question: "What is the difference between public, private, and protected access specifiers?",
      answer: """Define visibility of class members.""",
    ),
    FlashcardsCpp(
      question: "What is operator overloading in C++?",
      answer: """Providing custom implementation for operators for user-defined types.""",
    ),
    FlashcardsCpp(
      question: "What is an inline function in C++?",
      answer: """A function where the compiler replaces the call with the function code to save time.""",
    ),
  ];

  int _currentIndex = 0;

  void showNextCard() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _flashcards.length;
    });
  }

  void showPreviousCard() {
    setState(() {
      _currentIndex =
          (_currentIndex - 1 + _flashcards.length) % _flashcards.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flashcards C++'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 250,
              height: 250,
              child: FlipCard(
                front: FlashcardView(
                  text: _flashcards[_currentIndex].question,
                ),
                back: FlashcardView(
                  text: _flashcards[_currentIndex].answer,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OutlinedButton.icon(
                  onPressed: showPreviousCard,
                  icon: const Icon(Icons.chevron_left),
                  label: const Text('Prev'),
                ),
                OutlinedButton.icon(
                  onPressed: showNextCard,
                  icon: const Icon(Icons.chevron_right),
                  label: const Text('Next'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
