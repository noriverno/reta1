import 'dart:io';

import 'package:flutter/material.dart';
import 'package:reta1/widgets/picker/user_image_picker.dart';

class AuthForm extends StatefulWidget {
  AuthForm(
    this.submitFn,
    this.isLoading,
    this.submitFB,
    this.signInAnonymously,
  );

  final bool isLoading;
  final void Function(
    String email,
    String password,
    String userName,
    File image,
    bool isLogin,
    BuildContext ctx,
  ) submitFn;

  final Future Function() submitFB;

  final void Function() signInAnonymously;

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  var _isLogin = true;
  var _userEmail = '';
  var _userName = '';
  var _userPassword = '';
  File _userImageFile;

  void _pickedImage(File image) {
    _userImageFile = image;
  }

  void _trySubmit() {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus(); // cierra el teclado

    if (_userImageFile == null && !_isLogin) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Please pick an image'),
        backgroundColor: Theme.of(context).errorColor,
      ));
      return;
    }

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
                const SizedBox(height: 100),
                if (_isLogin)
                  Text(
                    'Inicio sesion para continuar',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                SizedBox(
                  height: 45,
                ),
                if (!_isLogin) UserImagePicker(_pickedImage),
                TextFormField(
                  key: ValueKey('email'),
                  autocorrect: false,
                  textCapitalization: TextCapitalization.none,
                  enableSuggestions: false,
                  validator: (value) {
                    if (value.isEmpty || !value.contains('@')) {
                      return 'Please enter a valida email address';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                    labelStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 17,
                    ),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  onSaved: (value) {
                    _userEmail = value;
                  },
                ),
                if (!_isLogin) SizedBox(height: 12),
                if (!_isLogin)
                  TextFormField(
                    key: ValueKey('username'),
                    autocorrect: true,
                    textCapitalization: TextCapitalization.words,
                    enableSuggestions: false,
                    validator: (value) {
                      if (value.isEmpty || value.length < 4) {
                        return 'Username must be at least 4 characters long.';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Username',
                      labelStyle: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 17,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    onSaved: (value) {
                      _userName = value;
                    },
                  ),
                SizedBox(height: 12),
                TextFormField(
                  key: ValueKey('password'),
                  validator: (value) {
                    if (value.isEmpty || value.length < 7) {
                      return 'Password must be at least 7 characters long.';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Contrase??a',
                    labelStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 17,
                    ),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  obscureText: true,
                  onSaved: (value) {
                    _userPassword = value;
                  },
                ),
                if (_isLogin) SizedBox(height: 12),
                if (_isLogin)
                  Text(
                    '??Olvidaste la contrase??a?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                SizedBox(height: 12),
                if (widget.isLoading) CircularProgressIndicator(),
                if (!widget.isLoading)
                  ElevatedButton(
                    onPressed: _trySubmit,
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(Size(400, 50)),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    child: Text(
                      _isLogin ? 'Iniciar' : 'Aceptar',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                SizedBox(height: 12),
                ElevatedButton(
                  onPressed: widget.signInAnonymously,
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(400, 50)),
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  child: Text(
                    'SkIp',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                SizedBox(height: 12),
                if (!widget.isLoading)
                  FlatButton(
                    onPressed: () {
                      setState(() {
                        _isLogin = !_isLogin;
                      });
                    },
                    child: Text(
                      _isLogin ? 'O' : 'Ya tengo cuenta',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                    textColor: Theme.of(context).primaryColor,
                  ),
                SizedBox(height: 12),
                FlatButton(
                  onPressed: () async {
                    await widget.submitFB();
                  },
                  child: Image.asset('assets/images/reta_login_fb.jpg'),
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
