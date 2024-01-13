import 'package:flashcard/model/Flashcard.dart';
import 'package:flutter/material.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({Key? key}) : super(key: key);

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  final _questionController = TextEditingController();
  final _answerController = TextEditingController();

  // ... methods for handling input and saving flashcards

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Flashcard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _questionController,
              decoration: const InputDecoration(
                labelText: 'Question',
              ),
            ),
            TextField(
              controller: _answerController,
              decoration: const InputDecoration(
                labelText: 'Answer',
              ),
            ),
            ElevatedButton(
              onPressed: () => _saveFlashcard(),
              child: const Text('Add Flashcard'),
            ),
          ],
        ),
      ),
    );
  }

  // In _AddCardScreenState:

  void _saveFlashcard() {
    final question = _questionController.text;
    final answer = _answerController.text;

    if (question.isNotEmpty && answer.isNotEmpty) {
      Navigator.pop(context, Flashcard(question, answer));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in both question and answer.'),
        ),
      );
    }
  }
}
