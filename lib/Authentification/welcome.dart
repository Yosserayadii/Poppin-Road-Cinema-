import 'package:flutter/material.dart';
import 'package:poppinroadcimema/reusable_widgets/Custom_colors.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
            image: AssetImage("assets/ownlogo.png"),
            height: height * 0.6,
          ),
          Text(
            "Favourite movie ticket",
            style: Theme.of(context).textTheme.headline3,
          ),
          Text(
            "Dive into a new adventure with Poppin Road Cinema",
            style: Theme.of(context).textTheme.bodyText1,
            textAlign: TextAlign.center,
          ),
          Row(
            children: [
              Expanded(
                  child: OutlinedButton(
                onPressed: () {},
                child: Text("Login".toUpperCase()),
                style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(),
                    foregroundColor: CustomColors.fifthColor,
                    side: BorderSide(color: CustomColors.fifthColor),
                    padding: EdgeInsets.symmetric(vertical: 20)),
              )),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: ElevatedButton(
                onPressed: () {},
                child: Text("Sign up ".toUpperCase()),
                style: OutlinedButton.styleFrom(
                    elevation: 0,
                    shape: RoundedRectangleBorder(),
                    foregroundColor: CustomColors.primaryColor,
                    backgroundColor: CustomColors.fifthColor,
                    padding: EdgeInsets.symmetric(vertical: 20)),
              )),
            ],
          )
        ],
      ),
    ));
  }
}
