import 'package:flutter/material.dart';

import '../custom/custom_text.dart';
import '../theme/config.dart';

class ExperienceCard extends StatefulWidget {
  const ExperienceCard(
      {Key? key,
      required this.image,
      required this.title,
      required this.desc,
      required this.period,
      required this.role,
      required this.isMobile})
      : super(key: key);

  final String image, title, desc, period, role;
  final bool isMobile;

  @override
  _ExperienceCardState createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<ExperienceCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
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
        onTap: () {},
        child: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.only(
            top: height * 0.04,
            left: width * 0.015,
            right: width * 0.015,
            bottom: height * 0.04,
          ),
          width: !widget.isMobile ? width * 0.28 : width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Theme.of(context).cardColor,
          ),
          child: Column(
            children: [
              Image.asset(
                'assets/experience/${widget.image}',
                scale: 1.1,
                width: !widget.isMobile ? width : width * 0.28,
                height: !widget.isMobile ? height : height * 0.18,
              ),
              Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(
                  top: height * 0.02,
                  left: width * 0.015,
                  right: width * 0.01,
                  bottom: height * 0.02,
                ),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      FittedBox(
                        fit: BoxFit.cover,
                        child: CustomText(
                          text: widget.title,
                          fontSize: 25,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0, bottom: 16.0),
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: CustomText(
                            text: widget.role,
                            fontSize: 14,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: CustomText(
                            text: widget.period,
                            fontSize: 15,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      CustomText(
                        text: widget.desc,
                        fontSize: 15,
                        color: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
