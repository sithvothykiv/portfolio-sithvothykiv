import 'package:flutter/material.dart';

import '../src/experience/card.dart';
import '../src/experience/data.dart';
import '../src/nav_bar/title_bar.dart';

class Experience extends StatelessWidget {
  Experience({Key? key}) : super(key: key);

  final List<List<String>> data = experience();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        TitleBar(height: height, width: width, title: 'EXPERIENCE'),
        Padding(
          padding: EdgeInsets.only(bottom: height * 0.1),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              if (constraints.maxWidth < 1000) {
                return Column(
                  children: List.generate(
                    data.length,
                    (int i) => Padding(
                      padding: EdgeInsets.only(
                          left: 30.0, right: 30.0, bottom: height * 0.05),
                      child: ExperienceCard(
                        image: data[i][4],
                        title: data[i][0],
                        role: data[i][1],
                        period: data[i][2],
                        desc: data[i][3],
                        isMobile: true,
                      ),
                    ),
                  ),
                );
              } else {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: width * 0.8,
                      child: Column(
                        children: List.generate(
                          data.length,
                          (int i) => Padding(
                            padding: EdgeInsets.only(bottom: height * 0.025),
                            child: ExperienceCard(
                              image: data[i][4],
                              title: data[i][0],
                              role: data[i][1],
                              period: data[i][2],
                              desc: data[i][3],
                              isMobile: true,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
