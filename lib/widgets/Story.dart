import 'package:flutter/material.dart';
import 'package:reta1/screens/video_screen.dart';

const instagramColors = [
  Color(0xFFfeda75),
  Color(0xfffa7e1e),
  Color(0xffd62976),
  Color(0xff962fbf),
  Color(0xff4f5bd5),
];

const ColorFilter _colorFilterGrey = ColorFilter.matrix([
  0.2126,
  0.7152,
  0.0722,
  0,
  0,
  0.2126,
  0.7152,
  0.0722,
  0,
  0,
  0.2126,
  0.7152,
  0.0722,
  0,
  0,
  0,
  0,
  0,
  1,
  0,
]);

const ColorFilter _colorFilterOriginal = ColorFilter.matrix(<double>[
  1,
  0,
  0,
  0,
  0,
  0,
  1,
  0,
  0,
  0,
  0,
  0,
  1,
  0,
  0,
  0,
  0,
  0,
  1,
  0,
]);

class Story extends StatelessWidget {
  final String image;
  final String name;
  final String id;
  final String title;
  final bool circle;
  final double width;
  final double height;

  const Story(
      {Key key,
      this.image,
      this.name,
      this.id,
      this.title,
      this.circle,
      this.width,
      this.height})
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
    var storyW;
    var storyH;
    width == null ? storyW = 200.0 : storyW = width;
    height == null ? storyH = 110.0 : storyH = height;

    return Column(
      children: [
        InkWell(
          onTap: () => selectVideo(context),
          child: Container(
            width: storyW,
            height: storyH,
            // decoration: BoxDecoration(
            //   gradient: LinearGradient(
            //     colors: instagramColors,
            //     begin: Alignment.bottomLeft,
            //     end: Alignment.topRight,
            //   ),
            // ),
            child: ClipRRect(
              child: Image.asset(image),
            ),
          ),
        ),
      ],
    );
  }
}

class StoryCircle extends StatefulWidget {
  final String image;
  final String name;
  final String id;
  final String title;
  final bool circle;
  final double width;
  final double height;
  final VoidCallback onTeamSelected;
  final bool isTeamSelected;

  const StoryCircle({
    Key key,
    this.image,
    this.name,
    this.id,
    this.title,
    this.circle,
    this.width,
    this.height,
    this.onTeamSelected,
    this.isTeamSelected,
  }) : super(key: key);

  @override
  _StoryCircleState createState() => _StoryCircleState();
}

class _StoryCircleState extends State<StoryCircle> {
  //var _colorFilter = _colorFilterOriginal;
  var _colorFilter = _colorFilterGrey;

  void selectVideo(BuildContext context) {
    Navigator.of(context).pushNamed(
      VideoScreen.routeName,
      arguments: {
        'id': widget.id,
        'title': widget.title,
      },
    );
  }

  void _onClickTeam() {
    setState(() {
      if (_colorFilter == _colorFilterOriginal) {
        _colorFilter = _colorFilterGrey;
        widget.onTeamSelected();
      } else if (!widget.isTeamSelected) {
        _colorFilter = _colorFilterOriginal;
        widget.onTeamSelected();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var storyW;
    var storyH;
    widget.width == null ? storyW = 200.0 : storyW = widget.width;
    widget.height == null ? storyH = 110.0 : storyH = widget.height;

    return Column(
      children: [
        InkWell(
          onTap: () => _onClickTeam(),
          child: Container(
            width: storyW,
            height: storyH,
            child: ColorFiltered(
                colorFilter: _colorFilter,
                child: ClipOval(
                  child: Image.asset(
                    widget.image,
                  ),
                )),
          ),
        ),
      ],
    );
  }
}
