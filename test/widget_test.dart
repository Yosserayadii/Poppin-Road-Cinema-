import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:poppinroadcimema/animations/splash.dart';
import 'package:poppinroadcimema/main.dart'; // Import your app's entry point

void main() {
  testWidgets('Splash Widget Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: Splash(),
      ),
    );

    // Verify that the initial state of the widget is correct.
    expect(find.text('Splash Screen'), findsNothing);

    // Trigger the animation by waiting for the second image position change.
    await tester.pump(Duration(seconds: 3));

    // Verify that navigation to homescreen occurs

    // You can add more test assertions as needed

    // ... Rest of your test code
  });
}
