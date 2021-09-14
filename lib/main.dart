import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/pages/home/components/zoom_drawer.dart';
import 'package:food_delivery/pages/splash/splash.dart';
// import 'package:food_delivery/pages/splash/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Delivery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(),
        ),
        primaryColor: Colors.black,
        colorScheme: ColorScheme.fromSwatch(
          accentColor: Colors.black,
        ),
        textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.black),
        fontFamily: 'Actor',
      ),
      home: FirebaseAuth.instance.currentUser != null
          ? MyDrawer()
          : SplashScreen(),
    );
  }
}
