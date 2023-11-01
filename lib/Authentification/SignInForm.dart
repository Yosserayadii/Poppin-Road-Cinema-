import 'package:flutter/material.dart';
import 'package:poppinroadcimema/reusable_widgets/Custom_colors.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
            child: Column(children: [
          Text(
            "Welcome !",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "please sign in and start the adventure ",
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.w300),
          ),
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Enter your email',
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: const InputDecoration(
                    hintText: 'Enter your password',
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pop(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize:
                          Size(MediaQuery.of(context).size.width - 40, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: const Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Divider(),
          SizedBox(height: 30),
          ButtonBar(
            alignment: MainAxisAlignment.start,
            buttonMinWidth: 400,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(MediaQuery.of(context).size.width - 40, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  backgroundColor: CustomColors.fourthColor,
                ),
                icon: Image.asset(
                  'assets/google_icon.png',
                  height: 24,
                  width: 24,
                ),
                label: Text("Sign In with Google"),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(MediaQuery.of(context).size.width - 40, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  backgroundColor: Color(0xFF3B5998),
                ),
                icon: Image.asset(
                  'assets/facebook_icon.png',
                  height: 24,
                  width: 24,
                ),
                label: Text("Sign In with Facebook"),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(MediaQuery.of(context).size.width - 40, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  backgroundColor: Colors.black,
                ),
                icon: Image.asset(
                  'assets/apple_icon.png',
                  height: 24,
                  width: 24,
                  color: Colors.white,
                ),
                label: Text("Sign In with Apple"),
              ),
            ],
          )
        ])));
  }
}
