import 'package:flutter/material.dart';

class ModelOne extends StatefulWidget {
  const ModelOne({super.key});

  @override
  State<ModelOne> createState() => ModelOnePage();
}

class ModelOnePage extends State<ModelOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Termi - welcome screen"),
      ),
      body: const Text("model one")
    );
  }
}
