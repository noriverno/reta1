import 'package:flutter/material.dart';
import 'package:reta1/screens/Comments.dart';
import 'package:reta1/screens/TestMe.dart';
import 'package:reta1/screens/home_screen.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const name0 = "Elisa Long";
    const name1 = "Truman Warren";
    const name2 = "Shannen Adamson";
    const name3 = "Michelle Everly";
    const name4 = "Miles Derrickson";
    const name5 = "Marvin Thompsett";
    const name6 = "Lennox Boone";

    List<Widget> _layouts = [
      _videoInfo(),
      SizedBox(height: 8.0),
      PostX(
        profileImage: "assets/images/ph_foro1.jpg",
        text: "Este es un comentario aleatorio del tema discutido",
        name: name0,
      ),
      SizedBox(height: 8.0),
      PostX(
        profileImage: "assets/images/ph_video1.jpg",
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
          _buildVideoPlayer(context),
          Expanded(
              child: ListView(
            children: _layouts,
          ))
        ],
      ),
    );
  }
}

Widget _buildVideoPlayer(BuildContext context) {
  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'JkVuEv98bYI',
    flags: YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
    ),
  );

  return Container(
    margin: new EdgeInsets.only(top: MediaQuery.of(context).padding.top),
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).orientation == Orientation.portrait
        ? 200.0
        : MediaQuery.of(context).size.height -
            MediaQuery.of(context).padding.top,
    // decoration: BoxDecoration(
    //     image: DecorationImage(
    //         image: AssetImage('assets/images/ph_video1.jpg'),
    //         fit: BoxFit.cover)),
    child: YoutubePlayer(
      controller: _controller,
      liveUIColor: Colors.black,
    ),
  );
}

Widget _comments() {
  return Container();
}

Widget _videoInfo() {
  return Column(
    children: <Widget>[
      ListTile(
        title: Text('Titulo del video'),
        subtitle: Text('Subtitulo del video'),
        trailing: Icon(Icons.arrow_drop_down),
      ),
      Container(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _buildButtonColumn(Icons.thumb_up, '1'),
            _buildButtonColumn(Icons.thumb_down, '0'),
            _buildButtonColumn(Icons.share, "Share"),
            _buildButtonColumn(Icons.cloud_download, "Download"),
            _buildButtonColumn(Icons.playlist_add, "Save"),
          ],
        ),
      )
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
