import 'package:flutter/material.dart';
import 'package:reta1/screens/Comments.dart';

class Constants {
  static const name7 = "Elisa Long";
  static const name1 = "Truman Warren";
  static const name2 = "Shannen Adamson";
  static const name3 = "Michelle Everly";
  static const name4 = "Miles Derrickson";
  static const name5 = "Marvin Thompsett";
  static const name6 = "Lennox Boone";

  static const comment1 = "Este es un comentario aleatorio del tema discutido";
  static const comment2 = "Este es otro comentario que escrito por el usuario";
  static const comment3 = "El usuario dejo un comentario en el video ";

  static const profilePic1 = "assets/images/ph_foro2.jpg";
  static const profilePic2 = "assets/images/ph_foro4.jpg";
  static const profilePic3 = "assets/images/reta_login_fb.jpg";

  static const List<Widget> layouts = [
    PostX(
      profileImage: Constants.profilePic1,
      text: Constants.comment1,
      name: Constants.name1,
    ),
    SizedBox(height: 8.0),
    PostX(
      profileImage: Constants.profilePic2,
      text: Constants.comment2,
      name: Constants.name2,
    ),
    SizedBox(height: 8.0),
    PostX(
      profileImage: Constants.profilePic3,
      text: Constants.comment3,
      name: Constants.name3,
    ),
  ];

  static const List<Widget> layouts2 = [
    PostX(
      profileImage: Constants.profilePic3,
      text: Constants.comment3,
      name: Constants.name3,
    ),
  ];
}
