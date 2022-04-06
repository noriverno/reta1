import 'package:flutter/material.dart';
import 'package:flutter_reaction_button/flutter_reaction_button.dart';
import '../reactions/data/example_data.dart' as Example;

class PostX extends StatefulWidget {
  final String profileImage;
  final String name;
  final String text;
  final List<Reaction> reactions;

  //color

  const PostX({
    this.profileImage,
    this.name,
    this.text,
    this.reactions,
  });

  @override
  _PostXState createState() => _PostXState();
}

class _PostXState extends State<PostX> {
  @override
  Widget build(BuildContext context) {
    final postBgColor = Colors.white; //Colors.grey[700];
    final postTextColor = Colors.black; //Colors.white;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: postBgColor,
      ),
      child: Column(
        children: [
          _PostHeader(
            profileImage: widget.profileImage,
            name: widget.name,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              widget.text,
              style: TextStyle(
                fontSize: 18.0,
                color: postTextColor,
              ),
            ),
          ),
          _LikeCommentShareRow(Example.reactions),
        ],
      ),
    );
  }
}

class _LikeCommentShareRow extends StatefulWidget {
  final List<Reaction> reactions;
  const _LikeCommentShareRow(this.reactions);

  @override
  __LikeCommentShareRowState createState() => __LikeCommentShareRowState();
}

class __LikeCommentShareRowState extends State<_LikeCommentShareRow> {
  @override
  Widget build(BuildContext context) {
    final postButtonBGColor = Colors.white; // Colors.grey[200];
    final postReactionBGColor = Colors.white; // Colors.green;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          // child: _WhatsOnYourMindButton(
          //   text: "Me gusta",
          //   iconColor: Colors.grey,
          //   //icon: Icons.thumb_up_alt_outlined,
          //   bgColor: Colors.grey[200],
          // ),
          child: SizedBox(
            height: 50.0,
            child: DecoratedBox(
              decoration: BoxDecoration(color: postButtonBGColor),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                FlutterReactionButtonCheck(
                  onReactionChanged: (reaction, index, isChecked) {
                    print('reaction selected index: $index');
                  },
                  reactions: widget.reactions,
                  initialReaction: Example.defaultInitialReaction,
                  selectedReaction: widget.reactions[1],
                  boxAlignment: AlignmentDirectional.centerStart,
                ),
              ]),
            ),
          ),
        ),
        // SizedBox(width: 1.0),
        Expanded(
          child: _WhatsOnYourMindButton(
            text: "Responder",
            iconColor: Colors.grey,
            //icon: Icons.messenger_outline_sharp,
            bgColor: postButtonBGColor,
          ),
        ),
        // SizedBox(width: 1.0),
        // Expanded(
        //   child: _WhatsOnYourMindButton(
        //     text: "Share",
        //     iconColor: Colors.grey,
        //     icon: Icons.share,
        //   ),
        // ),
        // SizedBox(width: 1.0),
        Expanded(
          child: _WhatsOnYourMindButton(
            text: "15 min",
            iconColor: Colors.grey,
            //icon: Icons.share,
            bgColor: postButtonBGColor,
          ),
        ),
        // SizedBox(width: 1.0),
        Expanded(
          child: _WhatsOnYourMindButton(
            text: "143",
            iconColor: Colors.white,
            icon: Icons.sports_soccer,
            bgColor: postReactionBGColor,
          ),
        ),
      ],
    );
  }
}

class _PostHeader extends StatelessWidget {
  final String profileImage;
  final String name;

  const _PostHeader({this.profileImage, this.name});

  @override
  Widget build(BuildContext context) {
    final headTextColor = Colors.black; //Colors.white;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(60.0),
                child: SizedBox(
                  height: 40.0,
                  width: 40.0,
                  child: Image.asset(profileImage),
                ),
              ),
              SizedBox(width: 8.0),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: "$name ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: headTextColor,
                        )),
                    //TextSpan(text: "updated his status"),
                  ],
                ),
              ),
            ],
          ),
          Icon(Icons.more_horiz_rounded, color: Colors.grey[600]),
        ],
      ),
    );
  }
}

class _WhatsOnYourMindButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String text;
  final Color bgColor;

  const _WhatsOnYourMindButton(
      {this.icon, this.iconColor, this.text, this.bgColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: bgColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // if (icon != null) Icon(icon, color: iconColor),
            if (icon != null)
              Image.asset(
                "assets/images/RETA_REACCION_MEGUSTA.png",
                width: 30.0,
                height: 30.0,
              ),
            if (icon != null) SizedBox(width: 8.0),
            Text(text, style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
