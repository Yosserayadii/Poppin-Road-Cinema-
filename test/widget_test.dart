  
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:poppinroadcimema/animations/splash.dart';
import 'package:poppinroadcimema/main.dart'; // Import your app's entry point
// Import the Splash widget

void main() {
  testWidgets('Test Splash Widget', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(const MainPage()); // Replace with your app's entry point

    // Verify that the Splash widget is displayed
    expect(find.byType(Splash), findsOneWidget);

    // Delay for 3 seconds to allow animation and navigation to complete
    await Future.delayed(const Duration(seconds: 3));


    // ... Rest of your test code
  });
}
