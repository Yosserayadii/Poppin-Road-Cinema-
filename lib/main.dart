import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:poppinroadcimema/Routes/Route.dart';
import 'package:poppinroadcimema/firebase_options.dart';
import 'package:poppinroadcimema/providers/models_provider.dart';
import 'package:poppinroadcimema/reusable_widgets/Styles.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = true;
    return MultiProvider(
      providers: [
      ChangeNotifierProvider(create: (_) => ModelsProvider() 
      
      )

       ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Poppin Road Cinema',
        theme: Styles.themeData(isDarkTheme, context),
        initialRoute: '/',
        routes: routes,
      ),
    );
  }
}