import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

import 'package:reta1/widgets/auth/auth_form.dart';

class AuthScreen extends StatefulWidget {
  static const routeName = '/auth';

  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _auth = FirebaseAuth.instance;
  var _isLoading = false;

  final _facebookLogin = FacebookLogin();

  Future _handleLoginFB() async {
    final _result = await _facebookLogin.logIn(['email']);

    switch (_result.status) {
      case FacebookLoginStatus.cancelledByUser:
        print('FacebookLoginStatus.cancelledByUser');
        break;
      case FacebookLoginStatus.error:
        print('FacebookLoginStatus.error');
        break;
      case FacebookLoginStatus.loggedIn:
        try {
          loginWithfacebook(_result);
        } catch (e) {
          print(e);
        }
        break;
    }
  }

  void loginWithfacebook(FacebookLoginResult result) async {
    AuthResult authResult;
    final FacebookAccessToken accessToken = result.accessToken;
    AuthCredential credential =
        FacebookAuthProvider.getCredential(accessToken: accessToken.token);
    authResult = await _auth.signInWithCredential(credential);
    if (authResult.additionalUserInfo.isNewUser) {
      await Firestore.instance
          .collection('users')
          .document(authResult.user.uid)
          .setData({
        'username': authResult.user.email,
        'email': authResult.user.email,
        'image_url': '',
        'name': authResult.user.displayName,
        'lastname': '',
        'birth': '',
        'gender': '',
      });
    }

    setState(() {
      _isLoading = true;
    });

    Navigator.of(context).pop();
  }

  void _signInAnonymously() async {
    AuthResult authResul = await _auth.signInAnonymously();
    setState(() {
      _isLoading = true;
    });

    Navigator.of(context).pop();
  }

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

        final ref = FirebaseStorage.instance
            .ref()
            .child('user_images')
            .child(authResult.user.uid + '.jpg');

        await ref.putFile(image).onComplete;

        final url = await ref.getDownloadURL();

        await Firestore.instance
            .collection('users')
            .document(authResult.user.uid)
            .setData({
          'username': userName,
          'email': email,
          'image_url': url,
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
          AuthForm(
            _submitAuthForm,
            _isLoading,
            _handleLoginFB,
            _signInAnonymously,
          ),
        ],
      ),
    );
  }
}
