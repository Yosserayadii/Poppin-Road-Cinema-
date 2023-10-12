import 'package:flutter/material.dart';
import 'package:poppinroadcimema/Routes/Route.dart';
import 'package:poppinroadcimema/reusable_widgets/Styles.dart';

void main() {
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = true;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Poppin Road Cinema',
      theme: Styles.themeData(isDarkTheme, context),
      initialRoute: '/',
      routes: routes,
    );
  }
}
