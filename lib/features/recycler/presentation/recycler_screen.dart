import 'package:flutter/material.dart';

class RecyclerScreen extends StatelessWidget {
  const RecyclerScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Recycler')),
        body: const Center(child: Text('Recycler')));
  }
}
