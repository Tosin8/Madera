import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'routes.dart';
import 'screen/home/home_screen.dart';
import 'screen/splash/splash_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;

  runApp(MyApp(showHome: showHome));
}

class MyApp extends StatelessWidget {
  final bool showHome;
  const MyApp({super.key, required this.showHome});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Madera',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: Colors.white,
        // textTheme: const TextTheme(
        //   bodyLarge: TextStyle(color: kTextColor),
        // ),
        useMaterial3: true,
      ),
      home: showHome ? const HomePage() : const SplashScreen(),
      //initialRoute: SplashScreen.routeName,
      // using routes so that there will be no need of remebering names.
      //routes: routes,
    );
  }
}
