import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:reta1/models/user_reg.dart';

import 'package:reta1/widgets/auth/reg2_form.dart';

class Reg2Screen extends StatefulWidget {
  static const routeName = '/reg2';

  _Reg2ScreenState createState() => _Reg2ScreenState();
}

class _Reg2ScreenState extends State<Reg2Screen> {
  final _auth = FirebaseAuth.instance;
  var _isLoading = false;
  UserReg userReg;

  void _submitAuthForm(
    String email,
    String password,
    String userName,
    File image,
    bool isLogin,
    BuildContext ctx,
  ) async {
    AuthResult authResult;

    try {
      setState(() {
        _isLoading = true;
      });
      if (isLogin) {
        authResult = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
      } else {
        authResult = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
/*
        final ref = FirebaseStorage.instance
            .ref()
            .child('user_images')
            .child(authResult.user.uid + '.jpg');

        await ref.putFile(image).onComplete;

        final url = await ref.getDownloadURL();
*/
        final url = '';

        print('22222' +
            this.userReg.userName +
            this.userReg.userLastName +
            this.userReg.userBirth +
            this.userReg.userGender.toString());

        await Firestore.instance
            .collection('users')
            .document(authResult.user.uid)
            .setData({
          'username': userName,
          'email': email,
          'image_url': url,
          'name': this.userReg.userName,
          'lastname': this.userReg.userLastName,
          'birth': this.userReg.userName,
          'gender': this.userReg.userGender.toString(),
        });
      }

      Navigator.of(context).pop();
    } on PlatformException catch (err) {
      var message = 'An error ocurred, please check your credentials';

      if (err.message != null) {
        message = err.message;
      }

      Scaffold.of(ctx).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Theme.of(ctx).errorColor,
        ),
      );
      setState(() {
        _isLoading = false;
      });
    } catch (err) {
      print(err);
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext ctx) {
    this.userReg = ModalRoute.of(context).settings.arguments as UserReg;

    return Scaffold(
      backgroundColor: Color.fromRGBO(119, 185, 87, 1),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("assets/images/reta_bkg_login.jpg"),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Reg2Form(
            _submitAuthForm,
            _isLoading,
          ),
        ],
      ),
    );
  }
}
