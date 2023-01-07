import 'dart:math';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
        primarySwatch: createMaterialColor(Colors.white),
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
  late Timer timer;
  String photo = "";

  @override
  void initState() {
    photo = "assets/mountain${random(1, 5)}.svg";
    super.initState();
    timer = Timer(const Duration(seconds: 1), _nextPic);
  }

  void _nextPic() {
    setState(() {
      photo = "assets/mountain${random(1, 5)}.svg";
    });
    timer = Timer(const Duration(seconds: 5), _nextPic);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: SvgPicture.asset(
              photo != "" ? photo : 'assets/mountain1.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ModelZero(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(20.0),
                      fixedSize: const Size(300, 80),
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.white54),
                  child: const Text("Model 0"),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ModelOne(),
                      ),
                    );

                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(20.0),
                      fixedSize: const Size(300, 80),
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.white54),
                  child: const Text("Model 1"),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
