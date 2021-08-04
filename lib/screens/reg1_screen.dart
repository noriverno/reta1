import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:reta1/screens/reg2_screen.dart';
import 'package:reta1/widgets/auth/reg1_form.dart';
import 'package:reta1/models/user_reg.dart';

class Reg1Screen extends StatefulWidget {
  static const routeName = '/reg1';

  _Reg1ScreenState createState() => _Reg1ScreenState();
}

class _Reg1ScreenState extends State<Reg1Screen> {
  var _isLoading = false;

  void _submitAuthForm(
    String userName,
    String userLastName,
    String userBirth,
    Gender userGender,
    BuildContext ctx,
  ) async {
    try {
      setState(() {
        _isLoading = true;
      });

      UserReg user = UserReg(
          userName: userName,
          userLastName: userLastName,
          userBirth: userBirth,
          userGender: userGender);

      Navigator.of(context)
          .popAndPushNamed(Reg2Screen.routeName, arguments: user);
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
          Reg1Form(
            _submitAuthForm,
            _isLoading,
          ),
        ],
      ),
    );
  }
}
