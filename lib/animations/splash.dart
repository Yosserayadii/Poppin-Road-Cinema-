import 'package:flutter/material.dart';
import 'package:poppinroadcimema/Screens/HomeCinema/Home_Page/home_page.dart';
import 'package:poppinroadcimema/Screens/HomePage/home_cinema.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  double imagePosition = 0.0;

  @override
  void initState() {
    super.initState();
    animateImages();
  }

  void animateImages() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      imagePosition = 0.5;
    });

    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => HomeCinema(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            const curve = Curves.easeInOut;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);

            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF171B30),
        child: Stack(
          children: [
            AnimatedContainer(
              duration: Duration(seconds: 1),
              curve: Curves.easeInOut,
              alignment: Alignment(0.0, imagePosition),
              child: Image.asset(
                'assets/logoo.png',
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height / 2,
              ),
            ),
            AnimatedContainer(
              duration: Duration(seconds: 1),
              curve: Curves.easeInOut,
              alignment: Alignment(0.0, -imagePosition),
              child: Image.asset(
                'assets/logo.png',
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height / 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
