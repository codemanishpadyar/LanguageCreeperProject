import 'flashcards_html.dart';
import 'flashcardshtml_view.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class flashcardshtmltrial extends StatelessWidget {
  const flashcardshtmltrial({Key? key}) : super(key: key);

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
  final List<FlashcardsHtml> _flashcards = [
    FlashcardsHtml(
      question: "What is HTML used for?",
      answer: """It defines the structure and content of a web page.""",
    ),
    FlashcardsHtml(
      question: "What is the purpose of <a> in HTML?",
      answer: """Creates hyperlinks to navigate between web pages.""",
    ),
    FlashcardsHtml(
      question: "What does <img> do?",
      answer: """Embeds an image into a web page.""",
    ),
    FlashcardsHtml(
      question: "What is the difference between block-level and inline elements in HTML?",
      answer: """Block-level occupies full width (e.g., <div>), inline only wraps content (e.g., <span>).""",
    ),
    FlashcardsHtml(
      question: "What is semantic HTML?",
      answer: """Tags like <header>, <footer>, <article> define meaning and structure of content.""",
    ),
    FlashcardsHtml(
      question: "What is the purpose of the <meta> tag?",
      answer: """Provides metadata about the HTML document (e.g., charset, author).""",
    ),
    FlashcardsHtml(
      question: "What is the difference between <link> and <script>?",
      answer: """<link> links external resources (e.g., CSS), <script> embeds or links JavaScript.""",
    ),
    FlashcardsHtml(
      question: "What is the role of the <form> tag?",
      answer: """Collects user input for submission to a server.""",
    ),
    FlashcardsHtml(
      question: "What is the purpose of the <canvas> tag?",
      answer: """Used for drawing graphics via JavaScript.""",
    ),
    FlashcardsHtml(
      question: "What is the difference between id and class attributes?",
      answer: """id is unique to a single element; class can be shared by multiple elements.""",
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
        title: const Text('Flashcards HTML'),
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
