import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

import 'models/zero.dart';
import 'models/one.dart';

int random(int min, int max) {
  return min + Random().nextInt(max - min);
}

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}

class Termi extends StatelessWidget {
  const Termi({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Termi',
      theme: ThemeData(
        primarySwatch: createMaterialColor(Colors.transparent),
      ),
      home: const ModelChooser(),
    );
  }
}

class ModelChooser extends StatefulWidget {
  const ModelChooser({super.key});

  @override
  State<ModelChooser> createState() => ModelChooserPage();
}

class ModelChooserPage extends State<ModelChooser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Termi - welcome screen"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: Svg("assets/mountain${random(1, 3)}.svg"), fit: BoxFit.cover)),
        ),
      ),
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: Svg("assets/mountain${random(1, 3)}.svg"),
                  fit: BoxFit.cover)),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ModelZero()));
                  },
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(20.0),
                      fixedSize: const Size(300, 80)),
                  child: const Text("Model 0")),
              const SizedBox(height: 30),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ModelOne()));
                  },
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(20.0),
                      fixedSize: const Size(300, 80)),
                  child: const Text("Model 1"))
            ],
          ))),
    );
  }
}
