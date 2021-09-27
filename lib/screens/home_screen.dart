import 'package:flutter/material.dart';

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
                        image: "assets/images/ph_video1.jpg",
                        name: "user1",
                      ),
                      const SizedBox(width: 16.0),
                      Story(
                        image: "assets/images/ph_video1.jpg",
                        name: "user2",
                      ),
                      const SizedBox(width: 16.0),
                      Story(
                        image: "assets/images/ph_video1.jpg",
                        name: "user3",
                      ),
                      const SizedBox(width: 16.0),
                      Story(
                        image: "assets/users/0.jpeg",
                        name: "user1",
                      ),
                      const SizedBox(width: 16.0),
                      Story(
                        image: "assets/users/1.jpeg",
                        name: "user2",
                      ),
                      const SizedBox(width: 16.0),
                      Story(
                        image: "assets/users/2.jpeg",
                        name: "user3",
                      ),
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
                    image: 'assets/images/ph_foro1.jpg',
                  ),
                  Post(
                    userName: 'dancamdev',
                    userImage: 'assets/users/dancamdev.png',
                    image: 'assets/images/ph_foro1.jpg',
                  ),
                  Post(
                    userName: 'dancamdev',
                    userImage: 'assets/users/dancamdev.png',
                    image: 'assets/images/ph_foro1.jpg',
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

  const Story({Key key, this.image, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
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
      ],
    );
  }
}

class Post extends StatelessWidget {
  final String userImage;
  final String userName;
  final String image;

  const Post({
    Key key,
    this.userName,
    this.userImage,
    this.image,
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
        Container(
          height: 10.0,
          color: Colors.green,
        ),
      ],
    );
  }
}
