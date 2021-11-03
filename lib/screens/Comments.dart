import 'package:flutter/material.dart';

class PostX extends StatelessWidget {
  final String profileImage;
  final String name;
  final String text;

  const PostX({
    this.profileImage,
    this.name,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          _PostHeader(
            profileImage: profileImage,
            name: name,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              text,
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          _LikeCommentShareRow(),
        ],
      ),
    );
  }
}

class _LikeCommentShareRow extends StatelessWidget {
  const _LikeCommentShareRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: _WhatsOnYourMindButton(
            text: "Like",
            iconColor: Colors.grey,
            icon: Icons.thumb_up_alt_outlined,
          ),
        ),
        SizedBox(width: 1.0),
        Expanded(
          child: _WhatsOnYourMindButton(
            text: "Comment",
            iconColor: Colors.grey,
            icon: Icons.messenger_outline_sharp,
          ),
        ),
        SizedBox(width: 1.0),
        Expanded(
          child: _WhatsOnYourMindButton(
            text: "Share",
            iconColor: Colors.grey,
            icon: Icons.share,
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
                        style: TextStyle(fontWeight: FontWeight.bold)),
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

  const _WhatsOnYourMindButton({
    this.icon,
    this.iconColor,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: iconColor),
            SizedBox(width: 8.0),
            Text(text, style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
