import 'package:flutter/material.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
        debugShowCheckedModeBanner: false,
        initialRoute: '/1',
        routes: {
          '/1': (ctx) => Widget1(),
          '/2': (ctx) => Widget2(),
          '/3': (ctx) => Widget3(),
        });
  }
}

class MyScaffold extends StatelessWidget {
  final Widget body;

  MyScaffold({this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Navigator.canPop(context)
            ? null
            : Drawer(
                child: const Text('In the Drawer', textAlign: TextAlign.center),
              ),
        body: this.body);
  }
}

class Widget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
        body: Column(children: [
      Text('Widget 1', style: Theme.of(context).textTheme.headline4),
      FlatButton(
          child: Text("Go to 2"),
          onPressed: () => {Navigator.pushNamed(context, "/2")}),
    ]));
  }
}

class Widget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
        body: Column(children: [
      Text('Widget 2', style: Theme.of(context).textTheme.headline4),
      FlatButton(
          child: Text("Go to 3"),
          onPressed: () => {Navigator.pushNamed(context, "/3")}),
    ]));
  }
}

class Widget3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
        body: Text('Widget 3', style: Theme.of(context).textTheme.headline4));
  }
}
