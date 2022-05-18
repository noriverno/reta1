import 'package:flutter/material.dart';
import 'package:giphy_picker/giphy_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//https://codewithandrea.com/articles/parse-json-dart/

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Giphy Picker Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GiphyGif _gif;
  Future<Match> futureMatch;

  @override
  void initState() {
    super.initState();
    futureMatch = fetchMatch();
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text(_gif?.title ?? 'Giphy Picker Demo'),
  //     ),
  //     body: SafeArea(
  //       child: Center(
  //         child: _gif == null
  //             ? Text('Pick a gif..')
  //             : GiphyImage.original(gif: _gif),
  //       ),
  //     ),
  //     floatingActionButton: FloatingActionButton(
  //       backgroundColor: Colors.blueAccent,
  //       child: Icon(Icons.search),
  //       onPressed: () async {
  //         // request your Giphy API key at https://developers.giphy.com/
  //         final gif = await GiphyPicker.pickGif(
  //           context: context,
  //           apiKey: 'E1guXh4A1LrcZqApNhp40HahrQPuUiYJ',
  //           fullScreenDialog: false,
  //           previewType: GiphyPreviewType.previewWebp,
  //           decorator: GiphyDecorator(
  //             showAppBar: false,
  //             searchElevation: 4,
  //             giphyTheme: ThemeData.dark().copyWith(
  //               inputDecorationTheme: InputDecorationTheme(
  //                 border: InputBorder.none,
  //                 enabledBorder: InputBorder.none,
  //                 focusedBorder: InputBorder.none,
  //                 contentPadding: EdgeInsets.zero,
  //               ),
  //             ),
  //           ),
  //         );

  //         if (gif != null) {
  //           setState(() => _gif = gif);
  //         }
  //       },
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Football'),
      ),
      body: Center(
        child: FutureBuilder<Match>(
          future: futureMatch,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                padding: const EdgeInsets.all(8),
                children: [
                  Container(
                    height: 50,
                    color: Colors.green[400],
                    child: Center(
                      child: Text(snapshot.data.venue),
                    ),
                  ),
                  Container(
                    height: 50,
                    color: Colors.green[300],
                    child: Center(
                      child: Text(snapshot.data.league),
                    ),
                  ),
                  Container(
                    height: 50,
                    color: Colors.green[200],
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(snapshot.data.home),
                          Image.network(snapshot.data.homeLogo),
                          Text(snapshot.data.homeGoals.toString()),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    color: Colors.green[100],
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(snapshot.data.away),
                          Image.network(snapshot.data.awayLogo),
                          Text(snapshot.data.awayGoals.toString()),
                        ],
                      ),
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
    );
  }
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
          'https://v3.football.api-sports.io/fixtures?season=2021&team=2287&date=2022-05-14'));

  request.headers.addAll(headers);

  http.StreamedResponse streamedResponse = await request.send();

  if (streamedResponse.statusCode == 200) {
    //print(await streamedResponse.stream.bytesToString());

    var response = await http.Response.fromStream(streamedResponse);

    final decodedJson = jsonDecode(response.body); // dynamic
    final venue =
        decodedJson['response'][0]['fixture']['venue']['name'] as String;
    final league = decodedJson['response'][0]['league']['name'] as String;
    final home = decodedJson['response'][0]['teams']['home']['name'] as String;
    final homeLogo =
        decodedJson['response'][0]['teams']['home']['logo'] as String;
    final homeGoals = decodedJson['response'][0]['goals']['home'] as int;
    final away = decodedJson['response'][0]['teams']['away']['name'] as String;
    final awayLogo =
        decodedJson['response'][0]['teams']['away']['logo'] as String;
    final awayGoals = decodedJson['response'][0]['goals']['away'] as int;

    Match match = Match(
      venue: venue,
      league: league,
      home: home,
      homeLogo: homeLogo,
      homeGoals: homeGoals,
      away: away,
      awayLogo: awayLogo,
      awayGoals: awayGoals,
    );

    return match;
  } else {
    print(streamedResponse.reasonPhrase);
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

  Match({
    this.venue,
    this.league,
    this.home,
    this.homeLogo,
    this.homeGoals,
    this.away,
    this.awayLogo,
    this.awayGoals,
  });

  factory Match.fromJson(Map<String, dynamic> json) {
    return Match(
      venue: json['venue'],
      league: json['league'],
      home: json['home'],
      homeLogo: json['homeLogo'],
      homeGoals: json['homeGoals'],
      away: json['away'],
      awayLogo: json['awayLogo'],
      awayGoals: json['awayGoals'],
    );
  }
}
