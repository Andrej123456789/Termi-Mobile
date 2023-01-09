import 'dart:io';
import 'dart:math';
import 'dart:async';

import 'package:flutter/material.dart';

import 'package:xterm/xterm.dart';
import 'package:flutter_svg/svg.dart';

import 'console.dart';

int random(int min, int max) {
  return min + Random().nextInt(max - min);
}

class ModelOne extends StatefulWidget {
  const ModelOne({super.key});

  @override
  ModelOnePage createState() => ModelOnePage();
}

class ModelOnePage extends State<ModelOne> {
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

  late Timer timer;
  String photo = "";

  @override
  void initState() {
    photo = "assets/night${random(1, 3)}.svg";
    super.initState();
    timer = Timer(const Duration(seconds: 5), _nextPic);
  }

  void _nextPic() {
    setState(() {
      photo = "assets/night${random(1, 3)}.svg";
    });
    terminal.write('Hello, world!\n');
    timer = Timer(const Duration(seconds: 5), _nextPic);
  }

  /* --------------------------------- */
  Terminal terminal = Terminal();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: SvgPicture.asset(
              photo != "" ? photo : 'assets/night2.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              children: [
                Container(
                  height: 30,
                  child: TerminalView(terminal),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
