import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
            //fontFamily: 'RobotCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
      onTap: () {
        tapHandler();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).primaryColor,
            child: Text(
              'Reta Deportiva',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile(
            'Preferencias',
            Icons.settings,
            () {
              //Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          buildListTile(
            'Salir',
            Icons.logout,
            () {
              FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
    );
  }
}
