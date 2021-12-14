import 'package:flutter/material.dart';

import 'package:reta1/models/user_reg.dart';

class Reg1Form extends StatefulWidget {
  Reg1Form(
    this.submitFn,
    this.isLoading,
  );

  final bool isLoading;
  final void Function(
    String userName,
    String userLastName,
    String userBirth,
    Gender userGender,
    BuildContext ctx,
  ) submitFn;

  @override
  _Reg1FormState createState() => _Reg1FormState();
}

class _Reg1FormState extends State<Reg1Form> {
  final _formKey = GlobalKey<FormState>();
  var _userName = '';
  var _userLastName = '';
  var _userGender = Gender.woman;
  var _userBirth = '';

  void _trySubmit() {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus(); // cierra el teclado

    if (isValid) {
      _formKey.currentState.save();
      widget.submitFn(
        _userName.trim(),
        _userLastName.trim(),
        _userBirth.trim(),
        _userGender,
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
                SizedBox(
                  height: 45,
                ),
                TextFormField(
                  key: ValueKey('name'),
                  autocorrect: true,
                  textCapitalization: TextCapitalization.words,
                  enableSuggestions: false,
                  validator: (value) {
                    if (value.isEmpty || value.length < 4) {
                      return 'Nombres must be at least 4 characters long.';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Nombres*',
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
                  key: ValueKey('lastname'),
                  autocorrect: true,
                  textCapitalization: TextCapitalization.words,
                  enableSuggestions: false,
                  validator: (value) {
                    if (value.isEmpty || value.length < 4) {
                      return 'Apellidos must be at least 4 characters long.';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Apellidos*',
                    labelStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 17,
                    ),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  onSaved: (value) {
                    _userLastName = value;
                  },
                ),
                SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Género*',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.white,
                            groupValue: _userGender,
                            value: Gender.woman,
                            onChanged: (value) {
                              setState(() {
                                _userGender = value;
                              });
                            },
                          ),
                          Text(
                            'Femenino',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.white,
                            groupValue: _userGender,
                            value: Gender.man,
                            onChanged: (value) {
                              setState(() {
                                _userGender = value;
                              });
                            },
                          ),
                          Text(
                            'Masculino',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.white,
                            groupValue: _userGender,
                            value: Gender.other,
                            onChanged: (value) {
                              setState(() {
                                _userGender = value;
                              });
                            },
                          ),
                          Text(
                            'Otro',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Radio(
                          activeColor: Colors.white,
                          groupValue: _userGender,
                          value: Gender.notSay,
                          onChanged: (value) {
                            setState(() {
                              _userGender = value;
                            });
                          },
                        ),
                        Text(
                          'Prefiero no decirlo',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        'Fecha de nacimiento*',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 90),
                    Expanded(
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        key: ValueKey('birth'),
                        keyboardType: TextInputType.datetime,
                        validator: (value) {
                          if (value.isEmpty || value.length != 8) {
                            return 'Fecha de nacimiento must be 8 characters long.';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'DD/MM/AA*',
                          labelStyle: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 17,
                          ),
                          fillColor: Colors.white,
                          filled: true,
                        ),
                        onSaved: (value) {
                          _userBirth = value;
                        },
                      ),
                    )
                  ],
                ),
                SizedBox(height: 30),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '*Campo obligatorio',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
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
                      'Continuar',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
