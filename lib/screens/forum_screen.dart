import 'package:flutter/material.dart';
import 'package:reta1/screens/Comments.dart';
import 'package:flutter_reaction_button/flutter_reaction_button.dart';

class ForumScreen extends StatelessWidget {
  static const routeName = '/forum';

  @override
  Widget build(BuildContext context) {
    const name0 = "Elisa Long";
    const name1 = "Truman Warren";
    const name2 = "Shannen Adamson";
    const name3 = "Michelle Everly";
    const name4 = "Miles Derrickson";
    const name5 = "Marvin Thompsett";
    const name6 = "Lennox Boone";

    final arguments = ModalRoute.of(context).settings.arguments as Map;
    final videoId = arguments['id'];
    final videoTitle = arguments['title'];
    final image = arguments['image'];

    List<Widget> _layouts = [
      _videoInfo(videoTitle),
      // SizedBox(height: 8.0),
      PostX(
        profileImage: "assets/images/ph_foro2.jpg",
        text: "Este es un comentario aleatorio del tema discutido",
        name: name0,
      ),
      SizedBox(height: 8.0),
      PostX(
        profileImage: "assets/images/ph_foro4.jpg",
        text: "Este es otro comentario que escrito por el usuario",
        name: name1,
      ),
      SizedBox(height: 8.0),
      PostX(
        profileImage: "assets/images/reta_login_fb.jpg",
        text: "El usuario dejo un comentario en el video ",
        name: name2,
      ),
    ];

    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              image,
            ),
          ),
          Expanded(
              child: ListView(
            children: _layouts,
          ))
        ],
      ),
    );
  }
}

Widget _comments() {
  return Container();
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
        //subtitle: Text('Subtitulo del video'),
        //trailing: Icon(Icons.arrow_drop_down),
      ),
      // Container(
      //   color: Colors.grey[200],
      //   padding: const EdgeInsets.all(16.0),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: <Widget>[
      //       _buildCustomButtonColumn(
      //           Image.asset(
      //             "assets/images/RETA_REACCION_MEGUSTA.png",
      //             width: 40.0,
      //             height: 40.0,
      //           ),
      //           '3'),
      //       _buildCustomButtonColumn(
      //           Image.asset(
      //             "assets/images/RETA_REACCION_RISA.png",
      //             width: 40.0,
      //             height: 40.0,
      //           ),
      //           '1'),
      //       _buildCustomButtonColumn(
      //           Image.asset(
      //             "assets/images/RETA_REACCION_ENOJADO.png",
      //             width: 40.0,
      //             height: 40.0,
      //           ),
      //           '1'),
      //       _buildButtonColumn(Icons.comment, "Comentar"),
      //       _buildButtonColumn(Icons.ios_share, "Compartir"),
      //     ],
      //   ),
      // )
    ],
  );
}

Widget _buildButtonColumn(IconData icon, String text) {
  return Column(
    children: <Widget>[
      Container(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Icon(
          icon,
          color: Colors.grey[700],
        ),
      ),
      Text(
        text,
        style: TextStyle(color: Colors.grey[700]),
      ),
    ],
  );
}

Widget _buildCustomButtonColumn(Image icon, String text) {
  return Column(
    children: <Widget>[
      Container(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: new Tab(icon: icon),
      ),
      Text(
        text,
        style: TextStyle(color: Colors.grey[700]),
      ),
    ],
  );
}
