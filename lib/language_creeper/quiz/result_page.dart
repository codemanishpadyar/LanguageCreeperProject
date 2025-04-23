import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../activity page/main_page.dart';

class ResultPage extends StatelessWidget {
  final int score;
  final int total;
  final List<Map<String, String>> answeredQuestions;

  ResultPage(
      {required this.score, required this.total, required this.answeredQuestions}) {
    _saveScoreToFirebase();
  }

  Future<void> _saveScoreToFirebase() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        print("❌ No logged-in user found.");
        return;
      }

      DocumentReference userDoc = FirebaseFirestore.instance.collection('names')
          .doc(user.uid);

      await FirebaseFirestore.instance.runTransaction((transaction) async {
        DocumentSnapshot snapshot = await transaction.get(userDoc);

        if (!snapshot.exists) {
          print("ℹ️ User document does not exist, creating new one...");
          transaction.set(userDoc, {
            'name': user.displayName ?? 'Anonymous',
            'email': user.email ?? '',
            'uid': user.uid,
            'score': score,
            'gamesPlayed': 1,
          });
        } else {
          Map<String, dynamic>? userData = snapshot.data() as Map<
              String,
              dynamic>?;

          int previousScore = userData?['score'] ?? 0;
          int previousGamesPlayed = userData?['gamesPlayed'] ?? 0;


          print("✅ Existing user found. Updating score...");
          print("🔹 Previous Score: $previousScore, New Score: ${previousScore +
              score}");
          print(
              "🔹 Previous Games Played: $previousGamesPlayed, New Games Played: ${previousGamesPlayed +
                  1}");

          transaction.update(userDoc, {
            'score': previousScore + score,
            'gamesPlayed': previousGamesPlayed + 1,
          });
        }
      }).then((_) {
        print("✅ Transaction successful");
      }).catchError((error) {
        print("❌ Transaction failed: $error");
      });
    } catch (e) {
      print("❌ Error saving score: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) =>
              MainPage(selectedLanguage: '',)), // Navigate to MainPage
        );
        return false;
      },
      child: Scaffold( // ✅ Keep only this `Scaffold`
        appBar: AppBar(
          title: Text("Quiz Results"),
          backgroundColor: Color(0xFF2F5437),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                "Your Score: $score / $total",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: answeredQuestions.length,
                  itemBuilder: (context, index) {
                    final question = answeredQuestions[index];
                    bool isCorrect = question['selected'] ==
                        question['correct'];

                    return Card(
                      color: isCorrect ? Colors.green.shade100 : Colors.red
                          .shade100,
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        title: Text(question['question']!, style: TextStyle(
                            fontWeight: FontWeight.bold)),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Selected: ${question['selected']}",
                                style: TextStyle(color: Colors.blue)),
                            Text("Correct: ${question['correct']}",
                                style: TextStyle(color: Colors.green)),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) =>
                        MainPage(selectedLanguage: '',)), // ✅ Restart quiz
                  );
                },
                child: Text("Try Again"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}