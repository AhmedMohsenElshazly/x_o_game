import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 177, 194, 225),
      appBar: AppBar(
        title: const Text("game screen"),
      ),
      body: const Center(
        child: Text("welcome to game screen",textAlign: TextAlign.start,),
        
      ),
    );
  }
}
