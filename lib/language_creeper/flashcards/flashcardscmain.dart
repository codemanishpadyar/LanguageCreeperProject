import 'flashcards_c.dart';
import 'flashcardsc_view.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class FlashcardsCTrial extends StatelessWidget {
  const FlashcardsCTrial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FlashcardScreen(),
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFBFADA),
        appBarTheme: const AppBarTheme(
          color: Color(0xFFADBC9F),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: const Color(0xFFADBC9F),
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
  final List<FlashcardsC> _flashcards = [
    FlashcardsC(question: "What is the use of printf()?", answer: "Prints output to the console."),
    FlashcardsC(question: "What are arrays in C?", answer: "A collection of elements of the same type stored in contiguous memory."),
    FlashcardsC(question: "What is the purpose of main()?", answer: "It’s the entry point of a C program."),
    FlashcardsC(question: "What is a pointer to a pointer in C?", answer: "A pointer storing the address of another pointer."),
    FlashcardsC(question: "What is the difference between struct and union?", answer: "struct stores all members; union shares memory among members."),
    FlashcardsC(question: "What are function pointers in C?", answer: "Pointers used to store addresses of functions."),
    FlashcardsC(question: "What is typedef in C?", answer: "Creates an alias for an existing data type."),
    FlashcardsC(question: "What is the difference between call by value and call by reference?", answer: "Call by value passes a copy; call by reference passes the address."),
    FlashcardsC(question: "What is the difference between malloc() and calloc()?", answer: "malloc() allocates uninitialized memory; calloc() allocates and initializes memory to zero."),
    FlashcardsC(question: "What is a segmentation fault?", answer: "An error due to accessing invalid memory."),
  ];

  int _currentIndex = 0;

  void showNextCard() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _flashcards.length;
    });
  }

  void showPreviousCard() {
    setState(() {
      _currentIndex = (_currentIndex - 1 + _flashcards.length) % _flashcards.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flashcards C')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 250,
              height: 250,
              child: FlipCard(
                front: FlashcardView(text: _flashcards[_currentIndex].question),
                back: FlashcardView(text: _flashcards[_currentIndex].answer),
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
