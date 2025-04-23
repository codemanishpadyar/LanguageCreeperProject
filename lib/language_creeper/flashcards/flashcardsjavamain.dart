import 'flashcards_java.dart';
import 'flashcardsjava_view.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class flashcardsjavatrial extends StatelessWidget {
  const flashcardsjavatrial({Key? key}) : super(key: key);

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
  final List<FlashcardsJava> _flashcards = [
    FlashcardsJava(
      question: "What is JVM in Java?",
      answer: """JVM (Java Virtual Machine) runs Java bytecode on any platform.""",
    ),
    FlashcardsJava(
      question: "What is the difference between == and .equals()?",
      answer: """== compares references; .equals() compares object values.""",
    ),
    FlashcardsJava(
      question: "What is a constructor?",
      answer: """A special method to initialize objects, called when an object is created.""",
    ),
    FlashcardsJava(
      question: "What is polymorphism in Java?",
      answer: """The ability of a method to perform differently based on the object calling it.""",
    ),
    FlashcardsJava(
      question: "What is the difference between an interface and an abstract class?",
      answer: """An interface has only abstract methods; abstract classes can have both abstract and concrete methods.""",
    ),
    FlashcardsJava(
      question: "What is the role of garbage collection in Java?",
      answer: """It automatically deallocates unused objects to free up memory.""",
    ),
    FlashcardsJava(
      question: "What are access modifiers in Java?",
      answer: """public, private, protected, and default control access levels of classes and members.""",
    ),
    FlashcardsJava(
      question: "What is the final keyword in Java?",
      answer: """Used to declare constants, prevent method overriding, and inheritance of a class.""",
    ),
    FlashcardsJava(
      question: "What is multithreading in Java?",
      answer: """Concurrent execution of two or more threads for better performance.""",
    ),
    FlashcardsJava(
      question: "What is the difference between ArrayList and LinkedList in Java?",
      answer: """ArrayList is faster for accessing, while LinkedList is faster for insertion/deletion.""",
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
        title: const Text('Flashcards Java'),
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
