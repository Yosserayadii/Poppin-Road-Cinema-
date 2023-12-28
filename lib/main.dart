import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:poppinroadcimema/providers/CinemaProvider.dart';
import 'package:poppinroadcimema/providers/SelectedSeatsProvider.dart';
import 'package:poppinroadcimema/providers/UserProvider.dart';
import 'package:poppinroadcimema/providers/models_provider.dart';
import 'package:provider/provider.dart';
import 'package:poppinroadcimema/Routes/Route.dart';
import 'package:poppinroadcimema/firebase_options.dart';
import 'package:poppinroadcimema/providers/PriceProvider.dart';
import 'package:poppinroadcimema/providers/models_provider.dart';
import 'package:poppinroadcimema/reusable_widgets/Styles.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PriceProvider()),
        ChangeNotifierProvider(create: (context) => CinemaProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => ModelsProvider()),
        ChangeNotifierProvider(create: (_) => SelectedSeatsProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
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
