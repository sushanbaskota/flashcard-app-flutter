import 'package:flashcard/FlashcardWidget.dart';
import 'package:flashcard/model/Flashcard.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  final List<Flashcard> flashcards = [
    // Add your flashcards here
    Flashcard("MinHeap", "Complete Binary Tree, Always min element at root node, while inserting insert element at last of index then heapify up to maintain the heap property"),
    Flashcard("BST", "Left node is less than right node")
  ];

  // Methods for flipping cards, navigating between cards, etc.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flashcards'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlashcardWidget(flashcard: flashcards[currentIndex]),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => previousCard(),
                  child: Text('Previous'),
                ),
                ElevatedButton(
                  onPressed: () => nextCard(),
                  child: Text('Next'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void nextCard() {
    setState(() {
      currentIndex = (currentIndex + 1) % flashcards.length;
    });
  }

  void previousCard() {
    setState(() {
      currentIndex = (currentIndex - 1 + flashcards.length) % flashcards.length;
    });
  }
}
