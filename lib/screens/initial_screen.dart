import 'package:flutter/material.dart';
import 'package:reta1/screens/auth_screen.dart';
import 'package:reta1/screens/auth_screen copy.dart';

class InitialScreen extends StatelessWidget {
  static const routeName = '/initial';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color.fromRGBO(119, 185, 87, 1),
      body: new Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("assets/images/reta_bkg2.jpg"),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              // child: Padding(
              //   padding: EdgeInsets.all(16),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 450,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(AuthScreen2.routeName);
                    },
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(Size(300, 40)),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    child: Text(
                      'Registrarse',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(AuthScreen.routeName);
                    },
                    child: Text(
                      'Iniciar sesión',
                      style: TextStyle(
                        // fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // ),
        ],
      ),
    );
  }
}
