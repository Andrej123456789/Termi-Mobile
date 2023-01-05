import 'dart:io';
import 'package:flutter/material.dart';

import 'console.dart';

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
      body: Center(
          child: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8.5))),
                    child: SizedBox(
                        width: 450,
                        height: 250,
                        child: SingleChildScrollView(child: Text(outputText)))),
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
                  border: const OutlineInputBorder(),
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
          )
        ],
      )),
    );
  }
}
