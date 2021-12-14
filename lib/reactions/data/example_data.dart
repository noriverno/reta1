import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reaction_button/flutter_reaction_button.dart';

List<Reaction> flagsReactions = [
  Reaction(
    previewIcon: _builFlagsdPreviewIcon(
        'assets/images/RETA_REACCION_MEGUSTA.png', 'English'),
    icon: _buildIcon('assets/images/RETA_REACCION_MEGUSTA.png'),
  ),
  Reaction(
    previewIcon: _builFlagsdPreviewIcon(
        'assets/images/RETA_REACCION_RISA.png', 'Arabic'),
    icon: _buildIcon(
      'assets/images/RETA_REACCION_RISA.png',
    ),
  ),
  Reaction(
    enabled: false,
    previewIcon: _builFlagsdPreviewIcon(
        'assets/images/RETA_REACCION_ENOJADO.png', 'German'),
    icon: _buildIcon('assets/images/RETA_REACCION_ENOJADO.png'),
  ),
  // Reaction(
  //   previewIcon:
  //       _builFlagsdPreviewIcon('assets/images/spain-round.png', 'Spanish'),
  //   icon: _buildIcon('assets/images/spain.png'),
  // ),
  // Reaction(
  //   previewIcon:
  //       _builFlagsdPreviewIcon('assets/images/china-round.png', 'Chinese'),
  //   icon: _buildIcon('assets/images/china.png'),
  // ),
];

final defaultInitialReaction = Reaction(
  icon: Text('Me gusta',
      textAlign: TextAlign.center,
      style: TextStyle(fontWeight: FontWeight.bold)),
);

final reactions = [
  Reaction(
    title: _buildTitle('Me gusta'),
    previewIcon: _buildReactionsPreviewIcon(
      'assets/images/RETA_REACCION_MEGUSTA.png',
    ),
    icon: _buildReactionsIcon(
      'assets/images/RETA_REACCION_MEGUSTA.png',
      Text(
        'Me gusta',
        // style: TextStyle(
        //   color: Color(0XFF3b5998),
        // ),
      ),
    ),
  ),
  Reaction(
    title: _buildTitle('Risa'),
    previewIcon: _buildReactionsPreviewIcon(
      'assets/images/RETA_REACCION_RISA.png',
    ),
    icon: _buildReactionsIcon(
      'assets/images/RETA_REACCION_RISA.png',
      Text(
        'Risa',
        // style: TextStyle(
        //   color: Color(0XFFed5168),
        // ),
      ),
    ),
  ),
  Reaction(
    title: _buildTitle('Enojado'),
    previewIcon: _buildReactionsPreviewIcon(
      'assets/images/RETA_REACCION_ENOJADO.png',
    ),
    icon: _buildReactionsIcon(
      'assets/images/RETA_REACCION_ENOJADO.png',
      Text(
        'Enojado',
        // style: TextStyle(
        //   color: Color(0XFFffda6b),
        // ),
      ),
    ),
  ),
  // Reaction(
  //   title: _buildTitle('Sad'),
  //   previewIcon: _buildReactionsPreviewIcon('assets/images/sad.png'),
  //   icon: _buildReactionsIcon(
  //     'assets/images/sad.png',
  //     Text(
  //       'Sad',
  //       style: TextStyle(
  //         color: Color(0XFFffda6b),
  //       ),
  //     ),
  //   ),
  // ),
  // Reaction(
  //   title: _buildTitle('Surprised'),
  //   previewIcon: _buildReactionsPreviewIcon('assets/images/surprised.png'),
  //   icon: _buildReactionsIcon(
  //     'assets/images/surprised.png',
  //     Text(
  //       'Surprised',
  //       style: TextStyle(
  //         color: Color(0XFFffda6b),
  //       ),
  //     ),
  //   ),
  // ),
  // Reaction(
  //   title: _buildTitle('Mad'),
  //   previewIcon: _buildReactionsPreviewIcon('assets/images/mad.png'),
  //   icon: _buildReactionsIcon(
  //     'assets/images/mad.png',
  //     Text(
  //       'Mad',
  //       style: TextStyle(
  //         color: Color(0XFFf05766),
  //       ),
  //     ),
  //   ),
  // ),
];

Widget _builFlagsdPreviewIcon(String path, String text) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 7.5),
          Image.asset(path, height: 30),
        ],
      ),
    );

Widget _buildTitle(String title) => Container(
      padding: const EdgeInsets.symmetric(horizontal: 7.5, vertical: 2.5),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

Widget _buildReactionsPreviewIcon(String path) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.5, vertical: 5),
      child: Image.asset(path, height: 40),
    );

Widget _buildIcon(String path) => Image.asset(
      path,
      height: 30,
      width: 30,
    );

Widget _buildReactionsIcon(String path, Text text) => Container(
      color: Colors.transparent,
      child: Row(
        children: <Widget>[
          Image.asset(path, height: 20),
          const SizedBox(width: 5),
          text,
        ],
      ),
    );
