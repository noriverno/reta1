import 'package:flutter/material.dart';
import 'package:reta1/screens/video_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}

const instagramColors = [
  Color(0xFFfeda75),
  Color(0xfffa7e1e),
  Color(0xffd62976),
  Color(0xff962fbf),
  Color(0xff4f5bd5),
];

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Image.asset(
                    'assets/images/ph_titulo_videoblogs.jpg',
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              ],
            ),
            Container(
              height: 130.0,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Story(
                        image: "assets/images/ph_video2.jpg",
                        name: "user1",
                        id: 'ATR2gFYChWI',
                        title: '¡Aprender a hacer dominadas perfectas!',
                      ),
                      const SizedBox(width: 16.0),
                      Story(
                        image: "assets/images/ph_video3.jpg",
                        name: "user2",
                        id: 'pHF3EqYdFKA',
                        title: 'Una vergüenza la selección mexicana',
                      ),
                      const SizedBox(width: 16.0),
                      Story(
                        image: "assets/images/ph_video4.jpg",
                        name: "user3",
                        id: 'sS5UbyhtxjY',
                        title:
                            'Los mejores goles de la selección. ¿Cuál fue el mejor?',
                      ),
                      // const SizedBox(width: 16.0),
                      // Story(
                      //   image: "",
                      //   name: "user1",
                      // ),
                      // const SizedBox(width: 16.0),
                      // Story(
                      //   image: "",
                      //   name: "user2",
                      // ),
                      // const SizedBox(width: 16.0),
                      // Story(
                      //   image: "",
                      //   name: "user3",
                      // ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 2.0,
              color: Colors.white.withOpacity(0.2),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Image.asset(
                    'assets/images/ph_titulo_foros.jpg',
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  Post(
                    userName: 'dancamdev',
                    userImage: 'assets/users/dancamdev.png',
                    image: 'assets/images/ph_foro2.jpg',
                    title: '¿Chicharito debería regresar a la selección?',
                    id: '1',
                  ),
                  Post(
                    userName: 'dancamdev',
                    userImage: 'assets/users/dancamdev.png',
                    image: 'assets/images/ph_foro3.jpg',
                    title:
                        '¿Quién ganará la liga MX? Dinos para ti quién será el campeón',
                    id: '2',
                  ),
                  Post(
                    userName: 'dancamdev',
                    userImage: 'assets/users/dancamdev.png',
                    image: 'assets/images/ph_foro4.jpg',
                    title:
                        'Malos resultados en el Tri ¿Quién es el mayor culpable?',
                    id: '3',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Story extends StatelessWidget {
  final String image;
  final String name;
  final String id;
  final String title;

  const Story({Key key, this.image, this.name, this.id, this.title})
      : super(key: key);

  void selectVideo(BuildContext context) {
    Navigator.of(context).pushNamed(
      VideoScreen.routeName,
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () => selectVideo(context),
          child: Container(
            width: 200.0,
            height: 110.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: instagramColors,
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
            ),
            child: ClipRRect(
              child: Image.asset(image),
            ),
          ),
        ),
      ],
    );
  }
}

class Post extends StatelessWidget {
  final String userImage;
  final String userName;
  final String image;
  final String title;
  final String id;

  const Post({
    Key key,
    this.userName,
    this.userImage,
    this.image,
    this.title,
    this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            image,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Container(
                      width: 300,
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ],
              ),
            ),
            Container(
              width: 40,
              height: 100,
              decoration: BoxDecoration(color: Colors.grey.shade200),
              child: Icon(
                Icons.star,
                color: Colors.yellow.shade700,
                size: 25.0,
              ),
            ),
          ],
        ),
        Container(
          height: 10.0,
          color: Colors.green,
        ),
      ],
    );
  }
}
