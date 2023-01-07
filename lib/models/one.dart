import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

int random(int min, int max) {
  return min + Random().nextInt(max - min);
}

class ModelOne extends StatefulWidget {
  const ModelOne({super.key});

  @override
  State<ModelOne> createState() => ModelOnePage();
}

class ModelOnePage extends State<ModelOne> {
  var controller = TextEditingController();
  var focusNode = FocusNode();

  String outputText = "not implemented";
  String path = Directory.current.path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: SvgPicture.asset(
              "assets/night${random(1, 3)}.svg",
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white24, width: 3.0),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8.5),
                          ),
                        ),
                        child: SizedBox(
                          width: 975,
                          height: 475,
                          child: SingleChildScrollView(
                            child: Text(
                              outputText,
                              style: const TextStyle(
                                color: Colors.white70,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
