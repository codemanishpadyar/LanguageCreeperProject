import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(MaterialApp(
    title: 'Coding Battle Game',
    home: CharacterSelectionScreen(),
  ));
}

class CharacterSelectionScreen extends StatefulWidget {
  @override
  _CharacterSelectionScreenState createState() => _CharacterSelectionScreenState();
}

class _CharacterSelectionScreenState extends State<CharacterSelectionScreen> {
  String? selectedCharacter = "James"; // Default character
  late VideoPlayerController _backgroundController;
  bool _videoInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeBackgroundVideo("James"); // Initialize with default character
  }

  void _initializeBackgroundVideo(String characterName) {
    _backgroundController = VideoPlayerController.asset("assets/$characterName/Standing.mp4")
      ..initialize().then((_) {
        _backgroundController.setLooping(true);
        _backgroundController.play();
        setState(() {
          _videoInitialized = true;
        });
      });
  }

  void _selectCharacter(String characterName) {
    if (characterName == selectedCharacter) return;
    setState(() {
      selectedCharacter = characterName;
      _backgroundController.dispose();
      _initializeBackgroundVideo(characterName);
    });
  }

  @override
  void dispose() {
    _backgroundController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _videoInitialized
              ? SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: _backgroundController.value.size.width,
                height: _backgroundController.value.size.height,
                child: VideoPlayer(_backgroundController),
              ),
            ),
          )
              : Container(color: Colors.black),
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Column(
              children: [
                // First row of buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildCharacterButton("James"),
                    SizedBox(width: 20),
                    _buildCharacterButton("Ashton"),
                  ],
                ),
                SizedBox(height: 20),
                // Second row of button
                _buildCharacterButton("Remy"),
                SizedBox(height: 40),
                if (selectedCharacter != null)
                  AnimatedOpacity(
                    opacity: 1.0,
                    duration: Duration(milliseconds: 500),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CodingBattleGame(selectedCharacter!),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber[700],
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 8,
                      ),
                      child: Text(
                        "Start Battle!",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCharacterButton(String name) {
    bool isSelected = selectedCharacter == name;
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: isSelected ? Colors.amber : Colors.transparent,
          width: 3,
        ),
        boxShadow: [
          if (isSelected)
            BoxShadow(
              color: Colors.amber.withOpacity(0.4),
              blurRadius: 10,
              spreadRadius: 2,
            )
        ],
      ),
      child: ElevatedButton(
        onPressed: () => _selectCharacter(name),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black.withOpacity(0.6),
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          name,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class CodingBattleGame extends StatefulWidget {
  final String characterName;
  const CodingBattleGame(this.characterName);

  @override
  _CodingBattleGameState createState() => _CodingBattleGameState();
}

class _CodingBattleGameState extends State<CodingBattleGame> {
  late VideoPlayerController _backgroundController;
  bool _videoInitialized = false;
  int questionIndex = 0;
  int score = 0;
  List<Map<String, dynamic>> questions = [];
  String? userId;
  bool isLoading = true;
  TextEditingController _answerController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initializeBackgroundVideo();
    _getUserId();
  }

  void _initializeBackgroundVideo() {
    _backgroundController = VideoPlayerController.asset("assets/${widget.characterName}/Fighting.mp4")
      ..initialize().then((_) {
        _backgroundController.setLooping(true);
        _backgroundController.play();
        setState(() {
          _videoInitialized = true;
        });
      });
  }

  void _getUserId() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      userId = user.uid;
      _fetchQuestions();
    }
  }

  void _fetchQuestions() async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('quizzes').get();
      List<QueryDocumentSnapshot> allDocs = snapshot.docs..shuffle();

      setState(() {
        questions = allDocs.take(5).map((doc) {
          var data = doc.data() as Map<String, dynamic>;
          return {
            'question': data['question'],
            'correctAnswer': data['answer'],
          };
        }).toList();
        isLoading = false;
      });
    } catch (e) {
      print("Error fetching questions: $e");
      setState(() => isLoading = false);
    }
  }

  void checkAnswer(String userAnswer) {
    if (questions.isEmpty) return;

    setState(() {
      String correctAnswer = questions[questionIndex]['correctAnswer'];

      if (userAnswer.toLowerCase().trim() == correctAnswer.toLowerCase().trim()) {
        score += 10;
      } else {
        score = (score - 10).clamp(0, double.infinity).toInt();
      }

      if (questionIndex < 4) {
        questionIndex++;
        _answerController.clear();
      } else {
        _updateUserScore(score);
        _endGame();
      }
    });
  }

  void _updateUserScore(int points) async {
    if (userId == null) return;

    DocumentReference userRef = FirebaseFirestore.instance.collection('names').doc(userId!);
    try {
      DocumentSnapshot userDoc = await userRef.get();
      int currentScore = userDoc.exists ? (userDoc['score'] ?? 0) : 0;
      await userRef.set({'score': currentScore + points}, SetOptions(merge: true));
    } catch (e) {
      print("Error updating score: $e");
    }
  }

  void _endGame() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Game Over! Final Score: $score'),
      backgroundColor: Colors.blue,
    ));

    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => CharacterSelectionScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _videoInitialized
              ? SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: _backgroundController.value.size.width,
                height: _backgroundController.value.size.height,
                child: VideoPlayer(_backgroundController),
              ),
            ),
          )
              : Container(color: Colors.black),
          isLoading
              ? Center(child: CircularProgressIndicator())
              : Center(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Text(
                          questions[questionIndex]['question'],
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20),
                        TextField(
                          controller: _answerController,
                          style: TextStyle(fontSize: 18, color: Colors.white),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.black.withOpacity(0.6),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintText: "Type your answer here...",
                            hintStyle: TextStyle(color: Colors.white54),
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () => checkAnswer(_answerController.text.trim()),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber[700],
                            padding: EdgeInsets.symmetric(
                                horizontal: 40, vertical: 15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          child: Text("Submit Answer",
                              style: TextStyle(fontSize: 18, color: Colors.white)),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Score: $score',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}