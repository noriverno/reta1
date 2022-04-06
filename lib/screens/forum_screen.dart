import 'package:flutter/material.dart';
import 'package:reta1/screens/Comments.dart';
import 'package:reta1/widgets/constants.dart';

const routeAllcomments = '/allComments';
const routeComment = '/comments';

class ForumScreen extends StatelessWidget {
  static const routeName = '/forum';

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context).settings.arguments as Map;

    final videoTitle = arguments['title'];
    final image = arguments['image'];

    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              image,
            ),
          ),
          _videoInfo(videoTitle),
          Expanded(
            child: ListView(
              children: Constants.layouts,
            ),
          ),
        ],
      ),
    );
  }
}

Widget _videoInfo(String videoTitle) {
  return Column(
    children: <Widget>[
      ListTile(
        title: Text(
          videoTitle,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}
