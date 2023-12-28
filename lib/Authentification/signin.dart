import 'package:flutter/material.dart';
import 'package:poppinroadcimema/Authentification/SignInForm.dart';
import 'package:poppinroadcimema/reusable_widgets/Custom_colors.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset(
            "assets/signin.gif",
            fit: BoxFit.cover,
          ),

          // Dark filter
          Container(
            color: Colors.black.withOpacity(0.6), // Adjust opacity as needed
          ),

          Container(
            padding: EdgeInsets.fromLTRB(10, 5, 0, 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end, // Align to the bottom
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Favourite movie ticket",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  "Dive into a new adventure with Poppin Road Cinema",
                  style: TextStyle(
                      color: CustomColors.fourthColor, fontSize: 18.0),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    _showSignInSignUpModal(context);
                  },
                  child: Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width - 10,
                    child: Center(
                      child: Text(
                        "Sign In / Sign Up",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showSignInSignUpModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: CustomColors.primaryColor,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24.0)),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 35, 25, 110)
                      .withOpacity(0.2), // Shadow color
                  spreadRadius: 5, // Spread radius
                  blurRadius: 5, // Blur radius
                  offset: Offset(0, 3), // Offset in the x, y direction
                ),
              ],
            ),
            child: Column(
              children: [
                // Draggable area (grey bar)
                Container(
                  width: 40.0,
                  height: 5.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 205, 205, 205),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                // Your content (e.g., MapWidget)
                Container(
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(24.0))),
                  height: MediaQuery.of(context).size.height - 350,
                  child: SignInForm(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
