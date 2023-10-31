import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:poppinroadcimema/Models/Cinema.dart';

class MapBottomWidget extends StatelessWidget {
  final PageController pageController;
  final List<Cinema> Cinemas;

  const MapBottomWidget({
    Key? key,
    required this.pageController,
    required this.Cinemas,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 2,
      height: MediaQuery.of(context).size.height * 0.3,
      child: PageView.builder(
        controller: pageController,
        onPageChanged: (value) {},
        itemCount: Cinemas.length,
        itemBuilder: (_, index) {
          final item = Cinemas[index];
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Card(
              // elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Expanded(
                        //   child: ListView.builder(
                        //     padding: EdgeInsets.zero,
                        //     scrollDirection: Axis.horizontal,
                        //     itemCount: item.rating,
                        //     itemBuilder: (BuildContext context, int index) {
                        //       return const Icon(
                        //         Icons.star,
                        //         color: Colors.orange,
                        //       );
                        //     },
                        //   ),
                        // ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    0, 10.0, 0, 8.0), // Add padding as needed
                                child: Row(
                                  children: [
                                    Text(
                                      item.title ?? '',
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(
                                      FeatherIcons.star,
                                      color: Colors.orange,
                                      size: 17,
                                    ),
                                    Text(
                                      item.rating.toString(),
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.orange,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              Expanded(
                                child: Text(
                                  item.address ?? '',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        item.image ?? '',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
