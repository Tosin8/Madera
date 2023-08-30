import 'package:flutter/material.dart';

import 'routes.dart';
import 'screen/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      // home: SplashScreen(),
      initialRoute: SplashScreen.routeName,
      // using routes so that there will be no need of remebering names.
      routes: routes,
    );
  }
}
