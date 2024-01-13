import 'package:flashcard/model/Flashcard.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class FlashcardWidget extends StatelessWidget {
  final Flashcard flashcard;

  const FlashcardWidget({Key? key, required this.flashcard}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      front: Card(
        child: Container(  // Wrap the Text widget in a Container
          color: Colors.white30,
          padding: const EdgeInsets.all(16),  // Add padding for better readability
          child: Text(
            flashcard.question,
            textAlign: TextAlign.center,  // Optionally center the text
            // Add wrapping behavior
            softWrap: true,
            overflow: TextOverflow.fade,  // Optionally fade out overflowing text
          ),
        ),
      ),
      back: Card(
        child: Container(  // Wrap the Text widget in a Container
          color: Colors.green,
          padding: const EdgeInsets.all(16),  // Add padding for better readability
          child: Text(
            flashcard.answer,
            textAlign: TextAlign.center,  // Optionally center the text
            // Add wrapping behavior
            softWrap: true,
            overflow: TextOverflow.fade,  // Optionally fade out overflowing text
          ),
        ),
      ),
    );
  }
}
