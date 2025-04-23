import 'flashcards_python.dart';
import 'flashcardspython_view.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class flashcardspythontrial extends StatelessWidget {
  const flashcardspythontrial({Key? key}) : super(key: key);

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
  final List<FlashcardsPython> _flashcards = [
    FlashcardsPython(
      question: "What are Python's key features?",
      answer: """Simple syntax, dynamically typed, and supports multiple paradigms like OOP and functional programming.""",
    ),
    FlashcardsPython(
      question: "What does len() do in Python?",
      answer: """Returns the number of elements in an object (e.g., list, string).""",
    ),
    FlashcardsPython(
      question: "What is a Python list?",
      answer: """An ordered, mutable collection of items that can store multiple data types.""",
    ),
    FlashcardsPython(
      question: "What is the difference between list and tuple in Python?",
      answer: """list is mutable; tuple is immutable.""",
    ),
    FlashcardsPython(
      question: "What are Python decorators?",
      answer: """Functions that modify the behavior of other functions.""",
    ),
    FlashcardsPython(
      question: "What is the purpose of self in Python classes?",
      answer: """Refers to the instance of the class, used to access variables and methods.""",
    ),
    FlashcardsPython(
      question: "What are Python's data types?",
      answer: """int, float, str, bool, list, tuple, dict, set.""",
    ),
    FlashcardsPython(
      question: "What is the difference between deepcopy and shallow copy?",
      answer: """deepcopy duplicates objects recursively, while shallow copy copies only references.""",
    ),
    FlashcardsPython(
      question: "What are Python modules and packages?",
      answer: """A module is a single Python file; a package is a collection of modules.""",
    ),
    FlashcardsPython(
      question: "What is a lambda function in Python?",
      answer: """An anonymous, single-expression function.""",
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
        title: const Text('Flashcards Python'),
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
