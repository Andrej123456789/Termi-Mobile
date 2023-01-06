import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'console.dart';

int random(int min, int max) {
  return min + Random().nextInt(max - min);
}

class ModelZero extends StatefulWidget {
  const ModelZero({super.key});

  @override
  State<ModelZero> createState() => ModelZeroPage();
}

class ModelZeroPage extends State<ModelZero> {
  Console console = Console();

  var controller = TextEditingController();
  var focusNode = FocusNode();

  String path = Directory.current.path;

  String outputText = "";
  void updateText() {
    setState(() {
      outputText = console.getLog();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: SvgPicture.asset(
              "assets/background.svg",
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
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: TextField(
                      controller: controller,
                      focusNode: focusNode,
                      decoration: InputDecoration(
                        labelText: path,
                        labelStyle: const TextStyle(
                          color: Colors.white24,
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white24,
                            width: 3.0,
                          ),
                        ),
                        border: const OutlineInputBorder(),
                      ),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      onSubmitted: (value) {
                        if (value == "return") {
                          Navigator.pop(context);
                        }

                        console.addLog(value);
                        updateText();

                        controller.clear();
                        focusNode.requestFocus();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
