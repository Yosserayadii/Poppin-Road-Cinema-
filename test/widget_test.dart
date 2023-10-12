import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:poppinroadcimema/Screens/home_page.dart';
import 'package:poppinroadcimema/Screens/splash.dart';

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

    // Verify that the text on the screen has changed.
    expect(find.text('Splash Screen'), findsNothing);
    await tester
        .pumpAndSettle(); // This will pump frames until there are no more frames to pump, which is when the animation completes.
    expect(find.byType(homescreen), findsOneWidget);
    // Assumes homescreen is the correct widget to navigate to.
  });
}
