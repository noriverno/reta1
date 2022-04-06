import 'package:flutter/material.dart';

//test
class MyApp2 extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp2> {
  Route _onRoute(RouteSettings settings) {
    final str = settings.name.split("/")[1];
    final index = int.parse(str, onError: (s) => 0);

    return new MaterialPageRoute(
        builder: (BuildContext context) => new Home(index: index));
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Expanded(
          child: new MaterialApp(
            title: 'Flutter Demo',
            onGenerateRoute: _onRoute,
          ),
        ),
        new Container(
          height: 44.0,
          color: Colors.blueAccent,
          child: new Center(
            child: new Text("permanent view"),
          ),
        )
      ],
    );
  }
}

class Home extends StatelessWidget {
  Home({Key key, this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) => new Scaffold(
        appBar: new AppBar(
          title: new Text("View ${index}"),
        ),
        body: new Center(
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new Text("View ${index}"),
              new FlatButton(
                  onPressed: () =>
                      Navigator.of(context).pushNamed("/${index + 1}"),
                  child: new Text("Push"))
            ],
          ),
        ),
      );
}
