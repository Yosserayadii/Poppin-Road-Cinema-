import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:confetti/confetti.dart';

class Spinning_wheel extends StatefulWidget {
  const Spinning_wheel({Key? key});

  @override
  State<Spinning_wheel> createState() => _Spinning_wheelState();
}

class _Spinning_wheelState extends State<Spinning_wheel> {
  final selected = BehaviorSubject<int>();
  int rewards = 0;
  List<int> items = [5, 20, 30, 40, 50, 60, 70, 80];
  int timeLeft = 60; // Set countdown to 1 minute
  bool canSpin = false;
  bool isSpinning = false;
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(duration: const Duration(seconds: 2));
    checkLastSpinTime();
  }

  Future<void> checkLastSpinTime() async {
    final prefs = await SharedPreferences.getInstance();
    final lastSpinTime = prefs.getInt('lastSpinTime') ?? 0;
    final currentTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    final elapsedTime = currentTime - lastSpinTime;
    if (elapsedTime >= 24 * 60 * 60) {
      setState(() {
        canSpin = true;
        timeLeft = 0;
      });
    }
  }

  @override
  void dispose() {
    selected.close();
    _confettiController.dispose();
    super.dispose();
  }

  void showConfetti() {
    setState(() {
      _confettiController.play();
    });
  }

  Future<void> startSpin() async {
    if (canSpin) {
      setState(() {
        isSpinning = true;
      });
      selected.add(Fortune.randomInt(0, items.length));
      await Future.delayed(const Duration(seconds: 2)); 
      setState(() {
        rewards = items[selected.value];
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("You just won $rewards Points"),
          ),
        );
        canSpin = false;
        saveLastSpinTime();
        isSpinning = false;
        showConfetti();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 300,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 400,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Color(0xFFFFD700),
                        width: 2.0,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue,
                          offset: Offset(0, 0),
                          spreadRadius: 10,
                          blurRadius: 10,
                        ),
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          offset: Offset(0, 10),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: FortuneWheel(
                      selected: selected.stream,
                      animateFirst: isSpinning, 
                      items: [
                        for (int i = 0; i < items.length; i++) ...<FortuneItem>[
                          FortuneItem(
                            child: Container(
                              color: i.isEven ? Colors.grey : Colors.blue,
                              alignment: Alignment.center,
                              child: Text(
                                items[i].toString(),
                                style: TextStyle(
                                  color: i.isEven ? Colors.black : Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          )
                        ]
                      ],
                      onAnimationEnd: () {
                       
                      },
                    ),
                  ),
                  TextButton(
                    onPressed: startSpin, 
                    child: Text(
                      "SPIN",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith((states) {
                        if (states.contains(MaterialState.disabled)) {
                          return Colors.grey;
                        }
                        return Colors.red;
                      }),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Text(
              canSpin ? "Ready to spin!" : "Time left: ${formatTime(timeLeft)}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: ConfettiWidget(
        confettiController: _confettiController,
        blastDirectionality: BlastDirectionality.explosive,
        maxBlastForce: 20,
        minBlastForce: 8,
        emissionFrequency: 0.05,
        numberOfParticles: 50,
        gravity: 0.1,
      ),
    );
  }

  String formatTime(int timeInSeconds) {
    final minutes = (timeInSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (timeInSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  Future<void> saveLastSpinTime() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('lastSpinTime', DateTime.now().millisecondsSinceEpoch ~/ 1000);
  }
}
