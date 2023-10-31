import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Spinning_wheel extends StatefulWidget {
  const Spinning_wheel({super.key});

  @override
  State<Spinning_wheel> createState() => _Spinning_wheelState();
}

class _Spinning_wheelState extends State<Spinning_wheel> {
  final selected = BehaviorSubject<int>();
  int rewards = 0;
  List<int> items = [5, 20, 30, 40, 50, 60, 70, 80];
  int timeLeft = 0; 
  bool canSpin = false;
  bool showCongrats = false;

  @override
  void initState() {
    super.initState();
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
    } else {
      final actualEndTime = lastSpinTime + 24 * 60 * 60;
      final remainingTime = actualEndTime - currentTime;
      setState(() {
        canSpin = false;
        timeLeft = remainingTime;
      });
      startCountdownTimer();
    }
  }

  void startCountdownTimer() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (timeLeft <= 0) {
        setState(() {
          canSpin = true;
          timeLeft = 0;
        });
        timer.cancel();
      } else {
        setState(() {
          timeLeft--;
        });
      }
    });
  }

  Future<void> saveLastSpinTime() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('lastSpinTime', DateTime.now().millisecondsSinceEpoch ~/ 1000);
  }

  void showCongratulations() {
    setState(() {
      showCongrats = true;
    });
  }

  void hideCongratulations() {
    setState(() {
      showCongrats = false;
    });
  }

  @override
  void dispose() {
    selected.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
                      animateFirst: false,
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
                        setState(() {
                          rewards = items[selected.value];
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("You just won $rewards Points"),
                            ),
                          );
                          canSpin = false;
                          timeLeft = 24 * 60 * 60;
                          saveLastSpinTime();
                          showCongratulations();
                        });
                      },
                    ),
                  ),
                  GestureDetector(
                    onTap: canSpin
                        ? () {
                            selected.add(Fortune.randomInt(0, items.length));
                          }
                        : null,
                    child: Image.asset(
                      'assets/spin.png',
                      width: 80,
                      height: 80,
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
            if (showCongrats)
              GestureDetector(
                onTap: hideCongratulations,
                child: Image.asset(
                  'assets/congratulations.gif',
                  width: 400,
                  height: 400,
                ),
              ),
          ],
        ),
      ),
    );
  }

  String formatTime(int timeInSeconds) {
    final hours = (timeInSeconds ~/ 3600).toString().padLeft(2, '0');
    final minutes = ((timeInSeconds % 3600) ~/ 60).toString().padLeft(2, '0');
    final seconds = (timeInSeconds % 60).toString().padLeft(2, '0');
    return '$hours:$minutes:$seconds';
  }
}
