import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'result_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(QuizPagePython());
}

class QuizPagePython extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizHomePage(),
    );
  }
}

class QuizHomePage extends StatefulWidget {
  @override
  _QuizHomePageState createState() => _QuizHomePageState();
}

class _QuizHomePageState extends State<QuizHomePage> {
  List<Map<String, dynamic>> questions = [];
  List<Map<String, dynamic>> selectedQuestions = [];
  List<Map<String, String>> answeredQuestions = []; // Store user responses
  int currentIndex = 0;
  int score = 0;
  bool isLoading = true;
  String? selectedOption;

  @override
  void initState() {
    super.initState();
    fetchQuestions();
  }

  void fetchQuestions() async {
    try {
      final snapshot =
      await FirebaseFirestore.instance.collection('python_questions').get();

      final fetchedQuestions = snapshot.docs.map((doc) => doc.data()).toList();

      setState(() {
        questions = fetchedQuestions;
        if (questions.isNotEmpty) {
          selectedQuestions = (questions..shuffle()).take(10).toList();
        }
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  void submitAnswer() {
    if (selectedOption == null) return;

    int correctIndex = selectedQuestions[currentIndex]['correctOptionIndex'];
    String correctAnswer = selectedQuestions[currentIndex]['options'][correctIndex];

    answeredQuestions.add({
      "question": selectedQuestions[currentIndex]['question'],
      "selected": selectedOption!,
      "correct": correctAnswer,
    });

    if (selectedOption == correctAnswer) {
      score += 1;
    }

    if (currentIndex < selectedQuestions.length - 1) {
      setState(() {
        currentIndex++;
        selectedOption = null;
      });
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(
            score: score,
            total: selectedQuestions.length,
            answeredQuestions: answeredQuestions,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double progress = (currentIndex + 1) / selectedQuestions.length;

    return Scaffold(
      backgroundColor: Color(0xFFD0D7B1),
      appBar: AppBar(
        backgroundColor: Color(0xFF2F5437),
        title: Text('Quiz', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : selectedQuestions.isEmpty
            ? Text(
          "No questions found. Please add some to Firebase.",
          style: TextStyle(fontSize: 18, color: Colors.red),
        )
            : Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Circular progress bar for question number
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 80,
                    width: 80,
                    child: CircularProgressIndicator(
                      value: progress,
                      backgroundColor: Colors.grey.shade300,
                      color: Colors.green,
                      strokeWidth: 8,
                    ),
                  ),
                  Text(
                    "${currentIndex + 1}/${selectedQuestions.length}",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Question text
              Expanded(
                child: Center(
                  child: Text(
                    selectedQuestions[currentIndex]['question'],
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              // Options
              ...selectedQuestions[currentIndex]['options'].map<Widget>((option) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: SizedBox(
                    width: double.infinity, // Stretch to full width
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedOption = option;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selectedOption == option
                            ? Colors.green.shade300
                            : Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Color(0xFF2F5437)),
                        ),
                      ),
                      child: Text(option,
                          style: TextStyle(fontSize: 16, color: Colors.black)),
                    ),
                  ),
                );
              }).toList(),

              SizedBox(height: 20),

              // Submit button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: submitAnswer,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade400,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text("Submit Answer",
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ),

              SizedBox(height: 10),

              // End quiz button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade400,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text("End Quiz",
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
