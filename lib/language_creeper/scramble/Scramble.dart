import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GameScreen extends StatefulWidget {
  final int level;
  final String userId;
  final Function(int) onLevelComplete;

  const GameScreen({
    required this.level,
    required this.userId,
    required this.onLevelComplete,
    Key? key,
  }) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> with SingleTickerProviderStateMixin {
  late List<String> correctOrder;
  late List<String> scrambledOrder;
  int lives = 5;
  bool isLoading = true;

  // Animation controller for hearts
  late AnimationController _heartController;
  late Animation<double> _heartAnimation;

  @override
  void initState() {
    super.initState();
    fetchLevelCode();

    // Initialize heart animation
    _heartController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _heartAnimation = Tween<double>(begin: 1.0, end: 1.5).animate(
      CurvedAnimation(parent: _heartController, curve: Curves.easeOutBack),
    );
  }

  @override
  void dispose() {
    _heartController.dispose();
    super.dispose();
  }

  Future<void> fetchLevelCode() async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
      await FirebaseFirestore.instance.collection('scrambleQuestions').doc('Q${widget.level}').get();

      if (snapshot.exists && snapshot.data() != null) {
        List<String> codeLines = List<String>.from(snapshot.data()?['code'] ?? []);

        setState(() {
          correctOrder = codeLines;
          scrambledOrder = List.of(correctOrder)..shuffle();
          isLoading = false;
        });
      } else {
        throw Exception("Document does not exist");
      }
    } catch (e) {
      print("Error fetching data: $e");
      setState(() {
        correctOrder = ["// Error loading code: $e"];
        scrambledOrder = correctOrder;
        isLoading = false;
      });
    }
  }

  Future<void> updateScore(int points) async {
    try {
      String? authUid = FirebaseAuth.instance.currentUser?.uid;

      if (authUid == null || authUid != widget.userId) {
        print("User is not authenticated or UID mismatch!");
        return;
      }

      DocumentReference userRef =
      FirebaseFirestore.instance.collection('names').doc(widget.userId);

      await FirebaseFirestore.instance.runTransaction((transaction) async {
        DocumentSnapshot userSnapshot = await transaction.get(userRef);

        int currentScore = 0; // Default score if not present

        if (userSnapshot.exists && userSnapshot.data() != null) {
          Map<String, dynamic>? userData = userSnapshot.data() as Map<String, dynamic>?;
          currentScore = userData?['score'] ?? 0; // Fetch existing score
        }

        int newScore = currentScore + points;
        transaction.set(userRef, {'score': newScore}, SetOptions(merge: true)); // Merge to avoid overwriting
      });

      print("🔥 Score updated successfully in Firestore.");
    } catch (e) {
      print("❌ Error updating score: $e");
    }
  }


  void checkOrder() async {
    if (scrambledOrder.join() == correctOrder.join()) {
      updateScore(20); // Increase score by 20 points

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Congratulations!'),
          content: Text('You completed Level ${widget.level}!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                widget.onLevelComplete(widget.level);
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } else {
      setState(() {
        lives -= 1;
      });

      updateScore(-10); // Decrease score by 10 points for incorrect attempt

      // Trigger heart animation
      _heartController.forward(from: 0).then((_) {
        _heartController.reverse();
      });

      if (lives <= 0) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Game Over'),
            content: const Text('You ran out of lives. Better luck next time!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Incorrect. Try again!')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Level ${widget.level}'),
        backgroundColor: const Color(0xFF1A4D2E),
        elevation: 0,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFA7D397),
              Color(0xFFF5EEC8),
              Color(0xFFDCFFB7),
              Color(0xFFA7D397),
            ],
          ),
        ),
        child: Column(
          children: [
            // Lives counter with animation
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  5,
                      (index) => AnimatedBuilder(
                    animation: _heartAnimation,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: index >= lives
                            ? 0.0 // Hide lost hearts
                            : _heartAnimation.value,
                        child: Opacity(
                          opacity: index >= lives ? 0.0 : 1.0,
                          child: Icon(
                            Icons.favorite,
                            color: index < lives ? Colors.red : Colors.grey,
                            size: 30,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            // Scrambled code list
            Expanded(
              child: ReorderableListView(
                padding: const EdgeInsets.all(16),
                onReorder: (int oldIndex, int newIndex) {
                  if (newIndex > oldIndex) newIndex -= 1;
                  setState(() {
                    final item = scrambledOrder.removeAt(oldIndex);
                    scrambledOrder.insert(newIndex, item);
                  });
                },
                children: scrambledOrder
                    .map(
                      (line) => Card(
                    key: ValueKey(line),
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    color: Colors.white.withOpacity(0.1),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      title: Text(
                        line,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.drag_handle,
                        color: Colors.white54,
                      ),
                    ),
                  ),
                )
                    .toList(),
                // Change color when dragging
                proxyDecorator: (child, index, animation) {
                  return Material(
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: child,
                    ),
                  );
                },
              ),
            ),
            // Submit button
            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: checkOrder,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'SUBMIT SOLUTION',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}