import 'package:flutter/material.dart';
import 'package:reta1/screens/Comments.dart';
import 'package:reta1/widgets/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const routeHome = '/';
const routeAllcomments = '/allComments';
const routeComment = '/comment';

class HyperForumScreen extends StatefulWidget {
  static const routeName = '/hyperforum';

  @override
  _HyperForumScreenState createState() => _HyperForumScreenState();
}

class _HyperForumScreenState extends State<HyperForumScreen> {
  final _navigatorKey = GlobalKey();
  Future<Match> futureMatch;

  @override
  void initState() {
    super.initState();
    futureMatch = fetchMatch();
  }

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

    return Scaffold(
      body: Column(
        children: <Widget>[
          Center(
            child: FutureBuilder<Match>(
              future: futureMatch,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: <Widget>[
                      Container(
                        child: SizedBox(
                          height: 20,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Image.network(
                              snapshot.data.homeLogo,
                              height: 100,
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(
                                        snapshot.data.homeGoals.toString(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30,
                                          color: Colors.grey[700],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: 50,
                                        width: 50,
                                        decoration: new BoxDecoration(
                                          image: new DecorationImage(
                                            image: new AssetImage(
                                                "assets/images/VS.jpg"),
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        snapshot.data.awayGoals.toString(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30,
                                          color: Colors.grey[700],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(
                                        '84:00',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.grey[500],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Image.network(
                              snapshot.data.awayLogo,
                              height: 100,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        child: SizedBox(
                          height: 20,
                        ),
                      ),
                      // Container(
                      //   constraints: new BoxConstraints(
                      //     minHeight: 50.0,
                      //     maxHeight: 150.0,
                      //   ),
                      //   child: Column(
                      //     mainAxisSize: MainAxisSize.min,
                      //     children: [
                      //       Row(
                      //         children: <Widget>[
                      //           SizedBox(
                      //             width: 20,
                      //           ),
                      //           Text(
                      //             '13′',
                      //             textAlign: TextAlign.justify,
                      //             style: TextStyle(
                      //               fontSize: 20,
                      //               color: Colors.grey[500],
                      //             ),
                      //           ),
                      //           SizedBox(
                      //             width: 10,
                      //           ),
                      //           Icon(
                      //             Icons.sports_soccer,
                      //           ),
                      //           SizedBox(
                      //             width: 10,
                      //           ),
                      //           Text(
                      //             'Marco A. Solis',
                      //             textAlign: TextAlign.justify,
                      //             style: TextStyle(
                      //               fontSize: 20,
                      //               color: Colors.grey[500],
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      Container(
                        constraints: new BoxConstraints(
                          minHeight: 50.0,
                          maxHeight: 150.0,
                        ),
                        child: ListView.separated(
                          itemCount: snapshot.data.listEvents.length,
                          separatorBuilder: (context, index) => Divider(),
                          itemBuilder: (context, index) {
                            final event = snapshot.data.listEvents[index];
                            var icon;

                            if (event.type == 'Goal') {
                              icon = Icon(Icons.sports_soccer);
                            } else if (event.detail == 'Yellow Card' ||
                                event.detail == 'Red Card') {
                              icon = ImageIcon(
                                AssetImage("assets/images/TARJETA.png"),
                              );
                            } else {
                              icon = Text(event.type);
                            }

                            return Row(
                              children: <Widget>[
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  event.time.toString() + '′',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.grey[500],
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                icon,
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  event.player,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.grey[500],
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      Container(
                        child: SizedBox(
                          height: 20,
                        ),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              },
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

  Future<Match> fetchMatch() async {
    var headers = {
      'x-rapidapi-key': 'b208938a5f5e8173dbae2e51352aeccb',
      'x-rapidapi-host': 'v3.football.api-sports.io'
    };
    var request = http.Request(
        // 'GET', Uri.parse('https://v3.football.api-sports.io/fixtures?id=861503'));
        'GET',
        Uri.parse(
            // 'https://v3.football.api-sports.io/fixtures?season=2022&team=2287&date=2022-07-10'));
            //'https://v3.football.api-sports.io/fixtures?id=864108'));
            'https://v3.football.api-sports.io/fixtures?id=869542'));

    request.headers.addAll(headers);

    http.StreamedResponse streamedResponse = await request.send();

    if (streamedResponse.statusCode == 200) {
      //print(await streamedResponse.stream.bytesToString());
      var response = await http.Response.fromStream(streamedResponse);

      final decodedJson = jsonDecode(response.body); // dynamic

      //print(decodedJson['response'][0]['events'][0]);

      final venue =
          decodedJson['response'][0]['fixture']['venue']['name'] as String;
      final league = decodedJson['response'][0]['league']['name'] as String;
      final home =
          decodedJson['response'][0]['teams']['home']['name'] as String;
      final homeLogo =
          decodedJson['response'][0]['teams']['home']['logo'] as String;
      final homeGoals = decodedJson['response'][0]['goals']['home'] as int;
      final away =
          decodedJson['response'][0]['teams']['away']['name'] as String;
      final awayLogo =
          decodedJson['response'][0]['teams']['away']['logo'] as String;
      final awayGoals = decodedJson['response'][0]['goals']['away'] as int;

      List<Event> listEvents = <Event>[];
      for (var json in decodedJson['response'][0]['events']) {
        listEvents.add(Event.fromJson(json));
      }

      Match match = Match(
        venue: venue,
        league: league,
        home: home,
        homeLogo: homeLogo,
        homeGoals: homeGoals,
        away: away,
        awayLogo: awayLogo,
        awayGoals: awayGoals,
        listEvents: listEvents,
      );

      return match;
    } else {
      print(streamedResponse.reasonPhrase);
    }
  }
}

Widget _videoInfo(String videoTitle) {
  return Container(
      color: Colors.green,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Chat en vivo',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    Icon(
                      Icons.contactless_outlined,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Text(
                  'Usuarios activos 1,215',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ));

  // return Column(
  //   children: <Widget>[
  //     ListTile(
  //       title: Text(
  //         videoTitle,
  //         style: TextStyle(
  //           fontSize: 18,
  //           fontWeight: FontWeight.bold,
  //           color: Colors.green,
  //         ),
  //       ),
  //     ),
  //   ],
  // );
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

class Event {
  int time;
  int extra;
  String team;
  String player;
  String type;
  String detail;
  String comment;

  Event._(
      {this.time,
      this.extra,
      this.team,
      this.player,
      this.type,
      this.detail,
      this.comment});

  factory Event.fromJson(Map<String, dynamic> json) {
    return new Event._(
      time: json['time']['elapsed'],
      extra: json['time']['extra'],
      team: json['team']['name'],
      player: json['player']['name'],
      type: json['type'],
      detail: json['detail'],
      // extra: json['extra'],
      // team: json['team'],
      // player: json['player'],
      // type: json['type'],
      // detail: json['detail'],
    );
  }
}

class Match {
  final String venue;
  final String league;
  final String home;
  final String homeLogo;
  final int homeGoals;
  final String away;
  final String awayLogo;
  final int awayGoals;
  final List<Event> listEvents;

  Match({
    this.venue,
    this.league,
    this.home,
    this.homeLogo,
    this.homeGoals,
    this.away,
    this.awayLogo,
    this.awayGoals,
    this.listEvents,
  });

  // factory Match.fromJson(Map<String, dynamic> json) {
  //   return Match(
  //     venue: json['venue'],
  //     league: json['league'],
  //     home: json['home'],
  //     homeLogo: json['homeLogo'],
  //     homeGoals: json['homeGoals'],
  //     away: json['away'],
  //     awayLogo: json['awayLogo'],
  //     awayGoals: json['awayGoals'],
  //   );
  // }
}
