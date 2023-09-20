import 'package:flutter/material.dart';
import 'package:flutter_dev_folio/src/home/social_media_bar.dart';

import '../custom/custom_text.dart';
import '../html_open_link.dart';
import '../theme/config.dart';
import 'data.dart';

class ProjectsCard extends StatefulWidget {
  const ProjectsCard({
    Key? key,
    required this.title,
    required this.techStack,
    required this.desc,
    required this.link,
    required this.isMobile,
  }) : super(key: key);

  final String title, techStack, desc, link;
  final bool isMobile;

  @override
  _ProjectsCardState createState() => _ProjectsCardState();
}

class _ProjectsCardState extends State<ProjectsCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final decoration = BoxDecoration(
      color: Theme.of(context).cardColor,
      borderRadius: BorderRadius.circular(15.0),
    );
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: EdgeInsets.only(top: isHover ? height * 0.005 : height * 0.01, bottom: !isHover ? height * 0.005 : height * 0.01),
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
          padding: EdgeInsets.symmetric(
            vertical: height * 0.02,
            horizontal: width * 0.015,
          ),
          width: !widget.isMobile ? width * 0.30 : width,
          height: height * 0.25,
          decoration: decoration,
          child: (widget.title == '' && widget.link != '')
              ? FutureBuilder(
                  future: github(widget.link),
                  builder: (BuildContext context, AsyncSnapshot<Object?> snapshot) {
                    if (snapshot.hasData) {
                      final List<String> data = snapshot.data as List<String>;
                      return Column(
                        children: [
                          Center(
                            child: Column(
                              children: <Widget>[
                                FittedBox(
                                  fit: BoxFit.cover,
                                  child: CustomText(
                                    text: data[0],
                                    fontSize: 25,
                                    color: Colors.white,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0, bottom: 16.0),
                                  child: FittedBox(
                                    fit: BoxFit.cover,
                                    child: CustomText(
                                      text: data[1],
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                CustomText(text: data[2], fontSize: 15, color: Colors.white),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Image.asset('assets/projects/constant/stars.png', scale: 2),
                              Padding(
                                padding: const EdgeInsets.only(right: 24.0),
                                child: CustomText(text: ' ${data[3]}', fontSize: 12, color: Colors.white),
                              ),
                              Image.asset('assets/projects/constant/forks.png', scale: 2),
                              CustomText(text: ' ${data[4]}', fontSize: 12, color: Colors.white),
                            ],
                          ),
                        ],
                      );
                    }
                    return const Center();
                  },
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.folder,
                          color: Theme.of(context).primaryColor,
                        ),
                        Image.asset(
                          'assets/home/constant/github.png',
                          width: 20,
                          height: 20,
                          color: Theme.of(context).primaryColor,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CustomText(
                          text: widget.title,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).primaryColor,
                        ),
                        const SizedBox(height: 5),
                        CustomText(
                          text: widget.desc,
                          fontSize: 13,
                          color: Theme.of(context).primaryColor,
                          isTextAlignCenter: false,
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                    CustomText(
                      text: widget.techStack,
                      fontSize: 12,
                      color: Theme.of(context).primaryColor,
                    ),
                    /*FutureBuilder(
                        future: starsAndForks(widget.link),
                        builder: (BuildContext context, AsyncSnapshot<Object?> snapshot) {
                          if (snapshot.hasData) {
                            final List<String> data = snapshot.data as List<String>;
                            if (data[1] == 'null' && data[0] == 'null') return const Center();
                            return Padding(
                              padding: const EdgeInsets.only(top: 8.0, left: 5.0),
                              child: Row(
                                children: [
                                  Image.asset('assets/projects/constant/stars.png', scale: 2),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 24.0),
                                    child: CustomText(
                                      text: ' ${data[0]}',
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Image.asset('assets/projects/constant/forks.png', scale: 2),
                                  CustomText(text: ' ${data[1]}', fontSize: 12, color: Colors.white),
                                ],
                              ),
                            );
                          }
                          return const Center();
                        }),*/
                  ],
                ),
        ),
      ),
    );
  }
}
