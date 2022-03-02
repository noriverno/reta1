import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(119, 185, 87, 1),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("assets/images/reta_bkg_2.jpg"),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Container(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 12),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Nuevas',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
//inicia
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 50,
                        height: 80,
                        decoration: BoxDecoration(color: Colors.grey.shade300),
                        child: Icon(
                          Icons.person_outlined,
                          color: Colors.green,
                          size: 25.0,
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                              width: 300,
                              height: 80,
                              decoration:
                                  BoxDecoration(color: Colors.grey.shade100),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    '@Timoteo: Te mencionó en una publicación',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )),
                        ],
                      ),
                      Container(
                        width: 50,
                        height: 80,
                        decoration: BoxDecoration(color: Colors.grey.shade600),
                        child: Icon(
                          Icons.delete_outlined,
                          color: Colors.white,
                          size: 25.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),

//fin
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 50,
                        height: 80,
                        decoration: BoxDecoration(color: Colors.grey.shade300),
                        child: Icon(
                          Icons.person_outlined,
                          color: Colors.green,
                          size: 25.0,
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                              width: 300,
                              height: 80,
                              decoration:
                                  BoxDecoration(color: Colors.grey.shade100),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Se agrego un nuevo foro de "Podrá el campeón Cruz Azul..."',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )),
                        ],
                      ),
                      Container(
                        width: 50,
                        height: 80,
                        decoration: BoxDecoration(color: Colors.grey.shade600),
                        child: Icon(
                          Icons.delete_outlined,
                          color: Colors.white,
                          size: 25.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 50,
                        height: 80,
                        decoration: BoxDecoration(color: Colors.grey.shade300),
                        child: Icon(
                          Icons.person_outlined,
                          color: Colors.green,
                          size: 25.0,
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                              width: 300,
                              height: 80,
                              decoration:
                                  BoxDecoration(color: Colors.grey.shade100),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'A Zacarias Piedras le gustó tu comentario',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )),
                        ],
                      ),
                      Container(
                        width: 50,
                        height: 80,
                        decoration: BoxDecoration(color: Colors.grey.shade600),
                        child: Icon(
                          Icons.delete_outlined,
                          color: Colors.white,
                          size: 25.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Anteriores',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
//inicia
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 50,
                        height: 80,
                        decoration: BoxDecoration(color: Colors.grey.shade300),
                        child: Icon(
                          Icons.person_outlined,
                          color: Colors.green,
                          size: 25.0,
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                              width: 300,
                              height: 80,
                              decoration:
                                  BoxDecoration(color: Colors.grey.shade100),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Ricardo te contestó a tu comentario de la publicación',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )),
                        ],
                      ),
                      Container(
                        width: 50,
                        height: 80,
                        decoration: BoxDecoration(color: Colors.grey.shade600),
                        child: Icon(
                          Icons.delete_outlined,
                          color: Colors.white,
                          size: 25.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),

//fin
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 50,
                        height: 80,
                        decoration: BoxDecoration(color: Colors.grey.shade300),
                        child: Icon(
                          Icons.person_outlined,
                          color: Colors.green,
                          size: 25.0,
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                              width: 300,
                              height: 80,
                              decoration:
                                  BoxDecoration(color: Colors.grey.shade100),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Tienes una nueva sugerencia de foro: Mexicanos por Europa',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )),
                        ],
                      ),
                      Container(
                        width: 50,
                        height: 80,
                        decoration: BoxDecoration(color: Colors.grey.shade600),
                        child: Icon(
                          Icons.delete_outlined,
                          color: Colors.white,
                          size: 25.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 50,
                        height: 80,
                        decoration: BoxDecoration(color: Colors.grey.shade300),
                        child: Icon(
                          Icons.person_outlined,
                          color: Colors.green,
                          size: 25.0,
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                              width: 300,
                              height: 80,
                              decoration:
                                  BoxDecoration(color: Colors.grey.shade100),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Se han realizado 10 publicaciones nuevas desde tu última.. ',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )),
                        ],
                      ),
                      Container(
                        width: 50,
                        height: 80,
                        decoration: BoxDecoration(color: Colors.grey.shade600),
                        child: Icon(
                          Icons.delete_outlined,
                          color: Colors.white,
                          size: 25.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
