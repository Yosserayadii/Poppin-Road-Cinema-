import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:poppinroadcimema/Models/Cinema.dart';
import 'package:poppinroadcimema/reusable_widgets/Custom_colors.dart';

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
      height: MediaQuery.of(context).size.height * 0.2, // Reduced the height
      child: PageView.builder(
        controller: pageController,
        onPageChanged: (value) {},
        itemCount: Cinemas.length,
        itemBuilder: (_, index) {
          final item = Cinemas[index];
          return Padding(
            padding: const EdgeInsets.all(10.0), // Reduced the padding
            child: Card(
              elevation: 3, // Adjusted the elevation
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(10), // Reduced the border radius
              ),
              child: Row(
                children: [
                  const SizedBox(width: 15), // Reduced the width
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 180,
                              child: Text(
                                item.title ?? '',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              FeatherIcons.star,
                              color: Colors.orange,
                              size: 14,
                            ),
                            Text(
                              item.rating.toString(),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 27,
                          height: 6,
                          decoration: ShapeDecoration(
                            color: CustomColors.fifthColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          item.address ?? '',
                          style: const TextStyle(
                            fontSize: 12, // Reduced the font size
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(8), // Reduced the border radius
                      child: Image.asset(
                        item.image ?? '',
                        fit: BoxFit.cover,
                        height: 80, // Reduced the height
                        width: 100, // Reduced the width
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}