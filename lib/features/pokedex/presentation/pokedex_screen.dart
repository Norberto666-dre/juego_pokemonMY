import 'package:flutter/material.dart';

class PokedexScreen extends StatelessWidget {
  const PokedexScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Pokedex')), body: const Center(child: Text('Pokedex')));
  }
}

