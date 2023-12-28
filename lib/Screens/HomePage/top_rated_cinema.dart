import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lottie/lottie.dart';
import 'package:poppinroadcimema/Models/Movie.dart';
import 'package:poppinroadcimema/Screens/HomeCinema/Home_page/Movie_interface.dart';
import 'package:poppinroadcimema/providers/CinemaProvider.dart';
import 'package:poppinroadcimema/reusable_widgets/Custom_colors.dart';
import 'package:provider/provider.dart';

class TopRatedCinema extends StatefulWidget {
  @override
  State createState() => _TopRatedCinemaState();
}

class _TopRatedCinemaState extends State<TopRatedCinema> {
  late final PageController pageController;
  final ScrollController _scrollController = ScrollController();
  int pageNo = 0;

  Timer? carouselTimer;

  Timer getTimer() {
    return Timer.periodic(const Duration(seconds: 3), (timer) {
      if (pageNo == 2) {
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
    pageController = PageController(initialPage: 1, viewportFraction: 0.85);
    carouselTimer = getTimer();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        showBottomAppBar = false;
        setState(() {});
      } else {
        showBottomAppBar = true;
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

  bool showBottomAppBar = true;

  @override
  Widget build(BuildContext context) {
    final cinemaProvider = Provider.of<CinemaProvider>(context);
    final cinemasData = cinemaProvider.cinemasData;

    final filteredCinemas =
        cinemasData.where((cinema) => cinema.rating! >= 3).toList();

    final topCinemas = filteredCinemas.length >= 3
        ? filteredCinemas.sublist(0, 3)
        : filteredCinemas;

    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 15, bottom: 0),
            child: Row(
              children: [
                const Text(
                  'Top rated Cinema!',
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
                      final cinema = topCinemas[index];
                      final movies =
                          cinema.movies ?? []; // Ensure movies is not null

                      return AnimatedBuilder(
                        animation: pageController,
                        builder: (ctx, child) {
                          return child!;
                        },
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MovieInterface(
                                  selectedCinema: cinema,
                                ),
                              ),
                            );
                          },
                          onPanDown: (d) {
                            carouselTimer?.cancel();
                            carouselTimer = null;
                          },
                          onPanCancel: () {
                            carouselTimer = getTimer();
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
                                  offset: const Offset(5, 5),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(25),
                                    child: Image.network(
                                      "${cinema.image}",
                                      fit: BoxFit.cover,
                                      width: 120,
                                      height: 190,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 177,
                                  child: Column(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 15, bottom: 9),
                                            child: Text(
                                              cinema.title ?? '',
                                              textAlign: TextAlign.start,
                                              softWrap: true,
                                              style: TextStyle(
                                                  fontSize: 17,
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
                                                    BorderRadius.circular(5),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 9, left: 5),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.add_location_rounded,
                                                  size: 10.0,
                                                  color: Colors.white,
                                                ),
                                                Container(
                                                  width: 155,
                                                  child: Text(
                                                    cinema.address?.substring(
                                                            0, 30) ??
                                                        '',
                                                    style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Row(children: [
                                            Text("${cinema.rating}"),
                                            Icon(
                                              Icons.star,
                                              size: 20,
                                              color: Colors.yellow,
                                            )
                                          ]),
                                          Container(
                                            padding:
                                                const EdgeInsets.only(top: 0.0),
                                            height: 25,
                                            width: 120,
                                            child: ElevatedButton(
                                              onPressed: () {},
                                              child: const Text('Check in map'),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: topCinemas.length,
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    topCinemas.length,
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
                                    borderRadius: BorderRadius.circular(100),
                                  ),
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
