import 'dart:io';

import 'package:flutter/material.dart';
import 'package:reta1/widgets/Story.dart';

class Reg3Form extends StatefulWidget {
  Reg3Form(
    this.submitFn,
    this.isLoading,
  );

  final bool isLoading;
  //final storyW = 100.0;
  //final storyH = 100.0;
  final storyW = 60.0;
  final storyH = 60.0;

  final void Function(
    String email,
    String password,
    String userName,
    File image,
    bool isLogin,
    BuildContext ctx,
  ) submitFn;

  @override
  _Reg3FormState createState() => _Reg3FormState();
}

class _Reg3FormState extends State<Reg3Form> {
  final _formKey = GlobalKey<FormState>();
  var _isLogin = false;
  var _userEmail = '';
  var _userName = '';
  var _userPassword = '';
  var _userPassword2 = '';
  File _userImageFile;

  // void _pickedImage(File image) {
  //   _userImageFile = image;
  // }

  void _trySubmit() {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus(); // cierra el teclado

    if (isValid) {
      _formKey.currentState.save();
      widget.submitFn(
        _userEmail.trim(),
        _userPassword.trim(),
        _userName.trim(),
        _userImageFile,
        _isLogin,
        context,
      );
      // Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      // child: Card(
      //   margin: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: 80),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Solo un paso más.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Selecciona a tu equipo favorito.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 12),
                // if (!_isLogin)
                //   TextFormField(
                //     key: ValueKey('username'),
                //     autocorrect: true,
                //     textCapitalization: TextCapitalization.words,
                //     enableSuggestions: false,
                //     validator: (value) {
                //       if (value.isEmpty || value.length < 4) {
                //         return 'Username must be at least 4 characters long.';
                //       }
                //       return null;
                //     },
                //     decoration: InputDecoration(
                //       labelText: 'Usuario*',
                //       labelStyle: TextStyle(
                //         color: Theme.of(context).primaryColor,
                //         fontSize: 17,
                //       ),
                //       fillColor: Colors.white,
                //       filled: true,
                //     ),
                //     onSaved: (value) {
                //       _userName = value;
                //     },
                //   ),

                Container(
                  //height: 130.0, // dos filas
                  height: 80.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          StoryCircle(
                            image: "assets/images/EQAMElogo.png",
                            name: "user1",
                            id: 'ATR2gFYChWI',
                            title: 'America',
                            circle: true,
                            width: widget.storyW,
                            height: widget.storyH,
                          ),
                          const SizedBox(width: 1.0),
                          StoryCircle(
                            image: "assets/images/EQATSlogo.png",
                            name: "user2",
                            id: 'pHF3EqYdFKA',
                            title: 'Atlas',
                            circle: true,
                            width: widget.storyW,
                            height: widget.storyH,
                          ),
                          const SizedBox(width: 5.0),
                          StoryCircle(
                            image: "assets/images/EQCRZlogo.png",
                            name: "user3",
                            id: 'sS5UbyhtxjY',
                            title: 'Cruz Azul',
                            circle: true,
                            width: widget.storyW,
                            height: widget.storyH,
                          ),
                          const SizedBox(width: 10.0),
                          StoryCircle(
                            image: "assets/images/EQGDLlogo.png",
                            name: "user4",
                            id: 'XXX',
                            title: 'Chivas',
                            circle: true,
                            width: widget.storyW,
                            height: widget.storyH,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 80.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          StoryCircle(
                            image: "assets/images/EQAMElogo.png",
                            name: "user1",
                            id: 'ATR2gFYChWI',
                            title: 'America',
                            circle: true,
                            width: widget.storyW,
                            height: widget.storyH,
                          ),
                          const SizedBox(width: 1.0),
                          StoryCircle(
                            image: "assets/images/EQATSlogo.png",
                            name: "user2",
                            id: 'pHF3EqYdFKA',
                            title: 'Atlas',
                            circle: true,
                            width: widget.storyW,
                            height: widget.storyH,
                          ),
                          const SizedBox(width: 5.0),
                          StoryCircle(
                            image: "assets/images/EQCRZlogo.png",
                            name: "user3",
                            id: 'sS5UbyhtxjY',
                            title: 'Cruz Azul',
                            circle: true,
                            width: widget.storyW,
                            height: widget.storyH,
                          ),
                          const SizedBox(width: 10.0),
                          StoryCircle(
                            image: "assets/images/EQGDLlogo.png",
                            name: "user4",
                            id: 'XXX',
                            title: 'Chivas',
                            circle: true,
                            width: widget.storyW,
                            height: widget.storyH,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 80.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          StoryCircle(
                            image: "assets/images/EQAMElogo.png",
                            name: "user1",
                            id: 'ATR2gFYChWI',
                            title: 'America',
                            circle: true,
                            width: widget.storyW,
                            height: widget.storyH,
                          ),
                          const SizedBox(width: 1.0),
                          StoryCircle(
                            image: "assets/images/EQATSlogo.png",
                            name: "user2",
                            id: 'pHF3EqYdFKA',
                            title: 'Atlas',
                            circle: true,
                            width: widget.storyW,
                            height: widget.storyH,
                          ),
                          const SizedBox(width: 5.0),
                          StoryCircle(
                            image: "assets/images/EQCRZlogo.png",
                            name: "user3",
                            id: 'sS5UbyhtxjY',
                            title: 'Cruz Azul',
                            circle: true,
                            width: widget.storyW,
                            height: widget.storyH,
                          ),
                          const SizedBox(width: 10.0),
                          StoryCircle(
                            image: "assets/images/EQGDLlogo.png",
                            name: "user4",
                            id: 'XXX',
                            title: 'Chivas',
                            circle: true,
                            width: widget.storyW,
                            height: widget.storyH,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                if (widget.isLoading) CircularProgressIndicator(),
                if (!widget.isLoading)
                  ElevatedButton(
                    onPressed: _trySubmit,
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(Size(400, 50)),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    child: Text(
                      _isLogin ? 'Iniciar' : 'Añadir',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                if (!widget.isLoading)
                  FlatButton(
                    onPressed: () {
                      setState(() {
                        _isLogin = !_isLogin;
                      });
                    },
                    child: Text(
                      _isLogin
                          ? '¿No tienes cuenta aún? Registrate'
                          : 'Ya tengo cuenta',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                    textColor: Theme.of(context).primaryColor,
                  ),
              ],
            ),
          ),
        ),
      ),
      // ),
    );
  }
}
