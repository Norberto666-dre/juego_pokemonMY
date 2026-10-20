import 'package:flutter/material.dart';

class DeckScreen extends StatelessWidget {
  const DeckScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Deck')),
        body: const Center(child: Text('Deck')));
  }
}
