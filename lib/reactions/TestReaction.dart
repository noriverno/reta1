import 'package:flutter/material.dart';
import 'package:flutter_reaction_button/flutter_reaction_button.dart';
import 'data/example_data.dart' as Example;

import 'items/item.dart';

void main() => runApp(TestReaction());

class TestReaction extends StatefulWidget {
  @override
  _TestReactionState createState() => _TestReactionState();
}

class _TestReactionState extends State<TestReaction> {
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Reaction Button',
        home: Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            title: const Text('Flutter Reaction Button'),
            actions: [
              Builder(
                builder: (ctx) => FlutterReactionButton(
                  onReactionChanged: (reaction, index) {
                    Scaffold.of(ctx).showSnackBar(
                      SnackBar(
                        content: Text('reaction selected index: $index'),
                      ),
                    );
                  },
                  reactions: Example.flagsReactions,
                  initialReaction: Reaction(icon: Icon(Icons.language)),
                  boxColor: Colors.black.withOpacity(0.5),
                  boxRadius: 10,
                  boxDuration: Duration(milliseconds: 500),
                  boxAlignment: AlignmentDirectional.bottomEnd,
                ),
              ),
              SizedBox(width: 10),
            ],
          ),
          body: Builder(
            builder: (context) => ListView(
              padding: const EdgeInsets.symmetric(vertical: 5),
              children: [
                Item(
                  'image 1',
                  'assets/images/RETA_REACCION_MEGUSTA.png',
                  Example.reactions,
                ),
                Item(
                  'image 2',
                  'assets/images/RETA_REACCION_RISA.png',
                  Example.reactions,
                ),
                Item(
                  'image 3',
                  'assets/images/RETA_REACCION_ENOJADO.png',
                  Example.reactions,
                ),
                // Item(
                //   'image 4',
                //   'assets/images/img4.jpg',
                //   Example.reactions,
                // ),
                // Item(
                //   'image 5',
                //   'assets/images/img5.jpg',
                //   Example.reactions,
                // ),
              ],
            ),
          ),
        ),
      );
}
