import 'flashcards_javascript.dart';
import 'flashcardsjavascript_view.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class flashcardsjavascripttrial extends StatelessWidget {
  const flashcardsjavascripttrial({Key? key}) : super(key: key);

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
  final List<FlashcardsJavascript> _flashcards = [
    FlashcardsJavascript(
      question: "What is JavaScript used for?",
      answer: """It adds interactivity and dynamic behavior to web pages.""",
    ),
    FlashcardsJavascript(
      question: "What is the var, let, and const difference?",
      answer: """var is function-scoped, let and const are block-scoped, and const is immutable.""",
    ),
    FlashcardsJavascript(
      question: "What is undefined in JavaScript?",
      answer: """A variable declared but not initialized.""",
    ),
    FlashcardsJavascript(
      question: "What is the DOM in JavaScript?",
      answer: """The Document Object Model represents the structure of a web page for manipulation.""",
    ),
    FlashcardsJavascript(
      question: "What is an event in JavaScript?",
      answer: """An action (e.g., click, hover) that JavaScript can respond to.""",
    ),
    FlashcardsJavascript(
      question: "What is the difference between synchronous and asynchronous JavaScript?",
      answer: """Synchronous code runs line by line; asynchronous allows tasks like API calls without blocking execution.""",
    ),
    FlashcardsJavascript(
      question: "What is the difference between == and ===?",
      answer: """== checks value only; === checks value and type.""",
    ),
    FlashcardsJavascript(
      question: "What is a closure in JavaScript?",
      answer: """A function that retains access to variables from its parent scope even after the parent has returned.""",
    ),
    FlashcardsJavascript(
      question: "What is this in JavaScript?",
      answer: """Refers to the object that the function is a property of.""",
    ),
    FlashcardsJavascript(
      question: "What are promises in JavaScript?",
      answer: """Used to handle asynchronous operations by resolving or rejecting values.""",
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
        title: const Text('Flashcards JavaScript'),
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
