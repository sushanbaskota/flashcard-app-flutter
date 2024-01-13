import 'package:flashcard/AddCardScreen.dart';
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
     Flashcard("init", "hhh")
  ];

  Future<void> _addFlashcard() async {
    final newCard = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddCardScreen()),
    );

    if (newCard != null) {
      setState(() {
        flashcards.add(newCard);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ... other code
      appBar: AppBar(
        title: const Text('Flashcards'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlashcardWidget(flashcard: flashcards[currentIndex]),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => previousCard(),
                  child: const Text('Previous'),
                ),
                ElevatedButton(
                  onPressed: () => nextCard(),
                  child: const Text('Next'),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addFlashcard,
        child: const Icon(Icons.add),
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
