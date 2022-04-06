import 'package:flutter/material.dart';
import 'package:reta1/screens/Comments.dart';
import 'package:reta1/screens/auth_screen.dart';
import 'package:reta1/screens/reg1_screen.dart';
import 'package:reta1/widgets/constants.dart';

const routeHome = '/';
const routeAllcomments = '/allComments';
const routeComment = '/comment';

class ForumScreen extends StatefulWidget {
  static const routeName = '/forum';

  @override
  _ForumScreenState createState() => _ForumScreenState();
}

class _ForumScreenState extends State<ForumScreen> {
  final _navigatorKey = GlobalKey();

  Route _onRoute(RouteSettings settings) {
    Widget page;

    if (settings.name == routeHome) {
      page = AllComments();
    } else if (settings.name.startsWith(routeHome)) {
      page = Comment();
    }

    return new MaterialPageRoute(builder: (BuildContext context) => page);
  }

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
            child: Navigator(
              key: _navigatorKey,
              onGenerateRoute: _onRoute,
              //initialRoute: _onRoute,
            ),
            // child: AllComments(),
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

class AllComments extends StatefulWidget {
  @override
  State<AllComments> createState() => AllCommentsState();
}

class AllCommentsState extends State<AllComments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GestureDetector(
              child: ListView(
                children: Constants.layouts,
              ),
              onTap: () {
                Navigator.of(context).pushNamed(Comment.routeName);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Comment extends StatefulWidget {
  static const routeName = '/comment';

  @override
  State<Comment> createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              GestureDetector(
                child: Row(
                  children: [
                    SizedBox(
                      width: 20.0,
                    ),
                    Icon(
                      Icons.arrow_back_ios,
                      size: 35,
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              PostX(
                profileImage: Constants.profilePic3,
                text: Constants.comment3,
                name: Constants.name3,
              )
            ],
          ),
        ),
      ],
    );
  }
}
