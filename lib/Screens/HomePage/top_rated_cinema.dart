import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lottie/lottie.dart';
import 'package:poppinroadcimema/reusable_widgets/Custom_colors.dart';

class TopReatedCinma extends StatefulWidget {
  @override
  State createState() => _TopReatedCinmaState();
}

class _TopReatedCinmaState extends State<TopReatedCinma> {
  late final PageController pageController;
  final ScrollController _scrollController = ScrollController();
  int pageNo = 0;

  Timer? carasouelTmer;

  Timer getTimer() {
    return Timer.periodic(const Duration(seconds: 3), (timer) {
      if (pageNo == 4) {
        pageNo = 0;
      }
      pageController.animateToPage(
        pageNo,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOutCirc,
      );
      pageNo++;
    });
  }

  @override
  void initState() {
    pageController = PageController(initialPage: 0, viewportFraction: 0.85);
    carasouelTmer = getTimer();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        showBtmAppBr = false;
        setState(() {});
      } else {
        showBtmAppBr = true;
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  bool showBtmAppBr = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 15, bottom: 0),
            child: Row(
              children: [
                const Text(
                  'Top rated Cinema !',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Lottie.asset('assets/starsEmojy.json',
                    width: 30, repeat: true, fit: BoxFit.cover, reverse: true),
              ],
            ),
          ),
        ),
        SafeArea(
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                const SizedBox(
                  height: 2.0,
                ),
                SizedBox(
                  height: 200,
                  child: PageView.builder(
                    controller: pageController,
                    onPageChanged: (index) {
                      pageNo = index;
                      setState(() {});
                    },
                    itemBuilder: (_, index) {
                      return AnimatedBuilder(
                        animation: pageController,
                        builder: (ctx, child) {
                          return child!;
                        },
                        child: GestureDetector(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    "Hello yougggh tappgged at ${index + 1} "),
                              ),
                            );
                          },
                          onPanDown: (d) {
                            carasouelTmer?.cancel();
                            carasouelTmer = null;
                          },
                          onPanCancel: () {
                            carasouelTmer = getTimer();
                          },
                          child: Container(
                            margin: const EdgeInsets.only(
                                right: 8, left: 8, top: 24, bottom: 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24.0),
                              color: const Color.fromARGB(255, 24, 41, 86),
                              boxShadow: [
                                BoxShadow(
                                    color: const Color.fromARGB(197, 50, 50, 68)
                                        .withOpacity(0.5),
                                    spreadRadius: -1,
                                    blurRadius: 10,
                                    offset: const Offset(
                                        5, 5) // changes position of shadow
                                    ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(25),
                                    child: Image.asset(
                                      'assets/logoo.png',
                                    ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(top: 15, bottom: 9),
                                      child: Text(
                                        'Pathy',
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      width: 27,
                                      height: 6,
                                      decoration: ShapeDecoration(
                                        color: CustomColors.fifthColor,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                      ),
                                    ),
                                    const Padding(
                                        padding: EdgeInsets.only(
                                            top: 10, left: 5, bottom: 10),
                                        child: Row(
                                          children: [
                                            Icon(Icons.add_location_rounded,
                                                size: 12.0,
                                                color: Colors.white),
                                            Text(
                                              'Tunisia City , Ariana ',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                          ],
                                        )),
                                    Row(
                                      children: [
                                        Container(
                                          width: 17,
                                          height: 15,
                                          decoration: const ShapeDecoration(
                                            color: Color(0xFFD9D9D9),
                                            shape: StarBorder(
                                              points: 5,
                                              innerRadiusRatio: 0.38,
                                              pointRounding: 0,
                                              valleyRounding: 0,
                                              rotation: 0,
                                              squash: 0,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 17,
                                          height: 15,
                                          decoration: const ShapeDecoration(
                                            color: Color(0xFFD9D9D9),
                                            shape: StarBorder(
                                              points: 5,
                                              innerRadiusRatio: 0.38,
                                              pointRounding: 0,
                                              valleyRounding: 0,
                                              rotation: 0,
                                              squash: 0,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 19,
                                          height: 15,
                                          decoration: const ShapeDecoration(
                                            color: Color(0xFFD9D9D9),
                                            shape: StarBorder(
                                              points: 5,
                                              innerRadiusRatio: 0.38,
                                              pointRounding: 0,
                                              valleyRounding: 0,
                                              rotation: 0,
                                              squash: 0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        child: const Text('Check Our films'),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: 5,
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    5,
                    (index) => GestureDetector(
                      child: Container(
                        margin: const EdgeInsets.all(2.0),
                        child: pageNo == index
                            ? Container(
                                width: 20,
                                height: 10,
                                decoration: ShapeDecoration(
                                  color: CustomColors.fifthColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100)),
                                ),
                              )
                            : Icon(
                                Icons.circle,
                                size: 12.0,
                                color: pageNo == index
                                    ? Colors.indigoAccent
                                    : Colors.grey.shade300,
                              ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
