import 'package:flutter/material.dart';

import '../custom/custom_text.dart';
import '../html_open_link.dart';

class AchievementsCard extends StatefulWidget {
  const AchievementsCard({
    Key? key,
    required this.desc,
    required this.isMobile,
    required this.link,
  }) : super(key: key);

  final String desc, link;
  final bool isMobile;

  @override
  _AchievementsCardState createState() => _AchievementsCardState();
}

class _AchievementsCardState extends State<AchievementsCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: EdgeInsets.only(
          top: isHover ? height * 0.005 : height * 0.01,
          bottom: !isHover ? height * 0.005 : height * 0.01),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onHover: (bool value) {
          setState(() {
            isHover = value;
          });
        },
        onTap: () => htmlOpenLink(widget.link),
        child: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.only(
            top: height * 0.04,
            left: width * 0.015,
            right: width * 0.015,
            bottom: height * 0.04,
          ),
          width: !widget.isMobile ? width * 0.28 : width,
          height: height * 0.25,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Text(
                widget.desc,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 18,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 6,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
