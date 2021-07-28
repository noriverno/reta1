import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:reta1/screens/auth_screen.dart';
import 'package:reta1/screens/auth_screen copy.dart';
import 'package:reta1/screens/chat_screen.dart';
import 'package:reta1/screens/initial_screen.dart';
import 'package:reta1/screens/splash_screen.dart';
import 'package:reta1/screens/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final Map<int, Color> colorCodes = {
    //   50: Color.fromRGBO(119, 185, 87, .1),
    //   100: Color.fromRGBO(119, 185, 87, .2),
    //   200: Color.fromRGBO(119, 185, 87, .3),
    //   300: Color.fromRGBO(119, 185, 87, .4),
    //   400: Color.fromRGBO(119, 185, 87, .5),
    //   500: Color.fromRGBO(119, 185, 87, .6),
    //   600: Color.fromRGBO(119, 185, 87, .7),
    //   700: Color.fromRGBO(119, 185, 87, .8),
    //   800: Color.fromRGBO(119, 185, 87, .9),
    //   900: Color.fromRGBO(119, 185, 87, 1),
    // };

    // final MaterialColor color = new MaterialColor(0xFF77b957, colorCodes);

    return MaterialApp(
      title: 'Reta Deportiva',
      theme: ThemeData(
        // primaryColor: color[900],
        primaryColor: Colors.green[800],
        backgroundColor: Colors.green,
        accentColor: Colors.black,
        accentColorBrightness: Brightness.dark,
        buttonTheme: ButtonTheme.of(context).copyWith(
          buttonColor: Colors.green,
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (ctx, userSnapshot) {
          if (userSnapshot.connectionState == ConnectionState.waiting) {
            return SplashScreen();
          }
          if (userSnapshot.hasData) {
            // return ChatScreen();
            return TabsScreen();
          }
          // return AuthScreen();
          // pantalla inicial
          return InitialScreen();
          //return TabsScreen();
        },
      ),
      routes: {
        InitialScreen.routeName: (ctx) => InitialScreen(),
        AuthScreen.routeName: (ctx) => AuthScreen(),
        AuthScreen2.routeName: (ctx) => AuthScreen2(),
      },
    );
  }
}
