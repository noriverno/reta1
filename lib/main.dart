import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:reta1/screens/auth_screen.dart';
import 'package:reta1/screens/reg1_screen.dart';
import 'package:reta1/screens/reg2_screen.dart';
import 'package:reta1/screens/initial_screen.dart';
import 'package:reta1/screens/splash_screen.dart';
import 'package:reta1/screens/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reta Deportiva',
      theme: ThemeData(
        // primaryColor: color[900],
        fontFamily: 'Futura',
        primaryColor: Colors.green[800],
        backgroundColor: Colors.green,
        accentColor: Colors.black,
        accentColorBrightness: Brightness.dark,
        unselectedWidgetColor: Colors.white,
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
        Reg1Screen.routeName: (ctx) => Reg1Screen(),
        Reg2Screen.routeName: (ctx) => Reg2Screen(),
      },
    );
  }
}
