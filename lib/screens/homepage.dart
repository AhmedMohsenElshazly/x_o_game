import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:x_o_game/screens/gamescreen.dart';

class MyHomePge extends StatelessWidget {
  const MyHomePge({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 60, 55, 150),
      appBar: AppBar(
        title: const Text(
          "Home Page",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.right,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 100), // moves button UP
        child: Align(
          alignment: Alignment.center,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const GameScreen()),
    );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: const EdgeInsets.symmetric(
                  horizontal: 52, vertical: 20), // makes button larger
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text(
              'Play',
              style: TextStyle(fontSize: 24), // makes text larger
            ),
          ),
        ),
      ),
    );
  }
}
