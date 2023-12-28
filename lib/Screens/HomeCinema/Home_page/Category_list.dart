import 'package:flutter/material.dart';
import 'package:poppinroadcimema/reusable_widgets/Custom_colors.dart';

class CategoryList extends StatefulWidget {
  final String title;
  const CategoryList({super.key, required this.title});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int selectedcategory = 0;
  final List<String> categories = ["In Theater", "Box Office", "Coming Soon"];
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 30),
        child: Center(
          child: Text(
            "${widget.title}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: const Color.fromARGB(255, 192, 192, 192),
            ),
          ),
        )
        //  Container(
        //     height: 60,
        //     child: ListView.builder(
        //         scrollDirection: Axis.horizontal,
        //         itemCount: categories.length,
        //         itemBuilder: (context, index) => buildCategory(index, context))),
        );
  }

  // Padding buildCategory(int index, BuildContext context) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  //     child: GestureDetector(
  //       onTap: () {
  //         setState(() {
  //           selectedcategory = index;
  //         });
  //       },
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Text(
  //             categories[index],
  //             style: Theme.of(context).textTheme.headlineMedium!.copyWith(
  //                   fontWeight: FontWeight.normal,
  //                   fontSize: 15,
  //                   color: index == selectedcategory
  //                       ? CustomColors.fifthColor
  //                       : const Color.fromARGB(255, 187, 187, 187)
  //                           .withOpacity(0.2),
  //                 ),
  //           ),
  //           Container(
  //             margin: EdgeInsets.symmetric(vertical: 1),
  //             height: 6,
  //             width: 40,
  //             decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(10),
  //                 color: index == selectedcategory
  //                     ? CustomColors.fifthColor
  //                     : Colors.transparent),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
